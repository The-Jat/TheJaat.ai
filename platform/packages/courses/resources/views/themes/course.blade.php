{{-- <div class="container">
    <h3 class="page-intro__title">{{ $course->name }}</h3>
    {!! Theme::breadcrumb()->render() !!}
</div> --}}
    @php
        $ShowLeftBar = $course->parent_id !== 0 ? true: false;
        $hasChild = has_child($course->id);
        //   dd($hasChild);
    @endphp
<div>
    @if(BaseHelper::isHomepage($course->id) /*|| $course->parent_id !== 0*/)
    {{-- In case of landing course page  --}}

    <div class="container">
        <div @class(['row' => $ShowLeftBar])>
            <div @class(['col-lg-8' => $ShowLeftBar])>
                {!! apply_filters(COURSE_FILTER_FRONT_COURSE_CONTENT, BaseHelper::clean($course->content), $course) !!}
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

            
                  @if($course->parent_id !== 0)
                  <div class="col-md-4 sidebar p-0">
                    <div class="sidebar-content" style="position: sticky; padding: 50px 25px; top: 2rem;">
                        <div class="d-none d-md-block">
                          <div class="category-list py-5">
                            <div class="category-list-item">
                              @php
                                  $childFromParent = get_child_from_parent($course->parent_id);
                                  $parent = get_course_by_id($course->parent_id);
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
                                  <a class="{{ $childs->id ===  $course->id ? 'the-active-in-list' : ''  }}" href="{{ $childs->url }}">
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
    
    @elseif (!BaseHelper::isHomepage($course->id) && has_child($course->id))
            {{-- In case of our pages which has child excluding homepage... --}}
        {{-- <div class="container">
            <div class="row">
                <div @class(['col-lg-8' => $ShowLeftBar])>
                                        @php
                                            $childs = get_child_from_parent($course->id)
                                            // the above function will take the id of the page and return all its child.
                                        @endphp
                                        <div class="block-tab-item post-module-2 post-module-1">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        @foreach ($childs as $post)
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
                </div>
                
            </div>



        </div> --}}
    <style>
        .lessontable, .changetable {
            border-radius: 8px;
            padding: 0 11px 9px;
            box-shadow: 0 2px 12px rgba(44,85,126,.2);
            max-width: 800px;
            margin-bottom: 12px;
        }

        .lessontable-row:nth-child(odd), .changetable-row:nth-child(odd) {
           background: #f4f6fd;
        }
        .lessontable-row, .chaptertable-row, .changetable-row {
            margin: 3px 0;
            background-color: #edf0f9;
            border-radius: 6px;
            display: flex;
            align-items: center;
            transition: .1s all;
        }

        .lessontable-row-number, .chaptertable-row-number {
            background-color: #6daaf3;
            color: #fff;
            font-size: 1.1em;
            font-weight: 400;
            border-radius: 4px;
            padding: 0;
            margin: 3px 10px 3px 4px;
            width: 46px;
            min-width: 46px;
            text-align: center;
            line-height: 20px;
        }
        .lessontable-row-title a, .chaptertable-row-title {
            font-size: 1.2em;
            color: #3990d8;
            text-decoration-style: none;
        }

    </style>

    @php
        $childs = get_child_from_parent_course($course->id);
        // the above function will take the id of the page and return all its child.
    @endphp

    @foreach ($childs as $post)
        <div class="lessontable">
            <div class="lessontable-header">
                <a name="Chapter0"></a>
                <div class="lessontable-header-chapter">Chapter&nbsp;{{$loop->index}}</div>
                <div class="lessontable-header-title">{{$post->name}}</div>
            </div>

            @php
                $grandChilds = get_child_from_parent_course($post->id);
            @endphp
            @foreach ($grandChilds as $grandPost)
                <div class="lessontable-list">
                    <div class="lessontable-row">
                        <div class="lessontable-row-number">{{ $loop->parent->index }}.{{ $loop->iteration }}</div>
                        <div class="lessontable-row-title"><a href="{{ $grandPost->url }}">{{$grandPost->name}}</a></div>
                    </div>
                </div>
            @endforeach
        </div>
    @endforeach
        

    @else

    {{-- TODO : delete the below line later.... --}}
        {{-- {!! apply_filters(COURSE_FILTER_FRONT_COURSE_CONTENT, BaseHelper::clean($course->content), $course) !!} --}}

        {{-- testing start --}}

        <div class="container">
   
        <div class="row">
            <div class="col-sm-12 d-md-flex">
                <div class="left-bar left-bar--large-r-margin d-none d-lg-block">
                <style>
                    @media (min-width: 1140px){
                        .left-bar--large-r-margin {
                            margin-right: 80px;
                        }
                    }
                    @media (min-width: 992px){
                        .d-lg-block {
                            display: block !important;
                        }
                    }


                    .menu-with-accordion {
                        background-color: #fbfbfb;
                        border: 1px solid #d3dce6;
                        border-radius: 6px;
                    }
                    ul, ol {
                        list-style: none;
                    }
                    .menu-with-accordion .topmenu li h3 {
                        padding: 16px 24px;
                        border-bottom: 1px solid #d3dce6;
                        position: relative;
                        font-weight: 500;
                        color: #25265e;
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        cursor: pointer;
                        font-size: 16px;
                        line-height: 24px;
                        position: relative;
                    }
                    .menu-with-accordion .topmenu li h3:after {
                        content: '';
                        width: 14px;
                        height: 14px;
                        background-size: 100%;
                        transform: rotate(-90deg);
                        transition: transform .3s ease-out;
                        background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgMTg1LjM0NCAxODUuMzQ0IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAxODUuMzQ0IDE4NS4zNDQ7IiB4bWw6c3BhY2U9InByZXNlcnZlIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiI+PGc+PGc+Cgk8Zz4KCQk8cGF0aCBzdHlsZT0iZmlsbDojMjUyNjVFNjYiIGQ9Ik05Mi42NzIsMTQ0LjM3M2MtMi43NTIsMC01LjQ5My0xLjA0NC03LjU5My0zLjEzOEwzLjE0NSw1OS4zMDFjLTQuMTk0LTQuMTk5LTQuMTk0LTEwLjk5MiwwLTE1LjE4ICAgIGM0LjE5NC00LjE5OSwxMC45ODctNC4xOTksMTUuMTgsMGw3NC4zNDcsNzQuMzQxbDc0LjM0Ny03NC4zNDFjNC4xOTQtNC4xOTksMTAuOTg3LTQuMTk5LDE1LjE4LDAgICAgYzQuMTk0LDQuMTk0LDQuMTk0LDEwLjk4MSwwLDE1LjE4bC04MS45MzksODEuOTM0Qzk4LjE2NiwxNDMuMzI5LDk1LjQxOSwxNDQuMzczLDkyLjY3MiwxNDQuMzczeiIgZGF0YS1vcmlnaW5hbD0iIzAxMDAwMiIgY2xhc3M9ImFjdGl2ZS1wYXRoIiBkYXRhLW9sZF9jb2xvcj0iIzAxMDAwMiI+PC9wYXRoPgoJPC9nPgo8L2c+PC9nPiA8L3N2Zz4=);
                    }
                    .menu-with-accordion .topmenu li>ul {
                        overflow: hidden;
                        max-height: 0;
                        padding: 0;
                        transition: all .2s ease-in-out;
                    }
                </style>
                <div class="menu-with-accordion mb-10x mobile-sidebar-tab">
                <ul class="topmenu">
                    <li>
                        <h3><a href="https://programiz.pro/learn/master-cpp?utm_source=sidebar-navigation&amp;utm_campaign=programiz&amp;utm_medium=referral" style="color: #25265e;" title="C++ Programming Course">Interactive C++ Course</a></h3>
                        
                    </li>
                    <li>
                        <h3 class="">C++ Introduction</h3>

                        <ul data-visible="false" class="">
                            <li class="progress-list__single progress-list__single--done progress-list__single--active"><a href="/cpp-programming/variables-literals" title="C++ Variables and Literals" class="progress-list__single__link"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ Variables and Literals</a></li>
                            <li><a href="/cpp-programming/data-types" title="C++ Data Types"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ Data Types</a></li>
                            <li><a href="/cpp-programming/input-output" title="C++ Basic I/O"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ Basic I/O</a></li>
                            <li><a href="/cpp-programming/type-conversion" title="C++ Type Conversion"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ Type Conversion</a></li>
                            <li><a href="/cpp-programming/operators" title="C++ Operators"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ Operators</a></li>
                            <li><a href="/cpp-programming/comments" title="C++ Comments"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ Comments</a></li>
                        </ul>
                    </li>
                    <li>
                        <h3>C++ Flow Control</h3>
                        <ul data-visible="false">
                            <li><a href="/cpp-programming/if-else" title="C++ if...else"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ if...else</a></li>
                            <li><a href="/cpp-programming/for-loop" title="C++ for Loop"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ for Loop</a></li>
                            <li><a href="/cpp-programming/do-while-loop" title="C++ while and do...while Loop"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ do...while Loop</a></li>
                            <li><a href="/cpp-programming/break-statement" title="C++ break Statement"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ break</a></li>
                            <li><a href="/cpp-programming/continue-statement" title="C++ continue Statement"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ continue</a></li>
                            <li><a href="/cpp-programming/switch-case" title="C++ switch Statement"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ switch Statement</a></li>
                            <li><a href="/cpp-programming/goto" title="C++ goto Statement"><span class="progress-list__single__icon-wrap"><svg class="programiz-icon progress-list__single__icon"> <use xlink:href="/sites/all/themes/programiz/assets/feather-sprite.svg#check-small"> </use> </svg></span>C++ goto Statement</a></li>
                        </ul>
                    </li>
                </ul>
            </div>  

             </div>
        
    <div class="right-bar">
        <div class="editor-contents">
            {!! apply_filters(COURSE_FILTER_FRONT_COURSE_CONTENT, BaseHelper::clean($course->content), $course) !!}
        </div>
    </div>
        {{-- testing end --}}
    @endif
</div>
