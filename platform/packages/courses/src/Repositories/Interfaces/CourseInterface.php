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
}
