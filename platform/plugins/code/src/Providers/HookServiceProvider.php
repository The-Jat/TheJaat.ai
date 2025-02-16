<?php

namespace Botble\Code\Providers;

use Botble\Base\Facades\Assets;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Code\Models\CodeCategory;
use Botble\Code\Models\CodePost;
use Botble\Code\Models\CodeTag;
use Botble\Code\Services\CodeService;
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
            Menu::addMenuOptionModel(CodeCategory::class);
            Menu::addMenuOptionModel(CodeTag::class);
            add_action(MENU_ACTION_SIDEBAR_OPTIONS, [$this, 'registerMenuOptions'], 2);
        }
        add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'registerDashboardWidgets'], 21, 2);
        add_filter(BASE_FILTER_PUBLIC_SINGLE_DATA, [$this, 'handleSingleView'], 2);
        if (defined('PAGE_MODULE_SCREEN_NAME')) {
            add_filter(PAGE_FILTER_FRONT_PAGE_CONTENT, [$this, 'renderCodePage'], 2, 2);
            add_filter(PAGE_FILTER_PAGE_NAME_IN_ADMIN_LIST, [$this, 'addAdditionNameToPageName'], 147, 2);
        }

        if (defined('COURSE_MODULE_SCREEN_NAME')) {
            add_filter(COURSE_FILTER_FRONT_COURSE_CONTENT, [$this, 'renderCodeCourse'], 2, 2);
            add_filter(COURSE_FILTER_COURSE_NAME_IN_ADMIN_LIST, [$this, 'addAdditionNameToCourseName'], 147, 2);
        }

        $this->app['events']->listen(RouteMatched::class, function () {
            if (function_exists('admin_bar')) {
                admin_bar()->registerLink(trans('plugins/code::posts.post'), route('code_posts.create'), 'add-new', 'posts.create');
            }
        });

        if (function_exists('add_shortcode')) {
            add_shortcode(
                'code-posts',
                trans('plugins/code::base.short_code_name'),
                trans('plugins/code::base.short_code_description'),
                [$this, 'renderCodePosts']
            );
            shortcode()->setAdminConfig('code-posts', function ($attributes, $content) {
                return view('plugins/code::partials.posts-short-code-admin-config', compact('attributes', 'content'))
                    ->render();
            });
        }

        if (function_exists('theme_option')) {
            add_action(RENDERING_THEME_OPTIONS_PAGE, [$this, 'addThemeOptions'], 35);
        }

        if (defined('LANGUAGE_MODULE_SCREEN_NAME')) {
            add_action(BASE_ACTION_META_BOXES, [$this, 'addLanguageChooser'], 55, 2);
        }

        if (defined('THEME_FRONT_HEADER') && setting('code_post_schema_enabled', 1)) {
            add_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, function ($screen, $post) {
                add_filter(THEME_FRONT_HEADER, function ($html) use ($post) {
                    if (get_class($post) != CodePost::class) {
                        return $html;
                    }

                    $schemaType = setting('code_post_schema_type', 'NewsArticle');

                    if (! in_array($schemaType, ['NewsArticle', 'News', 'Article', 'CodePosting'])) {
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
                'title' => 'Code',
                'desc' => 'Theme options for Code',
                'id' => 'opt-text-subsection-code',
                'subsection' => true,
                'icon' => 'fa fa-edit',
                'fields' => [
                    [
                        'id' => 'code_page_id',
                        'type' => 'customSelect',
                        'label' => trans('plugins/code::base.code_page_id'),
                        'attributes' => [
                            'name' => 'code_page_id',
                            'list' => ['' => trans('plugins/code::base.select')] + $pages,
                            'value' => '',
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'id' => 'number_of_code_posts',
                        'type' => 'number',
                        'label' => trans('plugins/code::base.number_code_posts_per_page'),
                        'attributes' => [
                            'name' => 'number_of_code_posts',
                            'value' => 12,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'id' => 'number_of_posts_in_a_tag',
                        'type' => 'number',
                        'label' => trans('plugins/code::base.number_posts_per_page_in_tag'),
                        'attributes' => [
                            'name' => 'number_of_posts_in_a_tag',
                            'value' => 12,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'id' => 'child_code_css',
                        'section_id' => 'opt-text-subsection-code',
                        'type' => 'textarea',
                        'label' => __('Child Code Style'),
                        'attributes' => [
                            'name' => 'child_code_css',
                            'value' => null,
                            'options' => [
                                'class' => 'form-control',
                                // 'data-counter' => 2000,
                            ],
                        ],
                    ],
                [

                    'id' => 'sort_by',
                    'section_id' => 'opt-text-subsection-code',
                    'type' => 'select',
                    'label' => __('Sort By'),
                    'attributes' => [
                        'name' => 'sort_by',
                        'list' => [
                            'order' => 'Order',
                            'name' => 'Name',
                            'modification-time' => 'Modification Time',
                        ],
                        'value' => 'order',
                        'options' => [
                            'class' => 'form-control',
                        ],
                    ],
                ],
                [

                    'id' => 'sort_order',
                    'section_id' => 'opt-text-subsection-code',
                    'type' => 'select',
                    'label' => __('Sort Order'),
                    'attributes' => [
                        'name' => 'sort_order',
                        'list' => [
                            'asc' => 'Ascending',
                            'desc' => 'Descending',
                        ],
                        'value' => 'asc',
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
        if (Auth::user()->hasPermission('code_categories.index')) {
            Menu::registerMenuOptions(CodeCategory::class, trans('plugins/code::categories.menu'));
        }

        if (Auth::user()->hasPermission('code_tags.index')) {
            Menu::registerMenuOptions(CodeTag::class, trans('plugins/code::tags.menu'));
        }
    }

    public function registerDashboardWidgets(array $widgets, Collection $widgetSettings): array
    {
        if (! Auth::user()->hasPermission('code_posts.index')) {
            return $widgets;
        }

        Assets::addScriptsDirectly(['/vendor/core/plugins/code/js/code.js']);

        return (new DashboardWidgetInstance())
            ->setPermission('code_posts.index')
            ->setKey('widget_posts_recent')
            ->setTitle(trans('plugins/code::posts.widget_posts_recent'))
            ->setIcon('fas fa-edit')
            ->setColor('#f3c200')
            ->setRoute(route('posts.widget.recent-posts'))
            ->setBodyClass('scroll-table')
            ->setColumn('col-md-6 col-sm-6')
            ->init($widgets, $widgetSettings);
    }

    public function handleSingleView(Slug|array $slug): Slug|array
    {
        return (new CodeService())->handleFrontRoutes($slug);
    }

    public function renderCodePosts(Shortcode $shortcode): array|string
    {
        $posts = get_all_posts(true, (int)$shortcode->paginate);

        $view = 'plugins/code::themes.templates.posts';
        $themeView = Theme::getThemeNamespace() . '::views.templates.posts';

        if (view()->exists($themeView)) {
            $view = $themeView;
        }

        return view($view, compact('posts'))->render();
    }

    public function renderCodePage(?string $content, Page $page): ?string
    {
        if ($page->id == theme_option('code_page_id', setting('code_page_id'))) {
            $view = 'plugins/code::themes.loop';

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
        if ($page->id == theme_option('code_page_id', setting('code_page_id'))) {
            $subTitle = Html::tag('span', trans('plugins/code::base.code_page'), ['class' => 'additional-page-name'])
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
    public function renderCodeCourse(?string $content, Course $page)
    {
        if ($page->id == theme_option('code_page_id', setting('code_page_id'))) {
            $view = 'plugins/code::themes.loop';

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
        if ($page->id == theme_option('code_page_id', setting('code_page_id'))) {
            $subTitle = Html::tag('span', trans('plugins/code::base.code_page'), ['class' => 'additional-page-name'])
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
        if ($priority == 'head' && $model instanceof CodeCategory) {
            $route = 'categories.index';

            echo view('plugins/language::partials.admin-list-language-chooser', compact('route'))->render();
        }
    }

    public function addSettings(?string $data = null): string
    {
        return $data . view('plugins/code::settings')->render();
    }
}
