<?php

namespace Botble\Code\Providers;

use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Code\Models\Code;
use Botble\Code\Repositories\Caches\CodeCacheDecorator;
use Botble\Code\Repositories\Eloquent\CodeRepository;
use Botble\Code\Repositories\Interfaces\CodeInterface;
use Botble\Shortcode\View\View;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\View as ViewFacade;
use Illuminate\Support\ServiceProvider;

/**
 * @since 02/07/2016 09:50 AM
 */
class CodeServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register()
    {
        $this->setNamespace('packages/codes')
            ->loadHelpers();
    }

    public function boot()
    {
        $this->app->bind(CodeInterface::class, function () {
            return new CodeCacheDecorator(new CodeRepository(new Code()));
        });

        $this
            ->loadAndPublishConfigurations(['permissions', 'general'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadMigrations();

        Event::listen(RouteMatched::class, function () {
            dashboard_menu()->registerItem([
                'id'          => 'cms-core-code',
                'priority'    => 2,
                'parent_id'   => null,
                'name'        => 'packages/codes::codes.menu_name',
                'icon'        => 'fa fa-graduation-cap',
                'url'         => route('codes.index'),
                'permissions' => ['codes.index'],
            ]);

            if (function_exists('admin_bar')) {
                ViewFacade::composer('*', function () {
                    if (Auth::check() && Auth::user()->hasPermission('codes.create')) {
                        admin_bar()->registerLink(trans('packages/codes::codes.menu_name'), route('codes.create'), 'add-new');
                    }
                });
            }
        });

        if (function_exists('shortcode')) {
            view()->composer(['packages/codes::themes.code'], function (View $view) {
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
