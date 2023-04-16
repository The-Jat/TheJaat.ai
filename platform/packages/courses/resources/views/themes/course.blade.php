{{-- <div class="container">
    <h3 class="page-intro__title">{{ $course->name }}</h3>
    {!! Theme::breadcrumb()->render() !!}
</div> --}}
<div>
    @if($course->parent_id !== 0 || $course->id ===13)
    {{-- In case of landing course page  --}}
    {!! apply_filters(COURSE_FILTER_FRONT_COURSE_CONTENT, BaseHelper::clean($course->content), $course) !!}
    
    @else
    {{-- for rest of course pages --}}
    <div class="row">
        <div class="col-12">
            <!-- Tab content -->
            <div class="tab-content" id="nav-tabContent">
                {{-- @foreach($course as $item) --}}
                    {{-- <div class="tab-pane fade show @if($loop->index == 0) active @endif"
                         id="nav-category-tab-{{ $item['category']->id }}" role="tabpanel"
                         aria-labelledby="nav-{{ $item['category']->id }}-tab"> --}}
                         @php
                            $childs = get_child_from_parent($course->id)
                            // the above function will take the id of the page and return all its child.
                         @endphp
                        <div class="block-tab-item post-module-2 post-module-1">
                            <div class="row">
                                {{-- @if(!empty($item['posts'][0]))
                                    <div class="col-md-6">
                                        <div class="post-block-style">
                                            {!! Theme::partial('components.post-card-1-block', [
                                            'post' => $item['posts'][0],
                                            'categoryInImage' => true
                                            ]) !!}
                                        </div>
                                    </div>
                                @endif --}}
                                <div class="col-md-6">
                                    <div class="row">
                                        @foreach ($childs as $post)
                                            {{-- @if($loop->index == 0)
                                                @continue
                                            @endif --}}
                                            <div class="col-md-6 col-sm-6 sm-grid-content mb-30">
                                                {!! Theme::partial('components.list-view', [
                                                'post' => $post,
                                                'imageType' => 'medium'
                                                ]) !!}
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    {{-- </div> --}}
                {{-- @endforeach --}}
            </div>
            <!-- End Tab content-->
        </div>
    </div>
    @endif
</div>
