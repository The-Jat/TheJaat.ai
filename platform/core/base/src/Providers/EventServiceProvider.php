<?php

namespace Botble\Base\Providers;

use App\Http\Middleware\VerifyCsrfToken;
use Botble\ACL\Events\RoleAssignmentEvent;
use Botble\ACL\Events\RoleUpdateEvent;
use Botble\Base\Events\AdminNotificationEvent;
use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\PanelSectionsRendering;
use Botble\Base\Events\SendMailEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Events\UpdatedEvent;
use Botble\Base\Facades\AdminHelper;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Facades\MetaBox;
use Botble\Base\Http\Middleware\AdminLocaleMiddleware;
use Botble\Base\Http\Middleware\CoreMiddleware;
use Botble\Base\Http\Middleware\DisableInDemoModeMiddleware;
use Botble\Base\Http\Middleware\EnsureLicenseHasBeenActivated;
use Botble\Base\Http\Middleware\HttpsProtocolMiddleware;
use Botble\Base\Http\Middleware\LocaleMiddleware;
use Botble\Base\Listeners\AdminNotificationListener;
use Botble\Base\Listeners\BeforeEditContentListener;
use Botble\Base\Listeners\ClearDashboardMenuCaches;
use Botble\Base\Listeners\ClearDashboardMenuCachesForLoggedUser;
use Botble\Base\Listeners\CreatedContentListener;
use Botble\Base\Listeners\DeletedContentListener;
use Botble\Base\Listeners\PushDashboardMenuToSystemPanel;
use Botble\Base\Listeners\SendMailListener;
use Botble\Base\Listeners\UpdatedContentListener;
use Botble\Base\Models\AdminNotification;
use Botble\Support\Http\Middleware\BaseMiddleware;
use Illuminate\Auth\Events\Login;
use Illuminate\Config\Repository;
use Illuminate\Database\Events\MigrationsStarted;
use Illuminate\Database\Events\QueryExecuted;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Throwable;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        SendMailEvent::class => [
            SendMailListener::class,
        ],
        CreatedContentEvent::class => [
            CreatedContentListener::class,
        ],
        UpdatedContentEvent::class => [
            UpdatedContentListener::class,
        ],
        DeletedContentEvent::class => [
            DeletedContentListener::class,
        ],
        BeforeEditContentEvent::class => [
            BeforeEditContentListener::class,
        ],
        AdminNotificationEvent::class => [
            AdminNotificationListener::class,
        ],
        UpdatedEvent::class => [
            ClearDashboardMenuCaches::class,
        ],
        Login::class => [
            ClearDashboardMenuCachesForLoggedUser::class,
        ],
        RoleAssignmentEvent::class => [
            ClearDashboardMenuCaches::class,
        ],
        RoleUpdateEvent::class => [
            ClearDashboardMenuCaches::class,
        ],
    ];

    public function boot(): void
    {
        $events = $this->app['events'];

        $events->listen(RouteMatched::class, function () {
            /**
             * @var Router $router
             */
            $router = $this->app['router'];

            $router->pushMiddlewareToGroup('web', LocaleMiddleware::class);
            $router->pushMiddlewareToGroup('web', AdminLocaleMiddleware::class);
            $router->pushMiddlewareToGroup('web', HttpsProtocolMiddleware::class);
            $router->aliasMiddleware('preventDemo', DisableInDemoModeMiddleware::class);
            $router->middlewareGroup('core', [CoreMiddleware::class]);

            // $this->app->extend('core.middleware', function ($middleware) {
            //     return array_merge($middleware, [
            //         EnsureLicenseHasBeenActivated::class,
            //     ]);
            // });
            // This above code causing the require activation license dialog box to pop-up.
            // This is what this code does...
            /*
            1. $this->app->extend('core.middleware', function ($middleware) { ... });
                $this->app: Refers to the Laravel application's service container, which manages bindings and resolves dependencies throughout the application.
                extend('core.middleware', function ($middleware) { ... }):
                extend() is a method provided by Laravel's service container (Illuminate\Container\Container).
                It allows you to modify an existing binding or service definition identified by 'core.middleware'.
            2. function ($middleware) { ... }
                This is an anonymous function (closure) that receives the current value (which is an array of middleware) associated with 'core.middleware'.
                Inside this function, you can manipulate or extend the middleware array as needed.
            3. return array_merge($middleware, [ EnsureLicenseHasBeenActivated::class, ]);
                array_merge($middleware, [ EnsureLicenseHasBeenActivated::class, ]):
                Combines the existing middleware ($middleware) with an additional middleware class [ EnsureLicenseHasBeenActivated::class ].
                EnsureLicenseHasBeenActivated::class is presumably a middleware class that you want to add to the middleware stack.
            */

            add_filter(BASE_FILTER_TOP_HEADER_LAYOUT, function ($options) {
                try {
                    $countNotificationUnread = AdminNotification::countUnread();
                } catch (Throwable) {
                    $countNotificationUnread = 0;
                }

                return $options . view('core/base::notification.nav-item', compact('countNotificationUnread'));
            }, 99);

            add_filter(BASE_FILTER_FOOTER_LAYOUT_TEMPLATE, function ($html) {
                if (! Auth::guard()->check()) {
                    return $html;
                }

                return $html . view('core/base::notification.notification');
            }, 99);

            add_action(BASE_ACTION_META_BOXES, [MetaBox::class, 'doMetaBoxes'], 8, 2);

            $this->disableCsrfProtection();
        });

        $events->listen(MigrationsStarted::class, function () {
            rescue(function () {
                if (DB::getDefaultConnection() === 'mysql') {
                    DB::statement('SET SESSION sql_require_primary_key=0');
                }
            }, report: false);
        });

        $events->listen(['cache:cleared'], function () {
            $this->app['files']->delete(storage_path('cache_keys.json'));
        });

        $events->listen(PanelSectionsRendering::class, PushDashboardMenuToSystemPanel::class);

        if ($this->app->isLocal()) {
            DB::listen(function (QueryExecuted $queryExecuted) {
                if ($queryExecuted->time < 500) {
                    return;
                }

                Log::warning(sprintf('DB query exceeded %s ms. SQL: %s', $queryExecuted->time, $queryExecuted->sql));
            });
        }
    }

    protected function disableCsrfProtection(): void
    {
        /**
         * @var Repository $config
         */
        $config = $this->app['config'];

        if (
            BaseHelper::hasDemoModeEnabled()
            || $config->get('core.base.general.disable_verify_csrf_token', false)
            || ($this->app->environment('production') && AdminHelper::isInAdmin())
        ) {
            $this->app->instance(VerifyCsrfToken::class, new BaseMiddleware());
        }
    }
}
