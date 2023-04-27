{{-- <div class="pt-50 pb-50 {{ $shortcode->background_style }}">
    <div class="container">
        <div class="sidebar-widget">
            <div class="widget-header position-relative mb-30">
                <h5 class="widget-title mb-30 text-uppercase color1 font-weight-ultra">{!! clean($shortcode->title) !!}</h5>
                <div class="letter-background">{!! clean($shortcode->subtitle) !!}</div>
            </div>

            <div class="post-carausel-2 post-module-1 row">
                @foreach (get_galleries($shortcode->limit) as $gallery)
                    <div class="col">
                        <div class="post-thumb position-relative">
                            <div class="thumb-overlay img-hover-slide border-radius-5 position-relative lazy"
                                data-bg="{{ RvMedia::getImageUrl($gallery->image, 'medium', false, RvMedia::getDefaultImage()) }}"
                                style="background-image: url({{ RvMedia::getImageUrl(theme_option('img_loading')) }})">
                                <a class="img-link" href="{{ $gallery->url }}"></a>
                                @if($loop->index == 0)
                                    <span class="top-right-icon background5"><i class="ti-heart"></i></span>
                                @endif
                                <div class="post-content-overlay">
                                    <h6 class="post-title">
                                        <a class="color-white" href="{{ $gallery->url }}">{{ $gallery->name }}</a>
                                    </h6>
                                    <div class="entry-meta meta-1 font-small color-grey mt-10 pr-5 pl-5">
                                    <span
                                        class="post-on">{{ $gallery->created_at->format(post_date_format(false)) }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</div> --}}


<style>
    :root{
        --grey-10: #f7f4f3;
        --borderImportant: var(--grey-10);
    }
    .important{
        margin: 16px 0;
        border: 3px solid var(--borderImportant);
        border-radius: 6px;
    }
    .important__header{
        margin: 0;
        padding: 24px 24px 0;
        border: none;
    }
    .important__type{
        font-weight: 700;
        font-size: 16px;
    }
    .important__content{
        margin: 12px 24px 24px;
    }
    </style>
<div class="important important_smart">
    {{-- <div class="important__header"><span class="important__type">{{ $shortcode->heading }}</span></div>
    <div class="important__content">{{ $shortcode->content }}</div> --}}

    {{-- <div class="important__header"><span class="important__type">{{ $shortcode->heading }}</span></div> --}}
    
    <div class="important__header"><span class="important__type">{{ Arr::get($attributes, 'heading') }}</span></div>
    {{-- <div class="important__content">{{ nl2br(e(Arr::get($attributes, 'content'))) }}</div> --}}
    
    {{-- below working --}}
    {{-- <div class="important__content">{!! Arr::get($attributes, 'content') !!}</div> --}}
    <div class="important__content">{!! html_entity_decode(nl2br(e(Arr::get($attributes, 'content')))) !!}</div>

    {{-- return html_entity_decode($shortCode->content); --}}
    {{-- <div class="important__content">{{ $content }}</div> --}}
</div>
