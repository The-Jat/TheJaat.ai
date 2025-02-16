<?php

namespace Botble\Code\Http\Controllers;

use Botble\Base\Facades\BaseHelper;
use Botble\Code\Models\CodeCategory;
use Botble\Code\Models\CodePost;
use Botble\Code\Models\CodeTag;
use Botble\Code\Repositories\Interfaces\PostInterface;
use Botble\Code\Services\CodeService;
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

    public function getTag(string $slug, CodeService $codeService)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(CodeTag::class));

        if (! $slug) {
            abort(404);
        }

        $data = $codeService->handleFrontRoutes($slug);

        if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            return redirect()->to(route('public.single', SlugHelper::getPrefix(CodeTag::class) . '/' . $data['slug']));
        }

        event(new RenderingSingleEvent($slug));

        return Theme::scope($data['view'], $data['data'], $data['default_view'])
            ->render();
    }

    public function getPost(string $slug, CodeService $codeService)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(CodePost::class));

        if (! $slug) {
            abort(404);
        }

        $data = $codeService->handleFrontRoutes($slug);
// ddd($data);
        if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            return redirect()->to(route('public.single', SlugHelper::getPrefix(CodePost::class) . '/' . $data['slug']));
        }

        event(new RenderingSingleEvent($slug));

        return Theme::scope_code($data['view'], $data['data'], $data['default_view'])
            ->render();
    }

    public function getCategory(string $slug, CodeService $codeService)
    {
        $slug = SlugHelper::getSlug($slug, SlugHelper::getPrefix(CodeCategory::class));

        if (! $slug) {
            abort(404);
        }

        $data = $codeService->handleFrontRoutes($slug);

        if (isset($data['slug']) && $data['slug'] !== $slug->key) {
            return redirect()->to(route('public.single', SlugHelper::getPrefix(CodeCategory::class) . '/' . $data['slug']));
        }

        event(new RenderingSingleEvent($slug));

        return Theme::scope($data['view'], $data['data'], $data['default_view'])
            ->render();
    }
}
