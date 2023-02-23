<?php

namespace Botble\Comment\Models;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;
use Botble\Member\Models\Member;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Comment extends BaseModel
{
    use EnumCastable;

    /**
     * @var BaseModel
     */
    public static $author;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'bb_comments';

    /**
     * @var array
     */
    protected $fillable = [
        'comment',
        'reference_id',
        'reference_type',
        'ip_address',
        'user_id',
        'status',
        'parent_id',
        'reply_count',
        'created_at',
        'updated_at',
    ];

    /**
     * @var array
     */
    protected $casts = [
        'status' => BaseStatusEnum::class,
    ];

    /**
     * @var string[]
     */
    protected $appends = [
        'time',
        'rep',
        'isAuthor',
        'liked',
    ];

    /**
     * @var string[]
     */
    protected $with = [
        'user',
    ];

    protected static function boot()
    {
        parent::boot();

        static::created(function (Comment $comment) {
            if ((int)$comment->parent_id !== 0) {
                $parent = Comment::where(['id' => $comment->parent_id])->first();
                $parent->reply_count = Comment::where(['parent_id' => $parent->id])->count();
                $parent->save();
            }
        });

        static::deleted(function (Comment $comment) {
            Comment::where(['parent_id' => $comment->id])->delete();
        });
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function user()
    {
        return $this->hasOne(Member::class, 'id', 'user_id')->withDefault();
    }

    /**
     * @return MorphTo
     */
    public function reference()
    {
        return $this->morphTo();
    }

    /**
     * @return string
     */
    public function getTimeAttribute()
    {
        return $this->created_at->diffForHumans();
    }

    /**
     * @return bool
     */
    public function getIsAuthorAttribute()
    {
        if (self::$author && $this->user) {
            return $this->user->email === self::$author->email && $this->user->user_type === get_class(self::$author);
        }

        return false;
    }

    /**
     * @return array|\Illuminate\Contracts\Pagination\LengthAwarePaginator
     */
    public function getRepAttribute()
    {
        return (int)$this->reply_count > 0 ? $this->replies()
            ->orderBy('created_at', 'DESC')
            ->paginate(5, ['*'], 'rep_page') : [];
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function replies()
    {
        return $this->hasMany(Comment::class, 'parent_id', 'id');
    }

    /**
     * @return bool
     */
    public function getLikedAttribute()
    {
        if ((int)$this->like_count > 0 && auth()->guard(COMMENT_GUARD)->check()) {
            return $this->likes()->where(['user_id' => auth()->guard(COMMENT_GUARD)->id()])->exists();
        }

        return false;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function likes()
    {
        return $this->hasMany(CommentLike::class);
    }
}
