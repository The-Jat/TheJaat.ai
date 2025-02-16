<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class() extends Migration
{
    public function up(): void
    {
        Schema::table('code_posts', function (Blueprint $table) {
            $table->index('status', 'status');
            $table->index('author_id', 'author_id');
            $table->index('author_type', 'author_type');
            $table->index('created_at', 'created_at');
        });

        Schema::table('code_categories', function (Blueprint $table) {
            $table->index('parent_id', 'parent_id');
            $table->index('status', 'status');
            $table->index('created_at', 'created_at');
        });
    }

    public function down(): void
    {
        if (Schema::hasTable('code_posts')) {
            Schema::table('code_posts', function (Blueprint $table) {
                $table->dropIndex('status');
                $table->dropIndex('author_id');
                $table->dropIndex('author_type');
                $table->dropIndex('created_at');
            });
        }

        if (Schema::hasTable('code_categories')) {
            Schema::table('code_categories', function (Blueprint $table) {
                $table->dropIndex('parent_id');
                $table->dropIndex('status');
                $table->dropIndex('created_at');
            });
        }
    }
};
