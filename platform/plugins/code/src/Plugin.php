<?php

namespace Botble\Code;

use Botble\Code\Models\CodeCategory;
use Botble\Code\Models\CodeTag;
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
        Schema::dropIfExists('code_post_tags');
        Schema::dropIfExists('code_post_categories');
        Schema::dropIfExists('code_posts');
        Schema::dropIfExists('code_categories');
        Schema::dropIfExists('code_tags');
        Schema::dropIfExists('code_posts_translations');
        Schema::dropIfExists('code_categories_translations');
        Schema::dropIfExists('code_tags_translations');

        app(DashboardWidgetInterface::class)->deleteBy(['name' => 'widget_posts_recent']);

        app(MenuNodeInterface::class)->deleteBy(['reference_type' => CodeCategory::class]);
        app(MenuNodeInterface::class)->deleteBy(['reference_type' => CodeTag::class]);

        Setting::query()
            ->whereIn('key', [
                'code_post_schema_enabled',
                'code_post_schema_type',
            ])
            ->delete();
    }
}
