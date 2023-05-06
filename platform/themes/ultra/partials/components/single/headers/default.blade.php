<div class="entry-header single-header-default entry-header-1 mb-30">
    @php $category = $post->categories->first(); @endphp
    @if ($category)
        <div class="entry-meta meta-0 font-small mb-15">
            <a href="{{ $category->url }}">
                <span class="post-cat {{ random_background() }} color-white">{{ $category->name }}</span>
            </a>
        </div>
    @endif
    <h1 class="post-title">
        <a href="{{ get_external_link($post) }}" {{ is_external_link($post) ? 'target="_blank"' : '' }}>{{ $post->name }}</a>
    </h1>

    <div class="entry-meta meta-1 font-small color-grey mt-15 mb-15">
        @if (theme_option('enable_show_post_author_detail', 'yes') == 'yes' && class_exists($post->author_type) && $post->author && $post->author->id)
            <span class="post-by">{{ __('By') }} <a href="{{ $post->author->url }}">{{ $post->author->name }}</a></span>
        @endif
        <span class="post-on has-dot">{{ $post->created_at->format(post_date_format()) }}</span>
        <span class="time-reading has-dot">{{ get_time_to_read($post) }} {{ __('mins read') }}</span>
        <span class="hit-count"><i class="ti-bolt"></i> {{ number_format($post->views) . ' ' . __('views') }}</span>
    </div>

    <div class="bt-1 border-color-1 mt-20 mb-20"></div>
    <div class="clearfix">
        <div class="entry-meta meta-1 font-small color-grey float-left mt-10">
            @if(is_plugin_active('comment'))
                <span class="hit-count"><i class="ti-comment mr-5"></i> {{ $totalComment }} {{ __('comments') }}</span>
            @endif
            @if(is_plugin_active('pro-posts'))
                <span
                    class="btn-action-favorite-post {{ getIsFavoritePost($post->id) ? 'background8 post-bookmarked' : '' }}"
                    title="{{ __('Add to favorite') }}"
                    data-post-id="{{ $post->id }}"
                    data-login-id="{{ auth()->guard('member')->check() ? auth()->guard('member')->id() : '' }}"
                    data-url="{{ route('public.favorite-post') }}">
                    <i class="ti-heart mr-5"></i>
                </span>
                <span> {{ getPostTotalFavorite($post->id) }} {{ __('likes') }}</span>
                <span
                    class="hit-count btn-action-favorite-post {{ getIsBookmarkPost($post->id) ? 'background8 post-bookmarked' : '' }}"
                    title="{{ __('Add to bookmark') }}"
                    data-type="bookmark"
                    data-post-id="{{ $post->id }}"
                    data-login-id="{{ auth()->guard('member')->check() ? auth()->guard('member')->id() : '' }}"
                    data-url="{{ route('public.bookmark-post') }}">
                    <i class="ti-bookmark mr-5"></i>
                </span>

                {{-- The elements for the exporting as pdf --}}
                <style>
                    .exportPDF:hover{

                        color: white;
                        background: linear-gradient(120deg, #fccb90 0%, #d57eeb 100%);
                    }
                </style>
                <a class="exportPDF" style="
                    padding: 10px 15px;
                    cursor: pointer;"
                    href="{{ route('export.pdf', $post->id) }}"
                    title="{{ __('Export as PDF') }}">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-file-pdf" viewBox="0 0 16 16"> <path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/> <path d="M4.603 12.087a.81.81 0 0 1-.438-.42c-.195-.388-.13-.776.08-1.102.198-.307.526-.568.897-.787a7.68 7.68 0 0 1 1.482-.645 19.701 19.701 0 0 0 1.062-2.227 7.269 7.269 0 0 1-.43-1.295c-.086-.4-.119-.796-.046-1.136.075-.354.274-.672.65-.823.192-.077.4-.12.602-.077a.7.7 0 0 1 .477.365c.088.164.12.356.127.538.007.187-.012.395-.047.614-.084.51-.27 1.134-.52 1.794a10.954 10.954 0 0 0 .98 1.686 5.753 5.753 0 0 1 1.334.05c.364.065.734.195.96.465.12.144.193.32.2.518.007.192-.047.382-.138.563a1.04 1.04 0 0 1-.354.416.856.856 0 0 1-.51.138c-.331-.014-.654-.196-.933-.417a5.716 5.716 0 0 1-.911-.95 11.642 11.642 0 0 0-1.997.406 11.311 11.311 0 0 1-1.021 1.51c-.29.35-.608.655-.926.787a.793.793 0 0 1-.58.029zm1.379-1.901c-.166.076-.32.156-.459.238-.328.194-.541.383-.647.547-.094.145-.096.25-.04.361.01.022.02.036.026.044a.27.27 0 0 0 .035-.012c.137-.056.355-.235.635-.572a8.18 8.18 0 0 0 .45-.606zm1.64-1.33a12.647 12.647 0 0 1 1.01-.193 11.666 11.666 0 0 1-.51-.858 20.741 20.741 0 0 1-.5 1.05zm2.446.45c.15.162.296.3.435.41.24.19.407.253.498.256a.107.107 0 0 0 .07-.015.307.307 0 0 0 .094-.125.436.436 0 0 0 .059-.2.095.095 0 0 0-.026-.063c-.052-.062-.2-.152-.518-.209a3.881 3.881 0 0 0-.612-.053zM8.078 5.8a6.7 6.7 0 0 0 .2-.828c.031-.188.043-.343.038-.465a.613.613 0 0 0-.032-.198.517.517 0 0 0-.145.04c-.087.035-.158.106-.196.283-.04.192-.03.469.046.822.024.111.054.227.09.346z"/> </svg>
                  <span>Export as PDF</span> 
                </a>
            @endif
        </div>
        <ul class="d-inline-block list-inline float-right single-social-share">
            {!! Theme::partial('components.social-share-post', compact('post')) !!}
        </ul>
    </div>
</div>

<div class="video-player">
    @if($videoLink)
        <div class="embed-responsive embed-responsive-16by9 mb-30">
            <iframe class="embed-responsive-item" src="{{ $videoLink }}" allowfullscreen></iframe>
        </div>
    @elseif($videoUploadId)
        @php $videoLink = RvMedia::getImageUrl($videoUploadId); @endphp
        <video id="player" playsinline controls>
            <source src="{{ $videoLink }}"
                    type="video/mp4">
            <source src="{{ $videoLink }}"
                    type="video/webm">
        </video>
    @else
        <figure class="single-thumnail">
            <div class="border-radius-5">
                <div class="slider-single text-center">
                    <img class="border-radius-10 lazy"
                         src="{{ RvMedia::getImageUrl($post->image) }}"
                         data-src="{{ RvMedia::getImageUrl($post->image, 'large', false, RvMedia::getDefaultImage()) }}"
                         src="{{ RvMedia::getImageUrl(theme_option('img_loading')) }}"
                         loading="lazy"
                         style="width: 100%;"
                         alt="{{ $post->name }}">
                </div>
            </div>
        </figure>
    @endif
</div>
