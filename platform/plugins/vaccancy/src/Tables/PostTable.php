<?php

namespace Botble\Vaccancy\Tables;

// use Botble\Base\Facades\BaseHelper;
// use Botble\Base\Enums\BaseStatusEnum;
// use Botble\Vaccancy\Exports\PostExport;
// use Botble\Vaccancy\Models\VaccancyPost;
// use Botble\Vaccancy\Repositories\Interfaces\CategoryInterface;
// use Botble\Vaccancy\Repositories\Interfaces\PostInterface;
// use Botble\Table\Abstracts\TableAbstract;
// use Botble\Base\Facades\Html;
// use Illuminate\Contracts\Routing\UrlGenerator;
// use Illuminate\Database\Eloquent\Builder;
// use Illuminate\Database\Eloquent\Builder as EloquentBuilder;
// use Illuminate\Database\Eloquent\Model;
// use Illuminate\Database\Eloquent\Relations\Relation;
// use Illuminate\Database\Eloquent\Relations\Relation as EloquentRelation;
// use Illuminate\Database\Query\Builder as QueryBuilder;
// use Illuminate\Http\JsonResponse;
// use Illuminate\Support\Facades\Auth;
// use Botble\Table\DataTables;
use Botble\ACL\Models\User;
use Botble\Base\Facades\Html;
use Botble\Base\Models\BaseQueryBuilder;
use Botble\Vaccancy\Exports\PostExport;
use Botble\Vaccancy\Models\VaccancyCategory;
use Botble\Vaccancy\Models\VaccancyPost;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\BulkChanges\CreatedAtBulkChange;
use Botble\Table\BulkChanges\NameBulkChange;
use Botble\Table\BulkChanges\SelectBulkChange;
use Botble\Table\BulkChanges\StatusBulkChange;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\FormattedColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\ImageColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Builder as EloquentBuilder;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\Relation as EloquentRelation;
use Illuminate\Database\Query\Builder as QueryBuilder;

class PostTable extends TableAbstract
{
    // protected $hasActions = true;

    // protected $hasFilter = true;

    // protected string $exportClass = PostExport::class;

    // protected int $defaultSortColumn = 6;

    // public function __construct(
    //     DataTables $table,
    //     UrlGenerator $urlGenerator,
    //     PostInterface $postRepository,
    //     protected CategoryInterface $categoryRepository
    // ) {
    //     parent::__construct($table, $urlGenerator);

    //     $this->repository = $postRepository;

    //     if (! Auth::user()->hasAnyPermission(['vaccancy_posts.edit', 'vaccancy_posts.destroy'])) {
    //         $this->hasOperations = false;
    //         $this->hasActions = false;
    //     }
    // }

    // public function ajax(): JsonResponse
    // {
    //     $data = $this->table
    //         ->eloquent($this->query())
    //         ->editColumn('name', function (VaccancyPost $item) {
    //             if (! Auth::user()->hasPermission('vaccancy_posts.edit')) {
    //                 return BaseHelper::clean($item->name);
    //             }

    //             return Html::link(route('vaccancy_posts.edit', $item->id), BaseHelper::clean($item->name));
    //         })
    //         ->editColumn('image', function (VaccancyPost $item) {
    //             return $this->displayThumbnail($item->image);
    //         })
    //         ->editColumn('checkbox', function (VaccancyPost $item) {
    //             return $this->getCheckbox($item->id);
    //         })
    //         ->editColumn('created_at', function (VaccancyPost $item) {
    //             return BaseHelper::formatDate($item->created_at);
    //         })
    //         ->editColumn('updated_at', function (VaccancyPost $item) {
    //             $categories = '';
    //             foreach ($item->categories as $category) {
    //                 $categories .= Html::link(route('vaccancy_categories.edit', $category->id), $category->name) . ', ';
    //             }

    //             return rtrim($categories, ', ');
    //         })
    //         ->editColumn('author_id', function (VaccancyPost $item) {
    //             return $item->author && $item->author->name ? BaseHelper::clean($item->author->name) : '&mdash;';
    //         })
    //         ->editColumn('status', function (VaccancyPost $item) {
    //             if ($this->request()->input('action') === 'excel') {
    //                 return $item->status->getValue();
    //             }

