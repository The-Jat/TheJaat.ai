<?php

namespace Botble\Code\Providers;

use Botble\Api\Facades\ApiHelper;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Botble\Shortcode\View\View;
use Illuminate\Routing\Events\RouteMatched;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Code\Models\CodePost;
use Botble\Code\Repositories\Caches\CodePostCacheDecorator;
use Botble\Code\Repositories\Eloquent\PostRepository;
use Botble\Code\Repositories\Interfaces\PostInterface;
use Illuminate\Support\ServiceProvider;
use Botble\Code\Models\CodeCategory;
use Botble\Code\Repositories\Caches\CodeCategoryCacheDecorator;
use Botble\Code\Repositories\Eloquent\CategoryRepository;
use Botble\Code\Repositories\Interfaces\CategoryInterface;
use Botble\Code\Models\CodeTag;
use Botble\Code\Repositories\Caches\CodeTagCacheDecorator;
use Botble\Code\Repositories\Eloquent\TagRepository;
use Botble\Code\Repositories\Interfaces\TagInterface;
use Botble\Language\Facades\Language;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\SiteMapManager;
use Botble\Slug\Facades\SlugHelper;

/**
 * @since 02/07/2016 09:50 AM
 */
class CodeServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(PostInterface::class, function () {
            return new CodePostCacheDecorator(new PostRepository(new CodePost()));
        });

        $this->app->bind(CategoryInterface::class, function () {
            return new CodeCategoryCacheDecorator(new CategoryRepository(new CodeCategory()));
        });

        $this->app->bind(TagInterface::class, function () {
            return new CodeTagCacheDecorator(new TagRepository(new CodeTag()));
        });
    }

    public function boot(): void
    {
        SlugHelper::registerModule(CodePost::class, 'Code Posts');
        SlugHelper::registerModule(CodeCategory::class, 'Code Categories');
        SlugHelper::registerModule(CodeTag::class, 'Code Tags');

        SlugHelper::setPrefix(CodeTag::class, 'code-tag', true);
        SlugHelper::setPrefix(CodePost::class, 'code', true);
        SlugHelper::setPrefix(CodeCategory::class, 'code-category', true);

        $this->setNamespace('plugins/code')
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
        SiteMapManager::registerKey(['code-posts', 'code-categories', 'code-tags']);

        $this->app['events']->listen(RouteMatched::class, function () {
            dashboard_menu()
                ->registerItem([
                    'id' => 'cms-plugins-code',
                    'priority' => 3,
                    'parent_id' => null,
                    'name' => 'plugins/code::base.menu_name',
                    'icon' => 'ti ti-mouse',
                    'url' => route('code_posts.index'),
                    'permissions' => ['code_posts.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-code-post',
                    'priority' => 1,
                    'parent_id' => 'cms-plugins-code',
                    'name' => 'plugins/code::posts.menu_name',
                    'icon' => null,
                    'url' => route('code_posts.index'),
                    'permissions' => ['code_posts.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-code-categories',
                    'priority' => 2,
                    'parent_id' => 'cms-plugins-code',
                    'name' => 'plugins/code::categories.menu_name',
                    'icon' => null,
                    'url' => route('code_categories.index'),
                    'permissions' => ['code_categories.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-code-tags',
                    'priority' => 3,
                    'parent_id' => 'cms-plugins-code',
                    'name' => 'plugins/code::tags.menu_name',
                    'icon' => null,
                    'url' => route('code_tags.index'),
                    'permissions' => ['code_tags.index'],
                ]);
        });

        $useLanguageV2 = $this->app['config']->get('plugins.code.general.use_language_v2', false) &&
            defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME');

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && $useLanguageV2) {
            LanguageAdvancedManager::registerModule(CodePost::class, [
                'name',
                'description',
                'content',
            ]);

            LanguageAdvancedManager::registerModule(CodeCategory::class, [
                'name',
                'description',
            ]);

            LanguageAdvancedManager::registerModule(CodeTag::class, [
                'name',
                'description',
            ]);
        }

        $this->app->booted(function () use ($useLanguageV2) {
            $models = [CodePost::class, CodeCategory::class, CodeTag::class];

            if (defined('LANGUAGE_MODULE_SCREEN_NAME') && ! $useLanguageV2) {
                Language::registerModule($models);
            }

            SeoHelper::registerModule($models);

            // disable revision history as it causes improper layout.
            // $configKey = 'packages.revision.general.supported';
            // config()->set($configKey, array_merge(config($configKey, []), [CodePost::class]));

            $this->app->register(HookServiceProvider::class);
        });

        if (function_exists('shortcode')) {
            view()->composer([
                'plugins/code::themes.post',
                'plugins/code::themes.category',
                'plugins/code::themes.tag',
            ], function (View $view) {
                $view->withShortcodes();
            });
        }
    }
}
