<?php

namespace Botble\Course\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Course\Supports\Template;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CourseRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:120',
            'description' => 'nullable|string|max:400',
            'content' => 'required|string',
            'template' => Rule::in(array_keys(Template::getCourseTemplates())),
            'status' => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
