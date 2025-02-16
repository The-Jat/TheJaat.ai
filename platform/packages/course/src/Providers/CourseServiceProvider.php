<?php

namespace Botble\Course\Providers;

use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Course\Models\Course;
use Botble\Course\Repositories\Caches\CourseCacheDecorator;
use Botble\Course\Repositories\Eloquent\CourseRepository;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Shortcode\View\View;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\ServiceProvider;
use Botble\Slug\Facades\SlugHelper;

/**
 * @since 02/07/2016 09:50 AM
 */
class CourseServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->setNamespace('packages/course')
            ->loadHelpers();
    }

    public function boot(): void
    {
        $this->app->bind(CourseInterface::class, function () {
            return new CourseCacheDecorator(new CourseRepository(new Course()));
        });

        // set the prefix.
        SlugHelper::setPrefix(Course::class, 'learn', true);
        $this
            ->loadAndPublishConfigurations(['permissions', 'general'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadMigrations();

        $this->app['events']->listen(RouteMatched::class, function () {
            dashboard_menu()->registerItem([
                'id' => 'cms-core-course',
                'priority' => 3,
                'parent_id' => null,
                'name' => 'packages/course::courses.base_menu_name',
                'icon' => 'ti ti-pencil',
                'url' => route('courses.index'),
                'permissions' => ['courses.index'],
            ])
            ->registerItem([
                'id' => 'cms-core-course-post',
                'priority' => 1,
                'parent_id' => 'cms-core-course',
                'name' => 'packages/course::courses.post_menu_name',
                'icon' => null,
                'url' => route('courses.index'),
                'permissions' => ['courses.index'],
            ])
            ->registerItem([
                'id' => 'cms-core-course-tables',
                'priority' => 2,
                'parent_id' => 'cms-core-course',
                'name' => 'packages/course::courses.table_menu_name',
                'icon' => null,
                'url' => route('courses.table'),
                'permissions' => ['courses.table'],
            ])
            ->registerItem([
                'id' => 'cms-core-course-config',
                'priority' => 4,
                'parent_id' => 'cms-core-course',
                'name' => 'config',//'packages/course::courses.table_menu_name',
                'icon' => null,
                'url' => route('courses.config'),
                'permissions' => ['courses.config'],
            ]);

            if (function_exists('admin_bar')) {
                admin_bar()->registerLink(trans('packages/course::courses.menu'), route('courses.create'), 'add-new', 'courses.create');
            }
        });

        if (function_exists('shortcode')) {
            view()->composer(['packages/course::themes.course'], function (View $view) {
                $view->withShortcodes();
            });
        }

        $this->app->booted(function () {
            $this->app->register(HookServiceProvider::class);
        });

        $this->app->register(EventServiceProvider::class);
    }
}
