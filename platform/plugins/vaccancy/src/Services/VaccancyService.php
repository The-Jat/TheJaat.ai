<?php

namespace Botble\Vaccancy\Services;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\Helper;
use Botble\Vaccancy\Models\VaccancyCategory;
use Botble\Vaccancy\Models\VaccancyPost;
use Botble\Vaccancy\Models\VaccancyTag;
use Botble\Vaccancy\Repositories\Interfaces\CategoryInterface;
use Botble\Vaccancy\Repositories\Interfaces\PostInterface;
use Botble\Vaccancy\Repositories\Interfaces\TagInterface;
use Botble\SeoHelper\SeoOpenGraph;
use Botble\Slug\Models\Slug;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Botble\Media\Facades\RvMedia;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\Theme;

class VaccancyService
{
    public function handleFrontRoutes(Slug|array $slug): Slug|array|Builder
    {
        // dd($slug->reference_type);
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

        switch ($slug->reference_type) {
            case VaccancyPost::class:
                $post = app(PostInterface::class)
                    ->getFirstBy(
                        $condition,
                        ['*'],
                        ['categories', 'tags', 'slugable', 'categories.slugable', 'tags.slugable']
                    );

                if (empty($post)) {
                    abort(404);
                }

                Helper::handleViewCount($post, 'viewed_post');

                SeoHelper::setTitle($post->name)
                    ->setDescription($post->description);

                $meta = new SeoOpenGraph();
                if ($post->image) {
                    $meta->setImage(RvMedia::getImageUrl($post->image));
                }
                $meta->setDescription($post->description);
                $meta->setUrl($post->url);
                $meta->setTitle($post->name);
                $meta->setType('article');

                SeoHelper::setSeoOpenGraph($meta);

                SeoHelper::meta()->setUrl($post->url);

                if (function_exists('admin_bar')) {
                    admin_bar()->registerLink(
                        trans('plugins/vaccancy::posts.edit_this_post'),
                        route('vaccancy_posts.edit', $post->id),
                        null,
                        'posts.edit'
                    );
                }

                if (function_exists('shortcode')) {
                    shortcode()->getCompiler()->setEditLink(route('vaccancy_posts.edit', $post->id), 'posts.edit');
                }

                Theme::breadcrumb()->add(__('Home'), route('public.index'));

                $category = $post->categories->sortByDesc('id')->first();
                if ($category) {
                    if ($category->parents->count()) {
                        foreach ($category->parents as $parentCategory) {
                            Theme::breadcrumb()->add($parentCategory->name, $parentCategory->url);
                        }
                    }

                    Theme::breadcrumb()->add($category->name, $category->url);
                }

                Theme::breadcrumb()->add($post->name, $post->url);

                do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, POST_MODULE_SCREEN_NAME, $post);

                return [
                    'view' => 'vaccancy-post',
                    'default_view' => 'plugins/vaccancy::themes.vaccancy-post',
                    'data' => compact('post'),
                    'slug' => $post->slug,
                ];
            case VaccancyCategory::class:
                $category = app(CategoryInterface::class)
                    ->getFirstBy($condition, ['*'], ['slugable']);

                if (empty($category)) {
                    abort(404);
                }

                SeoHelper::setTitle($category->name)
                    ->setDescription($category->description);

                $meta = new SeoOpenGraph();
                if ($category->image) {
                    $meta->setImage(RvMedia::getImageUrl($category->image));
                }
                $meta->setDescription($category->description);
                $meta->setUrl($category->url);
                $meta->setTitle($category->name);
                $meta->setType('article');

                SeoHelper::setSeoOpenGraph($meta);

                SeoHelper::meta()->setUrl($category->url);

                if (function_exists('admin_bar')) {
                    admin_bar()->registerLink(
                        trans('plugins/vaccancy::categories.edit_this_category'),
                        route('categories.edit', $category->id),
                        null,
                        'categories.edit'
                    );
                }

                $allRelatedCategoryIds = array_merge([$category->id], $category->activeChildren->pluck('id')->all());

                $posts = app(PostInterface::class)
                    ->getByCategory($allRelatedCategoryIds, (int)theme_option('number_of_posts_in_a_category', 12));

                Theme::breadcrumb()
                    ->add(__('Home'), route('public.index'));

                if ($category->parents->count()) {
                    foreach ($category->parents->reverse() as $parentCategory) {
                        Theme::breadcrumb()->add($parentCategory->name, $parentCategory->url);
                    }
                }

                Theme::breadcrumb()->add($category->name, $category->url);

                do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, CATEGORY_MODULE_SCREEN_NAME, $category);

