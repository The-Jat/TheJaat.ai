<div class="col-lg-8 col-md-12 col-sm-12">
    @if(!empty($posts) && $posts->total() > 0)
        <div class="loop-list loop-list-1">
            @if($posts->first())
                <article class="first-post mb-50 animate-conner">
                    {!! Theme::partial('components.post-card-1-block', ['post' => $posts->first()]) !!}
                </article>
            @endif

            @foreach($posts->slice(1) as $post)
                <article class="row mb-50">
                    {!! Theme::partial('components.post-card-2-block', ['post' => $post]) !!}
                </article>
            @endforeach
            <div>View All</div>
        </div>


        <!--pagination-->
        {{-- <div class="pagination-area pt-30 text-center bt-1 border-color-1">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="single-wrap d-flex justify-content-center">
                            @if($posts)
                                {!! $posts->withQueryString()->links() !!}
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div> --}}
    @else
        <p class="text-center">{{ __('No posts') }}</p>
    @endif
</div>

<div class="col-lg-4 col-md-12 col-sm-12 primary-sidebar sticky-sidebar">
    <div class="widget-area pl-30">
        {!! dynamic_sidebar('primary_sidebar') !!}
    </div>
</div>
