<?php

namespace Botble\Vaccancy\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class VaccancyTag extends BaseModel
{
    protected $table = 'vaccancy_tags';

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
        return $this->belongsToMany(VaccancyPost::class, 'vaccancy_post_tags', 'tag_id', 'post_id');
        // return $this->belongsToMany(VaccancyPost::class, 'vaccancy_post_tags');
    }

    protected static function boot(): void
    {
        parent::boot();

        self::deleting(function (VaccancyTag $tag) {
            $tag->posts()->detach();
        });
    }
}
