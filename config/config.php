
<?php

return [
    /*
    |--------------------------------------------------------------------------
    | Base URL Configuration
    |--------------------------------------------------------------------------
    |
    | This configuration defines the base URL for the application. It uses
    | the 'BASE_URL' environment variable if set; otherwise, it defaults to
    | 'http://127.0.0.1:8000'. Adjust the URL based on your environment.
    |
    */
    'BaseUrl' => env('BASE_URL', 'http://127.0.0.1:8000'),

    'objects' => [
        'Option 1' => [
            'name' => 'Option 1',
            'value' => 'Value 1',
        ],
        'Option 2' => [
            'name' => 'Option 2',
            'value' => 'Value 2',
        ],
        'Option 3' => [
            'name' => 'Option 3',
            'value' => 'Value 3',
        ],
        'OtherOption' => [
            'name' => 'OtherOption',
            'value' => 'OtherValue',
        ],
        // Add more objects as needed
    ],



];
