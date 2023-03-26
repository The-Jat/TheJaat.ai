<?php

namespace Botble\Course\Providers;

use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Course\Models\Course;
use Botble\Course\Repositories\Caches\CourseCacheDecorator;
use Botble\Course\Repositories\Eloquent\CourseRepository;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Shortcode\View\View;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\View as ViewFacade;
use Illuminate\Support\ServiceProvider;

/**
 * @since 02/07/2016 09:50 AM
 */
class CourseServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register()
    {
        $this->setNamespace('packages/courses')
            ->loadHelpers();
    }

    public function boot()
    {
        $this->app->bind(CourseInterface::class, function () {
            return new CourseCacheDecorator(new CourseRepository(new Course()));
        });

        $this
            ->loadAndPublishConfigurations(['permissions', 'general'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadMigrations();

        Event::listen(RouteMatched::class, function () {
            dashboard_menu()->registerItem([
                'id'          => 'cms-core-course',
                'priority'    => 2,
                'parent_id'   => null,
                'name'        => 'packages/courses::courses.menu_name',
                'icon'        => 'fa fa-graduation-cap',
                'url'         => route('courses.index'),
                'permissions' => ['courses.index'],
            ]);

            if (function_exists('admin_bar')) {
                ViewFacade::composer('*', function () {
                    if (Auth::check() && Auth::user()->hasPermission('courses.create')) {
                        admin_bar()->registerLink(trans('packages/course::courses.menu_name'), route('courses.create'), 'add-new');
                    }
                });
            }
        });

        if (function_exists('shortcode')) {
            view()->composer(['packages/course::themes.course'], function (View $view) {
                $view->withShortcodes();
            });
        }

        $this->app->booted(function () {
            $this->app->register(HookServiceProvider::class);
            $this->app->register(RouteServiceProvider::class);
        });

        $this->app->register(EventServiceProvider::class);
    }
}
