<?php

namespace Botble\Shortener\Providers;

use Botble\Api\Facades\ApiHelper;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Botble\Shortcode\View\View;
use Illuminate\Routing\Events\RouteMatched;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Shortener\Models\Post;
use Botble\Shortener\Repositories\Caches\ShortenerCacheDecorator;
use Botble\Shortener\Repositories\Eloquent\ShortenerRepository;
use Botble\Shortener\Repositories\Interfaces\ShortenerInterface;
use Illuminate\Support\ServiceProvider;
use Botble\Shortener\Models\Category;
use Botble\Shortener\Repositories\Caches\CategoryCacheDecorator;
use Botble\Shortener\Repositories\Eloquent\CategoryRepository;
use Botble\Shortener\Repositories\Interfaces\CategoryInterface;
use Botble\Shortener\Models\Shortener;
use Botble\Shortener\Repositories\Caches\TagCacheDecorator;
use Botble\Shortener\Repositories\Eloquent\TagRepository;
use Botble\Shortener\Repositories\Interfaces\TagInterface;
use Botble\Language\Facades\Language;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\SiteMapManager;
use Botble\Slug\Facades\SlugHelper;

/**
 * @since 02/07/2016 09:50 AM
 */
class ShortenerServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(ShortenerInterface::class, function () {
            return new ShortenerCacheDecorator(new ShortenerRepository(new Shortener()));
        });

        // $this->app->bind(CategoryInterface::class, function () {
        //     return new CategoryCacheDecorator(new CategoryRepository(new Category()));
        // });

        // $this->app->bind(TagInterface::class, function () {
        //     return new TagCacheDecorator(new TagRepository(new Tag()));
        // });
    }

    public function boot(): void
    {
        // This below line was causing issue of giving wrong url from the
        // the shortener model $shortener->url, it was giving "127.0.0.1:8000",
        // However the url contains the intended url in database. So I commented the line.
        // SlugHelper::registerModule(Shortener::class, 'Shortener Posts');

        // SlugHelper::registerModule(Category::class, 'Shortener Categories');
        // SlugHelper::registerModule(Tag::class, 'Shortener Tags');

        // SlugHelper::setPrefix(Tag::class, 'shortener-tag', true);
        // SlugHelper::setPrefix(Post::class, 'shortener', true);
        // SlugHelper::setPrefix(Category::class, 'shortener-category', true);

        $this->setNamespace('plugins/shortener')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions', 'general'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadMigrations()
            ->publishAssets();

        if (ApiHelper::enabled()) {
            $this->loadRoutes(['api']);
        }

        $this->app->register(EventServiceProvider::class);
        SiteMapManager::registerKey(['shortener-posts', 'shortener-categories', 'shortener-tags']);

        $this->app['events']->listen(RouteMatched::class, function () {
            dashboard_menu()
                ->registerItem([
                    'id' => 'cms-plugins-shortener',
                    'priority' => 1,
                    'parent_id' => null,
                    'name' => 'plugins/shortener::base.menu_name',
                    'icon' => 'ti ti-cut',
                    'url' => route('shortener.index'),
                    'permissions' => ['shortener.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-shortener-create',
                    'priority' => 3,
                    'parent_id' => 'cms-plugins-shortener',
                    'name' => 'Create',//'plugins/shortener::categories.menu_name',
                    'icon' => null,
                    'url' => route('shortener.create'),
                    'permissions' => ['shortener.create'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-shortener-index',
                    'priority' => 2,
                    'parent_id' => 'cms-plugins-shortener',
                    'name' => 'plugins/shortener::index.menu_name',
                    'icon' => null,
                    'url' => route('shortener.index'),
                    'permissions' => ['shortener.index'],
                ])
                
                ->registerItem([
                    'id' => 'cms-plugins-shortener-tags',
                    'priority' => 3,
                    'parent_id' => 'cms-plugins-shortener',
                    'name' => 'plugins/shortener::tags.menu_name',
                    'icon' => null,
                    'url' => route('tags.index'),
                    'permissions' => ['tags.index'],
                ]);
        });

        $useLanguageV2 = $this->app['config']->get('plugins.shortener.general.use_language_v2', false) &&
            defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME');

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && $useLanguageV2) {
            LanguageAdvancedManager::registerModule(Post::class, [
                'name',
                'description',
                'content',
            ]);

            LanguageAdvancedManager::registerModule(Category::class, [
                'name',
                'description',
            ]);

            LanguageAdvancedManager::registerModule(Tag::class, [
                'name',
                'description',
            ]);
        }

        $this->app->booted(function () use ($useLanguageV2) {
            $models = [Post::class, Category::class, Tag::class];

            if (defined('LANGUAGE_MODULE_SCREEN_NAME') && ! $useLanguageV2) {
                Language::registerModule($models);
            }

            SeoHelper::registerModule($models);

            $configKey = 'packages.revision.general.supported';
            config()->set($configKey, array_merge(config($configKey, []), [Post::class]));

            $this->app->register(HookServiceProvider::class);
        });

        if (function_exists('shortcode')) {
            view()->composer([
                'plugins/shortener::themes.post',
                'plugins/shortener::themes.category',
                'plugins/shortener::themes.tag',
            ], function (View $view) {
                $view->withShortcodes();
            });
        }
    }
}