    //             return BaseHelper::clean($item->status->toHtml());
    //         })
    //         ->addColumn('operations', function (VaccancyPost $item) {
    //             return $this->getOperations('vaccancy_posts.edit', 'vaccancy_posts.destroy', $item);
    //         });

    //     return $this->toJson($data);
    // }

    // public function query(): Relation|Builder|QueryBuilder
    // {
    //     $query = $this->repository->getModel()
    //         ->with([
    //             'categories' => function ($query) {
    //                 $query->select(['vaccancy_categories.id', 'vaccancy_categories.name']);
    //             },
    //             'author',
    //         ])
    //         ->select([
    //             'id',
    //             'name',
    //             'image',
    //             'created_at',
    //             'status',
    //             'updated_at',
    //             'author_id',
    //             'author_type',
    //         ]);

    //     return $this->applyScopes($query);
    // }

    // public function columns(): array
    // {
    //     return [
    //         'id' => [
    //             'title' => trans('core/base::tables.id'),
    //             'width' => '20px',
    //         ],
    //         'image' => [
    //             'title' => trans('core/base::tables.image'),
    //             'width' => '70px',
    //         ],
    //         'name' => [
    //             'title' => trans('core/base::tables.name'),
    //             'class' => 'text-start',
    //         ],
    //         'updated_at' => [
    //             'title' => trans('plugins/vaccancy::posts.categories'),
    //             'width' => '150px',
    //             'class' => 'no-sort text-center',
    //             'orderable' => false,
    //         ],
    //         'author_id' => [
    //             'title' => trans('plugins/vaccancy::posts.author'),
    //             'width' => '150px',
    //             'class' => 'no-sort text-center',
    //             'orderable' => false,
    //         ],
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
    //     return $this->addCreateButton(route('vaccancy_posts.create'), 'vaccancy_posts.create');
    // }

    // public function bulkActions(): array
    // {
    //     return $this->addDeleteAction(route('vaccancy_posts.deletes'), 'vaccancy_posts.destroy', parent::bulkActions());
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
    //         'category' => [
    //             'title' => trans('plugins/vaccancy::posts.category'),
    //             'type' => 'select-search',
    //             'validate' => 'required|string',
    //             'callback' => 'getCategories',
    //         ],
    //         'created_at' => [
    //             'title' => trans('core/base::tables.created_at'),
    //             'type' => 'datePicker',
    //             'validate' => 'required|string|date',
    //         ],
    //     ];
    // }

    // public function getCategories(): array
    // {
    //     return $this->categoryRepository->pluck('name', 'id');
    // }

    // public function applyFilterCondition(EloquentBuilder|QueryBuilder|EloquentRelation $query, string $key, string $operator, ?string $value): EloquentRelation|EloquentBuilder|QueryBuilder
    // {
    //     if ($key === 'category' && $value && ! BaseHelper::isJoined($query, 'vaccancy_post_categories')) {
    //         $query = $query
    //             ->join('vaccancy_post_categories', 'vaccancy_post_categories.post_id', '=', 'posts.id')
    //             ->join('vaccancy_categories', 'vaccancy_post_categories.category_id', '=', 'vaccancy_categories.id')
    //             ->select($query->getModel()->getTable() . '.*');

    //         return $query->where('vaccancy_post_categories.category_id', $value);
    //     }

    //     return parent::applyFilterCondition($query, $key, $operator, $value);
    // }

    // public function saveBulkChangeItem(Model|VaccancyPost $item, string $inputKey, ?string $inputValue): Model|bool
    // {
    //     if ($inputKey === 'category') {
    //         /**
    //          * @var Post $item
    //          */
    //         $item->categories()->sync([$inputValue]);

    //         return $item;
    //     }

    //     return parent::saveBulkChangeItem($item, $inputKey, $inputValue);
    // }

