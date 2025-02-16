<?php

use Botble\Base\Facades\BaseHelper;
use Botble\Vaccancy\Models\VaccancyCategory;
use Botble\Vaccancy\Models\VaccancyPost;
use Botble\Vaccancy\Models\VaccancyTag;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'Botble\Vaccancy\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix() . '/vaccancy', 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'posts', 'as' => 'vaccancy_posts.'], function () {
            Route::resource('', 'VaccancyPostController')
                ->parameters(['' => 'post']);

            Route::delete('items/destroy', [
                'as' => 'deletes',
                'uses' => 'VaccancyPostController@deletes',
                'permission' => 'vaccancy_posts.destroy',
            ]);

            Route::get('widgets/recent-posts', [
                'as' => 'widget.recent-posts',
                'uses' => 'VaccancyPostController@getWidgetRecentPosts',
                'permission' => 'vaccancy_posts.index',
            ]);
        });

        Route::group(['prefix' => 'categories', 'as' => 'vaccancy_categories.'], function () {
            Route::resource('', 'CategoryController')
                ->parameters(['' => 'category']);

            Route::delete('items/destroy', [
                'as' => 'deletes',
                'uses' => 'CategoryController@deletes',
                'permission' => 'vaccancy_categories.destroy',
            ]);
        });

        Route::group(['prefix' => 'tags', 'as' => 'vaccancy_tags.'], function () {
            Route::resource('', 'TagController')
                ->parameters(['' => 'tag']);

            Route::delete('items/destroy', [
                'as' => 'deletes',
                'uses' => 'TagController@deletes',
                'permission' => 'vaccancy_tags.destroy',
            ]);

            Route::get('all', [
                'as' => 'all',
                'uses' => 'TagController@getAllTags',
                'permission' => 'vaccancy_tags.index',
            ]);
        });
    });

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
            Route::get('search', [
                'as' => 'public.search',
                'uses' => 'PublicController@getSearch',
            ]);

            if (SlugHelper::getPrefix(VaccancyTag::class, 'tag')) {
                Route::get(SlugHelper::getPrefix(VaccancyTag::class, 'tag') . '/{slug}', [
                    'as' => 'public.tag',
                    'uses' => 'PublicController@getTag',
                ]);
            }

            if (SlugHelper::getPrefix(VaccancyPost::class)) {
                Route::get(SlugHelper::getPrefix(VaccancyPost::class) . '/{slug}', [
                    'uses' => 'PublicController@getPost',
                ]);

                // for the 'vaccancy' endpoint
                Route::get(SlugHelper::getPrefix(VaccancyPost::class), [
                    'uses' => 'LandingController@getPost',
                ]);
            }

            if (SlugHelper::getPrefix(VaccancyCategory::class)) {
                Route::get(SlugHelper::getPrefix(VaccancyCategory::class) . '/{slug}', [
                    'uses' => 'PublicController@getCategory',
                ]);
            }
        });
    }

    // if (defined('THEME_MODULE_SCREEN_NAME')) {
        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
           // if (SlugHelper::getPrefix(Course::class)) {
                Route::get(theme_option('vaccancy_landing_page_slug','vaccancy-landing'), [
                    'uses' => 'LandingController@VaccancyLanding',
                ]);
            //}
        });
    // }
});
