<?php

namespace Botble\Course\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;

interface CourseInterface extends RepositoryInterface
{
    /**
     * @return mixed
     */
    public function getDataSiteMap();

    /**
     * @param int $limit
     */
    public function getFeaturedCourses($limit);

    /**
     * @param int $parent_id
     */
    public function getChildFromParent($parent_id);

    /**
     * @param int $id
     */
    public function getCourseById($id);

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
    public function getAllCourses($active = true);

     /**
     * @param int $perPage
     * @param bool $active
     * @return mixed
     */
    public function getAllCourses2($perPage = 12, $active = true, array $with = ['slugable']);

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
    public function getCourses(array $select, array $orderBy);
}
