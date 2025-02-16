@php Theme::layout('no-breadcrumbs') @endphp

<style>
    :root {
        --color-primary: #3858F6;
        --color-lightest: #F0F2F5;
        --color-secondary: #D93E40;
        --color-extra01: #666666;
        --shadow-dark: 0 2px 6px 0 rgba(0, 0, 0, 0.2);
        --shadow-primary: 0px 4px 10px rgba(37, 47, 63, 0.1);
        --font-size-b3: 14px;
        --font-size-b4: 12px;
        --p-medium: 500;

        --color-white: #ffffff;

    }



    .conatainer {
        padding-right: 15px;
        padding-left: 15px;
    }



    @media (min-width: 576px) {
        .conatainer {
            max-width: 540px;
        }
    }

    @media (min-width: 768px) {
        .conatainer {
            max-width: 720px;
        }
    }

    @media (min-width: 992px) {
        .conatainer {
            max-width: 960px;
        }
    }

    @media (min-width: 1200px) {
        .conatainer {
            max-width: 1140px;
        }
    }


    @media only screen and (min-width: 1200px) {
        .conatainer {
            max-width: 1260px;
        }
    }








    .conatainer {
        --bs-gutter-x: 1.5rem;
        --bs-gutter-y: 0;
        width: 100%;
        padding-right: calc(var(--bs-gutter-x) * .5);
        padding-left: calc(var(--bs-gutter-x) * .5);
        margin-right: auto;
        margin-left: auto;
    }

    .content-block.post-list-view {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
    }

    .mt--30 {
        margin-top: 15px !important;
        margin-bottom: 15px !important;
    }

    .content-block.post-list-view .post-thumbnail {
        min-width: 295px;
        margin-right: 20px;
        max-width: 295px;
        overflow: hidden;
    }

    .content-block .post-thumbnail {
        position: relative;
    }

    .content-block.post-list-view .post-thumbnail a {
        display: block;
        height: 100%;
    }

    .content-block.post-list-view .post-thumbnail a {
        display: block;
        height: 100%;
    }

    .content-block.post-list-view .post-thumbnail a img {
        width: 100%;
        -o-object-fit: cover;
        object-fit: cover;
        height: 100%;
    }

    .content-block.post-list-view .post-thumbnail img {
        -webkit-transition: 0.5s;
        -o-transition: 0.5s;
        transition: 0.5s;
    }

    .content-block.post-list-view .post-content {
        border: 1px solid var(--color-lightest);
        padding: 32px 30px;
        -webkit-box-flex: 1;
        -webkit-flex-grow: 1;
        -ms-flex-positive: 1;
        flex-grow: 1;
    }

    .content-block.post-list-view .post-content .post-cat {
        margin-bottom: 15px;
    }

    .content-block.post-list-view .post-content .title {
        margin-bottom: 0;
    }

    .content-block.post-list-view .post-content .post-meta-wrapper {
        margin-top: 46px;
    }

    .post-meta-wrapper {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: justify;
        -webkit-justify-content: space-between;
        -ms-flex-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        -webkit-align-items: center;
        -ms-flex-align: center;
        align-items: center;
        -webkit-flex-wrap: wrap;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
    }

    .content-block.post-list-view .post-content .post-cat .post-cat-list {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
    }

    .post-content .post-cat .post-cat-list {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-wrap: wrap;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        -webkit-box-align: center;
        -webkit-align-items: center;
        -ms-flex-align: center;
        align-items: center;
        margin: -8px;
    }

    .post-content .post-cat .post-cat-list a {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        font-size: var(--font-size-b3);
        line-height: 20px;
        margin: 8px;
        position: relative;
        font-weight: var(--p-medium);
    }

    .post-content .post-cat .post-cat-list a {
        color: var(--color-secondary);
    }

    @media (min-width: 1200px) {
        .hover-flip-item-wrapper {
            opacity: 1;
            text-align: left;
        }
    }

    .hover-flip-item {
        position: relative;
        display: inline-block;
        overflow: hidden;
    }

    .hover-flip-item-wrapper {
        position: relative;
        display: inline-block;
        overflow: hidden;
        cursor: pointer;
        -webkit-transition: opacity 0.2s;
        -o-transition: opacity 0.2s;
        transition: opacity 0.2s;
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
    }

    @media (min-width: 1200px) {
        .hover-flip-item span {
            display: inline-block;
            position: relative;
            z-index: 1;
            /* color: transparent; */
            -webkit-transition: -webkit-transform 1.2s cubic-bezier(0.19, 1, 0.22, 1);
            transition: -webkit-transform 1.2s cubic-bezier(0.19, 1, 0.22, 1);
            -o-transition: -o-transform 1.2s cubic-bezier(0.19, 1, 0.22, 1);
            -o-transition: transform 1.2s cubic-bezier(0.19, 1, 0.22, 1);
            transition: transform 1.2s cubic-bezier(0.19, 1, 0.22, 1);
            transition: transform 1.2s cubic-bezier(0.19, 1, 0.22, 1), -webkit-transform 1.2s cubic-bezier(0.19, 1, 0.22, 1);
        }
    }

    .content-block .post-content .title a {
        position: relative;
        display: inline;
        background-image: -webkit-gradient(linear, left top, right top, from(currentColor), to(currentColor));
        background-image: -webkit-linear-gradient(left, currentColor 0%, currentColor 100%);
        background-image: -o-linear-gradient(left, currentColor 0%, currentColor 100%);
        background-image: linear-gradient(to right, currentColor 0%, currentColor 100%);
        background-size: 0px 2px;
        background-position: 0px 95%;
        -webkit-transition: background-size 0.25s cubic-bezier(0.785, 0.135, 0.15, 0.86) 0s;
        -o-transition: background-size 0.25s cubic-bezier(0.785, 0.135, 0.15, 0.86) 0s;
        transition: background-size 0.25s cubic-bezier(0.785, 0.135, 0.15, 0.86) 0s;
        padding: 0.1% 0px;
        background-repeat: no-repeat;
        color: inherit;
    }

    .post-meta {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -webkit-align-items: center;
        -ms-flex-align: center;
        align-items: center;
    }

    .post-meta .post-author-name {
        margin-bottom: 4px;
        font-weight: var(--p-medium);
    }

    @media (min-width: 1200px) {
        .hover-flip-item-wrapper {
            opacity: 1;
            text-align: left;
        }
    }

    ul.post-meta-list {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-wrap: wrap;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        margin: -8px;
    }

    ul.post-meta-list li {
        color: var(--color-extra01);
        font-size: var(--font-size-b4);
        line-height: 18px;
        margin: 8px;
        position: relative;
    }

    .post-content .post-cat .post-cat-list a:hover,
    .mainmenu-nav ul.mainmenu>li>a:hover,
    a.axil-link-button {
        color: var(--color-primary);
    }

    .hover-flip-item-wrapper:hover .hover-flip-item span {
        -webkit-transform: translateY(-105%);
        -ms-transform: translateY(-105%);
        transform: translateY(-105%);
    }

    @media (min-width: 1200px) {
        .hover-flip-item span:before {
            top: 0;
            -webkit-transform: skewY(0);
            -ms-transform: skewY(0);
            transform: skewY(0);
            -webkit-transform-origin: right bottom;
            -ms-transform-origin: right bottom;
            transform-origin: right bottom;
            -webkit-transition: -webkit-transform 2s cubic-bezier(0.19, 1, 0.22, 1);
            transition: -webkit-transform 2s cubic-bezier(0.19, 1, 0.22, 1);
            -o-transition: -o-transform 2s cubic-bezier(0.19, 1, 0.22, 1);
            -o-transition: transform 2s cubic-bezier(0.19, 1, 0.22, 1);
            transition: transform 2s cubic-bezier(0.19, 1, 0.22, 1);
            transition: transform 2s cubic-bezier(0.19, 1, 0.22, 1), -webkit-transform 2s cubic-bezier(0.19, 1, 0.22, 1);
        }
    }

    @media (min-width: 1200px) {

        .hover-flip-item span:after,
        .hover-flip-item span:before {
            content: attr(data-text);
            display: block;
            position: absolute;
            color: var(--color-secondary);
        }
    }

    .content-block.post-list-view:hover .post-thumbnail img {
        -webkit-transform: scale(1.1);
        -ms-transform: scale(1.1);
        transform: scale(1.1);
        -webkit-filter: grayscale(1);
        filter: grayscale(1);
    }

    .content-block.post-list-view.is-active .post-content,
    .content-block.post-list-view:hover .post-content {
        -webkit-box-shadow: var(--shadow-primary);
        box-shadow: var(--shadow-primary);
        background: var(--color-white);
        border: 1px solid var(--color-white);
    }
