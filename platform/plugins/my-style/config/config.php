<?php

use Botble\Blog\Models\Post;
use Botble\Page\Models\Page;
use Botble\Course\Models\Course;

return [
    'supported' => [
        Page::class,
        Post::class,
        Course::class,
    ],
];
