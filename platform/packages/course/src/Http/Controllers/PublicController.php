<?php

namespace Botble\Course\Http\Controllers;

use Botble\Course\Models\Course;
use Botble\Course\Services\CourseService;
use Botble\Theme\Events\RenderingSingleEvent;
use Illuminate\Routing\Controller;
use Botble\Slug\Facades\SlugHelper;
use Botble\Theme\Facades\Theme;

class PublicController extends Controller
{
    public function getCourse(string $slug, CourseService $courseService)
    {
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
