{{-- <div class="container">
    <h3 class="page-intro__title">{{ $course->name }}</h3>
    {!! Theme::breadcrumb()->render() !!}
</div> --}}

{{-- <div>
    {!! apply_filters(COURSE_FILTER_FRONT_COURSE_CONTENT, Html::tag('div', BaseHelper::clean($course->content), ['class' => 'ck-content'])->toHtml(), $course) !!}
</div> --}}
{{-- @php Theme::layout('no-breadcrumbs') @endphp --}}
<style>
    :root {
        --blueAction-46: #436ebd;
        --foregroundAction: var(--blueAction-46);
        --redBrand-46: #c4433a;
        --foregroundAccent: var(--redBrand-46);
        --grey-11: #e9e6e4;
        --borderPrimary: var(--grey-11);
    }

    .page_contains_header .page__inner {
        padding: 0;
    }

    .page_sidebar-animation-on .page__inner {
        transition: margin-top .2s;
    }

    .page__inner {
        padding: 0 16px;
    }

    @media (min-width: 1220px) .main {
        line-height: 24px;
        font-size: 16px;
    }

    @media (min-width: 1170px) .main {
        line-height: 20px;
        font-size: 16px;
    }

    @media (min-width: 1120px) .main {
        line-height: 20px;
    }

    .main {
        margin: auto;
        padding: 0 0 35px;
    }

    .main:before,
    .main__header:before {
        content: "";
        display: table;
    }

    .content:before {
        content: "";
        display: table;
    }

    @media (min-width: 1220px) .frontpage-content {
        line-height: 20px;
    }

    .frontpage-content {
        background: var(--backgroundBase);
        outline: none;
    }

    .frontpage-content .tabs,
    .frontpage-content .tabs__menu {
        background: var(--backgroundBase);
    }

    .frontpage-content .tabs__menu.sticky {
        background: var(--backgroundBase);
    }

    .frontpage-content .tabs__menu {
        position: -webkit-sticky;
        position: sticky;
        top: 0;
        z-index: 1;
        box-sizing: border-box;
    }

    .frontpage-content .tabs__menu-inner {
        overflow-x: hidden;
        position: relative;
    }

    .frontpage-content .tabs__menu-inner-scroll {
        -webkit-flex-flow: row nowrap;
        -ms-flex-flow: row nowrap;
        flex-flow: row nowrap;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        gap: 24px;
        overflow-x: auto;
    }

    .frontpage-content .tabs__menu-button.active {
        color: var(--foregroundAccent);
        border-bottom-color: var(--foregroundAccent);
    }

    .frontpage-content .tabs__menu-button {
        background: none;
        box-shadow: none;
        text-decoration: none;
        padding: 12px 8px;
        min-width: 180px;
        border: none;
        border-bottom: 2px solid transparent;
        cursor: pointer;
        font-family: SF Pro Text, sans-serif;
        font-style: normal;
        font-weight: 500;
        font-size: 16px;
        line-height: 24px;
        letter-spacing: 1px;
        text-align: left;
        display: -webkit-inline-flex;
        display: -ms-inline-flexbox;
        display: inline-flex;
        -webkit-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column;
        box-sizing: border-box;
        color: var(--foregroundDefault);
        position: relative;
        z-index: 1;
    }

    .frontpage-content .tabs__menu-button-title {
        font-weight: 400;
        font-size: 12px;
        line-height: 18px;
        text-transform: uppercase;
    }

    .frontpage-content .tabs__menu-inner:after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        border-top: 2px solid var(--borderPrimary);
    }

    .frontpage-content .tabs__menu.sticky:after {
        content: "";
        position: absolute;
        bottom: -2px;
        left: 0;
        width: 100%;
        border-top: 4px solid var(--borderPrimary);
    }

    .frontpage-content .tabs,
    .frontpage-content .tabs__menu {
        background: var(--backgroundBase);
    }

    .frontpage-content .tabs__content-inner {
        padding: 36px 0;
    }

    .frontpage-content .tabs__content-inner,
    .frontpage-content .tabs__menu-inner {
        max-width: 984px;
        margin: 0 auto;
        box-sizing: border-box;
    }

    .main h1,
    .main h2,
    .main h3,
    .main h4,
    .main h5 {
        page-break-after: avoid;
    }

    .main h2,
    .main h3,
    .main h4 {
        position: relative;
    }

    .frontpage-content__title {
        margin-bottom: 24px;
        font-size: 20px;
        line-height: 28px;
        color: var(--foregroundDefault);
    }

    .frontpage-content__description p {
        margin: 0 0 8px;
    }

    .frontpage-content__description p:last-child {
        margin-bottom: 0;
    }

    .frontpage-content__description p {
        margin: 0 0 8px;
    }

    .frontpage-content .list {
        counter-reset: a;
        padding: 0;
        margin: 0;
    }

    .frontpage-content .list__item {
        list-style: none;
        counter-increment: a;
    }

    .frontpage-content .list__title {
        position: relative;
        font-family: BlinkMacSystemFont, -apple-system, Segoe UI, Roboto, Helvetica, Arial, sans-serif;
        font-weight: 700;
        font-size: 16px;
        line-height: 24px;
        margin-bottom: 16px;
    }

    .frontpage-content .list__link {
        color: var(--foregroundDefault);
    }

    :link,
    :visited {
        text-decoration: none;
    }

    /* :link,
    :visited {
        color: var(--foregroundAction);
    } */

    .frontpage-content .list-sub {
        padding: 0;
        margin: 0;
        counter-reset: b;
        margin-bottom: 24px;
        list-style-type: none;
        -webkit-column-gap: 10px;
        column-gap: 10px;
        -webkit-columns: 3;
        columns: 3;
    }

    .frontpage-content .list-sub__item {
        counter-increment: b;
        -webkit-column-break-inside: avoid;
        -moz-column-break-inside: avoid;
        break-inside: avoid;
        margin: 0;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
    }

    .frontpage-content .list-sub__item:before {
        content: "";
    }

    .frontpage-content .list-sub__title {
        position: relative;
        padding-left: 38px;
        margin-bottom: 2px;
    }

    .frontpage-content .list-sub__title:before {
        position: absolute;
        top: 4px;
        left: 0;
        font-family: Consolas, Lucida Console, Menlo, Monaco, monospace;
        font-size: 12px;
        line-height: 16px;
        content: counter(a) "." counter(b);
    }

    .frontpage-content .list-sub__link {
        font-size: 16px;
        line-height: 23px;
    }

    .list-sub__link{
        color: var(--foregroundAction);
    }

    :link,
    :visited {
        text-decoration: none;
    }

    /* :link,
    :visited {
        color: var(--foregroundAction);
    } */

    .working-hover a:hover,
    a:active {
        color: var(--foregroundAccent);
        /* text-decoration: underline; */
    }

    .figure-container {
        border: 1px solid #d3dce6;
        border-radius: 4px;
        overflow: hidden;
    }

    .figure-img {
        height: auto;
        display: block;
        margin-left: auto;
        margin-right: auto;
        height: auto;
    }

    body {
        overflow-x:hidden!important;
    }
    @media (min-width: 768px) {
        .figure-container {
            margin: 40px 0;
        }
    }
