<?php

// use Botble\Base\Models\MetaBox as MetaBoxModel;
use Botble\Course\Models\Course;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\Course\Supports\Template;
use Botble\Media\Facades\RvMedia;
use Botble\SeoHelper\SeoOpenGraph;
use Botble\Member\Models\Member;
use Botble\Member\Repositories\Interfaces\MemberInterface;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Arr;
use Illuminate\Support\Carbon;

if (!function_exists('get_all_courses')) {
    function get_all_courses(bool $active = true): Collection
    {
        return app(CourseInterface::class)->getAllCourses($active);
    }
}

if (!function_exists('register_course_template')) {
    function register_course_template(array $templates): void
    {
        Template::registerCourseTemplate($templates);
    }
}

if (!function_exists('get_course_templates')) {
    function get_course_templates(): array
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
        return array($num['value']); //Template::getCourseTemplates();
    }
}

if (!function_exists('get_all_courses_by_parent_id')) {
    function get_all_courses_by_parent_id(int $id): Collection
    {
        return app(CourseInterface::class)->getAllCoursesByParentId($id);
    }
}

if (!function_exists('getLastUpdatedTime')) {
    function getLastUpdatedTime(int $id)
    {
        $post = app(CourseInterface::class)->getLastUpdatedPostOfCurrentCourse($id);
        // dd($child);
        if ($post) {
            return Carbon::parse($post->updated_at)->diffForHumans();
        } else{
            // send the updated time of itself then
            return 0.0;
        }
    }
}

