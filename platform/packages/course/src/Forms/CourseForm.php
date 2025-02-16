<?php

namespace Botble\Course\Forms;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Forms\FormAbstract;
use Botble\Course\Http\Requests\CourseRequest;
use Botble\Course\Models\Course;
use Botble\Base\Forms\FieldOptions\ContentFieldOption;
use Botble\Base\Forms\FieldOptions\DescriptionFieldOption;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\Fields\EditorField;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Course\Supports\Template;

class CourseForm extends FormAbstract
{



    public function setup(): void
    {
        // Get all parent courses whose parent_id = 0
        $list = get_course_parents();
        // dd($list);
        $parents = [];
        foreach ($list as $row) {
            // dd($list);
            // if ($this->getModel() && (/*$this->model->id === $row->id ||*/ $this->model->id === $row->parent_id) || $row->parent_id != 0 ) {
            //     continue;
            // }
            // dd($row->name);
            $parents[$row->id] = $row->indent_text . ' ' . $row->name;
            // dd($parents);
        }
        $parents = [0 => trans('plugins/blog::categories.none')] + $parents;

        // Get all courses
        $items = Course::all(); // Retrieve all items from the model

        $dataArray = [];
        foreach ($items as $item) {
            $dataArray[] = [
                'id'   => $item->id,
                'name' => $item->name,
                'parent_id' => $item->parent_id,
            ];
        }

        $this
            ->model(Course::class)
            ->setValidatorClass(CourseRequest::class)
            ->hasTabs()
            ->add('name', TextField::class, NameFieldOption::make()->maxLength(120)->required()->toArray())

            // Parent Child
            ->add('parent_id', 'customSelectParentChild', [
                            'label'      => trans('core/base::forms.parent'),
                            'label_attr' => ['class' => 'control-label required'],
                            'attr'       => [
                                'class' => 'select-search-full',
                            ],
                            'optionAttrs' => ['child_id' =>'child'],
                            'childChoices' => [],
                            'completeList'=> $dataArray,
                            'choices'    => $parents,
                        ])

            ->add('description', TextareaField::class, DescriptionFieldOption::make()->toArray())

            // Level
            ->add('level', 'number', [
                            'label'      => trans('core/base::forms.level'),
                            'label_attr' => ['class' => 'control-label'],
                            'attr'       => [
                                'placeholder'  => trans('core/base::forms.level_placeholder'),
                                'data-counter' => 5,
                            ],
                            'default_value' => 0,
                        ])
            // Order
            ->add('order', 'number', [
                            'label'      => 'order',
                            'label_attr' => ['class' => 'control-label'],
                            'attr'       => [
                                'placeholder'  => 'order',
                                'data-counter' => 5,
                            ],
                            'default_value' => 0,
                        ])
            // Categories
            ->add('Categories', 'customSelect', [
                            'label'      => trans('core/base::forms.categories'),
                            'label_attr' => ['class' => 'control-label'],
                            'choices'    => get_topics($this->level->getOptions()),
                        ])
            ->add('content', EditorField::class, ContentFieldOption::make()->allowedShortcodes()->toArray())
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->when(Template::getCourseTemplates(), function (CourseForm $form, array $templates) {
                return $form
                    ->add(
                        'template',
                        SelectField::class,
                        SelectFieldOption::make()
                            ->label(trans('core/base::forms.template'))
                            ->required()
                            ->choices($templates)
                            ->toArray()
                    );
            })
            ->add('image', MediaImageField::class)
            ->setBreakFieldPoint('status');
    }


    // protected $template = 'core/base::forms.form-tabs';

    // public function buildForm(): void
    // {
    //     // Get all parent courses whose parent_id = 0
    //     $list = get_course_parents();

