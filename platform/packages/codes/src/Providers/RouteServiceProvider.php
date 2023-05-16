<?php

namespace Botble\Code\Providers;

use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * Move base routes to a service provider to make sure all filters & actions can hook to base routes
     */
    public function boot()
    {
        $this->loadRoutesFrom(package_path('codes/routes/web.php'));
    }
}
