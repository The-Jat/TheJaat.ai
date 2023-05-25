<?php

namespace Botble\Course\Tables;

use BaseHelper;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Table\Abstracts\TableAbstract;
use Html;
use Illuminate\Contracts\Routing\UrlGenerator;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Yajra\DataTables\DataTables;

class CourseTable extends TableAbstract
{
    /**
     * @var bool
     */
    protected $hasActions = true;

    /**
     * @var bool
     */
    protected $hasFilter = true;
// public $Item=0;
    /**
     * CourseTable constructor.
     * @param DataTables $table
     * @param UrlGenerator $urlGenerator
     * @param CourseInterface $courseRepository
     */
    public function __construct(DataTables $table, UrlGenerator $urlGenerator, CourseInterface $courseRepository)
    {
        parent::__construct($table, $urlGenerator);
        
        $this->repository = $courseRepository;

        if (!Auth::user()->hasAnyPermission(['courses.edit', 'courses.destroy'])) {
            $this->hasOperations = false;
            $this->hasActions = false;
        }
    }

    /**
     * {@inheritDoc}
     */
    public function ajax(): JsonResponse
    {
        $courseTemplates = get_course_templates();
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('name', function ($item) {
                // $this->Item = $item->parent_id;
                if (!Auth::user()->hasPermission('posts.edit')) {
                    $name = $item->name;
                } else {
                    $name = Html::link(route('courses.edit', $item->id), $item->name);
                }

                if (function_exists('theme_option') && BaseHelper::isHomepage($item->id)) {
                    $name .= Html::tag('span', ' — ' . trans('packages/courses::courses.front_page'), [
                        'class' => 'additional-page-name',
                    ])->toHtml();
                }

                return apply_filters(COURSE_FILTER_COURSE_NAME_IN_ADMIN_LIST, $name, $item);
            })
            ->editColumn('checkbox', function ($item) {
                return $this->getCheckbox($item->id);
            })
            ->editColumn('template', function ($item) use ($courseTemplates) {
                return Arr::get($courseTemplates, $item->template);
            })
            ->editColumn('created_at', function ($item) {
                return BaseHelper::formatDate($item->created_at);
            })
            ->editColumn('status', function ($item) {
                return $item->status->toHtml();
            })
            ->addColumn('operations', function ($item) {
                return $this->getOperations('courses.edit', 'courses.destroy', $item);
            });

        return $this->toJson($data);
    }

    /**
     * @return mixed
     */
    public function query()
    {
        $query = $this->repository->getModel()->select([
            'id',
            'name',
            'parent_id',
            'template',
            'created_at',
            'status',
        ]);
        // $this->repository->getModel()->
        return $this->applyScopes($query);
    }

    /**
     * {@inheritDoc}
     */
    public function columns()
    {
        return [
            'id'         => [
                'title' => trans('core/base::tables.id'),
                'width' => '20px',
            ],
            'name'       => [
                'title' => trans('core/base::tables.name'),
                'class' => 'text-start',
            ],
            'parent_id'         => [
                'title' => 'Parent ID',
                'width' => '20px',
            ],
            'template'   => [
                'title' => trans('core/base::tables.template'),
                'class' => 'text-start',
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'width' => '100px',
                'class' => 'text-center',
            ],
            'status'     => [
                'title' => trans('core/base::tables.status'),
                'width' => '100px',
                'class' => 'text-center',
            ],
        ];
    }

    /**
     * {@inheritDoc}
     */
    public function buttons()
    {
        return $this->addCreateButton(route('courses.create'), 'courses.create');
    }

    /**
     * {@inheritDoc}
     */
    public function bulkActions(): array
    {
        return $this->addDeleteAction(route('courses.deletes'), 'courses.destroy', parent::bulkActions());
    }

    /**
     * {@inheritDoc}
     */
    public function getBulkChanges(): array
    {
        return [
            'name'       => [
                'title'    => trans('core/base::tables.name'),
                'type'     => 'text',
                'validate' => 'required|max:120',
            ],
            'status'     => [
                'title'    => trans('core/base::tables.status'),
                'type'     => 'customSelect',
                'choices'  => BaseStatusEnum::labels(),
                'validate' => 'required|' . Rule::in(BaseStatusEnum::values()),
            ],
            'template'   => [
                'title'    => trans('core/base::tables.template'),
                'type'     => 'customSelect',
                'choices'  => get_course_templates(),
                'validate' => 'required',
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type'  => 'date',
            ],
            'parent_id' => [
                'title' => trans('core/base::tables.parent'),
                'type'  => 'number',
                // 'choices'=> get_parent_from_id($this->Item),
            ],
        ];
    }
}
