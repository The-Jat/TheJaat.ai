<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        if (! Schema::hasTable('vaccancy_posts_translations')) {
            Schema::create('vaccancy_posts_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('posts_id');
                $table->string('name', 255)->nullable();
                $table->string('description', 400)->nullable();
                $table->longText('content')->nullable();

                $table->primary(['lang_code', 'posts_id'], 'posts_translations_primary');
            });
        }

        if (! Schema::hasTable('vaccancy_categories_translations')) {
            Schema::create('vaccancy_categories_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('categories_id');
                $table->string('name', 255)->nullable();
                $table->string('description', 400)->nullable();

                $table->primary(['lang_code', 'categories_id'], 'categories_translations_primary');
            });
        }

        if (! Schema::hasTable('vaccancy_tags_translations')) {
            Schema::create('vaccancy_tags_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('tags_id');
                $table->string('name', 255)->nullable();
                $table->string('description', 400)->nullable();

                $table->primary(['lang_code', 'tags_id'], 'tags_translations_primary');
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('vaccancy_posts_translations');
        Schema::dropIfExists('vaccancy_categories_translations');
        Schema::dropIfExists('vaccancy_tags_translations');
    }
};
