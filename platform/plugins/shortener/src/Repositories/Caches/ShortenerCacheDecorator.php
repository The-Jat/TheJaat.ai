<?php

namespace Botble\Shortener\Repositories\Caches;

use Botble\Shortener\Models\Shortener;
use Botble\Shortener\Repositories\Interfaces\ShortenerInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;

class ShortenerCacheDecorator extends CacheAbstractDecorator implements ShortenerInterface
{
    // public function getFeatured(int $limit = 5, array $with = []): Collection
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // public function getListPostNonInList(array $selected = [], int $limit = 7, array $with = []): Collection
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // public function getRelated(int|string $id, int $limit = 3): Collection
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // // public function getRelatedCategoryIds(Post|int|string $model): array
    // // {
    // //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // // }

    // public function getByCategory(array|int|string $categoryId, int $paginate = 12, int $limit = 0): Collection|LengthAwarePaginator
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // public function getByUserId(int|string $authorId, int $paginate = 6): Collection|LengthAwarePaginator
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // public function getDataSiteMap(): Collection|LengthAwarePaginator
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // public function getByTag(int|string $tag, int $paginate = 12): Collection|LengthAwarePaginator
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // public function getRecentPosts(int $limit = 5, int|string $categoryId = 0): Collection
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // public function getSearch(string|null $keyword, int $limit = 10, int $paginate = 10): Collection|LengthAwarePaginator
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // public function getAllPosts(int $perPage = 12, bool $active = true, array $with = ['slugable']): Collection|LengthAwarePaginator
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // public function getPopularPosts(int $limit, array $args = []): Collection
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // public function getFilters(array $filters): Collection|LengthAwarePaginator
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }

    // public function getSingleShortedField(int $id): Collection
    // {
    //     return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    // }
}
