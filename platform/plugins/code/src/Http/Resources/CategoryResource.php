<?php

namespace Botble\Code\Http\Resources;

use Botble\Code\Models\CodeCategory;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin CodeCategory
 */
class CategoryResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'slug' => $this->slug,
            'url' => $this->url,
            'description' => $this->description,
        ];
    }
}
