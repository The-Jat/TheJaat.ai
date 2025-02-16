<?php

use Botble\ACL\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        if (! Schema::hasColumn('code_categories', 'author_type')) {
            Schema::table('code_categories', function (Blueprint $table) {
                $table->string('author_type', 255);
            });
        }

        Schema::table('code_categories', function (Blueprint $table) {
            $table->string('author_type', 255)->change();
        });

        if (! Schema::hasColumn('code_tags', 'author_type')) {
            Schema::table('code_tags', function (Blueprint $table) {
                $table->string('author_type', 255);
            });
        }

        Schema::table('code_tags', function (Blueprint $table) {
            $table->string('author_type', 255)->change();
        });

        if (! Schema::hasColumn('code_posts', 'author_type')) {
            Schema::table('code_posts', function (Blueprint $table) {
                $table->string('author_type', 255);
            });
        }

        Schema::table('code_posts', function (Blueprint $table) {
            $table->string('author_type', 255)->change();
        });
    }

    public function down(): void
    {
        Schema::table('code_categories', function (Blueprint $table) {
            $table->string('author_type', 255)->default(addslashes(User::class))->change();
        });

        Schema::table('code_tags', function (Blueprint $table) {
            $table->string('author_type', 255)->default(addslashes(User::class))->change();
        });

        Schema::table('code_posts', function (Blueprint $table) {
            $table->string('author_type', 255)->default(addslashes(User::class))->change();
        });
    }
};
