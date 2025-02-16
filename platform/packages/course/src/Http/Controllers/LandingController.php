<?php

namespace Botble\Course\Http\Controllers;

use Botble\Course\Models\Course;
use Botble\Course\Services\CourseService;
use Botble\Theme\Events\RenderingSingleEvent;
use Illuminate\Routing\Controller;
use Botble\Slug\Facades\SlugHelper;
use Botble\Theme\Facades\Theme;

class LandingController extends Controller
{
    public function getCourse(/*string $slug,*/ CourseService $courseService)
    {
        // ddd($slug);
        // $data= [
        //     'view' => 'course',
        //     'default_view' => 'packages/course::themes.course',
        //     'data' => compact('course'),
        //     // 'slug' => $course->slug,
        // ];
        // $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Course::class));

        // if (! $slug) {
        //     abort(404);
        // }

        $data = $courseService->handleLandingRoute();
        // ddd($data['default_view']);
        // $data['default_view'] = "course";

        // if (isset($data['slug']) && $data['slug'] !== $slug->key) {
        //     return redirect()->to(url(SlugHelper::getPrefix(Course::class) . '/' . $data['slug']));
        // }

        // event(new RenderingSingleEvent($slug));
// dd(Theme::scope($data['view'], $data['data'], $data['default_view'])->render());
        return Theme::scope($data['view'], $data['data'], $data['default_view'])->render();
    }

    public function showCourse(string $slug, CourseService $courseService){
        // ddd($slug);
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Course::class));

        if (! $slug) {
            abort(404);
        }

        $data = $courseService->handleFrontRoutes($slug);

        if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            return redirect()->to(url(SlugHelper::getPrefix(Course::class) . '/' . $data['slug']));
        }

        event(new RenderingSingleEvent($slug));

        return Theme::scope($data['view'], $data['data'], $data['default_view'])->render();
    }
}
