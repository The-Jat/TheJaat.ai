<?php

namespace Botble\Vaccancy\Repositories\Eloquent;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseQueryBuilder;
use Botble\Vaccancy\Models\VaccancyPost;
use Botble\Vaccancy\Repositories\Interfaces\PostInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Exception;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;

class PostRepository extends RepositoriesAbstract implements PostInterface
{
    public function getFeatured(int $limit = 5, array $with = []): Collection
    {
        $data = $this->model
            ->where([
                'status' => BaseStatusEnum::PUBLISHED,
                'is_featured' => 1,
            ])
            ->limit($limit)
            ->with(array_merge(['slugable'], $with))
            ->orderBy('created_at', 'desc');

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getListPostNonInList(array $selected = [], int $limit = 7, array $with = []): Collection
    {
        $data = $this->model
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->whereNotIn('id', $selected)
            ->limit($limit)
            ->with($with)
            ->orderBy('created_at', 'desc');

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getRelated(int|string $id, int $limit = 3): Collection
    {
        /**
         * @var Post $model
         */
        $model = $this->model;

        $data = $model
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->where('id', '!=', $id)
            ->limit($limit)
            ->with('slugable')
            ->orderBy('created_at', 'desc')
            ->whereHas('categories', function ($query) use ($id) {
                $query->whereIn('categories.id', $this->getRelatedCategoryIds($id));
            });

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getRelatedCategoryIds(VaccancyPost|int|string $model): array
    {
        $model = $model instanceof VaccancyPost ? $model : $this->findById($model);

        if (! $model) {
            return [];
        }

        try {
            return $model->categories()->allRelatedIds()->toArray();
        } catch (Exception) {
            return [];
        }
    }

    public function getByCategory(array|int|string $categoryId, int $paginate = 12, int $limit = 0): Collection|LengthAwarePaginator
    {
        if (! is_array($categoryId)) {
            $categoryId = [$categoryId];
        }

        $data = $this->model
            ->where('vaccancy_posts.status', BaseStatusEnum::PUBLISHED)
            ->join('vaccancy_post_categories', 'vaccancy_post_categories.post_id', '=', 'vaccancy_posts.id')
            ->join('vaccancy_categories', 'vaccancy_post_categories.category_id', '=', 'vaccancy_categories.id')
            ->whereIn('vaccancy_post_categories.category_id', $categoryId)
            ->select('vaccancy_posts.*')
            ->distinct()
            ->with('slugable')
            ->orderBy('vaccancy_posts.created_at', 'desc');

        if ($paginate != 0) {
            return $this->applyBeforeExecuteQuery($data)->paginate($paginate);
        }

        return $this->applyBeforeExecuteQuery($data)->limit($limit)->get();
    }

    public function getByUserId(int|string $authorId, int $paginate = 6): Collection|LengthAwarePaginator
    {
        $data = $this->model
            ->where([
                'status' => BaseStatusEnum::PUBLISHED,
                'author_id' => $authorId,
            ])
            ->with('slugable')
            ->orderBy('created_at', 'desc');

        return $this->applyBeforeExecuteQuery($data)->paginate($paginate);
    }

    public function getDataSiteMap(): Collection|LengthAwarePaginator
    {
        $data = $this->model
            ->with('slugable')
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->orderBy('created_at', 'desc');

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getByTag(int|string $tag, int $paginate = 12): Collection|LengthAwarePaginator
    {
        /**
         * @var Post $model
         */
        $model = $this->model;
        $data = $model
            ->with(['slugable', 'categories', 'categories.slugable', 'author'])
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->whereHas('tags', function ($query) use ($tag) {
                /**
                 * @var Builder $query
                 */
                $query->where('vaccancy_tags.id', $tag);
            })
            ->orderBy('created_at', 'desc');

        return $this->applyBeforeExecuteQuery($data)->paginate($paginate);
    }

    public function getRecentPosts(int $limit = 5, int|string $categoryId = 0): Collection
    {
        /**
         * @var Post $data
         */
        $data = $this->model->where(['status' => BaseStatusEnum::PUBLISHED]);

        if ($categoryId != 0) {
            $data = $data
                ->join('vaccancy_post_categories', 'vaccancy_post_categories.post_id', '=', 'vaccancy_posts.id')
                ->where('vaccancy_post_categories.category_id', $categoryId);
        }

        $data = $data->limit($limit)
            ->with('slugable')
            ->select('posts.*')
            ->orderBy('created_at', 'desc');

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getSearch(string|null $keyword, int $limit = 10, int $paginate = 10): Collection|LengthAwarePaginator
    {
        $data = $this->model
            ->with('slugable')
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->where(function ($query) use ($keyword) {
                /**
                 * @var BaseQueryBuilder $query
                 */
                $query->addSearch('name', $keyword);
            })
            ->orderBy('created_at', 'desc');

        if ($limit) {
            $data = $data->limit($limit);
        }

        if ($paginate) {
            return $this->applyBeforeExecuteQuery($data)->paginate($paginate);
        }

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getAllPosts(int $perPage = 12, bool $active = true, array $with = ['slugable']): Collection|LengthAwarePaginator
    {
        $data = $this->model
            ->with($with)
            ->orderBy('created_at', 'desc');

        if ($active) {
            $data = $data->where('status', BaseStatusEnum::PUBLISHED);
        }

        return $this->applyBeforeExecuteQuery($data)->paginate($perPage);
    }

    public function getPopularPosts(int $limit, array $args = []): Collection
    {
        $data = $this->model
            ->with('slugable')
            ->orderBy('views', 'desc')
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->limit($limit);

        if (! empty(Arr::get($args, 'where'))) {
            $data = $data->where($args['where']);
        }

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getFilters(array $filters): Collection|LengthAwarePaginator
    {
        /**
         * @var Post $data
         */
        $data = $this->originalModel;

        if ($filters['categories'] !== null) {
            $categories = array_filter((array)$filters['categories']);

            $data = $data->whereHas('categories', function ($query) use ($categories) {
                $query->whereIn('categories.id', $categories);
            });
        }

        if ($filters['categories_exclude'] !== null) {
            $data = $data
                ->whereHas('categories', function ($query) use ($filters) {
                    $query->whereNotIn('categories.id', array_filter((array)$filters['categories_exclude']));
                });
        }

        if ($filters['exclude'] !== null) {
            $data = $data->whereNotIn('posts.id', array_filter((array)$filters['exclude']));
        }

        if ($filters['include'] !== null) {
            $data = $data->whereNotIn('posts.id', array_filter((array)$filters['include']));
        }

        if ($filters['author'] !== null) {
            $data = $data->whereIn('author_id', array_filter((array)$filters['author']));
        }

        if ($filters['author_exclude'] !== null) {
            $data = $data->whereNotIn('author_id', array_filter((array)$filters['author_exclude']));
        }

        if ($filters['featured'] !== null) {
            $data = $data->where('posts.is_featured', $filters['featured']);
        }

        if ($filters['search'] !== null) {
            $data = $data
                ->where(function ($query) use ($filters) {
                    $query
                        ->addSearch('posts.name', $filters['search'])
                        ->addSearch('posts.description', $filters['search']);
                });
        }

        $orderBy = Arr::get($filters, 'order_by', 'updated_at');
        $order = Arr::get($filters, 'order', 'desc');

        $data = $data
            ->where('posts.status', BaseStatusEnum::PUBLISHED)
            ->orderBy($orderBy, $order);

        return $this->applyBeforeExecuteQuery($data)->paginate((int)$filters['per_page']);
    }
}
