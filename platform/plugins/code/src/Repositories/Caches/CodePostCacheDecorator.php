<?php

namespace Botble\Code\Repositories\Caches;

use Botble\Code\Models\CodePost;
use Botble\Code\Repositories\Interfaces\PostInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;

class CodePostCacheDecorator extends CacheAbstractDecorator implements PostInterface
{
    public function getFeatured(int $limit = 5, array $with = []): Collection
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getListPostNonInList(array $selected = [], int $limit = 7, array $with = []): Collection
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getRelated(int|string $id, int $limit = 3): Collection
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getRelatedCategoryIds(CodePost|int|string $model): array
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getByCategory(array|int|string $categoryId, int $paginate = 12, int $limit = 0): Collection|LengthAwarePaginator
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getByUserId(int|string $authorId, int $paginate = 6): Collection|LengthAwarePaginator
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getDataSiteMap(): Collection|LengthAwarePaginator
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getByTag(int|string $tag, int $paginate = 12): Collection|LengthAwarePaginator
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getRecentPosts(int $limit = 5, int|string $categoryId = 0): Collection
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getSearch(string|null $keyword, int $limit = 10, int $paginate = 10): Collection|LengthAwarePaginator
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getAllPosts(int $perPage = 12, bool $active = true, array $with = ['slugable']): Collection|LengthAwarePaginator
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getPopularPosts(int $limit, array $args = []): Collection
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getFilters(array $filters): Collection|LengthAwarePaginator
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getAllRootCodes(bool $active = true): Collection
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
    /**
     * {@inheritDoc}
     */
    public function getCodes(array $select, array $orderBy)
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getAllCodePostsByParentId(int $id, int $paginate = 10): Collection|LengthAwarePaginator
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getDifficultyCodePostsByParentId(int $id, array $filters, int $paginate = 10): Collection|LengthAwarePaginator
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
}
