<?php

namespace Botble\Code\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class CodeTag extends BaseModel
{
    protected $table = 'code_tags';

    protected $fillable = [
        'name',
        'description',
        'status',
        'author_id',
        'author_type',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
        'description' => SafeContent::class,
    ];

    public function posts(): BelongsToMany
    {
        return $this->belongsToMany(CodePost::class, 'vaccancy_post_tags', 'tag_id', 'post_id');
        // return $this->belongsToMany(CodePost::class, 'post_tags');
    }

    protected static function boot(): void
    {
        parent::boot();

        self::deleting(function (CodeTag $tag) {
            $tag->posts()->detach();
        });
    }
}