                return [
                    'view' => 'vaccancy_category',
                    'default_view' => 'plugins/vaccancy::themes.category',
                    'data' => compact('category', 'posts'),
                    'slug' => $category->slug,
                ];
            case VaccancyTag::class:
                // dd("in tags");
                $tag = app(TagInterface::class)->getFirstBy($condition, ['*'], ['slugable']);
// dd($tag);
                if (! $tag) {
                    abort(404);
                }

                SeoHelper::setTitle($tag->name)
                    ->setDescription($tag->description);

                $meta = new SeoOpenGraph();
                $meta->setDescription($tag->description);
                $meta->setUrl($tag->url);
                $meta->setTitle($tag->name);
                $meta->setType('article');

                SeoHelper::setSeoOpenGraph($meta);

                SeoHelper::meta()->setUrl($tag->url);

                if (function_exists('admin_bar')) {
                    admin_bar()->registerLink(trans('plugins/vaccancy::tags.edit_this_tag'), route('tags.edit', $tag->id), null, 'tags.edit');
                }

                $posts = get_vaccancy_posts_by_vaccancy_tag($tag->id, (int)theme_option('number_of_posts_in_a_tag', 12));

                Theme::breadcrumb()
                    ->add(__('Home'), route('public.index'))
                    ->add($tag->name, $tag->url);

                do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, VACCANCY_TAG_MODULE_SCREEN_NAME, $tag);

                return [
                    'view' => 'tag',
                    'default_view' => 'plugins/vaccancy::themes.tag',
                    'data' => compact('tag', 'posts'),
                    'slug' => $tag->slug,
                ];
        }

        return $slug;
    }


    public function handleFrontRoutesForLanding(): Slug|array|Builder
    {
        // ddd($slug);
        // if (!$slug instanceof Slug) {
        //     return $slug;
        // }

        // $condition = [
        //     'id' => $slug->reference_id,
        //     'status' => BaseStatusEnum::PUBLISHED,
        // ];

        // if (Auth::check() && request()->input('preview')) {
        //     Arr::forget($condition, 'status');
        // }

        $posts = app(PostInterface::class)
                ->getAllPosts();
            
        // dd($post);
        // $post = app(PostInterface::class)
        //     ->getFirstBy(
        //         $condition,
        //         ['*'],
        //         ['categories', 'tags', 'slugable', 'categories.slugable', 'tags.slugable']
        //     );

        // if (empty($post)) {
        //     abort(404);
        // }

        // Helper::handleViewCount($post, 'viewed_post');

        // SeoHelper::setTitle($post->name)
        //     ->setDescription($post->description);

        // $meta = new SeoOpenGraph();
        // if ($post->image) {
        //     $meta->setImage(RvMedia::getImageUrl($post->image));
        // }
        // $meta->setDescription($post->description);
        // $meta->setUrl($post->url);
        // $meta->setTitle($post->name);
        // $meta->setType('article');

        // SeoHelper::setSeoOpenGraph($meta);

        // SeoHelper::meta()->setUrl($post->url);

        // if (function_exists('admin_bar')) {
        //     admin_bar()->registerLink(
        //         trans('plugins/vaccancy::posts.edit_this_post'),
        //         route('posts.edit', $post->id),
        //         null,
        //         'posts.edit'
        //     );
        // }

        // if (function_exists('shortcode')) {
        //     shortcode()->getCompiler()->setEditLink(route('posts.edit', $post->id), 'posts.edit');
        // }

        // Theme::breadcrumb()->add(__('Home'), route('public.index'));

        // $category = $post->categories->sortByDesc('id')->first();
        // if ($category) {
        //     if ($category->parents->count()) {
        //         foreach ($category->parents as $parentCategory) {
        //             Theme::breadcrumb()->add($parentCategory->name, $parentCategory->url);
        //         }
        //     }

        //     Theme::breadcrumb()->add($category->name, $category->url);
        // }

        // Theme::breadcrumb()->add($post->name, $post->url);

        // do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, POST_MODULE_SCREEN_NAME, $post);

        return [
            'view' => 'vaccancy-post',
            'default_view' => 'plugins/vaccancy::themes.vaccancy-post',
            'data' => compact('posts'),
            'layout' => 'vaccancy'
            // 'slug' => $post->slug,
        ];
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

        $vaccancies = app(PostInterface::class)->getAllPosts();

        // dd($vaccancies);
        // if there is no courses available then show maintenance page.
        // if (empty($course) || !count($course)) {
        //     return [
        //         'view' => 'maintenance',
        //         'default_view' => 'packages/course::themes.maintenance',
        //         'data' => compact('course'),
        //         'slug' => '',//Todo, is it used...
        //     ];
        //     // abort(404);
        // }

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
            'default_view' => 'plugins/vaccancy::themes.vaccancy-landing',
            'data' => compact('vaccancies'),
            // 'slug' => $course[0]->slug,//Todo, is it used...
        ];
    }
}
