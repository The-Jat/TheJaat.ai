<?php

namespace Botble\Code\Http\Resources;

use Botble\Code\Models\CodeTag;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin CodeTag
 */
class TagResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'slug' => $this->slug,
            'description' => $this->description,
        ];
    }
}