</style>


<div class="conatainer">
    <div class="row">
        <div class="col-lg-8 col-xl-8" style="padding-left: 15px;
        padding-right: 15px;">
            @foreach ($vaccancies as $vaccancy)
                @php
                    // dd($vaccancy);
                @endphp
                <div class="content-block post-list-view axil-control mt--30">
                    <div class="post-thumbnail">
                        <a href="post-details.html">
                            <img src="https://new.axilthemes.com/demo/template/blogar/assets/images/small-images/post-seo-list-01.jpg"
                                alt="Post Images">
                        </a>
                    </div>
                    <div class="post-content">
                        <div class="post-cat">
                            <div class="post-cat-list">
                                <a class="hover-flip-item-wrapper" href="#">
                                    <span class="hover-flip-item">
                                        <span data-text="CONTENT MARKETING">CONTENT MARKETING</span>
                                    </span>
                                </a>
                            </div>
                        </div>
                        <h4 class="title"><a href="{{ get_external_link($vaccancy) }}"
                                {{ is_external_link_vaccancy($vaccancy) ? 'target="_blank"' : '' }}">{{ $vaccancy->name }}</a>
                        </h4>
                        <div class="post-meta-wrapper">
                            <div class="post-meta">
                                <div class="content">
                                    <h6 class="post-author-name">
                                        <a class="hover-flip-item-wrapper" href="author.html">
                                            <span class="hover-flip-item">
                                                <span data-text="Kanak Lota">Kanak Lota</span>
                                            </span>
                                        </a>
                                    </h6>
                                    <ul class="post-meta-list">
                                        <li>{{ \Carbon\Carbon::parse($vaccancy->updated_at)->diffForHumans() }}</li>
                                        <li>{{ get_time_to_read_vaccancy_post($vaccancy) }} min read</li>
                                    </ul>
                                </div>
                            </div>
                            {{-- <ul class="social-share-transparent justify-content-end">
                                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fas fa-link"></i></a></li>
                            </ul> --}}
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