</style>

@php
    $parentCourses = get_all_courses_by_parent_id($course->id);
    /* dd($parentCourses); */
    // Sort by order
    $parentCourses = $parentCourses->sortBy('order');
    /* dd($parentCourses); */
@endphp

<div class="page__inner">
    <main class="main main_frontpage">
        <div class="content frontpage">
            <div class="frontpage-content">
                <div class="tabs">
                    <div class="tabs__content" id="tab-1">
                        <section class="tabs__content-section">
                            <div class="tabs__content-inner">
                                <div>
                                    <h2 class="frontpage-content__title">{{ $course->name }}</h2>
                                    <figure class="figure-container">
                                        <img class="figure-img"
                                            src="{{ RvMedia::getImageUrl($course->image, 'medium', false, RvMedia::getDefaultImage()) }}"
                                            alt="pic">
                                    </figure>
                                    <div class="frontpage-content__description">
                                        {!! $course->content !!}
                                    </div>
                                    <div class="list">
                                        @foreach ($parentCourses as $parentCourse)
                                            <div class="list__item">

                                                <div class="list__title"><a class="list__link"
                                                        href="{{ get_external_link($parentCourse) }}">{{ $parentCourse->name }}</a>
                                                </div>
                                                @php
                                                    $childCourses = get_all_courses_by_parent_id($parentCourse->id);
                                                    // Sort by order
                                                    $childCourses = $childCourses->sortBy('order');
                                                @endphp
                                                <ul class="list-sub">
                                                    @foreach ($childCourses as $childCourse)
                                                        <li class="list-sub__item">
                                                            <div class="list-sub__title"><a class="list-sub__link"
                                                                    href="{{ get_external_link($childCourse) }}">{{ $childCourse->name }}</a>
                                                            </div>
                                                        </li>
                                                    @endforeach
                                                </ul>
                                            </div>
                                        @endforeach


                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>

                </div>
            </div>

        </div>
    </main>
</div>
