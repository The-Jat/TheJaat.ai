<?php

use Botble\Base\Facades\BaseHelper;
use Botble\Code\Models\CodeCategory;
use Botble\Code\Models\CodePost;
use Botble\Code\Models\CodeTag;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'Botble\Code\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix() . '/code', 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'posts', 'as' => 'code_posts.'], function () {
            Route::resource('', 'PostController')
                ->parameters(['' => 'post']);

            Route::delete('items/destroy', [
                'as' => 'deletes',
                'uses' => 'PostController@deletes',
                'permission' => 'code_posts.destroy',
            ]);

            Route::get('widgets/recent-posts', [
                'as' => 'widget.recent-posts',
                'uses' => 'PostController@getWidgetRecentPosts',
                'permission' => 'code_posts.index',
            ]);
        });

        Route::group(['prefix' => 'categories', 'as' => 'code_categories.'], function () {
            Route::resource('', 'CategoryController')
                ->parameters(['' => 'category']);

            Route::delete('items/destroy', [
                'as' => 'deletes',
                'uses' => 'CategoryController@deletes',
                'permission' => 'code_categories.destroy',
            ]);
        });

        Route::group(['prefix' => 'tags', 'as' => 'code_tags.'], function () {
            Route::resource('', 'TagController')
                ->parameters(['' => 'tag']);

            Route::delete('items/destroy', [
                'as' => 'deletes',
                'uses' => 'TagController@deletes',
                'permission' => 'code_tags.destroy',
            ]);

            Route::get('all', [
                'as' => 'all',
                'uses' => 'TagController@getAllTags',
                'permission' => 'code_tags.index',
            ]);
        });
    });

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
            Route::get('search', [
                'as' => 'public.search',
                'uses' => 'PublicController@getSearch',
            ]);

            if (SlugHelper::getPrefix(CodeTag::class, 'tag')) {
                Route::get(SlugHelper::getPrefix(CodeTag::class, 'tag') . '/{slug}', [
                    'as' => 'public.tag',
                    'uses' => 'PublicController@getTag',
                ]);
            }

            if (SlugHelper::getPrefix(CodePost::class)) {
                Route::get(SlugHelper::getPrefix(CodePost::class) . '/{slug}', [
                    'uses' => 'CodeLandingController@getCodePostList',
                ])->name('code_post_list');
            }

            if (SlugHelper::getPrefix(CodeCategory::class)) {
                Route::get(SlugHelper::getPrefix(CodeCategory::class) . '/{slug}', [
                    'uses' => 'PublicController@getCategory',
                ]);
            }
        });
    }

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
           // if (SlugHelper::getPrefix(Course::class)) {
                Route::get('code-landing', [
                    'uses' => 'CodeLandingController@getCodeLanding',
                ]);
            //}
        });
    }
});
