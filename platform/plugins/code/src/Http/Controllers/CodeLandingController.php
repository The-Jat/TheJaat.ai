<?php

namespace Botble\Code\Http\Controllers;

use Botble\Code\Models\CodePost;
use Botble\Code\Services\CodeService;
use Botble\Theme\Events\RenderingSingleEvent;
use Illuminate\Routing\Controller;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Http\Request;
use Botble\Theme\Facades\Theme;

class CodeLandingController extends Controller
{
    public function getCodeLanding(/*string $slug,*/ CodeService $courseService)
    {
        // ddd($courseService);
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
        // dd($data);
        // $data['default_view'] = "course";

        // if (isset($data['slug']) && $data['slug'] !== $slug->key) {
        //     return redirect()->to(url(SlugHelper::getPrefix(Course::class) . '/' . $data['slug']));
        // }

        // event(new RenderingSingleEvent($slug));

        return Theme::scope($data['view'], $data['data'], $data['default_view'])->render();
    }

    // public function showCourse(string $slug, CourseService $courseService){
    //     // ddd($slug);
    //     $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(Course::class));

    //     if (! $slug) {
    //         abort(404);
    //     }

    //     $data = $courseService->handleFrontRoutes($slug);

    //     if (isset($data['slug']) && $data['slug'] !== $slug->key) {
    //         return redirect()->to(url(SlugHelper::getPrefix(Course::class) . '/' . $data['slug']));
    //     }

    //     event(new RenderingSingleEvent($slug));

    //     return Theme::scope($data['view'], $data['data'], $data['default_view'])->render();
    // }

    public function getCodePostList(Request $request, string $slug, CodeService $codeService){

        // extract from request, if null set default values.
        $difficulty = $request->query('difficulty') ?? 'all';
        $orderBy = $request->query('orderBy') ?? 'order';
        $order = $request->query('order') ?? 'asc';

        $filterArray = array("difficulty" => $difficulty, 'orderBy' => $orderBy, 'order' => $order);

        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(CodePost::class));

        if (! $slug) {
            abort(404);
        }

        $data = $codeService->handleRoutes($slug, $filterArray);

        if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            return redirect()->to(url(SlugHelper::getPrefix(Course::class) . '/' . $data['slug']));
        }

        event(new RenderingSingleEvent($slug));

        return Theme::scope($data['view'], $data['data'], $data['default_view'])->render();
    }
}
