<?php

use Botble\Base\Facades\BaseHelper;
use Botble\Course\Models\Course;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Support\Facades\Route;
// use Botble\Course\Http\Controllers\TableController;
// use Botble\Course\Http\Controllers\FormFieldsController;
use Botble\Base\Facades\AdminHelper;

Route::group(['namespace' => 'Botble\Course\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(['prefix' => BaseHelper::getAdminPrefix(), 'middleware' => 'auth'], function () {
        Route::group(['prefix' => 'courses', 'as' => 'courses.'], function () {
            Route::resource('', 'CourseController')->parameters(['' => 'course']);

            // main table route to show the table landing page.
            Route::get('table', [
                'uses' => 'TableController@tableLanding',
            ])->name('table');

            // get children of clicked parent item.
            Route::get('/table/get-children/{itemId}', 'TableController@getChildren');

            // table item edit and destroy route
            Route::get('/table/{id}/edit', 'TableController@edit')->name('table.edit');
            Route::delete('/table/{id}', 'TableController@destroy')->name('table.destroy');

            // Route::get('table/list', [TableController::class, 'tableList'])->name('table.list');

            // Route::post('/change-sequence', 'TableController@changeSequence');
            // routes/web.php
            Route::get('/posts/reorder', 'TableController@showReorder');
            Route::post('/posts/reorder', 'TableController@saveReorder');

            // used in ParenChildSelect Input Box. To populate the child select box on change of parent select box.
            Route::get('/get-childs-for-parent/{id}', 'FormFieldsController@getChildsForParent');


            Route::delete('items/destroy', [
                'as' => 'deletes',
                'uses' => 'CourseController@deletes',
                'permission' => 'courses.destroy',
            ]);

            // main table route to show the table landing page.
            Route::get('config', [
                'uses' => 'ConfigController@configLanding',
            ])->name('config');
            Route::get('/edit-config', 'ConfigController@edit')->name('config.edit');
            Route::post('/update-config', 'ConfigController@update')->name('config.update');
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

    // if (defined('THEME_MODULE_SCREEN_NAME')) {
        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
            // if (SlugHelper::getPrefix(Course::class)) {
            Route::get('course-landing', [
                'uses' => 'LandingController@getCourse',
            ]);
            //}
        });
    // }

    // Route::group(['namespace' => 'Botble\Course\Http\Controllers'], function () {
    //     AdminHelper::registerRoutes(function () {
    //             Route::get('course-landing', [
    //                 'uses' => 'LandingController@getCourse',
    //             ]);
    //     });
    // });

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
            if (SlugHelper::getPrefix(Course::class)) {
                Route::get(config('packages.course.general.course_prefix') . '/{slug}', [
                    'uses' => 'LandingController@showCourse',
                ]);
            }
        });
    }


    // For resume only
    Route::get('/resume', function () {
        // Replace with the actual path to your PDF file
        $file = public_path('storage/cv/manish-kala-resume.pdf');
        
        // Check if the file exists
        if (file_exists($file)) {
            // Return the PDF file as a response
            return response()->file($file);
        } else {
            // If file not found, return 404 or handle error as needed
            abort(404, 'File not found');
        }
    })->name('resume');
    
});
