@php
    Theme::layout('full');
@endphp

<div class="container">

    <header style="margin-top: 10px;">
        <div class="mb-2 d-flex align-items-center gap-2 text-secondary fw-medium" style="font-size: 0.875rem;">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                stroke="currentColor" aria-hidden="true" class="me-2" style="width: 24px; height: 24px;">
                <path stroke-linecap="round" stroke-linejoin="round"
                    d="M15.362 5.214A8.252 8.252 0 0 1 12 21 8.25 8.25 0 0 1 6.038 7.047 8.287 8.287 0 0 0 9 9.601a8.983 8.983 0 0 1 3.361-6.867 8.21 8.21 0 0 0 3 2.48Z">
                </path>
                <path stroke-linecap="round" stroke-linejoin="round"
                    d="M12 18a3.75 3.75 0 0 0 .495-7.468 5.99 5.99 0 0 0-1.925 3.547 5.975 5.975 0 0 1-2.133-1.001A3.75 3.75 0 0 0 12 18Z">
                </path>
            </svg>
            <span>Explore</span>
        </div>

        <h1 class="text-capitalize fw-semibold" style="font-size: calc(1.5rem + 1vw);">
            Posts
        </h1>
    </header>

    <hr style="border-color: #e2e8f0;">


    <!-- Filters Section -->
    <div class="filters mb-4">
        <form action="{{ route('public.viewAllBlogPost') }}" method="GET" class="row g-3">
            <!-- Keyword Search -->
            <div class="col-md-3">
                <input type="text" name="keyword" class="form-control" placeholder="Search Keyword"
                    value="{{ request('keyword') }}">
            </div>

            <!-- Categories Dropdown -->
            <div class="col-md-2">
                <select name="category" class="form-select">
                    <option value="">All Categories</option>
                    @foreach ($categories as $category)
                        <option value="{{ $category->id }}"
                            {{ request('category') == $category->id ? 'selected' : '' }}>
                            {{ $category->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <!-- Tags Dropdown -->
            <div class="col-md-2">
                <select name="tag" class="form-select">
                    <option value="">All Tags</option>
                    @foreach ($tags as $tag)
                        <option value="{{ $tag->id }}" {{ request('tag') == $tag->id ? 'selected' : '' }}>
                            {{ $tag->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <!-- Authors Dropdown -->
            {{-- <div class="col-md-2">
                <select name="author" class="form-select">
                    <option value="">All Authors</option>
                    @foreach ($authors as $author)
                        <option value="{{ $author->id }}" {{ request('author') == $author->id ? 'selected' : '' }}>
                            {{ $author->name }}
                        </option>
                    @endforeach
                </select>
            </div> --}}

            <!-- Order Dropdown -->
            <div class="col-md-2">
                <select name="order" class="form-select">
                    <option value="newest" {{ request('order') == 'newest' ? 'selected' : '' }}>Newest to Oldest
                    </option>
                    <option value="oldest" {{ request('order') == 'oldest' ? 'selected' : '' }}>Oldest to Newest
                    </option>
                </select>
            </div>

            <!-- Submit Button -->
            <div class="col-md-1">
                <button type="submit" class="btn btn-primary w-100">Filter</button>
            </div>
        </form>
    </div>

    <!-- Blogs Cards Section -->
    {{-- <div class="blogs-cards row">
        @forelse ($blogs as $blog)
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">{{ $blog->title }}</h5>
                        <p class="card-text">{{ Str::limit($blog->content, 100) }}</p>
                    </div>
                    <div class="card-footer">
                        {{-- <a href="{{ route('blogs.show', $blog->id) }}" class="btn btn-sm btn-secondary">Read More</a> --}}
    {{-- </div>
                </div>
            </div>
        @empty
            <p>No blogs found.</p>
        @endforelse
    </div> --}}

    <!-- Pagination Section -->
    {{-- <div class="pagination justify-content-center">
        {{ $blogs->appends(request()->query())->links() }}
    </div> --}}

    {{-- resources/views/blog_cards.blade.php --}}


    <style>
        @media (min-width: 1024px) {
            .container {
                max-width: 1024px;
            }
        }
    </style>


    <div class="container my-5">
        <div class="row g-4">
            @foreach ($blogs as $blog)
                <div class="col-md-4" style="overflow: hidden; padding: 15px!important;">
                    <div class="card h-100 p-3 border-0 shadow-sm rounded-4"
                        style="overflow: hidden; position: relative; padding: 0px!important;
                            ">
                        <!-- Tags -->
                        {{-- <div class="d-flex gap-2 mb-2">
                            @foreach ($blog->tags as $tag)
                                <span class="badge bg-light text-dark fw-normal">
                                    {{ $tag->name }}
                                </span>
                            @endforeach
                        </div> --}}

                        <div style="padding: 0px!important;">
                            <a href="{{ get_external_link($blog) }}"
                                {{ is_external_link($blog) ? 'target="_blank"' : '' }}>
                                <img class="lazy" style="width: 100%; object-fit:cover; width:100%; height:100%;"
                                    data-src="{{ RvMedia::getImageUrl($blog->image, 'medium', false, RvMedia::getDefaultImage()) }}"
                                    src="{{ RvMedia::getImageUrl(theme_option('img_loading')) }}"
                                    alt="{{ $blog->name }}">
                            </a>
                        </div>

                        <a style="inset: 0; position:absolute;" href="{{ get_external_link($blog) }}"
                            {{ is_external_link($blog) ? 'target="_blank"' : '' }}>
                        </a>

                        <div
                            style="padding-top: 1rem; padding-bottom: 1rem;
                        padding-left: .875rem;
                        padding-right: .875rem;">



                            <!-- Author Info -->
                            <div class="d-flex align-items-center my-3">
                                <a style="display: flex; align-items: center;">
                                    <div>
                                        <img src="{{ $blog->author->avatar_url ?? 'https://via.placeholder.com/40' }}"
                                            class="rounded-circle me-2" alt="{{ $blog->author->name }}"
                                            style="width: 40px; height: 40px;">
                                    </div>
                                    <span style="font-size: .75rem; margin-left:0.5rem;">
                                        {{ $blog->author->name }}
                                    </span>
                                </a>

                                <span
                                    style="margin-left: 6px;
                                            margin-right: 6px;
                                            font-weight:500;
                                            font-size: .75rem;">
                                    .
                                </span>
                                <span style="font-size: .75rem;">
                                    {{ $blog->created_at->format('M d, Y') }}
                                </span>
                            </div>
                            <!-- Title -->
                            <h5 class="card-title" style="font-size: 1rem;">{{ $blog->name }}</h5>

                            <!-- Footer Icons -->
                            <div class="d-flex align-items-center justify-content-between"
                                style="display: flex;
                                        justify-content: space-between;
                                        gap: .625rem;
                                        align-items: flex-end;
                                        flex-wrap: wrap;">
                                <div class="d-flex align-items-center gap-3">
                                    <!-- Example: comments count -->
                                    {{-- <span class="text-muted">
                                        <i class="bi bi-chat"></i>
                                        {{ $blog->comments_count ?? 0 }}
                                    </span> --}}
                                    <!-- Example: reading time -->
                                    <span class="text-muted" style="font-size: .75rem;">
                                        <i class="bi bi-clock"></i>
                                        {{ get_time_to_read($blog) }} min read
                                    </span>
                                </div>
                                <!-- Link to blog detail page -->
                                {{-- <a href="{{ route('blogs.show', $blog->slug) }}" class="text-decoration-none">
                            Read more
                        </a> --}}
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        <!-- Pagination (if applicable) -->
        <div class="mt-4">
            {{ $blogs->links() }}
        </div>
    </div>


</div>
