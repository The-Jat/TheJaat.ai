<?php

use Botble\Course\Models\Course;

Route::group(['namespace' => 'Botble\Course\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'courses', 'as' => 'courses.'], function () {
            Route::resource('', 'CourseController')->parameters(['' => 'course']);

            Route::delete('items/destroy', [
                'as'         => 'deletes',
                'uses'       => 'CourseController@deletes',
                'permission' => 'courses.destroy',
            ]);
        });
    });

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
            if (SlugHelper::getPrefix(Course::class)) {
                Route::get(SlugHelper::getPrefix(Course::class) . '/{slug}', [
                    'uses' => 'PublicController@getCourse',
                ]);
            }
        });
    }
});
