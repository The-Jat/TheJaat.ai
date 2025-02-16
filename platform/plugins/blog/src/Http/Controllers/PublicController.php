<?php

namespace Botble\Blog\Http\Controllers;

use Botble\Base\Facades\BaseHelper;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Blog\Repositories\Interfaces\PostInterface;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\Theme;
use Illuminate\Http\Request;
use Botble\Blog\Models\Post;
use Botble\Blog\Models\Category;
use Botble\Blog\Models\Tag;

class PublicController extends BaseController
{
    public function getSearch(Request $request, PostInterface $postRepository)
    {
        $query = BaseHelper::stringify($request->input('q'));

        $title = __('Search result for: ":query"', compact('query'));

        SeoHelper::setTitle($title)
            ->setDescription($title);

        $posts = $postRepository->getSearch($query, 0, (int) theme_option('number_of_posts_in_a_category', 12));

        Theme::breadcrumb()->add($title, route('public.search'));

        return Theme::scope('search', compact('posts'))
            ->render();
    }


    public function viewAllBlogPost(Request $request)
    {
        // $query = BaseHelper::stringify($request->input('q'));
        $query = Post::query();
        // dd($query);

        // $title = __('Search result for: ":query"', compact('query'));

        SeoHelper::setTitle("View all blog posts")
            ->setDescription("View all the blog posts are in one click");

        // $posts = $postRepository->getSearch($query, 0, (int) theme_option('number_of_posts_in_a_category', 12));

        // Theme::breadcrumb()->add($title, route('public.search'));

         // Filter by keyword if provided
         if ($request->filled('keyword')) {
            $query->where('name', 'like', '%' . $request->keyword . '%');
        }

        if ($request->filled('category')) {
            $query->whereHas('categories', function ($q) use ($request) {
                $q->where('categories.id', $request->category);
            });
        }        

        // Filter by tag if provided (assuming Blog has a many-to-many relationship with Tag)
        if ($request->filled('tag')) {
            $query->whereHas('tags', function ($q) use ($request) {
                $q->where('id', $request->tag);
            });
        }

        // Filter by author if provided
        if ($request->filled('author')) {
            $query->where('user_id', $request->author);
        }

        // Order by newest or oldest
        if ($request->filled('order')) {
            $order = $request->order === 'oldest' ? 'asc' : 'desc';
            $query->orderBy('created_at', $order);
        } else {
            // Default order
            $query->orderBy('created_at', 'desc');
        }

        // Paginate results (e.g., 10 per page)
        $blogs = $query->paginate(9);

        // Fetch filter options (you can modify these as needed)
        $categories = Category::all();
        $tags       = Tag::all();
        // $authors    = User::all();

        return Theme::scopeBlog('plugins/blog::themes.viewAllBlogPost', compact('blogs', 'categories', 'tags'))
            ->render();
    }
}
