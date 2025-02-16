<?php

namespace Botble\Vaccancy\Repositories\Caches;

use Botble\Vaccancy\Repositories\Interfaces\TagInterface;
use Botble\Support\Repositories\Caches\CacheAbstractDecorator;
use Illuminate\Support\Collection;

class VaccancyTagCacheDecorator extends CacheAbstractDecorator implements TagInterface
{
    public function getDataSiteMap(): Collection
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getPopularTags(int $limit, array $with = ['slugable'], array $withCount = ['posts']): Collection
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }

    public function getAllTags($active = true): Collection
    {
        return $this->getDataIfExistCache(__FUNCTION__, func_get_args());
    }
}
