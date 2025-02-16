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

class PublicController extends Controller
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
        // dd($data);

        if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            return redirect()->to(route('public.single', SlugHelper::getPrefix(VaccancyTag::class) . '/' . $data['slug']));
        }

        event(new RenderingSingleEvent($slug));

        // Todo should be generic to take view from the plugin directory.
        return Theme::scope($data['view'], $data['data'], $data['default_view'])
            ->render();
    }

    public function getPost(string $slug, VaccancyService $vaccancyService)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(VaccancyPost::class));

        if (! $slug) {
            abort(404);
        }

        $data = $vaccancyService->handleFrontRoutes($slug);

        if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            return redirect()->to(route('public.single', SlugHelper::getPrefix(VaccancyPost::class) . '/' . $data['slug']));
        }

        event(new RenderingSingleEvent($slug));

        return Theme::scope($data['view'], $data['data'], $data['default_view'])
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
}
