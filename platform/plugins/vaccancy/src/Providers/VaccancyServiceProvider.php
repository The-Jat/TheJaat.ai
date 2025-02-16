<?php

namespace Botble\Vaccancy\Providers;

use Botble\Api\Facades\ApiHelper;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Botble\Shortcode\View\View;
use Illuminate\Routing\Events\RouteMatched;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Vaccancy\Models\VaccancyPost;
use Botble\Vaccancy\Repositories\Caches\VaccancyPostCacheDecorator;
use Botble\Vaccancy\Repositories\Eloquent\PostRepository;
use Botble\Vaccancy\Repositories\Interfaces\PostInterface;
use Illuminate\Support\ServiceProvider;
use Botble\Vaccancy\Models\VaccancyCategory;
use Botble\Vaccancy\Repositories\Caches\VaccancyCategoryCacheDecorator;
use Botble\Vaccancy\Repositories\Eloquent\CategoryRepository;
use Botble\Vaccancy\Repositories\Interfaces\CategoryInterface;
use Botble\Vaccancy\Models\VaccancyTag;
use Botble\Vaccancy\Repositories\Caches\VaccancyTagCacheDecorator;
use Botble\Vaccancy\Repositories\Eloquent\TagRepository;
use Botble\Vaccancy\Repositories\Interfaces\TagInterface;
use Botble\Language\Facades\Language;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\SiteMapManager;
use Botble\Slug\Facades\SlugHelper;

/**
 * @since 02/07/2016 09:50 AM
 */
class VaccancyServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(PostInterface::class, function () {
            return new VaccancyPostCacheDecorator(new PostRepository(new VaccancyPost()));
        });

        $this->app->bind(CategoryInterface::class, function () {
            return new VaccancyCategoryCacheDecorator(new CategoryRepository(new VaccancyCategory()));
        });

        $this->app->bind(TagInterface::class, function () {
            return new VaccancyTagCacheDecorator(new TagRepository(new VaccancyTag()));
        });
    }

    public function boot(): void
    {
        SlugHelper::registerModule(VaccancyPost::class, 'Vaccancy Posts');
        SlugHelper::registerModule(VaccancyCategory::class, 'Vaccancy Categories');
        SlugHelper::registerModule(VaccancyTag::class, 'Vaccancy Tags');

        SlugHelper::setPrefix(VaccancyTag::class, 'vaccancy_tag', true);
        SlugHelper::setPrefix(VaccancyPost::class, 'vaccancy', true);
        SlugHelper::setPrefix(VaccancyCategory::class, 'vaccancy_category', true);

        $this->setNamespace('plugins/vaccancy')
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
        SiteMapManager::registerKey(['vaccancy-posts', 'vaccancy-categories', 'vaccancy-tags']);

        $this->app['events']->listen(RouteMatched::class, function () {
            dashboard_menu()
                ->registerItem([
                    'id' => 'cms-plugins-vaccancy',
                    'priority' => 4,
                    'parent_id' => null,
                    'name' => 'plugins/vaccancy::base.menu_name',
                    'icon' => 'ti ti-layout',
                    'url' => route('vaccancy_posts.index'),
                    'permissions' => ['vaccancy_posts.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-vaccancy-post',
                    'priority' => 1,
                    'parent_id' => 'cms-plugins-vaccancy',
                    'name' => 'plugins/vaccancy::posts.menu_name',
                    'icon' => null,
                    'url' => route('vaccancy_posts.index'),
                    'permissions' => ['vaccancy_posts.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-vaccancy-categories',
                    'priority' => 2,
                    'parent_id' => 'cms-plugins-vaccancy',
                    'name' => 'plugins/vaccancy::categories.menu_name',
                    'icon' => null,
                    'url' => route('vaccancy_categories.index'),
                    'permissions' => ['vaccancy_categories.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-vaccancy-tags',
                    'priority' => 3,
                    'parent_id' => 'cms-plugins-vaccancy',
                    'name' => 'plugins/vaccancy::tags.menu_name',
                    'icon' => null,
                    'url' => route('vaccancy_tags.index'),
                    'permissions' => ['vaccancy_tags.index'],
                ]);
        });

        $useLanguageV2 = $this->app['config']->get('plugins.vaccancy.general.use_language_v2', false) &&
            defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME');

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && $useLanguageV2) {
            LanguageAdvancedManager::registerModule(VaccancyPost::class, [
                'name',
                'description',
                'content',
            ]);

            LanguageAdvancedManager::registerModule(VaccancyCategory::class, [
                'name',
                'description',
            ]);

            LanguageAdvancedManager::registerModule(VaccancyTag::class, [
                'name',
                'description',
            ]);
        }

        $this->app->booted(function () use ($useLanguageV2) {
            $models = [VaccancyPost::class, VaccancyCategory::class, VaccancyTag::class];

            if (defined('LANGUAGE_MODULE_SCREEN_NAME') && ! $useLanguageV2) {
                Language::registerModule($models);
            }

            SeoHelper::registerModule($models);

            $configKey = 'packages.revision.general.supported';
            config()->set($configKey, array_merge(config($configKey, []), [VaccancyPost::class]));

            $this->app->register(HookServiceProvider::class);
        });

        if (function_exists('shortcode')) {
            view()->composer([
                'plugins/vaccancy::themes.post',
                'plugins/vaccancy::themes.category',
                'plugins/vaccancy::themes.tag',
            ], function (View $view) {
                $view->withShortcodes();
            });
        }
    }
}
