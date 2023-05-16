<?php

namespace Botble\Code\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface CodeInterface extends RepositoryInterface
{
    /**
     * @return mixed
     */
    public function getDataSiteMap();

    /**
     * @param int $limit
     */
    public function getFeaturedCodes($limit);

    /**
     * @param int $parent_id
     */
    public function getChildFromParent($parent_id);

    /**
     * @param int $id
     */
    public function getCodeById($id);

    /**
     * @param array $array
     * @param array $select
     * @return mixed
     */
    public function whereIn($array, $select = []);

    /**
     * @param $query
     * @param int $limit
     * @return mixed
     */
    public function getSearch($query, $limit = 10);

    /**
     * @param bool $active
     * @return mixed
     */
    public function getAllCodes($active = true);

     /**
     * @param int $perPage
     * @param bool $active
     * @return mixed
     */
    public function getAllCodes2($perPage = 12, $active = true, array $with = ['slugable']);

    /**
     * @param array $filters
     * @return mixed
     */
    public function getFilters(array $filters);

    /**
     * @param array $select
     * @param array $orderBy
     * @return Collection
     */
    public function getCodes(array $select, array $orderBy);
}
