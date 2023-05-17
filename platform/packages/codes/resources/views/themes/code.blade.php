{{-- <div class="container">
    <h3 class="page-intro__title">{{ $code->name }}</h3>
    {!! Theme::breadcrumb()->render() !!}
</div> --}}
    @php
    // dd(BaseHelper::isHomepage($code->id));
    // dd($code);
      $ShowLeftBar = $code->parent_id !== 0 ? true: false;
    @endphp
<div>
    @if(BaseHelper::isHomepage($code->id))

    {{-- In case of home code page  --}}

    <div class="container">
        <div @class(['row' => $ShowLeftBar])>
            <div @class(['col-lg-8' => $ShowLeftBar])>
                {!! apply_filters(CODE_FILTER_FRONT_CODE_CONTENT, BaseHelper::clean($code->content), $code) !!}
            </div>

            {{-- testing starts --}}
            <style>
              .category-list {
                  counter-reset: category;
                }
                .sidebar .sidebar-content .category-list-item {
                    margin: 20px 0;
                  }
                  .sidebar .sidebar-content .category-list-item {
                    margin: 20px 0;
                  }
                  .category-list .category-list-item .post-list-category-title {
                    cursor: pointer;
                  }
                  .category-list .category-list-item h6 {
                      font-family: Open Sans,Helvetica,Arial,sans-serif!important;
                      font-size: 16px;
                      font-weight: 700;
                  }
                  .category-list .category-list-item .post-list-category-posts {
                      padding-left: 28px;
                  }
                  
                  .category-list .category-list-item h6:before {
                      counter-increment: category;
                      content: counter(category) ". ";
                      color: #9884fc;
                      font-weight: 700;
                      margin-right: 10px;
                  }
                  .category-list .category-list-item h6 i {
                      color: #9884fc;
                  }
                  .category-list .category-list-item .post-list-category-posts a {
                    font-size: 14px;
                    font-weight: 400;
                    color: #29303b;
                    padding: 4px 15px;
                    display: block;
                    border-left: 6px solid transparent;
                    margin: 1px 0;
                    text-decoration: none;
                  }
                  
                  .category-list .category-list-item .post-list-category-posts a:active, .category-list .category-list-item .post-list-category-posts a:focus, .category-list .category-list-item .post-list-category-posts a:hover {
                      border-color: #9884fc;
                  }
                  .category-list .category-list-item .post-list-category-posts a.active {
                    font-weight: 800;
                    border-color: #9884fc;
                  }
                  .the-active-in-list {
                    font-weight: 800!important;
                    border-color: #9884fc;
                  }
            </style>

            
                  @if($code->parent_id !== 0)
                  <div class="col-md-4 sidebar p-0">
                    <div class="sidebar-content" style="position: sticky; padding: 50px 25px; top: 2rem;">
                        <div class="d-none d-md-block">
                          <div class="category-list py-5">
                            <div class="category-list-item">
                              @php
                                  $childFromParent = get_child_from_parent($code->parent_id);
                                  $parent = get_code_by_id($code->parent_id);
                                  //dd($parent);
                                  //$childFromParent as $childs;
                                  // dd($childFromParent);
                                  // ddd($childFromParent);
                                  // the above function will take the id of the page and return all its child.
                              
         
                              @endphp



                              <div id="heading-bootstrap" data-toggle="collapse" data-target="#collapse-bootstrap" aria-expanded="false" aria-controls="collapse-bootstrap" class="post-list-category-title">
                                <h6>{{ $parent[0]->name}} <i class="fas fa-angle-down"></i></h6>
                              </div>
                              {{-- @if($loop->index == 0)
                                @continue
                                @endif --}}
                                
                                <div id="collapse-bootstrap" aria-labelledby="heading-bootstrap" class="collapse post-list-category-posts ">
                                  @foreach ($childFromParent as $childs)

                                  @php
                                  // dd($childs->url);
                                  @endphp
                                  <a class="{{ $childs->id ===  $code->id ? 'the-active-in-list' : ''  }}" href="{{ $childs->url }}">
                                    <div class="post-link">{{$childs->name}}</div>
                                  </a>
                                  @endforeach
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      
                      @endif


                  </div>
                          
            {{-- testing end --}}

        </div>
    </div>
    
    @else
    {{-- for rest of code pages --}}
    <div class="container">
        <div class="row">
            {{-- <div class="col">
                One of three columns
              </div> --}}
            <div @class(['col-lg-8' => $ShowLeftBar])>
                {{-- <div class="row"> --}}
                    {{-- <div class="col-12"> --}}
                        <!-- Tab content -->
                        {{-- <div class="tab-content" id="nav-tabContent"> --}}
                            {{-- @foreach($code as $item) --}}
                                {{-- <div class="tab-pane fade show @if($loop->index == 0) active @endif"
                                    id="nav-category-tab-{{ $item['category']->id }}" role="tabpanel"
                                    aria-labelledby="nav-{{ $item['category']->id }}-tab"> --}}
                                    @php
                                        $childs = get_child_from_parent($code->id)
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
                        {{-- </div> --}}
                        <!-- End Tab content-->
                    {{-- </div> --}}
                {{-- </div> --}}
            </div>
            
        </div>



    </div>

    @endif
</div>
