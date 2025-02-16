<?php

namespace Botble\Shortener\Services;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\Helper;
use Botble\Shortener\Models\Category;
use Botble\Shortener\Models\Shortener;
use Botble\Shortener\Models\Tag;
use Botble\Shortener\Repositories\Interfaces\CategoryInterface;
use Botble\Shortener\Repositories\Interfaces\PostInterface;
use Botble\Shortener\Repositories\Interfaces\TagInterface;
use Botble\SeoHelper\SeoOpenGraph;
use Botble\Slug\Models\Slug;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Botble\Media\Facades\RvMedia;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\Theme;

class BlogService
{
    public function handleFrontRoutes(Slug|array $slug): Slug|array|Builder
    {
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
            case Post::class:
                $post = app(ShortenerInterface::class)
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
                        trans('plugins/shortener::posts.edit_this_post'),
                        route('posts.edit', $post->id),
                        null,
                        'posts.edit'
                    );
                }

                if (function_exists('shortcode')) {
                    shortcode()->getCompiler()->setEditLink(route('posts.edit', $post->id), 'posts.edit');
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
                    'view' => 'post',
                    'default_view' => 'plugins/shortener::themes.post',
                    'data' => compact('post'),
                    'slug' => $post->slug,
                ];
            case Category::class:
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
                        trans('plugins/shortener::categories.edit_this_category'),
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
                    'view' => 'category',
                    'default_view' => 'plugins/shortener::themes.category',
                    'data' => compact('category', 'posts'),
                    'slug' => $category->slug,
                ];
            case Tag::class:
                $tag = app(TagInterface::class)->getFirstBy($condition, ['*'], ['slugable']);

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
                    admin_bar()->registerLink(trans('plugins/shortener::tags.edit_this_tag'), route('tags.edit', $tag->id), null, 'tags.edit');
                }

                $posts = get_posts_by_tag($tag->id, (int)theme_option('number_of_posts_in_a_tag', 12));

                Theme::breadcrumb()
                    ->add(__('Home'), route('public.index'))
                    ->add($tag->name, $tag->url);

                do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, TAG_MODULE_SCREEN_NAME, $tag);

                return [
                    'view' => 'tag',
                    'default_view' => 'plugins/shortener::themes.tag',
                    'data' => compact('tag', 'posts'),
                    'slug' => $tag->slug,
                ];
        }

        return $slug;
    }
}
