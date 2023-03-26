<?php

namespace Botble\Course\Repositories\Eloquent;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;

class CourseRepository extends RepositoriesAbstract implements CourseInterface
{
    /**
     * {@inheritDoc}
     */
    public function getDataSiteMap()
    {
        $data = $this->model
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->orderBy('created_at', 'desc');

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    /**
     * {@inheritDoc}
     */
    public function getFeaturedCourses($limit)
    {
        $data = $this->model
            ->where(['status' => BaseStatusEnum::PUBLISHED, 'is_featured' => 1])
            ->orderBy('created_at')
            ->limit($limit)
            ->orderBy('created_at', 'desc');

        return $this->applyBeforeExecuteQuery($data)->get();
    }

    /**
     * {@inheritDoc}
     */
    public function whereIn($array, $select = [])
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

    /**
     * {@inheritDoc}
     */
    public function getSearch($query, $limit = 10)
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

    /**
     * {@inheritDoc}
     */
    public function getAllCourses($active = true)
    {
        $data = $this->model;

        if ($active) {
            $data = $data->where('status', BaseStatusEnum::PUBLISHED);
        }

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
