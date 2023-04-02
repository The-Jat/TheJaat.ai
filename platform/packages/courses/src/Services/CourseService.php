<?php

namespace Botble\Course\Services;

use BaseHelper;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Course\Models\Course;
use Botble\Course\Repositories\Interfaces\CourseInterface;
use Botble\SeoHelper\SeoOpenGraph;
use Eloquent;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use RvMedia;
use SeoHelper;
use Theme;

class CourseService
{
    /**
     * @param Eloquent|Builder $slug
     * @return array|Eloquent
     */
    public function handleFrontRoutes($slug)
    {
        if (!$slug instanceof Eloquent) {
            return $slug;
        }

        $condition = [
            'id'     => $slug->reference_id,
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

        if (!BaseHelper::isHomepage($course->id)) {
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

        if ($course->template) {
            Theme::uses(Theme::getThemeName())
                ->layout($course->template);
        }

        if (function_exists('admin_bar') && Auth::check() && Auth::user()->hasPermission('courses.edit')) {
            admin_bar()
                ->registerLink(trans('packages/courses::courses.edit_this_page'), route('courses.edit', $course->id));
        }

        do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, COURSE_MODULE_SCREEN_NAME, $course);

        Theme::breadcrumb()
            ->add(__('Home'), route('public.index'))
            ->add(SeoHelper::getTitle(), $course->url);

        return [
            'view'         => 'course',
            'default_view' => 'packages/courses::themes.course',
            'data'         => compact('course'),
            'slug'         => $course->slug,
        ];
    }
}
