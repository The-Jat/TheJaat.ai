<?php

return [
    'pattern' => '--slug--',
    'supported' => [
        'Botble\Page\Models\Page' => 'Pages',
        'Botble\Course\Models\Course' => 'Courses',
        'Botble\Vaccancy\Models\VaccancyPost' => 'Vaccancy',
    ],
    'prefixes' => [],
    'disable_preview' => [],
    'slug_generated_columns' => [],
    'enable_slug_translator' => env('CMS_ENABLE_SLUG_TRANSLATOR', false),
];
