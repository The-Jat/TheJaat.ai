<?php

namespace Botble\Vaccancy\Forms\Fields;

use Botble\Base\Forms\FormField;

class CategoryMultiField extends FormField
{
    protected function getTemplate(): string
    {
        return 'plugins/vaccancy::categories.categories-multi';
    }
}
