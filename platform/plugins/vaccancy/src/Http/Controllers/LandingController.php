<?php

namespace Botble\Vaccancy\Http\Controllers;

use Botble\Base\Facades\BaseHelper;
use Botble\Vaccancy\Models\VaccancyCategory;
use Botble\Vaccancy\Models\VaccancyPost;
use Botble\Vaccancy\Models\VaccancyTag;
use Botble\Vaccancy\Repositories\Interfaces\PostInterface;
use Botble\Vaccancy\Services\VaccancyService;
use Botble\Theme\Events\RenderingSingleEvent;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Slug\Facades\SlugHelper;
use Botble\Theme\Facades\Theme;

class LandingController extends Controller
{
    public function getSearch(Request $request, PostInterface $postRepository)
    {
        $query = BaseHelper::stringify($request->input('q'));

        $title = __('Search result for: ":query"', compact('query'));

        SeoHelper::setTitle($title)
            ->setDescription($title);

        $posts = $postRepository->getSearch($query, 0, 12);

        Theme::breadcrumb()
            ->add(__('Home'), route('public.index'))
            ->add($title, route('public.search'));

        return Theme::scope('search', compact('posts'))
            ->render();
    }

    public function getTag(string $slug, VaccancyService $vaccancyService)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(VaccancyTag::class));

        if (! $slug) {
            abort(404);
        }

        $data = $vaccancyService->handleFrontRoutes($slug);

        if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            return redirect()->to(route('public.single', SlugHelper::getPrefix(VaccancyTag::class) . '/' . $data['slug']));
        }

        event(new RenderingSingleEvent($slug));

        return Theme::scope($data['view'], $data['data'], $data['default_view'])
            ->render();
    }

    public function getPost(VaccancyService $vaccancyService)
    {
        $slug = "vaccancy";
//         $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(VaccancyPost::class));
// dd($slug);
//         if (! $slug) {
//             abort(404);
//         }

        $data = $vaccancyService->handleFrontRoutesForLanding($slug);

        // if (isset($data['slug']) && $data['slug'] !== $slug->key) {
        //     return redirect()->to(route('public.single', SlugHelper::getPrefix(VaccancyPost::class) . '/' . $data['slug']));
        // }

        // event(new RenderingSingleEvent($slug));
// dd($data);
        //Theme::scope($data['view'], $data['data'], $data['default_view'], $data['layout'])
        // custom made scoper function, the control goes to the platform/packages/theme/src/Theme.php
        return Theme::scoper($data)
            ->render();
    }

    public function getCategory(string $slug, VaccancyService $vaccancyService)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(VaccancyCategory::class));

        if (! $slug) {
            abort(404);
        }

        $data = $vaccancyService->handleFrontRoutes($slug);

        if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            return redirect()->to(route('public.single', SlugHelper::getPrefix(VaccancyCategory::class) . '/' . $data['slug']));
        }

        event(new RenderingSingleEvent($slug));

        return Theme::scope($data['view'], $data['data'], $data['default_view'])
            ->render();
    }

    public function VaccancyLanding(/*string $slug,*/ VaccancyService $vaccancyService)
        {

            // return "HI";
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
    
            $data = $vaccancyService->handleLandingRoute();
            // dd($data);
            // dd($data);
            // $data['default_view'] = "course";
    
            // if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            //     return redirect()->to(url(SlugHelper::getPrefix(Course::class) . '/' . $data['slug']));
            // }
    
            // event(new RenderingSingleEvent($slug));

            return Theme::scope($data['view'], $data['data'], $data['default_view'])->render();
        }
}
