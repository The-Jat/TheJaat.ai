<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::create('courses', function (Blueprint $table) {
            $table->id();
            $table->string('name', 120);
            $table->longText('content')->nullable();
            $table->foreignId('user_id')->index();
            $table->integer('parent_id')->nullable();
            $table->integer('level')->default(0);
            $table->string('image', 255)->nullable();
            $table->string('template', 60)->nullable();
            $table->tinyInteger('is_featured')->default(0);
            $table->string('description', 400)->nullable();
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('courses');
    }
};
