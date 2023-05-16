<?php

return [
    [
        'name' => 'Code',
        'flag' => 'codes.index',
    ],
    [
        'name'        => 'Create',
        'flag'        => 'codes.create',
        'parent_flag' => 'codes.index',
    ],
    [
        'name'        => 'Edit',
        'flag'        => 'codes.edit',
        'parent_flag' => 'codes.index',
    ],
    [
        'name'        => 'Delete',
        'flag'        => 'codes.destroy',
        'parent_flag' => 'codes.index',
    ],
];
