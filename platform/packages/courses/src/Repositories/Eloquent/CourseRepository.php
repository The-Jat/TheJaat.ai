<?php

namespace Botble\Course\Repositories\Eloquent;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Support\Arr;

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
    public function getChildFromParentCourse($parent_id)
    {
        // ddd($parent_id);
        $data = $this->model
            ->where(['status' => BaseStatusEnum::PUBLISHED, 'parent_id' => $parent_id])
            ->orderBy('created_at')
            // ->limit($limit)
            ->orderBy('created_at', 'desc');
        // dd($this->applyBeforeExecuteQuery($data)->get());
        return $this->applyBeforeExecuteQuery($data)->get();
    }

    /**
     * {@inheritDoc}
     */
    public function hasChild($id)
    {
        $data = $this->model
            ->where(['status' => BaseStatusEnum::PUBLISHED, 'parent_id' => $id])
            ->orderBy('created_at')
            // ->limit($limit)
            ->orderBy('created_at', 'desc');

        // ddd($this->applyBeforeExecuteQuery($data)->get());
        return $this->applyBeforeExecuteQuery($data)->count()>0? true:false;
    }

    public function getCourseById($id)
    {
        $data = $this->model
            ->where(['status' => BaseStatusEnum::PUBLISHED, 'id' => $id])
            ->orderBy('created_at')
            // ->limit($limit)
            ->orderBy('created_at', 'desc');

        //  ddd($this->applyBeforeExecuteQuery($data)->get());
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

     /**
     * {@inheritDoc}
     */
    public function getAllCourses2($perPage = 12, $active = true, array $with = ['slugable'])
    {
        $data = $this->model
            ->with($with)
            ->orderBy('created_at', 'desc');

        if ($active) {
            $data = $data->where('status', BaseStatusEnum::PUBLISHED);
        }
// dd($data);
        return $this->applyBeforeExecuteQuery($data)->paginate($perPage);
    }

    /**
     * {@inheritDoc}
     */
    public function getFilters(array $filters)
    {
        // dd($filters);
        $data = $this->originalModel;

        // if ($filters['categories'] !== null) {
        //     $categories = array_filter((array)$filters['categories']);

        //     $data = $data->whereHas('categories', function ($query) use ($categories) {
        //         $query->whereIn('id', $categories);
        //     });
        // }

        // if ($filters['categories_exclude'] !== null) {
        //     $data = $data
        //         ->whereHas('categories', function ($query) use ($filters) {
        //             $query->whereNotIn('id', array_filter((array)$filters['categories_exclude']));
        //         });
        // }

        if ($filters['exclude'] !== null) {
            $data = $data->whereNotIn('id', array_filter((array)$filters['exclude']));
        }

        if ($filters['include'] !== null) {
            $data = $data->whereNotIn('id', array_filter((array)$filters['include']));
        }

        // if ($filters['author'] !== null) {
        //     $data = $data->whereIn('author_id', array_filter((array)$filters['author']));
        // }

        // if ($filters['author_exclude'] !== null) {
        //     $data = $data->whereNotIn('author_id', array_filter((array)$filters['author_exclude']));
        // }

        // if ($filters['featured'] !== null) {
        //     $data = $data->where('is_featured', $filters['featured']);
        // }

        // if ($filters['search'] !== null) {
        //     $data = $data
        //         ->where(function ($query) use ($filters) {
        //             $query
        //                 ->addSearch('name', $filters['search'])
        //                 ->addSearch('description', $filters['search']);
        //         });
        // }

        $orderBy = Arr::get($filters, 'order_by', 'updated_at');
        $order = Arr::get($filters, 'order', 'desc');

        $data = $data
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->orderBy($orderBy, $order);

        return $this->applyBeforeExecuteQuery($data)->paginate(8/*(int)$filters['per_page']*/);
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
}
