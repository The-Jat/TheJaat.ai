<?php

namespace Botble\Vaccancy;

use Botble\Vaccancy\Models\VaccancyCategory;
use Botble\Vaccancy\Models\VaccancyTag;
use Botble\Dashboard\Repositories\Interfaces\DashboardWidgetInterface;
use Botble\Menu\Repositories\Interfaces\MenuNodeInterface;
use Botble\Setting\Models\Setting;
use Illuminate\Support\Facades\Schema;
use Botble\PluginManagement\Abstracts\PluginOperationAbstract;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('vaccancy_post_tags');
        Schema::dropIfExists('vaccancy_post_categories');
        Schema::dropIfExists('vaccancy_posts');
        Schema::dropIfExists('vaccancy_categories');
        Schema::dropIfExists('vaccancy_tags');
        Schema::dropIfExists('vaccancy_posts_translations');
        Schema::dropIfExists('vaccancy_categories_translations');
        Schema::dropIfExists('vaccancy_tags_translations');

        app(DashboardWidgetInterface::class)->deleteBy(['name' => 'widget_posts_recent']);

        app(MenuNodeInterface::class)->deleteBy(['reference_type' => VaccancyCategory::class]);
        app(MenuNodeInterface::class)->deleteBy(['reference_type' => VaccancyTag::class]);

        Setting::query()
            ->whereIn('key', [
                'blog_post_schema_enabled',
                'blog_post_schema_type',
            ])
            ->delete();
    }
}
