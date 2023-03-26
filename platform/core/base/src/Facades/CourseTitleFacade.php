<?php

namespace Botble\Base\Facades;

use Botble\Base\Supports\CourseTitle;
use Illuminate\Support\Facades\Facade;

class CourseTitleFacade extends Facade
{
    /**
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return CourseTitle::class;
    }
}
