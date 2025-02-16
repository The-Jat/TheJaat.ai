<?php

namespace Botble\Code\Forms;

// use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Enums\DifficultyStatusEnum;
// use Botble\Base\Forms\Fields\TagField;
// use Botble\Base\Forms\FormAbstract;
use Botble\Code\Forms\Fields\CategoryMultiField;
use Botble\Code\Http\Requests\PostRequest;
use Botble\Code\Models\CodePost;
use Botble\Code\Repositories\Interfaces\CategoryInterface;
use Botble\Base\Forms\FieldOptions\ContentFieldOption;
use Botble\Base\Forms\FieldOptions\DescriptionFieldOption;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\OnOffFieldOption;
use Botble\Base\Forms\FieldOptions\RadioFieldOption;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\FieldOptions\TagFieldOption;
use Botble\Base\Forms\Fields\EditorField;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\OnOffField;
use Botble\Base\Forms\Fields\CustomSelectParentChildField;
use Botble\Base\Forms\Fields\RadioField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TagField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\Fields\TreeCategoryField;
use Botble\Base\Forms\FormAbstract;
// use Botble\Blog\Http\Requests\PostRequest;
use Botble\Code\Models\CodeCategory;
// use Botble\Blog\Models\Post;
use Botble\Code\Models\CodeTag;

class PostForm extends FormAbstract
{
    protected $template = 'core/base::forms.form-tabs';

