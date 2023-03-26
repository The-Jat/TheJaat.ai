<?php

return [
    [
        'name' => 'Course',
        'flag' => 'courses.index',
    ],
    [
        'name'        => 'Create',
        'flag'        => 'courses.create',
        'parent_flag' => 'courses.index',
    ],
    [
        'name'        => 'Edit',
        'flag'        => 'courses.edit',
        'parent_flag' => 'courses.index',
    ],
    [
        'name'        => 'Delete',
        'flag'        => 'courses.destroy',
        'parent_flag' => 'courses.index',
    ],
];
