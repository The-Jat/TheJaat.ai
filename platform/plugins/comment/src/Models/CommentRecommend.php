<?php

namespace Botble\Comment\Models;

use Botble\Base\Models\BaseModel;

class CommentRecommend extends BaseModel
{
    /**
     * @var string
     */
    protected $table = 'bb_comment_recommends';

    /**
     * @var string[]
     */
    protected $fillable = [
        'reference_id',
        'reference_type',
        'user_id',
    ];
}