    public function buildForm(): void
    {
        $list = get_code_parents();
        $parents = [];
        foreach ($list as $row) {
            // dd($list);
            if ($this->getModel() && (/*$this->model->id === $row->id ||*/$this->model->id === $row->parent_id) || $row->parent_id != 0) {
                continue;
            }
            // dd($row->name);
            $parents[$row->id] = $row->indent_text . ' ' . $row->name;
            // dd($parents);
        }
        $parents = [0 => trans('plugins/code::categories.none')] + $parents;
        // dd($parents);
        $items = CodePost::all(); // Retrieve all items from the model

        $dataArray = [];

        foreach ($items as $item) {
            $dataArray[] = [
                'id'   => $item->id,
                'name' => $item->name,
                'parent_id' => $item->parent_id,
            ];
        }

        $selectedCategories = [];
        if ($this->getModel()) {
            $selectedCategories = $this->getModel()->categories()->pluck('category_id')->all();
        }

        if (empty($selectedCategories)) {
            $selectedCategories = app(CategoryInterface::class)
                ->getModel()
                ->where('is_default', 1)
                ->pluck('id')
                ->all();
        }

        $tags = null;

        //     if ($this->getModel()) {
        //         $tags = $this->getModel()->tags()->pluck('name')->all();
        //         $tags = implode(',', $tags);
        //     }

        //     if (! $this->formHelper->hasCustomField('categoryMulti')) {
        //         $this->formHelper->addCustomField('categoryMulti', CategoryMultiField::class);
        //     }

        //     $this
        //         ->setupModel(new CodePost())
        //         ->setValidatorClass(PostRequest::class)
        //         ->withCustomFields()
        //         ->addCustomField('tags', TagField::class)
        //         ->add('name', 'text', [
        //             'label' => trans('core/base::forms.name'),
        //             'label_attr' => ['class' => 'control-label required'],
        //             'attr' => [
        //                 'placeholder' => trans('core/base::forms.name_placeholder'),
        //                 'data-counter' => 150,
        //             ],
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
        //         ->add('difficulty', 'customSelect', [
        //             'label' =>  trans('core/base::tables.difficulty'),
        //             'label_attr' => ['class' => 'control-label required'],
        //             'choices' => DifficultyStatusEnum::labels(),
        //         ])
        //         ->add('order', 'number', [
        //             'label'      => trans('core/base::tables.order'),
        //             'label_attr' => ['class' => 'control-label'],
        //             'attr'       => [
        //                 'placeholder'  => 'order',
        //                 'data-counter' => 5,
        //             ],
        //             'default_value' => 0,
        //         ])
        //         ->add('is_parent', 'onOff', [
        //             'label' => 'Is Parent',//trans('core/base::forms.is_featured'),
        //             'label_attr' => ['class' => 'control-label'],
        //             'default_value' => false,
        //         ])
        //         ->add('is_featured', 'onOff', [
        //             'label' => trans('core/base::forms.is_featured'),
        //             'label_attr' => ['class' => 'control-label'],
        //             'default_value' => false,
        //         ])
        //         ->add('content', 'editor', [
        //             'label' => trans('core/base::forms.content'),
        //             'label_attr' => ['class' => 'control-label'],
        //             'attr' => [
        //                 'rows' => 4,
        //                 'placeholder' => trans('core/base::forms.description_placeholder'),
        //                 'with-short-code' => true,
        //             ],
        //         ])
        //         ->add('status', 'customSelect', [
        //             'label' => trans('core/base::tables.status'),
        //             'label_attr' => ['class' => 'control-label required'],
        //             'choices' => BaseStatusEnum::labels(),
        //         ])
        //         ->add('categories[]', 'categoryMulti', [
        //             'label' => trans('plugins/code::posts.form.categories'),
        //             'label_attr' => ['class' => 'control-label required'],
        //             'choices' => get_categories_with_children_of_codes(),
        //             'value' => old('categories', $selectedCategories),
        //         ])
        //         ->add('image', 'mediaImage', [
        //             'label' => trans('core/base::forms.image'),
        //             'label_attr' => ['class' => 'control-label'],
        //         ])
        //         ->add('tag', 'tags', [
        //             'label' => trans('plugins/code::posts.form.tags'),
        //             'label_attr' => ['class' => 'control-label'],
        //             'value' => $tags,
        //             'attr' => [
        //                 'placeholder' => trans('plugins/code::base.write_some_tags'),
        //                 'data-url' => route('code_tags.all'),
        //             ],
        //         ])
        //         ->setBreakFieldPoint('status');

        //     // $postFormats = get_post_formats(true);

        //     // if (count($postFormats) > 1) {
        //     //     $this->addAfter('status', 'format_type', 'customRadio', [
        //     //         'label' => trans('plugins/code::posts.form.format_type'),
        //     //         'label_attr' => ['class' => 'control-label'],
        //     //         'choices' => get_post_formats(true),
        //     //     ]);
        //     // }
        // }

        $this
            ->model(CodePost::class)
            ->setValidatorClass(PostRequest::class)
            ->hasTabs()
            ->add('name', TextField::class, NameFieldOption::make()->required()->toArray())
            ->add('description', TextareaField::class, DescriptionFieldOption::make()->toArray())
            ->add('parent_id', CustomSelectParentChildField::class, [
                'label'      => trans('core/base::forms.parent'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'class' => 'select-search-full',
                ],
                'optionAttrs' => ['child_id' => 'child'],
                'childChoices' => [],
                'completeList' => $dataArray,
                'choices'    => $parents,
            ])
            ->add('difficulty', SelectField::class, [
                'label' =>  trans('core/base::forms.difficulty'),
                'label_attr' => ['class' => 'control-label required'],
                'choices' => DifficultyStatusEnum::labels(),
            ])
            ->add('order', 'number', [
                'label'      => trans('core/base::forms.order'),
                'label_attr' => ['class' => 'control-label'],
                'attr'       => [
                    'placeholder'  => 'order',
                    'data-counter' => 5,
                ],
                'default_value' => 0,
            ])
            ->add('is_parent', OnOffField::class, [
                'label' => 'Is Parent', //trans('core/base::forms.is_featured'),
                'label_attr' => ['class' => 'control-label'],
                'default_value' => false,
            ])
            ->add(
                'is_featured',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/base::forms.is_featured'))
                    ->defaultValue(false)
                    ->toArray()
            )
            ->add('content', EditorField::class, ContentFieldOption::make()->allowedShortcodes()->toArray())
            ->add('status', SelectField::class, StatusFieldOption::make()->toArray())
            ->when(get_post_formats(true), function (PostForm $form, array $postFormats) {
                if (count($postFormats) > 1) {
                    $choices = [];

                    foreach ($postFormats as $postFormat) {
                        $choices[$postFormat[0]] = $postFormat[1];
                    }

                    $form
                        ->add(
                            'format_type',
                            RadioField::class,
                            RadioFieldOption::make()
                                ->label(trans('plugins/code::posts.form.format_type'))
                                ->choices($choices)
                                ->toArray()
                        );
                }
            })
            // ->add(
            //     'categories[]',
            //     TreeCategoryField::class,
            //     SelectFieldOption::make()
            //         ->label(trans('plugins/blog::posts.form.categories'))
            //         ->choices(get_categories_with_children())
            //         ->when($this->getModel()->id, function (SelectFieldOption $fieldOption) {
            //             return $fieldOption->selected($this->getModel()->categories()->pluck('category_id')->all());
            //         })
            //         ->when(!$this->getModel()->id, function (SelectFieldOption $fieldOption) {
            //             return $fieldOption
            //                 ->selected(CodeCategory::query()
            //                     ->where('is_default', 1)
            //                     ->pluck('id')
            //                     ->all());
            //         })
            //         ->toArray()
            // )
            ->add('categories[]', CategoryMultiField::class, [
                'label' => trans('plugins/code::posts.form.categories'),
                'label_attr' => ['class' => 'control-label required'],
                'choices' => get_categories_with_children_of_codes(),
                'value' => old('categories', $selectedCategories),
            ])
            ->add('image', MediaImageField::class)
            ->add(
                'tag',
                TagField::class,
                TagFieldOption::make()
                    ->label(trans('plugins/code::posts.form.tags'))
                    ->when($this->getModel()->id, function (TagFieldOption $fieldOption) {
                        return $fieldOption
                            ->value(
                                $this->getModel()
                                    ->tags()
                                    ->select('name')
                                    ->get()
                                    ->map(fn (CodeTag $item) => $item->name)
                                    ->implode(',')
                            );
                    })
                    ->placeholder(trans('plugins/code::base.write_some_tags'))
                    ->ajaxUrl(route('code_tags.all'))
                    ->toArray()
            )
            ->setBreakFieldPoint('status');
    }
}
