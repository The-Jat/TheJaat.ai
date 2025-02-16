<?php

namespace Botble\Vaccancy\Providers;

use Botble\Base\Facades\Assets;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Vaccancy\Models\VaccancyCategory;
use Botble\Vaccancy\Models\VaccancyPost;
use Botble\Vaccancy\Models\VaccancyTag;
use Botble\Vaccancy\Services\VaccancyService;
use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Botble\Page\Models\Page;
use Botble\Page\Repositories\Interfaces\PageInterface;
use Botble\Course\Models\Course;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Shortcode\Compilers\Shortcode;
use Botble\Slug\Models\Slug;
use Botble\Base\Facades\Html;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;
use Botble\Menu\Facades\Menu;
use Botble\Media\Facades\RvMedia;
use Botble\Theme\Facades\Theme;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (defined('MENU_ACTION_SIDEBAR_OPTIONS')) {
            Menu::addMenuOptionModel(VaccancyCategory::class);
            Menu::addMenuOptionModel(VaccancyTag::class);
            add_action(MENU_ACTION_SIDEBAR_OPTIONS, [$this, 'registerMenuOptions'], 2);
        }
        add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'registerDashboardWidgets'], 21, 2);
        add_filter(BASE_FILTER_PUBLIC_SINGLE_DATA, [$this, 'handleSingleView'], 2);
        if (defined('PAGE_MODULE_SCREEN_NAME')) {
            add_filter(PAGE_FILTER_FRONT_PAGE_CONTENT, [$this, 'renderVaccancyPage'], 2, 2);
            add_filter(PAGE_FILTER_PAGE_NAME_IN_ADMIN_LIST, [$this, 'addAdditionNameToPageName'], 147, 2);
        }

        if (defined('COURSE_MODULE_SCREEN_NAME')) {
            add_filter(COURSE_FILTER_FRONT_COURSE_CONTENT, [$this, 'renderVaccancyCourse'], 2, 2);
            add_filter(COURSE_FILTER_COURSE_NAME_IN_ADMIN_LIST, [$this, 'addAdditionNameToCourseName'], 147, 2);
        }

        $this->app['events']->listen(RouteMatched::class, function () {
            if (function_exists('admin_bar')) {
                admin_bar()->registerLink(trans('plugins/vaccancy::posts.post'), route('posts.create'), 'add-new', 'posts.create');
            }
        });

        if (function_exists('add_shortcode')) {
            add_shortcode(
                'vaccancy-posts',
                trans('plugins/vaccancy::base.short_code_name'),
                trans('plugins/vaccancy::base.short_code_description'),
                [$this, 'renderVaccancyPosts']
            );
            shortcode()->setAdminConfig('vaccancy-posts', function ($attributes, $content) {
                return view('plugins/vaccancy::partials.posts-short-code-admin-config', compact('attributes', 'content'))
                    ->render();
            });
        }

        if (function_exists('theme_option')) {
            add_action(RENDERING_THEME_OPTIONS_PAGE, [$this, 'addThemeOptions'], 35);
        }

        if (defined('LANGUAGE_MODULE_SCREEN_NAME')) {
            add_action(BASE_ACTION_META_BOXES, [$this, 'addLanguageChooser'], 55, 2);
        }

        if (defined('THEME_FRONT_HEADER') && setting('vaccancy_post_schema_enabled', 1)) {
            add_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, function ($screen, $post) {
                add_filter(THEME_FRONT_HEADER, function ($html) use ($post) {
                    if (get_class($post) != VaccancyPost::class) {
                        return $html;
                    }

                    $schemaType = setting('vaccancy_post_schema_type', 'NewsArticle');

                    if (!in_array($schemaType, ['NewsArticle', 'News', 'Article', 'VaccancyPosting'])) {
                        $schemaType = 'NewsArticle';
                    }

                    $schema = [
                        '@context' => 'https://schema.org',
                        '@type' => $schemaType,
                        'mainEntityOfPage' => [
                            '@type' => 'WebPage',
                            '@id' => $post->url,
                        ],
                        'headline' => BaseHelper::clean($post->name),
                        'description' => BaseHelper::clean($post->description),
                        'image' => [
                            '@type' => 'ImageObject',
                            'url' => RvMedia::getImageUrl($post->image, null, false, RvMedia::getDefaultImage()),
                        ],
                        'author' => [
                            '@type' => 'Person',
                            'url' => route('public.index'),
                            'name' => class_exists($post->author_type) ? $post->author->name : '',
                        ],
                        'publisher' => [
                            '@type' => 'Organization',
                            'name' => theme_option('site_title'),
                            'logo' => [
                                '@type' => 'ImageObject',
                                'url' => RvMedia::getImageUrl(theme_option('logo')),
                            ],
                        ],
                        'datePublished' => $post->created_at->toDateString(),
                        'dateModified' => $post->updated_at->toDateString(),
                    ];

                    return $html . Html::tag('script', json_encode($schema), ['type' => 'application/ld+json'])
                        ->toHtml();
                }, 35);
            }, 35, 2);
        }

        add_filter(BASE_FILTER_AFTER_SETTING_CONTENT, [$this, 'addSettings'], 193);
    }

    public function addThemeOptions()
    {
        $pages = $this->app->make(PageInterface::class)->pluck('name', 'id', ['status' => BaseStatusEnum::PUBLISHED]);

        theme_option()
            ->setSection([
                'title' => 'Vaccancy',
                'desc' => 'Theme options for Vaccancy',
                'id' => 'opt-text-subsection-vaccancy',
                'subsection' => true,
                'icon' => 'fa fa-edit',
                'fields' => [
                    [
                        'id' => 'vaccancy_landing_page_slug',
                        'section_id' => 'opt-text-subsection-general',
                        'type' => 'text',
                        'label' => __('Vaccancy Landing Page Slug'),
                        'attributes' => [
                            'name' => 'vaccancy_landing_page_slug',
                            'value' => 'vaccancy-landing',
                            'options' => [
                                'class' => 'form-control',
                                'placeholder' => __('Change vaccancy landing slug'),
                                'data-counter' => 250,
                            ],
                        ],
                        'helper' => __('Vaccancy Landing Page Slug'),
                    ],
                    [
                        'id' => 'vaccancy_page_id',
                        'type' => 'customSelect',
                        'label' => trans('plugins/vaccancy::base.vaccancy_page_id'),
                        'attributes' => [
                            'name' => 'vaccancy_page_id',
                            'list' => ['' => trans('plugins/vaccancy::base.select')] + $pages,
                            'value' => '',
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'id' => 'number_of_posts_in_a_category',
                        'type' => 'number',
                        'label' => trans('plugins/vaccancy::base.number_posts_per_page_in_category'),
                        'attributes' => [
                            'name' => 'number_of_posts_in_a_category',
                            'value' => 12,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'id' => 'number_of_posts_in_a_tag',
                        'type' => 'number',
                        'label' => trans('plugins/vaccancy::base.number_posts_per_page_in_tag'),
                        'attributes' => [
                            'name' => 'number_of_posts_in_a_tag',
                            'value' => 12,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                ],
            ]);
    }

    /**
     * Register sidebar options in menu
     */
    public function registerMenuOptions(): void
    {
        if (Auth::user()->hasPermission('vaccancy_categories.index')) {
            Menu::registerMenuOptions(VaccancyCategory::class, trans('plugins/vaccancy::categories.menu'));
        }

        if (Auth::user()->hasPermission('vaccancy_tags.index')) {
            Menu::registerMenuOptions(VaccancyTag::class, trans('plugins/vaccancy::tags.menu'));
        }
    }

    public function registerDashboardWidgets(array $widgets, Collection $widgetSettings): array
    {
        if (!Auth::user()->hasPermission('vaccancy_posts.index')) {
            return $widgets;
        }

        Assets::addScriptsDirectly(['/vendor/core/plugins/vaccancy/js/vaccancy.js']);

        return (new DashboardWidgetInstance())
            ->setPermission('vaccancy_posts.index')
            ->setKey('widget_posts_recent')
            ->setTitle(trans('plugins/vaccancy::posts.widget_posts_recent'))
            ->setIcon('fas fa-edit')
            ->setColor('#f3c200')
            ->setRoute(route('posts.widget.recent-posts'))
            ->setBodyClass('scroll-table')
            ->setColumn('col-md-6 col-sm-6')
            ->init($widgets, $widgetSettings);
    }

    public function handleSingleView(Slug|array $slug): Slug|array
    {
        return (new VaccancyService())->handleFrontRoutes($slug);
    }

    public function renderVaccancyPosts(Shortcode $shortcode): array|string
    {
        $posts = get_all_posts(true, (int)$shortcode->paginate);

        $view = 'plugins/vaccancy::themes.templates.posts';
        $themeView = Theme::getThemeNamespace() . '::views.templates.posts';

        if (view()->exists($themeView)) {
            $view = $themeView;
        }

        return view($view, compact('posts'))->render();
    }

    public function renderVaccancyPage(?string $content, Page $page): ?string
    {
        if ($page->id == theme_option('vaccancy_page_id', setting('vaccancy_page_id'))) {
            $view = 'plugins/vaccancy::themes.loop';

            if (view()->exists(Theme::getThemeNamespace() . '::views.loop')) {
                $view = Theme::getThemeNamespace() . '::views.loop';
            }

            return view($view, [
                'posts' => get_all_posts(true, (int)theme_option('number_of_posts_in_a_category', 12)),
            ])->render();
        }

        return $content;
    }

    public function addAdditionNameToPageName(?string $name, Page $page): ?string
    {
        if ($page->id == theme_option('vaccancy_page_id', setting('vaccancy_page_id'))) {
            $subTitle = Html::tag('span', trans('plugins/vaccancy::base.vaccancy_page'), ['class' => 'additional-page-name'])
                ->toHtml();

            if (Str::contains($name, ' —')) {
                return $name . ', ' . $subTitle;
            }

            return $name . ' —' . $subTitle;
        }

        return $name;
    }


    /**
     * @param string|null $content
     * @param Page $page
     * @return array|string|null
     */
    public function renderVaccancyCourse(?string $content, Course $page)
    {
        if ($page->id == theme_option('vaccancy_page_id', setting('vaccancy_page_id'))) {
            $view = 'plugins/vaccancy::themes.loop';

            if (view()->exists(Theme::getThemeNamespace() . '::views.loop')) {
                $view = Theme::getThemeNamespace() . '::views.loop';
            }

            return view($view, [
                'posts' => get_all_posts(
                    true,
                    theme_option('number_of_posts_in_a_category', 12),
                    ['slugable', 'categories', 'categories.slugable', 'author']
                ),
            ])
                ->render();
        }

        return $content;
    }

    public function addAdditionNameToCourseName(?string $name, Course $page)
    {
        if ($page->id == theme_option('vaccancy_page_id', setting('vaccancy_page_id'))) {
            $subTitle = Html::tag('span', trans('plugins/vaccancy::base.vaccancy_page'), ['class' => 'additional-page-name'])
                ->toHtml();

            if (Str::contains($name, ' —')) {
                return $name . ', ' . $subTitle;
            }

            return $name . ' —' . $subTitle;
        }

        return $name;
    }


    public function addLanguageChooser(string $priority, Model $model): void
    {
        if ($priority == 'head' && $model instanceof VaccancyCategory) {
            $route = 'vaccancy_categories.index';

            echo view('plugins/language::partials.admin-list-language-chooser', compact('route'))->render();
        }
    }

    public function addSettings(?string $data = null): string
    {
        return $data . view('plugins/vaccancy::settings')->render();
    }
}
