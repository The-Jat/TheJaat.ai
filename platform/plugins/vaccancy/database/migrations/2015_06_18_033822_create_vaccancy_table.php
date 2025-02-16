<?php

use Botble\ACL\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::create('vaccancy_categories', function (Blueprint $table) {
            $table->id();
            $table->string('name', 120);
            $table->foreignId('parent_id')->default(0);
            $table->string('description', 400)->nullable();
            $table->string('status', 60)->default('published');
            $table->foreignId('author_id');
            $table->string('author_type', 255)->default(addslashes(User::class));
            $table->string('icon', 60)->nullable();
            $table->tinyInteger('order')->default(0);
            $table->tinyInteger('is_featured')->default(0);
            $table->tinyInteger('is_default')->unsigned()->default(0);
            $table->timestamps();
        });
        Schema::table('vaccancy_categories', function (Blueprint $table) {
            $table->index('parent_id', 'parent_id');
            $table->index('status', 'status');
            $table->index('created_at', 'created_at');
        });
        if (! Schema::hasColumn('vaccancy_categories', 'author_type')) {
            Schema::table('vaccancy_categories', function (Blueprint $table) {
                $table->string('author_type', 255);
            });
        }

        Schema::table('vaccancy_categories', function (Blueprint $table) {
            $table->string('author_type', 255)->change();
        });

        Schema::create('vaccancy_tags', function (Blueprint $table) {
            $table->id();
            $table->string('name', 120);
            $table->foreignId('author_id');
            $table->string('author_type', 255)->default(addslashes(User::class));
            $table->string('description', 400)->nullable()->default('');
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });
        if (! Schema::hasColumn('vaccancy_tags', 'author_type')) {
            Schema::table('vaccancy_tags', function (Blueprint $table) {
                $table->string('author_type', 255);
            });
        }

        Schema::table('vaccancy_tags', function (Blueprint $table) {
            $table->string('author_type', 255)->change();
        });

        Schema::create('vaccancy_posts', function (Blueprint $table) {
            $table->id();
            $table->string('name', 255);
            $table->string('description', 400)->nullable();
            $table->longText('content')->nullable();
            $table->string('status', 60)->default('published');
            $table->foreignId('author_id');
            $table->string('author_type', 255)->default(addslashes(User::class));
            $table->tinyInteger('is_featured')->unsigned()->default(0);
            $table->string('image', 255)->nullable();
            $table->integer('views')->unsigned()->default(0);
            $table->string('format_type', 30)->nullable();
            $table->timestamps();
        });
        Schema::table('vaccancy_posts', function (Blueprint $table) {
            $table->index('status', 'status');
            $table->index('author_id', 'author_id');
            $table->index('author_type', 'author_type');
            $table->index('created_at', 'created_at');
        });
        if (! Schema::hasColumn('vaccancy_posts', 'author_type')) {
            Schema::table('vaccancy_posts', function (Blueprint $table) {
                $table->string('author_type', 255);
            });
        }

        Schema::table('vaccancy_posts', function (Blueprint $table) {
            $table->string('author_type', 255)->change();
        });

        Schema::create('vaccancy_post_tags', function (Blueprint $table) {
            $table->foreignId('tag_id')->index();
            $table->foreignId('post_id')->index();
        });

        Schema::create('vaccancy_post_categories', function (Blueprint $table) {
            $table->foreignId('category_id')->index();
            $table->foreignId('post_id')->index();
        });

    }

    public function down(): void
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('vaccancy_post_tags');
        Schema::dropIfExists('vaccancy_post_categories');
        Schema::dropIfExists('vaccancy_posts');
        Schema::dropIfExists('vaccancy_categories');
        Schema::dropIfExists('vaccancy_tags');
    }
};
