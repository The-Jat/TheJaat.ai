<?php

use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Course\Supports\Template;

if (!function_exists('get_featured_courses')) {
    /**
     * @param int $limit
     * @return mixed
     */
    function get_featured_courses($limit)
    {
        return app(CourseInterface::class)->getFeaturedCourses($limit);
    }
}

// get the child courses of the passed page course
if (!function_exists('get_child_from_parent_course')) {
    /**
     * @param int $limit
     * @return mixed
     */
    function get_child_from_parent_course($parent_id)
    {
        return app(CourseInterface::class)->getChildFromParentCourse($parent_id);
    }
}

// get the child courses of the passed page course
// if (!function_exists('get_parent_from_id')) {
//     /**
//      * @param int $limit
//      * @return mixed
//      */
//     function get_parent_from_id($parent_id)
//     {
//         return app(CourseInterface::class)->getParentFromID($parent_id);
//     }
// }

// get the child courses of the passed page course
if (!function_exists('has_child')) {
    /**
     * @param int $limit
     * @return mixed
     */
    function has_child($id)
    {
        return app(CourseInterface::class)->hasChild($id);
    }
}

// get the course by the passed id.
if (!function_exists('get_course_by_id')) {
    /**
     * @param int $limit
     * @return mixed
     */
    function get_course_by_id($id)
    {
        return app(CourseInterface::class)->getCourseById($id);
    }
}

if (!function_exists('get_course_by_slug')) {
    /**
     * @param string $slug
     * @return mixed
     */
    function get_course_by_slug($slug)
    {
        return app(CourseInterface::class)->getBySlug($slug, true);
    }
}

if (!function_exists('get_all_courses')) {
    /**
     * @param boolean $active
     * @return mixed
     */
    function get_all_courses($active = true)
    {
        return app(CourseInterface::class)->getAllCourses($active);
    }
}

if (!function_exists('register_course_template')) {
    /**
     * @param array $templates
     * @return void
     */
    function register_course_template(array $templates)
    {
        Template::registerPageTemplate($templates);
    }
}

if (!function_exists('get_course_templates')) {
    /**
     * @return array
     */
    function get_course_templates()
    {
        return Template::getCourseTemplates();
    }
}

if (!function_exists('get_topics')) {
    /**
     * @return array
     */
    function get_topics($num)
    {
        //  dd($num['value']);
        return array($num['value']);//Template::getCourseTemplates();
    }
}
