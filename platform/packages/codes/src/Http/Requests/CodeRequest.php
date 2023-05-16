<?php

namespace Botble\Code\Http\Requests;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Code\Supports\Template;
use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CodeRequest extends Request
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'        => 'required|max:120',
            'description' => 'max:400',
            'content'     => 'required',
            'template'    => Rule::in(array_keys(Template::getCodeTemplates())),
            'status'      => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
