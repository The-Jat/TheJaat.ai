<?php

namespace Botble\Base\Forms\Fields;

class CustomSelectParentChildField extends SelectField
{
    protected function getTemplate(): string
    {
        // ddd("getTemplate");
        return 'core/base::forms.fields.custom-select-parent-child';
    }
}
