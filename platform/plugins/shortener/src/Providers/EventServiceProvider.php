<?php

namespace Botble\Shortener\Providers;

use Botble\Theme\Events\RenderingSiteMapEvent;
use Botble\Shortener\Listeners\RenderingSiteMapListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        RenderingSiteMapEvent::class => [
            RenderingSiteMapListener::class,
        ],
    ];
}
