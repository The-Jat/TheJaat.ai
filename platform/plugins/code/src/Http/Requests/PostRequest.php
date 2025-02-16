<?php

namespace Botble\Code\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Code\Supports\PostFormat;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class PostRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'name' => 'required|string|max:255',
            'description' => 'nullable|string|max:400',
            'content' => 'nullable|string',
            'tag' => 'nullable|string',
            'categories' => 'required|array',
            'status' => Rule::in(BaseStatusEnum::values()),
        ];

        $postFormats = PostFormat::getPostFormats(true);

        if (count($postFormats) > 1) {
            $rules['format_type'] = Rule::in(array_keys($postFormats));
        }

        return $rules;
    }
}
