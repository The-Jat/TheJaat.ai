<?php

namespace Botble\Code\Http\Resources;

use Botble\Code\Models\CodePost;
use Illuminate\Http\Resources\Json\JsonResource;
use Botble\Media\Facades\RvMedia;

/**
 * @mixin CodePost
 */
class ListPostResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'slug' => $this->slug,
            'description' => $this->description,
            'image' => $this->image ? RvMedia::url($this->image) : null,
            'categories' => CategoryResource::collection($this->categories),
            'tags' => TagResource::collection($this->tags),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
