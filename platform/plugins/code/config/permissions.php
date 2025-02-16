<?php

return [
    [
        'name' => 'Code',
        'flag' => 'plugins.code',
    ],
    [
        'name' => 'Posts',
        'flag' => 'code_posts.index',
        'parent_flag' => 'plugins.code',
    ],
    [
        'name' => 'Create',
        'flag' => 'code_posts.create',
        'parent_flag' => 'code_posts.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'code_posts.edit',
        'parent_flag' => 'code_posts.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'code_posts.destroy',
        'parent_flag' => 'code_posts.index',
    ],

    [
        'name' => 'Categories',
        'flag' => 'code_categories.index',
        'parent_flag' => 'plugins.code',
    ],
    [
        'name' => 'Create',
        'flag' => 'code_categories.create',
        'parent_flag' => 'code_categories.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'code_categories.edit',
        'parent_flag' => 'code_categories.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'code_categories.destroy',
        'parent_flag' => 'code_categories.index',
    ],

    [
        'name' => 'Tags',
        'flag' => 'code_tags.index',
        'parent_flag' => 'plugins.code',
    ],
    [
        'name' => 'Create',
        'flag' => 'code_tags.create',
        'parent_flag' => 'code_tags.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'code_tags.edit',
        'parent_flag' => 'code_tags.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'code_tags.destroy',
        'parent_flag' => 'code_tags.index',
    ],
];
