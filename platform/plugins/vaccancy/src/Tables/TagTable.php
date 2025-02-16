<?php

namespace Botble\Vaccancy\Tables;

// use Botble\Base\Facades\BaseHelper;
// use Botble\Base\Enums\BaseStatusEnum;
// use Botble\Vaccancy\Models\VaccancyTag;
// use Botble\Vaccancy\Repositories\Interfaces\TagInterface;
// use Botble\Table\Abstracts\TableAbstract;
// use Botble\Base\Facades\Html;
// use Illuminate\Contracts\Routing\UrlGenerator;
// use Illuminate\Database\Eloquent\Builder;
// use Illuminate\Database\Eloquent\Relations\Relation;
// use Illuminate\Database\Query\Builder as QueryBuilder;
// use Illuminate\Http\JsonResponse;
// use Illuminate\Support\Facades\Auth;
// use Botble\Table\DataTables;
use Botble\Vaccancy\Models\VaccancyTag;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\BulkChanges\CreatedAtBulkChange;
use Botble\Table\BulkChanges\NameBulkChange;
use Botble\Table\BulkChanges\StatusBulkChange;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class TagTable extends TableAbstract
{
    // protected $hasActions = true;

    // protected $hasFilter = true;

    // public function __construct(DataTables $table, UrlGenerator $urlGenerator, TagInterface $tagRepository)
    // {
    //     parent::__construct($table, $urlGenerator);

    //     $this->repository = $tagRepository;

    //     if (! Auth::user()->hasAnyPermission(['tags.edit', 'tags.destroy'])) {
    //         $this->hasOperations = false;
    //         $this->hasActions = false;
    //     }
    // }

    // public function ajax(): JsonResponse
    // {
    //     $data = $this->table
    //         ->eloquent($this->query())
    //         ->editColumn('name', function (VaccancyTag $item) {
    //             if (! Auth::user()->hasPermission('vaccancy_tags.edit')) {
    //                 return BaseHelper::clean($item->name);
    //             }

    //             return Html::link(route('vaccancy_tags.edit', $item->id), BaseHelper::clean($item->name));
    //         })
    //         ->editColumn('checkbox', function (VaccancyTag $item) {
    //             return $this->getCheckbox($item->id);
    //         })
    //         ->editColumn('created_at', function (VaccancyTag $item) {
    //             return BaseHelper::formatDate($item->created_at);
    //         })
    //         ->editColumn('status', function (VaccancyTag $item) {
    //             if ($this->request()->input('action') === 'excel') {
    //                 return $item->status->getValue();
    //             }

    //             return BaseHelper::clean($item->status->toHtml());
    //         })
    //         ->addColumn('operations', function (VaccancyTag $item) {
    //             return $this->getOperations('vaccancy_tags.edit', 'vaccancy_tags.destroy', $item);
    //         });

    //     return $this->toJson($data);
    // }

    // public function query(): Relation|Builder|QueryBuilder
    // {
    //     $query = $this->repository->getModel()->select([
    //         'id',
    //         'name',
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
    //         'status' => [
    //             'title' => trans('core/base::tables.status'),
    //             'width' => '100px',
    //         ],
    //         'created_at' => [
    //             'title' => trans('core/base::tables.created_at'),
    //             'width' => '100px',
    //         ],
    //     ];
    // }

    // public function buttons(): array
    // {
    //     return $this->addCreateButton(route('vaccancy_tags.create'), 'tags.create');
    // }

    // public function bulkActions(): array
    // {
    //     // dd('its');
    //     return $this->addDeleteAction(route('vaccancy_tags.deletes'), 'vaccancy_tags.destroy', parent::bulkActions());
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
    //             'validate' => 'required|in:' . implode(',', BaseStatusEnum::values()),
    //         ],
    //         'created_at' => [
    //             'title' => trans('core/base::tables.created_at'),
    //             'type' => 'datePicker',
    //         ],
    //     ];
    // }

    public function setup(): void
    {
        $this
            ->model(VaccancyTag::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('vaccancy_tags.create'))
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('vaccancy_tags.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addActions([
                EditAction::make()->route('vaccancy_tags.edit'),
                DeleteAction::make()->route('vaccancy_tags.destroy'),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('vaccancy_tags.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'created_at',
                        'status',
                    ]);
            });
    }

}