    //     $parents = [];
    //     foreach ($list as $row) {
    //         // dd($list);
    //         // if ($this->getModel() && (/*$this->model->id === $row->id ||*/ $this->model->id === $row->parent_id) || $row->parent_id != 0 ) {
    //         //     continue;
    //         // }
    //         // dd($row->name);
    //         $parents[$row->id] = $row->indent_text . ' ' . $row->name;
    //         // dd($parents);
    //     }
    //     $parents = [0 => trans('plugins/blog::categories.none')] + $parents;

    //     // Get all courses
    //     $items = Course::all(); // Retrieve all items from the model

    //     $dataArray = [];
    //     foreach ($items as $item) {
    //         $dataArray[] = [
    //             'id'   => $item->id,
    //             'name' => $item->name,
    //             'parent_id' => $item->parent_id,
    //         ];
    //     }

    //     $this
    //         ->setupModel(new Course())
    //         ->setValidatorClass(CourseRequest::class)
    //         ->withCustomFields()
    //         ->add('name', 'text', [
    //             'label' => trans('core/base::forms.name'),
    //             'label_attr' => ['class' => 'control-label required'],
    //             'attr' => [
    //                 'placeholder' => trans('core/base::forms.name_placeholder'),
    //                 'data-counter' => 120,
    //             ],
    //         ])
    //         ->add('parent_id', 'customSelectParentChild', [
    //             'label'      => trans('core/base::forms.parent'),
    //             'label_attr' => ['class' => 'control-label required'],
    //             'attr'       => [
    //                 'class' => 'select-search-full',
    //             ],
    //             'optionAttrs' => ['child_id' =>'child'],
    //             'childChoices' => [],
    //             'completeList'=> $dataArray,
    //             'choices'    => $parents,
    //         ])
    //         ->add('description', 'textarea', [
    //             'label' => trans('core/base::forms.description'),
    //             'label_attr' => ['class' => 'control-label'],
    //             'attr' => [
    //                 'rows' => 4,
    //                 'placeholder' => trans('core/base::forms.description_placeholder'),
    //                 'data-counter' => 400,
    //             ],
    //         ])
    //         ->add('level', 'number', [
    //             'label'      => trans('core/base::forms.level'),
    //             'label_attr' => ['class' => 'control-label'],
    //             'attr'       => [
    //                 'placeholder'  => trans('core/base::forms.level_placeholder'),
    //                 'data-counter' => 5,
    //             ],
    //             'default_value' => 0,
    //         ])
    //         ->add('order', 'number', [
    //             'label'      => 'order',
    //             'label_attr' => ['class' => 'control-label'],
    //             'attr'       => [
    //                 'placeholder'  => 'order',
    //                 'data-counter' => 5,
    //             ],
    //             'default_value' => 0,
    //         ])
    //         ->add('Categories', 'customSelect', [
    //             'label'      => trans('core/base::forms.categories'),
    //             'label_attr' => ['class' => 'control-label'],
    //             'choices'    => get_topics($this->level->getOptions()),
    //         ])
    //         ->add('content', 'editor', [
    //             'label' => trans('core/base::forms.content'),
    //             'label_attr' => ['class' => 'control-label required'],
    //             'attr' => [
    //                 'placeholder' => trans('core/base::forms.description_placeholder'),
    //                 'with-short-code' => true,
    //             ],
    //         ])
    //         ->add('status', 'customSelect', [
    //             'label' => trans('core/base::tables.status'),
    //             'label_attr' => ['class' => 'control-label required'],
    //             'choices' => BaseStatusEnum::labels(),
    //         ])
    //         ->add('template', 'customSelect', [
    //             'label' => trans('core/base::forms.template'),
    //             'label_attr' => ['class' => 'control-label required'],
    //             'choices' => get_page_templates(),
    //         ])
    //         ->add('image', 'mediaImage', [
    //             'label' => trans('core/base::forms.image'),
    //             'label_attr' => ['class' => 'control-label'],
    //         ])
    //         ->setBreakFieldPoint('status');
    // }
}
