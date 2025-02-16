<?php

namespace Botble\Course\Repositories\Eloquent;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Collection;

class CourseRepository extends RepositoriesAbstract implements CourseInterface
{
    public function getDataSiteMap(): Collection
    {
        $data = $this->model
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->orderBy('created_at', 'desc')
            ->select(['id', 'name', 'updated_at'])
            ->with('slugable');

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function whereIn(array $array, array $select = []): Collection
    {
        $courses = $this->model
            ->whereIn('id', $array)
            ->where('status', BaseStatusEnum::PUBLISHED);

        if (empty($select)) {
            $select = ['*'];
        }

        $data = $courses
            ->select($select)
            ->orderBy('created_at');

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getSearch(?string $query, int $limit = 10): Collection|LengthAwarePaginator
    {
        $courses = $this->model->where('status', BaseStatusEnum::PUBLISHED);
        foreach (explode(' ', $query) as $term) {
            $courses = $courses->where('name', 'LIKE', '%' . $term . '%');
        }

        $data = $courses
            ->orderBy('created_at', 'desc')
            ->limit($limit);

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getAllCourses(bool $active = true): Collection
    {
        $data = $this->model;

        if ($active) {
            $data = $data->where('status', BaseStatusEnum::PUBLISHED);
        }

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getAllRootCourses(bool $active = true): Collection
    {
        $data = $this->model;

        if ($active) {
            $data = $data->where('parent_id', 0)
                    ->where('status', BaseStatusEnum::PUBLISHED());
        }

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getAllCoursesByParentId(int $id): Collection
    {
        $data = $this->model;

        $data = $data->where('parent_id', $id)
                        ->where('status', 'published');
        return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getLastUpdatedPostOfCurrentCourse(int $id)
    {
        $data = $this->model;

        // this post itself
        $itself = $this->applyBeforeExecuteQuery($this->model->where('id', $id))->get();;

        // childs
        $data = $data->where('parent_id', $id)
            ->where('status', BaseStatusEnum::PUBLISHED())
            ->orderBy('updated_at', 'desc');
        $childs = $this->applyBeforeExecuteQuery($data)->get();

        // Grand childs
        $grandChildCollection = new Collection();
        foreach ($childs as $grandChild) {

            $grandChildCollection = $grandChildCollection->concat($grandChild->children()->get());
        }

        // merge grand child with child
        $mergedCollection = $grandChildCollection->concat($childs);
        // merge itself too
        $mergedCollection = $mergedCollection->concat($itself);

        // get the most recent updated post.
        $latestCoursePost = $mergedCollection->sortByDesc('updated_at')->first();

        return $latestCoursePost;
    }

    /**
     * {@inheritDoc}
     */
    public function getCourses(array $select, array $orderBy)
    {
        $data = $this->model
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->with('slugable')
            ->select($select);

        foreach ($orderBy as $by => $direction) {
            $data = $data->orderBy($by, $direction);
        }

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    // Retrieve all courses whose parent_id = 0 (grand parent courses)
    public function getParentCourses(array $select, array $orderBy)
    {
        $data = $this->model
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->where('parent_id', 0)
            ->with('slugable')
            ->select($select);

        foreach ($orderBy as $by => $direction) {
            $data = $data->orderBy($by, $direction);
        }
            return $this->applyBeforeExecuteQuery($data)->get();
    }

    public function getCourseById(int $courseId)
    {
        return $this->model->find($courseId);
    }
}
