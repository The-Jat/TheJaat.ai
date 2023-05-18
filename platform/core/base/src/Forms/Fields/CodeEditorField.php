<?php

namespace Botble\Base\Forms\Fields;

use Assets;
use Illuminate\Support\Arr;
use Kris\LaravelFormBuilder\Fields\FormField;

class CodeEditorField extends FormField
{
    /**
     * {@inheritDoc}
     */
    protected function getTemplate()
    {
        Assets::addScriptsDirectly('vendor/core/core/base/js/codeEditorNew.js');

        return 'core/base::forms.fields.editor';
    }

    /**
     *{@inheritDoc}
     */
    public function render(array $options = [], $showLabel = true, $showField = true, $showError = true)
    {
        $options['with-short-code'] = Arr::get($options, 'with-short-code', false);

        return parent::render($options, $showLabel, $showField, $showError);
    }
}
