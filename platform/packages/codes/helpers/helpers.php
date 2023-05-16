<?php

use Botble\Code\Repositories\Interfaces\CodeInterface;
use Botble\Code\Supports\Template;

if (!function_exists('get_featured_codes')) {
    /**
     * @param int $limit
     * @return mixed
     */
    function get_featured_codes($limit)
    {
        return app(CodeInterface::class)->getFeaturedCodes($limit);
    }
}

// get the child codes of the passed page code
if (!function_exists('get_child_from_parent')) {
    /**
     * @param int $limit
     * @return mixed
     */
    function get_child_from_parent($parent_id)
    {
        return app(CodeInterface::class)->getChildFromParent($parent_id);
    }
}

// get the code by the passed id.
if (!function_exists('get_code_by_id')) {
    /**
     * @param int $limit
     * @return mixed
     */
    function get_code_by_id($id)
    {
        return app(CodeInterface::class)->getCodeById($id);
    }
}

if (!function_exists('get_code_by_slug')) {
    /**
     * @param string $slug
     * @return mixed
     */
    function get_code_by_slug($slug)
    {
        return app(CodeInterface::class)->getBySlug($slug, true);
    }
}

if (!function_exists('get_all_codes')) {
    /**
     * @param boolean $active
     * @return mixed
     */
    function get_all_codes($active = true)
    {
        return app(CodeInterface::class)->getAllCodes($active);
    }
}

if (!function_exists('register_code_template')) {
    /**
     * @param array $templates
     * @return void
     */
    function register_code_template(array $templates)
    {
        Template::registerPageTemplate($templates);
    }
}

if (!function_exists('get_code_templates')) {
    /**
     * @return array
     */
    function get_code_templates()
    {
        return Template::getCodeTemplates();
    }
}

if (!function_exists('get_topics')) {
    /**
     * @return array
     */
    function get_topics($num)
    {
        //  dd($num['value']);
        return array($num['value']);//Template::getCodeTemplates();
    }
}
