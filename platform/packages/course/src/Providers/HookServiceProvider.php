<?php

namespace Botble\Course\Providers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Dashboard\Supports\DashboardWidgetInstance;
use Botble\Course\Models\Course;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Course\Services\CourseService;
use Botble\Slug\Models\Slug;
use Botble\Base\Facades\Html;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
use Botble\Menu\Facades\Menu;
use Botble\Media\Facades\RvMedia;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
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
            add_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, function ($screen, $course): void {
                add_filter(THEME_FRONT_HEADER, function (?string $html) use ($course): ?string {
                    if (get_class($course) != Course::class) {
                        return $html;
                    }

                    $schema = [
                        '@context' => 'https://schema.org',
                        '@type' => 'Organization',
                        'name' => theme_option('site_title'),
                        'url' => $course->url,
                        'logo' => [
                            '@type' => 'ImageObject',
                            'url' => RvMedia::getImageUrl(theme_option('logo')),
                        ],
                    ];

                    return $html . Html::tag('script', json_encode($schema), ['type' => 'application/ld+json'])
                            ->toHtml();
                }, 2);
            }, 2, 2);
        }
    }

    public function addThemeOptions(): void
    {
        $courses = $this->app->make(CourseInterface::class)
            ->pluck('name', 'id', ['status' => BaseStatusEnum::PUBLISHED]);

        theme_option()
            ->setSection([
                'title' => 'Course',
                'desc' => 'Theme options for Course',
                'id' => 'opt-text-subsection-course',
                'subsection' => true,
                'icon' => 'fa fa-book',
                'fields' => [
                    [
                        'id' => 'homecourse_id',
                        'type' => 'customSelect',
                        'label' => trans('packages/course::courses.settings.show_on_front'),
                        'attributes' => [
                            'name' => 'homecourse_id',
                            'list' => ['' => trans('packages/course::courses.settings.select')] + $courses,
                            'value' => '',
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],[
                    'id' => 'child_course_css',
                    'section_id' => 'opt-text-subsection-course',
                    'type' => 'textarea',
                    'label' => __('Child Course Style'),
                    'attributes' => [
                        'name' => 'child_course_css',
                        'value' => null,
                        'options' => [
                            'class' => 'form-control',
                            // 'data-counter' => 2000,
                        ],
                    ],
                ],],
            ]);
    }

    public function registerMenuOptions(): void
    {
        if (Auth::user()->hasPermission('courses.index')) {
            Menu::registerMenuOptions(Course::class, trans('packages/course::courses.menu'));
        }
    }

    public function addCourseStatsWidget(array $widgets, Collection $widgetSettings): array
    {
        $courses = $this->app->make(CourseInterface::class)->count(['status' => BaseStatusEnum::PUBLISHED]);

        return (new DashboardWidgetInstance())
            ->setType('stats')
            ->setPermission('courses.index')
            ->setTitle(trans('packages/course::courses.courses'))
            ->setKey('widget_total_courses')
            ->setIcon('far fa-file-alt')
            ->setColor('#32c5d2')
            ->setStatsTotal($courses)
            ->setRoute(route('courses.index'))
            ->init($widgets, $widgetSettings);
    }

    public function handleSingleView(Slug|array $slug): Slug|array
    {
        return (new CourseService())->handleFrontRoutes($slug);
    }
}
