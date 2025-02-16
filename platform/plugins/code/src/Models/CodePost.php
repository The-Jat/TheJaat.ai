<?php

namespace Botble\Code\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Revision\RevisionableTrait;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class CodePost extends BaseModel
{
    use RevisionableTrait;

    protected $table = 'code_posts';

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
        'parent_id',
        'difficulty',
        'order',
        'is_parent',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
        'description' => SafeContent::class,
    ];

    public function tags(): BelongsToMany
    {
        // return $this->belongsToMany(CodeTag::class, 'post_tags');
        return $this->belongsToMany(CodeTag::class, 'code_post_tags', 'tag_id', 'post_id');
    }

    public function categories(): BelongsToMany
    {
        // dd($this->belongsToMany(CodeCategory::class, 'code_post_categories', 'category_id', 'post_id'));
        return $this->belongsToMany(CodeCategory::class, 'code_post_categories', 'post_id', 'category_id');

        // return $this->belongsToMany(CodeCategory::class, 'code_post_categories');
    }

    protected function firstCategory(): Attribute
    {
        return Attribute::make(
            get: function (): ?CodeCategory {
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

        static::deleting(function (CodePost $post) {
            $post->categories()->detach();
            $post->tags()->detach();
        });
    }
}
