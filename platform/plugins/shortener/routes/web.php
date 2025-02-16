<?php

use Botble\Base\Facades\BaseHelper;
use Botble\Shortener\Models\Category;
use Botble\Shortener\Models\Shortener;
use Botble\Shortener\Models\Tag;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Support\Facades\Route;
use Botble\Shortener\Http\Controllers\QRController;
use Botble\Shortener\Http\Controllers\ShortenerController;
use Botble\Shortener\Http\Controllers\ScreenshotController;

Route::group(['namespace' => 'Botble\Shortener\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix() . '/blog', 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'shortener', 'as' => 'shortener.'], function () {
            Route::resource('', 'ShortenerController')
                ->parameters(['' => 'shortener']);

            Route::get('destroy/{id}', [
                'as'    => 'destroy',
                'uses'  => 'ShortenerController@destroy']);

            Route::get('fetch', [
                'as' => 'fetch',
                'uses' => 'ShortenerController@fetch']);
            Route::post('/shorten', [
                'as' => 'sub',
                'uses'  => 'ShortenerController@Sub'
            ]);

            Route::post('/check-password/{id}', [
                'as' => 'check.password',
                'uses'  => 'ShortenerController@checkPassword'  
            ]);

            // routes/web.php



            Route::get('/qr-code', [QRController::class, 'generateQRCode']);
            Route::get('/download-qrcode', [QRController::class, 'generateAndDownloadQRCode']);





            // Route::delete('items/destroy', [
            //     'as' => 'deletes',
            //     'uses' => 'PostController@deletes',
            //     'permission' => 'posts.destroy',
            // ]);

            // Route::get('widgets/recent-posts', [
            //     'as' => 'widget.recent-posts',
            //     'uses' => 'PostController@getWidgetRecentPosts',
            //     'permission' => 'posts.index',
            // ]);
        });

        // Route::group(['prefix' => 'categories', 'as' => 'categories.'], function () {
        //     Route::resource('', 'CategoryController')
        //         ->parameters(['' => 'category']);

        //     Route::delete('items/destroy', [
        //         'as' => 'deletes',
        //         'uses' => 'CategoryController@deletes',
        //         'permission' => 'categories.destroy',
        //     ]);
        // });

        // Route::group(['prefix' => 'tags', 'as' => 'tags.'], function () {
        //     Route::resource('', 'TagController')
        //         ->parameters(['' => 'tag']);

        //     Route::delete('items/destroy', [
        //         'as' => 'deletes',
        //         'uses' => 'TagController@deletes',
        //         'permission' => 'tags.destroy',
        //     ]);

        //     Route::get('all', [
        //         'as' => 'all',
        //         'uses' => 'TagController@getAllTags',
        //         'permission' => 'tags.index',
        //     ]);
        // });
    });

   
    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
            // 'ShortenerController@redirect')->name('shorten.redirect');
            Route::get('search', [
                'as' => 'public.search',
                'uses' => 'PublicController@getSearch',
            ]);

            if (SlugHelper::getPrefix(Tag::class, 'tag')) {
                Route::get(SlugHelper::getPrefix(Tag::class, 'tag') . '/{slug}', [
                    'as' => 'public.tag',
                    'uses' => 'PublicController@getTag',
                ]);
            }

            if (SlugHelper::getPrefix(Post::class)) {
                Route::get(SlugHelper::getPrefix(Post::class) . '/{slug}', [
                    'uses' => 'PublicController@getPost',
                ]);
            }

            if (SlugHelper::getPrefix(Category::class)) {
                Route::get(SlugHelper::getPrefix(Category::class) . '/{slug}', [
                    'uses' => 'PublicController@getCategory',
                ]);
            }
        });
    }
    

    // Route::get('shorty/{url}', 'ShortenerController@redirect')->name('shorty');
    Route::get('shorty/{url}', 'ShortenerController@validateLink')->name('shorty');
    Route::post('/check-password/{id}', [
        'as' => 'check.password',
        'uses'  => 'ShortenerController@checkPassword'  
    ]);


    
});

// Route::group([
//     'namespace' => 'Botble\Shortener\Http\Controllers',
//     'middleware' => 'web',
//     // 'as' => 'url_shortener.',
// ], function () {

//     // Route::get('/coder', [
//     //     'as' => 'public.coder',
//     //     'uses' => 'ShortenerController@redirect',
//     // ]);
//     Route::get('coder', 'ShortenerController@redirect')->name('coder');
// }

// );