// This function will add class to the tag passed in the array along with class-name in the html content.
// It is used in child-course-blade.php 
if (!function_exists('addClassToTags')) {
    function addClassToTags($tagClassArray, $html)
    {
        // The reason of being adding a div element is that the structure of the html content if as follows:
        //     <h3>overview:</h3>
        //     <p>paragraph</p>

        //     since there is no root elememt then the $xpath = new DOMXPath($doc); will create the first tag as
        //     container that contain the paragraph as follows:
        //     <h3>overview: <p>paragraph</p> </h3>
        //     which is wrong.
        //     - To overcome this problem I myself add the div as container because the course post containes siblings
        //     as the root elements. 

        $htmlContent = '<div id="myContentContainer"><!-- Existing content --></div>';
        $modifiedHtml = str_replace('</div>', $html . '</div>', $htmlContent);

        // dd($modifiedHtml);
        $doc = new DOMDocument();
        $doc->loadHTML($modifiedHtml, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
        $xpath = new DOMXPath($doc);
        // dd($xpath);
        // If want to check the DOMXPath parsed our content clearly then uncomment above
        // statement and see in the browser the object`s last key named as xml.

        foreach ($tagClassArray as $tagName => $class) {
            // dd($class);
            // dd($tagName);
            $tags = $xpath->query('//' . $tagName);
            // dd($tags);
            foreach ($tags as $tag) {
                $classAttr = $tag->getAttribute('class');
                // dd($classAttr);
                if ($classAttr !== '') {
                    $tag->setAttribute('class', $classAttr . ' ' . $class);
                } else {
                    $tag->setAttribute('class', $class);
                }
            }
        }

        // dd($doc->saveHTML());
        return $doc->saveHTML();
    }
}

// This function only returns the parents (i.e., whose parent_id = 0)
if (!function_exists('get_course_parents')) {
    /**
     * @param array $args
     * @return array
     */
    function get_course_parents(array $args = []): array
    {
        // $indent = Arr::get($args, 'indent', '——');

        $repo = app(CourseInterface::class);

        $categories = $repo->getParentCourses(Arr::get($args, 'select', ['*']), [
            'created_at' => 'DESC',
            //'is_default' => 'DESC',
            //'order'      => 'ASC',
        ]);

        $categories = sort_item_with_children($categories);

        // foreach ($categories as $category) {
        //     $depth = (int)$category->depth;
        //     $indentText = str_repeat($indent, $depth);
        //     $category->indent_text = $indentText;
        // }
        // dd($categories);

        return $categories;
    }
}

if (!function_exists('get_course_by_id')) {
    /**
     * Get a course by its ID.
     *
     * @param int $courseId
     * @return \App\Models\Course|null
     */
    function get_course_by_id(int $courseId)
    {
        $repo = app(CourseInterface::class);

        return $repo->getCourseById($courseId);
    }
}


if (!function_exists('get_course_hierarchy')) {
    /**
     * Get the parent and grandparent courses recursively until parent ID is 0.
     *
     * @param int $childCourseId
     * @return array
     */
    function get_course_hierarchy(int $childCourseId): array
    {

        $repo = app(CourseInterface::class);
        $hierarchy = [];

        while ($childCourseId !== 0) {
            $course = $repo->getCourseById($childCourseId);

            if (!$course) {
                break; // Stop if the course is not found
            }

            $hierarchy[] = [
                'id' => $course->id,
                'name' => $course->name,
                'url' => $course->url,
                'label' => $course->name,
            ];

            $childCourseId = $course->parent_id;
        }

        // dd($hierarchy);

        return array_reverse($hierarchy); // Reverse the array for a top-down hierarchy
    }

    // if (!function_exists('is_external_link_course')) {
    //     function is_external_link_course(Course $post): bool
    //     {
    //         return is_plugin_active('external-source') && !empty($post->external_source_link);
    //     }
    // }

    // return the time take to read the course post.
    // if (!function_exists('get_time_to_read_course_post')) {
    //     function get_time_to_read_course_post(Course $post): string
    //     {
    //         $timeToRead = MetaBox::getMetaData($post, 'time_to_read', true);

    //         if ($timeToRead) {
    //             return number_format($timeToRead);
    //         }

    //         return number_format(strlen(strip_tags($post->content)) / 300);
    //     }
    // }

    // Returns the GrandParent courses
    // if (!function_exists('get_latest_courses')) {
    //     function get_latest_courses(int $limit = 4)
    //     {
    //         return app(CourseInterface::class)
    //             ->getModel()
    //             ->where('parent_id', 0)
    //             ->take($limit)
    //             ->get();
    //     }
    // }


    // return the time take to read the course post.
    if (!function_exists('get_time_to_read_course_post')) {
        function get_time_to_read_course_post(Course $post): string
        {
            $timeToRead = MetaBox::getMetaData($post, 'time_to_read', true);

            if ($timeToRead) {
                return number_format($timeToRead);
            }

            return number_format(strlen(strip_tags($post->content)) / 300);
        }
    }

    // Returns the GrandParent courses
    if (!function_exists('get_latest_courses')) {
        function get_latest_courses(int $limit = 4)
        {
            return app(CourseInterface::class)
                ->getModel()
                ->where('parent_id', 0)
                ->take($limit)
                ->get();
        }
    }

    if (!function_exists('is_external_link_course')) {
        function is_external_link_course(Course $post): bool
        {
            return is_plugin_active('external-source') && !empty($post->external_source_link);
        }
    }

    // It returns the author object by its user id.
    if (!function_exists('getAuthorByUserID')) {
        function getAuthorByUserID(int $id)
        {
            $condition = [
                'id' => $id,
            ];

            $author = app()->make(MemberInterface::class)
                ->getModel()
                ->where($condition)
                ->with(['slugable'])
                ->first();

            return $author;
        }
    }

    // returns the author avatar url by user id.
    if (!function_exists('getAuthorAvatarURLByUserID')) {
        function getAuthorAvatarURLByUserID(int $id): String
        {
            $author = getAuthorByUserID($id);

            $meta = new SeoOpenGraph();
            // if ($author->avatar) {
            $meta->setImage(RvMedia::getImageUrl($author->avatar));
            // }
            // ddd($meta);

            $url = RvMedia::getImageUrl($author->avatar->url, 'thumb', false, RvMedia::getDefaultImage());
            return $url;
        }
    }
}

