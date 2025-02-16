<?php

namespace Botble\Course\Tables;

use Botble\Base\Facades\BaseHelper;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Course\Models\Course;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\BulkChanges\CreatedAtBulkChange;
use Botble\Table\BulkChanges\NameBulkChange;
use Botble\Table\BulkChanges\SelectBulkChange;
use Botble\Table\BulkChanges\StatusBulkChange;
use Botble\Base\Facades\Html;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Botble\Table\DataTables;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\FormattedColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\HeaderActions\CreateHeaderAction;


class CourseTable extends TableAbstract
{


    public function setup(): void
    {
        $this
            ->model(Course::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('courses.create'))
            ->addActions([
                EditAction::make()->route('courses.edit'),
                DeleteAction::make()->route('courses.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('courses.edit'),
                FormattedColumn::make('template')
                    ->title(trans('core/base::tables.template'))
                    ->alignStart()
                    ->getValueUsing(function (FormattedColumn $column) {
                        static $pageTemplates;

                        $pageTemplates ??= get_course_templates();

                        return Arr::get($pageTemplates, $column->getItem()->template ?: 'default');
                    }),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('courses.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                SelectBulkChange::make()
                    ->name('template')
                    ->title(trans('core/base::tables.template'))
                    ->choices(fn () => get_course_templates())
                    ->validate(['required', Rule::in(array_keys(get_course_templates()))]),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->
            queryUsing(function (Builder $query) {
                $query->select([
                    'id',
                    'name',
                    'parent_id',
                    'template',
                    'created_at',
                    'status',
                ]);
            });
    }




    // protected $hasActions = true;

    // protected $hasFilter = true;

    // public function __construct(DataTables $table, UrlGenerator $urlGenerator, CourseInterface $courseRepository)
    // {
    //     parent::__construct($table, $urlGenerator);

    //     $this->repository = $courseRepository;

    //     if (! Auth::user()->hasAnyPermission(['courses.edit', 'courses.destroy'])) {
    //         $this->hasOperations = false;
    //         $this->hasActions = false;
    //     }
    // }

    // public function ajax(): JsonResponse
    // {
    //     $courseTemplates = get_course_templates();

    //     $data = $this->table
    //         ->eloquent($this->query())
    //         ->editColumn('name', function (Course $item) {
    //             if (! Auth::user()->hasPermission('posts.edit')) {
    //                 $name = BaseHelper::clean($item->name);
    //             } else {
    //                 $name = Html::link(route('courses.edit', $item->id), BaseHelper::clean($item->name));
    //             }

    //             if (function_exists('theme_option') && BaseHelper::isHomepage($item->id)) {
    //                 $name .= Html::tag('span', ' — ' . trans('packages/course::courses.front_course'), [
    //                     'class' => 'additional-course-name',
    //                 ])->toHtml();
    //             }

    //             return apply_filters(COURSE_FILTER_COURSE_NAME_IN_ADMIN_LIST, $name, $item);
    //         })
    //         ->editColumn('checkbox', function (Course $item) {
    //             return $this->getCheckbox($item->id);
    //         })
    //         ->editColumn('parent_id', function (Course $item) {
    //             // Get parent course
    //             $parentCourse = get_course_by_id($item->parent_id);
    //             $grandParentCourse = null;
    //             if ($parentCourse) {
    //                 // Get grand parent course
    //                 $grandParentCourse = get_course_by_id($parentCourse->parent_id);
    //             }
    //             $parentName = $parentCourse ? $parentCourse->name . " [" . ($grandParentCourse ? $grandParentCourse->name : "--")  . "]" : "--";
    //             return $parentName;
    //         })
    //         ->editColumn('template', function (Course $item) use ($courseTemplates) {
    //             return Arr::get($courseTemplates, $item->template ?: 'default');
    //         })
    //         ->editColumn('created_at', function (Course $item) {
    //             return BaseHelper::formatDate($item->created_at);
    //         })
    //         ->editColumn('status', function (Course $item) {
    //             return $item->status->toHtml();
    //         })
    //         ->addColumn('operations', function (Course $item) {
    //             return $this->getOperations('courses.edit', 'courses.destroy', $item);
    //         });

    //     return $this->toJson($data);
    // }

    // public function query(): Relation|Builder|QueryBuilder
    // {
    //     $query = $this->repository->getModel()->select([
    //         'id',
    //         'name',
    //         'parent_id',
    //         'template',
    //         'created_at',
    //         'status',
    //     ]);

    //     return $this->applyScopes($query);
    // }

    // public function columns(): array
    // {
    //     return [
    //         'id' => [
    //             'title' => trans('core/base::tables.id'),
    //             'width' => '20px',
    //         ],
    //         'name' => [
    //             'title' => trans('core/base::tables.name'),
    //             'class' => 'text-start',
    //         ],
    //         'parent_id' => [
    //             'title' => trans('core/base::tables.parent'),
    //             'class' => 'text-start',
    //         ],
    //         // 'template' => [
    //         //     'title' => trans('core/base::tables.template'),
    //         //     'class' => 'text-start',
    //         // ],
    //         'created_at' => [
    //             'title' => trans('core/base::tables.created_at'),
    //             'width' => '100px',
    //             'class' => 'text-center',
    //         ],
    //         'status' => [
    //             'title' => trans('core/base::tables.status'),
    //             'width' => '100px',
    //             'class' => 'text-center',
    //         ],
    //     ];
    // }

    // public function buttons(): array
    // {
    //     return $this->addCreateButton(route('courses.create'), 'courses.create');
    // }

    // public function bulkActions(): array
    // {
    //     return $this->addDeleteAction(route('courses.deletes'), 'courses.destroy', parent::bulkActions());
    // }

    // public function getBulkChanges(): array
    // {
    //     return [
    //         'name' => [
    //             'title' => trans('core/base::tables.name'),
    //             'type' => 'text',
    //             'validate' => 'required|max:120',
    //         ],
    //         'status' => [
    //             'title' => trans('core/base::tables.status'),
    //             'type' => 'customSelect',
    //             'choices' => BaseStatusEnum::labels(),
    //             'validate' => 'required|' . Rule::in(BaseStatusEnum::values()),
    //         ],
    //         'template' => [
    //             'title' => trans('core/base::tables.template'),
    //             'type' => 'customSelect',
    //             'choices' => get_course_templates(),
    //             'validate' => 'required',
    //         ],
    //         'created_at' => [
    //             'title' => trans('core/base::tables.created_at'),
    //             'type' => 'datePicker',
    //         ],
    //     ];
    // }
}
