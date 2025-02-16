@php
    Theme::layout('full');
    // $totalComment = get_total_comment($post);
    // MetaBox::getMetaData($post, 'time_to_read', true);
    // $singleLayout = MetaBox::getMetaData($post, 'layout', true);
    // if (empty($singleLayout)) {
    // $singleLayout = theme_option('single_layout', 'default');
    // }

    // $videoLink = MetaBox::getMetaData($post, 'video_link', true);
    // $videoEmbedCode = MetaBox::getMetaData($post, 'video_embed_code', true);
    // $videoUploadId = MetaBox::getMetaData($post, 'video_upload_id', true);
    // if ($videoLink || $videoUploadId) {
    //     $singleLayout = 'default';
    // }

    // if (is_plugin_active('pro-posts')) {
    //     Theme::asset()->container('footer')->usePath(false)->add('favorite-post', 'vendor/core/plugins/pro-posts/js/favorite-posts.js');
    //     Theme::asset()->container('footer')->usePath()->add('post-js', 'js/post.js');
    // }
@endphp

<!--main content-->
<div class="main_content sidebar_right pb-50 default pt-50">
    {{-- <div data-post-id="{{ $post->id }}"></div> --}}
    {{-- @switch($singleLayout) --}}
    {{-- @case('top-full') --}}
    {{-- {!! Theme::partial('components.single.headers.top-full', compact('post', 'totalComment')) !!} --}}
    {{-- @break; --}}

    {{-- @case('inline')
            {!! Theme::partial('components.single.headers.inline', compact('post', 'totalComment')) !!}
            @break;
    @endswitch --}}

    <div class="container">
        {{-- <div class="row"> --}}
        {{-- <div class="col-lg-8 col-md-12 col-sm-12"> --}}
        {{-- @if ($singleLayout == 'default' || empty($singleLayout)) --}}
        {{-- {!! Theme::partial('components.single.headers.default', compact('post', 'totalComment', 'videoLink', 'videoEmbedCode', 'videoUploadId')) !!} --}}
        {{-- @endif --}}

        <div class="single-excerpt">
            {{-- <p class="font-large">{!! clean($post->description) !!}</p> --}}
        </div>
        {{-- <div class="entry-main-content wow fadeIn animated">
                    @if (defined('GALLERY_MODULE_SCREEN_NAME') && !empty(($galleries = gallery_meta_data($post))))
                        {!! render_object_gallery($galleries, ($post->categories()->first() ?
                        $post->categories()->first()->name
                        : __('Uncategorized'))) !!}
                    @endif
                    <div class="ck-content">{!! BaseHelper::clean($post->content) !!}</div>
                </div> --}}

        {{-- @if (is_plugin_active('external-source') && !empty($post->source_link))
                    <div class="entry-bottom mt-50 mb-30">
                        <p>{{ __('Source link') }}:
                            <a href="{{ $post->source_link }}" class="blue" target="_blank">{{ $post->source_link }}</a>
                        </p>
                    </div>
                @endif --}}

        {{-- <div class="entry-bottom mt-50 mb-30">
                    @if (!$post->tags->isEmpty())
                        <div class="tags">
                            @foreach ($post->tags as $tag)
                                <a href="{{ $tag->url }}" rel="tag" class="tag-cloud-link">{{ $tag->name }}</a>
                            @endforeach
                        </div>
                    @endif
                </div> --}}

        {{-- <div class="single-social-share clearfix wow fadeIn animated">
                    <ul class="d-inline-block list-inline float-right">
                        {!! Theme::partial('components.social-share-post', compact('post')) !!}
                    </ul>
                </div> --}}

        {{-- <div class="bt-1 border-color-1 mt-30 mb-30"></div>
                @if (theme_option('enable_show_post_author_detail', 'yes') == 'yes' && $post->author && $post->author->id)
                    <div class="author-bio mt-50 border-radius-10 bg-white wow fadeIn animated">
                        <div class="author-image mb-md-30">
                            <a href="{{ $post->author->url }}">
                                <img class="avatar"
                                     src="{{ RvMedia::getImageUrl($post->author->avatar->url, 'thumb', false, RvMedia::getDefaultImage()) }}"
                                     loading="lazy"
                                     alt="{{ $post->author->getFullName() }}">
                            </a>
                        </div>
                        <div class="author-info">
                            <a href="{{ $post->author->url }}">
                                <h4 class="font-weight-bold mb-20">
                                    <span class="vcard author">
                                        <span class="fn">{{ $post->author->getFullName() }}</span>
                                    </span>
                                </h4>
                            </a>
                            <p>{!! clean($post->author->description) !!}</p>
                        </div>
                    </div>
                @endif --}}

        {{-- @switch(theme_option('comment_type_in_post', ''))
                    @case('facebook')
                        {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, Theme::partial('comments')) !!}
                        @break

                    @case('member')
                        @if (is_plugin_active('comment') && comment_object_enable($post))
                            [comment type="{{ addslashes(get_class($post)) }}" type_id="{{ $post->id }}"][/comment]
                        @endif
                        @break
                @endswitch --}}

        {{-- @php $relatedPosts = get_related_posts($post->id, 3); @endphp

                @if ($relatedPosts->count() > 0)
                    {!! Theme::partial('components.single.related-posts', ['relatedPosts' => $relatedPosts ]) !!}
                @endif --}}
        <div class="container my-5">
            <div class="card card-body shadow-sm my-10">
                <div class="row card-row">
                    <div class="col-md-4">
                        <?php
                        // $urlToCapture = shortRoute($shorted->domain, $shorted->alias);
                        // dd($shorted->shorted);
                        // $urlToCapture = 'www.thejat.in';
                        // $screenshotUrl = shorted("/capture-screenshot/$urlToCapture");
                        $screenshotUrl = '//image.thum.io/get/width/' . $shorted->url;
                        ?>
                        <img src="{{ $screenshotUrl }}" class="img-fluid rounded shadow">
                    </div>
                    <div class="col-md-8">
                        <style>
                            .heading h2 {
                                font-size: calc(1.325rem + .9vw);
                            }

                            .card-row>* {
                                --bs-gutter-x: 1.5rem;
                                --bs-gutter-y: 0;
                                flex-shrink: 0;
                                width: 100%;
                                max-width: 100%;
                                padding-right: calc(var(--bs-gutter-x) * .5);
                                padding-left: calc(var(--bs-gutter-x) * .5);
                                margin-top: var(--bs-gutter-y);
                            }

                            #countdownButton:hover {
                                background-color: #3ba788 !important;
                            }
                        </style>
                        <div class="heading">
                            <h2>
                                <?php if (!empty($shorted->meta_title)): ?>
                                <?php echo $shorted->meta_title; ?>
                                <?php else: ?>
                                <?php echo 'You are about to be redirected to another page.'; ?>
                                <?php endif ?>
                            </h2>
                        </div>
                        <p class="description">
                            <?php if (!empty($shorted->meta_description)): ?>
                            <?php echo $shorted->meta_description; ?>
                            <?php endif ?>
                        </p>
                        <br>
                        <div class="row">
                            <div class="col-sm-6">
                                <a id="countdownButton" onclick="return false;"
                                    style="display:block; background-color: #45C48E; color: #fff;"
                                    href="{{$shorted->url}}" class="btn btn-secondary btn-block redirect"
                                    rel="nofollow"><?php echo 'Redirect me'; ?></a>
                            </div>
                            <div class="col-sm-6">
                                <a href="https://www.thejat.in" class="btn btn-primary btn-block" style="display:block;"
                                    rel="nofollow"><?php echo 'Take me to your homepage'; ?></a></a>
                            </div>
                        </div>
                        <div>
                            <hr style="border-top: 1px solid black;">
                            <p class="disclaimer">
                                You are about to be redirected to another page. We are not responsible for the content
                                of that page or the consequences it may have on you.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- </div> --}}

        {{-- <div class="col-lg-4 col-md-12 col-sm-12 primary-sidebar sticky-sidebar">
                <div class="widget-area pl-30">
                    {!! dynamic_sidebar('primary_sidebar') !!}
                </div>
            </div> --}}
        {{-- </div> --}}

        {{-- @if (theme_option('recently_viewed_posts_enable', 'yes') == 'yes')
            <div class="row recently-viewed-posts">
                <div class="col-md-12">
                    [recently-viewed-posts title="{{ __('Recently Viewed Posts') }}"
                    subtitle="{{ __('Your currently viewed posts.') }}"][/recently-viewed-posts]
                </div>
            </div>
        @endif --}}
    </div>
</div>

<script>
    // Function to start the countdown
    function startCountdown() {
        var countdownValue = 10; // Initial countdown value in seconds
        var countdownButton = document.getElementById('countdownButton');

        countdownButton.textContent = countdownValue + " seconds";

        var countdownInterval = setInterval(function() {
            countdownValue--;

            if (countdownValue >= 0) {
                countdownButton.textContent = countdownValue + " seconds";
            } else {
                clearInterval(countdownInterval);
                countdownButton.textContent = 'Go Now';
                countdownButton.onclick = null; // Remove the onclick event to enable the link
                // Redirect to the shortened link
                window.location.href = countdownButton.href; // Replace with your actual shortened link

            }
        }, 1000);
    }

    // Start the countdown automatically when the page loads
    window.addEventListener('load', startCountdown);
</script>