    // public function getDefaultButtons(): array
    // {
    //     return [
    //         'export',
    //         'reload',
    //     ];
    // }


    protected string $exportClass = PostExport::class;

    protected int $defaultSortColumn = 6;

    public function setup(): void
    {
        $this
            ->model(VaccancyPost::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('vaccancy_posts.create'))
            ->addActions([
                EditAction::make()->route('vaccancy_posts.edit'),
                DeleteAction::make()->route('vaccancy_posts.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                ImageColumn::make(),
                NameColumn::make()->route('vaccancy_posts.edit'),
                FormattedColumn::make('categories_name')
                    ->title(trans('plugins/vaccancy::posts.categories'))
                    ->width(150)
                    ->orderable(false)
                    ->searchable(false)
                    ->getValueUsing(function (FormattedColumn $column) {
                        $categories = $column
                            ->getItem()
                            ->categories
                            ->sortBy('name')
                            ->map(function (VaccancyCategory $category) {
                                return Html::link(route('vaccancy_categories.edit', $category->getKey()), $category->name, ['target' => '_blank']);
                            })
                            ->all();

                        return implode(', ', $categories);
                    })
                    ->withEmptyState(),
                FormattedColumn::make('author_id')
                    ->title(trans('plugins/vaccancy::posts.author'))
                    ->width(150)
                    ->orderable(false)
                    ->searchable(false)
                    ->getValueUsing(fn (FormattedColumn $column) => $column->getItem()->author?->name)
                    ->renderUsing(function (FormattedColumn $column) {
                        $post = $column->getItem();
                        $author = $post->author;

                        if (! $author->getKey()) {
                            return null;
                        }

                        if ($post->author_id && $post->author_type === User::class) {
                            return Html::link($author->url, $author->name, ['target' => '_blank']);
                        }

                        return null;
                    })
                    ->withEmptyState(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('vaccancy_posts.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
                SelectBulkChange::make()
                    ->name('category')
                    ->title(trans('plugins/vaccancy::posts.category'))
                    ->searchable()
                    ->choices(fn () => VaccancyCategory::query()->pluck('name', 'id')->all()),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->with([
                        'categories' => function (BelongsToMany $query) {
                            $query->select(['vaccancy_categories.id', 'vaccancy_categories.name']);
                        },
                        'author',
                    ])
                    ->select([
                        'id',
                        'name',
                        'image',
                        'created_at',
                        'status',
                        'updated_at',
                        'author_id',
                        'author_type',
                    ]);
            })
            ->onAjax(function (PostTable $table) {
                return $table->toJson(
                    $table
                        ->table
                        ->eloquent($table->query())
                        ->filter(function ($query) {
                            if ($keyword = $this->request->input('search.value')) {
                                $keyword = '%' . $keyword . '%';

                                return $query
                                    ->where('name', 'LIKE', $keyword)
                                    ->orWhereHas('categories', function ($subQuery) use ($keyword) {
                                        return $subQuery
                                            ->where('name', 'LIKE', $keyword);
                                    })
                                    ->orWhereHas('author', function ($subQuery) use ($keyword) {
                                        return $subQuery
                                            ->where('first_name', 'LIKE', $keyword)
                                            ->orWhere('last_name', 'LIKE', $keyword)
                                            ->orWhereRaw('concat(first_name, " ", last_name) LIKE ?', $keyword);
                                    });
                            }

                            return $query;
                        })
                );
            })
            ->onFilterQuery(
                function (
                    EloquentBuilder|QueryBuilder|EloquentRelation $query,
                    string $key,
                    string $operator,
                    string|null $value
                ) {
                    if (! $value || $key !== 'category') {
                        return false;
                    }

                    return $query->whereHas(
                        'categories',
                        fn (BaseQueryBuilder $query) => $query->where('categories.id', $value)
                    );
                }
            )
            ->onSavingBulkChangeItem(function (VaccancyPost $item, string $inputKey, string|null $inputValue) {
                if ($inputKey !== 'category') {
                    return null;
                }

                $item->categories()->sync([$inputValue]);

                return $item;
            });
    }
}
