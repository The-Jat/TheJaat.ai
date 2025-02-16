<?php

namespace Botble\Course\Services;

use Botble\Base\Facades\BaseHelper;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Course\Models\Course;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\SeoHelper\SeoOpenGraph;
use Botble\Slug\Models\Slug;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Botble\Media\Facades\RvMedia;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\Theme;

class CourseService
{
    public function handleFrontRoutes(Slug|array $slug): Slug|array|Builder
    {
        // ddd($slug);
        if (! $slug instanceof Slug) {
            return $slug;
        }

        $condition = [
            'id' => $slug->reference_id,
            'status' => BaseStatusEnum::PUBLISHED,
        ];

        if (Auth::check() && request()->input('preview')) {
            Arr::forget($condition, 'status');
        }

        if ($slug->reference_type !== Course::class) {
            return $slug;
        }

        $course = app(CourseInterface::class)->getFirstBy($condition, ['*'], ['slugable']);

        if (empty($course)) {
            abort(404);
        }

        $meta = new SeoOpenGraph();

        if ($course->image) {
            $meta->setImage(RvMedia::getImageUrl($course->image));
        }

        if (! BaseHelper::isHomepage($course->id)) {
            SeoHelper::setTitle($course->name)
                ->setDescription($course->description);

            $meta->setTitle($course->name);
            $meta->setDescription($course->description);
        } else {
            $siteTitle = theme_option('seo_title') ? theme_option('seo_title') : theme_option('site_title');
            $seoDescription = theme_option('seo_description');

            SeoHelper::setTitle($siteTitle)
                ->setDescription($seoDescription);

            $meta->setTitle($siteTitle);
            $meta->setDescription($seoDescription);
        }

        $meta->setUrl($course->url);
        $meta->setType('article');

        SeoHelper::setSeoOpenGraph($meta);

        SeoHelper::meta()->setUrl($course->url);

        if ($course->template) {
            Theme::uses(Theme::getThemeName())
                ->layout($course->template);
        }

        if (function_exists('admin_bar')) {
            admin_bar()
                ->registerLink(trans('packages/course::courses.edit_this_course'), route('courses.edit', $course->id), null, 'courses.edit');
        }

        if (function_exists('shortcode')) {
            shortcode()->getCompiler()->setEditLink(route('courses.edit', $course->id), 'courses.edit');
        }

        do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, COURSE_MODULE_SCREEN_NAME, $course);

        // Get breadcrumbs array for the courses
        $family = get_course_hierarchy($course->id);
        // Item to append
        $courseLandingPageItem = [
            "id" => 1,
            "name" => "Learn",
            "url" => "/course-landing",
            "label" => "Learn",
        ];
        // Insert the item at the first place.
        array_unshift($family, $courseLandingPageItem);

        // Add breadcrumbs
        // Defined this function at src/packages/theme/src/Breadcrumb.php
        // Next time when update to new version write this functiona at this location.
        Theme::breadcrumb()->addBreadCrumbsFromArray($family);

        if ($course['parent_id'] !== 0) {
            // dd($course['parent_id']);

            // for the child course posts.
            return [
                'view' => 'child-course',
                'default_view' => 'packages/course::themes.child-course',
                'data' => compact('course'),
                'slug' => $course->slug,
            ];
        } else {

            return [
                'view' => 'course',
                'default_view' => 'packages/course::themes.course',
                'data' => compact('course'),
                'slug' => $course->slug,
            ];
        }
    }

    public function handleLandingRoute(): Slug|array|Builder
    {
        // if (! $slug instanceof Slug) {
        //     return $slug;
        // }

        // $condition = [
        //     'id' => $slug->reference_id,
        //     'status' => BaseStatusEnum::PUBLISHED,
        // ];

        // if (Auth::check() && request()->input('preview')) {
        //     Arr::forget($condition, 'status');
        // }

        // if ($slug->reference_type !== Course::class) {
        //     return $slug;
        // }

        // $course = app(CourseInterface::class)->getFirstBy($condition, ['*'], ['slugable']);

        SeoHelper::setTitle("Courses")
                ->setDescription("");

        $course = app(CourseInterface::class)->getAllRootCourses();

        // if there is no courses available then show maintenance page.
        if (empty($course) || !count($course)) {
            return [
                'view' => 'maintenance',
                'default_view' => 'packages/course::themes.maintenance',
                'data' => compact('course'),
                'slug' => '',//Todo, is it used...
            ];
            // abort(404);
        }

        // $meta = new SeoOpenGraph();

        // if ($course->image) {
        //     $meta->setImage(RvMedia::getImageUrl($course->image));
        // }

        // if (! BaseHelper::isHomepage($course[0]->id)) {
        //     SeoHelper::setTitle($course->name)
        //         ->setDescription($course->description);

        //     $meta->setTitle($course[0]->name);
        //     $meta->setDescription($course[0]->description);
        // } else {
            // $siteTitle = theme_option('seo_title') ? theme_option('seo_title') : theme_option('site_title');
            // $seoDescription = theme_option('seo_description');

            // SeoHelper::setTitle($siteTitle);
                // ->setDescription($seoDescription);

            // $meta->setTitle($siteTitle);
            // $meta->setDescription($seoDescription);
        // }

        // $meta->setUrl($course[0]->url);
        // $meta->setType('article');
// ddd($meta);
        // SeoHelper::setSeoOpenGraph($meta);

        // SeoHelper::meta()->setUrl($course[0]->url);

        // if ($course[0]->template) {
        //     Theme::uses(Theme::getThemeName())
        //         ->layout($course[0]->template);
        // }

        // if (function_exists('admin_bar')) {
        //     admin_bar()
        //         ->registerLink(trans('packages/course::courses.edit_this_course'), route('courses.edit', $course[0]->id), null, 'courses.edit');
        // }

        // if (function_exists('shortcode')) {
        //     shortcode()->getCompiler()->setEditLink(route('courses.edit', $course[0]->id), 'courses.edit');
        // }

        // do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, COURSE_MODULE_SCREEN_NAME, $course[0]);

        // Theme::breadcrumb()
        //     ->add(__('Home'), route('public.index'))
        //     ->add("Learn", $course[0]->url);

        return [
            'view' => 'landing',
            'default_view' => 'packages/course::themes.landing',
            'data' => compact('course'),
            'slug' => $course[0]->slug,//Todo, is it used...
        ];
    }
}
