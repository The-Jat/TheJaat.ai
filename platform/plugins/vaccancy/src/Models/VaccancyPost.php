<?php

namespace Botble\Vaccancy\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Revision\RevisionableTrait;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class VaccancyPost extends BaseModel
{
    use RevisionableTrait;

    protected $table = 'vaccancy_posts';

    protected bool $revisionEnabled = true;

    protected bool $revisionCleanup = true;

    protected int $historyLimit = 20;

    protected array $dontKeepRevisionOf = [
        'content',
        'views',
    ];

    protected $fillable = [
        'name',
        'description',
        'content',
        'image',
        'is_featured',
        'format_type',
        'status',
        'author_id',
        'author_type',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
        'description' => SafeContent::class,
    ];

    public function tags(): BelongsToMany
    {
        // ddd("tags");
        // pass the column name otherwise the laravel thinks of column to be the table name + _id.
        return $this->belongsToMany(VaccancyTag::class, 'vaccancy_post_tags', 'tag_id', 'post_id');
    }

    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(VaccancyCategory::class, 'vaccancy_post_categories', 'post_id', 'category_id');
    }

    protected function firstCategory(): Attribute
    {
        return Attribute::make(
            get: function (): ?VaccancyCategory {
                $this->loadMissing('categories');

                return $this->categories->first();
            }
        );
    }

    public function author(): MorphTo
    {
        return $this->morphTo()->withDefault();
    }

    protected static function boot(): void
    {
        parent::boot();

        static::deleting(function (VaccancyPost $post) {
            $post->categories()->detach();
            $post->tags()->detach();
        });
    }
}
