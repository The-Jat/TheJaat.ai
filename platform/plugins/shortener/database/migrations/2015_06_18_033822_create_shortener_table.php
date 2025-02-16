<?php

use Botble\ACL\Models\User;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::create('shortener', function (Blueprint $table) {
            $table->charset = 'utf8mb4';
            $table->id();
            $table->bigInteger('userid')->index();
            $table->string('alias', 50)->index();
            $table->string('custom', 100)->index();
            $table->text('url');
            // $table->text('location');
            $table->text('location')->default(''); // Add this line to your migration file
            $table->text('devices')->default('');
            $table->text('options')->default('');
            $table->string('domain', 100);
            $table->text('description')->default('');
            $table->timestamp('date');
            $table->string('pass');
            $table->bigInteger('click')->default(0);
            $table->bigInteger('uniqueclick')->default(0);
            $table->string('meta_title');
            $table->text('meta_description');
            $table->string('meta_image')->nullable();
            $table->bigInteger('bundle');
            $table->integer('public')->default(0);
            $table->integer('archived')->default(0);
            $table->string('type');
            $table->string('pixels');
            $table->timestamp('expiry')->nullable();
            $table->text('parameters')->nullable();
            $table->integer('status')->default(1)->index();
            $table->bigInteger('qrid');
            $table->bigInteger('profileid');
            $table->timestamps(); // This adds created_at and updated_at columns.
            
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('shortener');
        
    }
};
