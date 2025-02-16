<?php

namespace Botble\Course\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Collection;

interface CourseInterface extends RepositoryInterface
{
    public function getDataSiteMap(): Collection;

    public function whereIn(array $array, array $select = []): Collection;

    public function getSearch(?string $query, int $limit = 10): Collection|LengthAwarePaginator;

    public function getAllCourses(bool $active = true): Collection;

    public function getAllRootCourses(bool $active = true): Collection;

    public function getAllCoursesByParentId(int $id): Collection;

    public function getLastUpdatedPostOfCurrentCourse(int $id);

    /**
     * @param array $select
     * @param array $orderBy
     * @return Collection
     */
    public function getCourses(array $select, array $orderBy);

    public function getParentCourses(array $select, array $orderBy);

    public function getCourseById(int $courseId);
}
