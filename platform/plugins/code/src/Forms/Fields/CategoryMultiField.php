<?php

namespace Botble\Code\Forms\Fields;

use Botble\Base\Forms\FormField;

class CategoryMultiField extends FormField
{
    protected function getTemplate(): string
    {
        return 'plugins/code::categories.categories-multi';
    }
}
