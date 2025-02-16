<?php

return [
    [
        'name' => 'Vaccancy',
        'flag' => 'plugins.vaccancy',
    ],
    [
        'name' => 'Posts',
        'flag' => 'vaccancy_posts.index',
        'parent_flag' => 'plugins.vaccancy',
    ],
    [
        'name' => 'Create',
        'flag' => 'vaccancy_posts.create',
        'parent_flag' => 'vaccancy_posts.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'vaccancy_posts.edit',
        'parent_flag' => 'vaccancy_posts.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'vaccancy_posts.destroy',
        'parent_flag' => 'vaccancy_posts.index',
    ],

    [
        'name' => 'Categories',
        'flag' => 'vaccancy_categories.index',
        'parent_flag' => 'plugins.vaccancy',
    ],
    [
        'name' => 'Create',
        'flag' => 'vaccancy_categories.create',
        'parent_flag' => 'vaccancy_categories.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'vaccancy_categories.edit',
        'parent_flag' => 'vaccancy_categories.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'vaccancy_categories.destroy',
        'parent_flag' => 'vaccancy_categories.index',
    ],

    [
        'name' => 'Tags',
        'flag' => 'vaccancy_tags.index',
        'parent_flag' => 'plugins.vaccancy',
    ],
    [
        'name' => 'Create',
        'flag' => 'vaccancy_tags.create',
        'parent_flag' => 'vaccancy_tags.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'vaccancy_tags.edit',
        'parent_flag' => 'vaccancy_tags.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'vaccancy_tags.destroy',
        'parent_flag' => 'vaccancy_tags.index',
    ],
];
