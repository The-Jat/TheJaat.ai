<?php

namespace Botble\Course\Providers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Botble\Course\Models\Course;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Course\Services\CourseService;
use Eloquent;
use Html;
use Illuminate\Contracts\Container\BindingResolutionException;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
use Menu;
use RvMedia;
use Throwable;

class HookServiceProvider extends ServiceProvider
{
    public function boot()
    {
        if (defined('MENU_ACTION_SIDEBAR_OPTIONS')) {
            Menu::addMenuOptionModel(Course::class);
            add_action(MENU_ACTION_SIDEBAR_OPTIONS, [$this, 'registerMenuOptions'], 10);
        }

        add_filter(DASHBOARD_FILTER_ADMIN_LIST, [$this, 'addCourseStatsWidget'], 15, 2);
        add_filter(BASE_FILTER_PUBLIC_SINGLE_DATA, [$this, 'handleSingleView'], 1);

        if (function_exists('theme_option')) {
            add_action(RENDERING_THEME_OPTIONS_PAGE, [$this, 'addThemeOptions'], 31);
        }

        if (defined('THEME_FRONT_HEADER')) {
            add_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, function ($screen, $course) {
                add_filter(THEME_FRONT_HEADER, function ($html) use ($course) {
                    if (get_class($course) != Course::class) {
                        return $html;
                    }

                    $schema = [
                        '@context' => 'https://schema.org',
                        '@type'    => 'Organization',
                        'name'     => theme_option('site_title'),
                        'url'      => $course->url,
                        'logo'     => [
                            '@type' => 'ImageObject',
                            'url'   => RvMedia::getImageUrl(theme_option('logo')),
                        ],
                    ];

                    return $html . Html::tag('script', json_encode($schema), ['type' => 'application/ld+json'])
                            ->toHtml();
                }, 2);
            }, 2, 2);
        }
    }

    public function addThemeOptions()
    {
        $courses = $this->app->make(CourseInterface::class)
            ->pluck('name', 'id', ['status' => BaseStatusEnum::PUBLISHED]);

        theme_option()
            ->setSection([
                'title'      => 'Course',
                'desc'       => 'Theme options for Course',
                'id'         => 'opt-text-subsection-course',
                'subsection' => true,
                'icon'       => 'fa fa-book',
                'fields'     => [
                    [
                        'id'         => 'homepage_id',
                        'type'       => 'customSelect',
                        'label'      => trans('packages/course::courses.settings.show_on_front'),
                        'attributes' => [
                            'name'    => 'homepage_id',
                            'list'    => ['' => trans('packages/course::courses.settings.select')] + $courses,
                            'value'   => '',
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
     * @throws Throwable
     */
    public function registerMenuOptions()
    {
        if (Auth::user()->hasPermission('courses.index')) {
            Menu::registerMenuOptions(Course::class, trans('packages/course::courses.menu'));
        }
    }

    /**
     * @param array $widgets
     * @param Collection $widgetSettings
     * @return array
     * @throws BindingResolutionException
     * @throws Throwable
     */
    public function addCourseStatsWidget(array $widgets, Collection $widgetSettings): array
    {
        $courses = $this->app->make(CourseInterface::class)->count(['status' => BaseStatusEnum::PUBLISHED]);

        return (new DashboardWidgetInstance())
            ->setType('stats')
            ->setPermission('courses.index')
            ->setTitle(trans('packages/course::courses.courses'))
            ->setKey('widget_total_pages')
            ->setIcon('far fa-file-alt')
            ->setColor('#32c5d2')
            ->setStatsTotal($courses)
            ->setRoute(route('courses.index'))
            ->init($widgets, $widgetSettings);
    }

    /**
     * @param Eloquent|Builder $slug
     * @return array|Eloquent
     */
    public function handleSingleView($slug)
    {
        return (new CourseService())->handleFrontRoutes($slug);
    }
}
