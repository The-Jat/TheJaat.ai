<?php

namespace Botble\Vaccancy\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Botble\Base\Facades\Html;
use Illuminate\Support\Collection;
use Illuminate\Support\HtmlString;

class VaccancyCategory extends BaseModel
{
    protected $table = 'vaccancy_categories';

    protected $fillable = [
        'name',
        'description',
        'parent_id',
        'icon',
        'is_featured',
        'order',
        'is_default',
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
        return $this->belongsToMany(VaccancyPost::class, 'vaccancy_post_categories', 'category_id', 'post_id')->with('slugable');
    }

    public function parent(): BelongsTo
    {
        return $this->belongsTo(VaccancyCategory::class, 'parent_id')->withDefault();
    }

    protected function parents(): Attribute
    {
        return Attribute::make(
            get: function (): Collection {
                $parents = collect();

                $parent = $this->parent;

                while ($parent->id) {
                    $parents->push($parent);
                    $parent = $parent->parent;
                }

                return $parents;
            },
        );
    }

    protected function badgeWithCount(): Attribute
    {
        return Attribute::make(
            get: function (): HtmlString {
                $badge = match ($this->status->getValue()) {
                    BaseStatusEnum::DRAFT => 'bg-secondary',
                    BaseStatusEnum::PENDING => 'bg-warning',
                    default => 'bg-success',
                };

                return Html::tag('span', (string)$this->posts_count, [
                    'class' => 'badge font-weight-bold ' . $badge,
                    'data-bs-toggle' => 'tooltip',
                    'data-bs-original-title' => trans('plugins/vaccancy::categories.total_posts', ['total' => $this->posts_count]),
                ]);
            },
        );
    }

    public function children(): HasMany
    {
        return $this->hasMany(VaccancyCategory::class, 'parent_id');
    }

    public function activeChildren(): HasMany
    {
        return $this
            ->children()
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->with(['slugable', 'activeChildren']);
    }

    protected static function boot(): void
    {
        parent::boot();

        self::deleting(function (VaccancyCategory $category) {
            foreach ($category->children()->get() as $child) {
                $child->delete();
            }

            $category->posts()->detach();
        });
    }
}
