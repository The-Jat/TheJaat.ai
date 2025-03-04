<?php

namespace TheSky\ProPosts\Providers;

use Botble\Base\Traits\LoadAndPublishDataTrait;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\ServiceProvider;
use TheSky\ProPosts\Models\FavoritePosts;
use TheSky\ProPosts\Repositories\Caches\FavoritePostsCacheDecorator;
use TheSky\ProPosts\Repositories\Eloquent\FavoritePostsRepository;
use TheSky\ProPosts\Repositories\Interfaces\FavoritePostsInterface;

class ProPostsServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register()
    {
        $this->app->bind(FavoritePostsInterface::class, function () {
            return new FavoritePostsCacheDecorator(new FavoritePostsRepository(new FavoritePosts()));
        });

        $this->setNamespace('plugins/pro-posts')->loadHelpers();
    }

    public function boot()
    {
        $this
            ->loadAndPublishConfigurations(['permissions'])
            ->loadMigrations()
            ->loadAndPublishTranslations()
            ->loadAndPublishViews()
            ->loadRoutes(['web']);

        Event::listen(RouteMatched::class, function (): void {
            if (defined('LANGUAGE_MODULE_SCREEN_NAME')) {
                \Language::registerModule([FavoritePosts::class]);
            }
        });
    }
}
