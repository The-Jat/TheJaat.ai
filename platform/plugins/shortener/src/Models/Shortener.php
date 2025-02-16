<?php

namespace Botble\Shortener\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Revision\RevisionableTrait;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Shortener extends BaseModel
{
    use RevisionableTrait;

    protected $table = 'shortener';

    protected bool $revisionEnabled = true;

    protected bool $revisionCleanup = true;

    protected int $historyLimit = 20;

    protected array $dontKeepRevisionOf = [
        'content',
        'views',
    ];

    protected $fillable = [
        'userid',
        'alias',
        'custom',
        'url',
        'location',
        'devices',
        'options',
        'domain',
        'description',
        'date',
        'pass',
        'click',
        'uniqueclick',
        'meta_title',
        'meta_description',
        'meta_image',
        'bundle',
        'public',
        'archived',
        'type',
        'pixels',
        'expiry',
        'parameters',
        'status',
        'qrid',
        'profileid',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
        'description' => SafeContent::class,
        'url' => 'string',
    ];

    // public function tags(): BelongsToMany
    // {
    //     return $this->belongsToMany(Tag::class, 'post_tags');
    // }

    // public function categories(): BelongsToMany
    // {
    //     return $this->belongsToMany(Category::class, 'post_categories');
    // }

    // protected function firstCategory(): Attribute
    // {
    //     return Attribute::make(
    //         get: function (): ?Category {
    //             $this->loadMissing('categories');

    //             return $this->categories->first();
    //         }
    //     );
    // }

    public function author(): MorphTo
    {
        return $this->morphTo()->withDefault();
    }

    // protected static function boot(): void
    // {
    //     parent::boot();

    //     static::deleting(function (Post $post) {
    //         $post->categories()->detach();
    //         $post->tags()->detach();
    //     });
    // }
}
