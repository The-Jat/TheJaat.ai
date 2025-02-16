<?php

Route::group(['namespace' => 'Botble\AIWriter\Http\Controllers', 'middleware' => ['web', 'core']], function () {
    Route::group(apply_filters(BASE_FILTER_GROUP_PUBLIC_ROUTE, []), function () {
        Route::post('ajax/get-ai-content', 'AIWriterController@ajaxGetAIContent')
            ->name('theme.ajax-get-ai-content');
    });
});
