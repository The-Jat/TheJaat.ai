<?php

use Botble\Code\Models\Code;

Route::group(['namespace' => 'Botble\Code\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'codes', 'as' => 'codes.'], function () {
            Route::resource('', 'CodeController')->parameters(['' => 'code']);

            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'CodeController@deletes',
                'permission' => 'codes.destroy',
            ]);
        });
    });

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
            if (SlugHelper::getPrefix(Code::class)) {
                Route::get(SlugHelper::getPrefix(Code::class) . '/{slug}', [
                    'uses' => 'PublicController@getCode',
                ]);
            }
        });
    }
});
