<?php

namespace Botble\Code\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;
use Botble\Code\Http\Requests\CodeRequest;
use Botble\Code\Models\Code;

class CodeForm extends FormAbstract
{
    /**
     * @var string
     */
    protected $template = 'core/base::forms.form-tabs';

    /**
     * {@inheritDoc}
     */
    public function buildForm()
    {
 ///       $list = get_code_parents();
// dd($list);
        $parents = [];
        // foreach ($list as $row) {
        //     // dd($list);
        //     if ($this->getModel() && ($this->model->id === $row->id || $this->model->id === $row->parent_id) || $row->parent_id != 0 ) {
        //         continue;
        //     }
        //     // dd($row->name);
        //     $parents[$row->id] = $row->indent_text . ' ' . $row->name;
        //     // dd($parents);
        // }
        $parents = [0 => trans('plugins/blog::categories.none')] + $parents;
        $this
            ->setupModel(new Code())
            ->setValidatorClass(CodeRequest::class)
            ->withCustomFields()
            // ->addCustomField('tags', TagField::class)
            ->add('name', 'text', [
                'label'      => trans('core/base::forms.name'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'  => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            
            ->add('parent_id', 'customSelect', [
                'label'      => trans('core/base::forms.parent'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'class' => 'select-search-full',
                ],
                'choices'    => $parents,
            ])
            ->add('description', 'textarea', [
                'label'      => trans('core/base::forms.description'),
                'label_attr' => ['class' => 'control-label'],
                'attr'       => [
                    'rows'         => 4,
                    'placeholder'  => trans('core/base::forms.description_placeholder'),
                    'data-counter' => 400,
                ],
            ])
            ->add('level', 'number', [
                'label'      => trans('core/base::forms.level'),
                'label_attr' => ['class' => 'control-label'],
                'attr'       => [
                    'placeholder'  => trans('core/base::forms.level_placeholder'),
                    'data-counter' => 5,
                ],
                'default_value' => 0,
            ])

            ->add('Categories', 'customSelect', [
                'label'      => trans('core/base::forms.categories'),
                'label_attr' => ['class' => 'control-label'],
                'choices'    => get_topics($this->level->getOptions()),
            ])

            ->add('is_featured', 'onOff', [
                'label'         => trans('core/base::forms.is_featured'),
                'label_attr'    => ['class' => 'control-label'],
                'default_value' => false,
            ])
            ->add('content', 'codeEditor', [
                'label'      => trans('core/base::forms.content'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'placeholder'     => trans('core/base::forms.description_placeholder'),
                    'with-short-code' => true,
                ],
            ])
            ->add('status', 'customSelect', [
                'label'      => trans('core/base::tables.status'),
                'label_attr' => ['class' => 'control-label required'],
                'choices'    => BaseStatusEnum::labels(),
            ])
            ->add('template', 'customSelect', [
                'label'      => trans('core/base::forms.template'),
                'label_attr' => ['class' => 'control-label required'],
                'choices'    => get_code_templates(),
            ])
            ->add('image', 'mediaImage', [
                'label'      => trans('core/base::forms.image'),
                'label_attr' => ['class' => 'control-label'],
            ])
            ->setBreakFieldPoint('status');
    }
}
