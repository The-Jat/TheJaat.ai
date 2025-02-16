<?php

namespace Botble\Vaccancy\Providers;

use Botble\Theme\Events\RenderingSiteMapEvent;
use Botble\Vaccancy\Listeners\RenderingSiteMapListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        RenderingSiteMapEvent::class => [
            RenderingSiteMapListener::class,
        ],
    ];
}
