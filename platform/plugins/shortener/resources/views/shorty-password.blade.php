<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Enter your password to unlock this link - Premium URL Shortener Demo</title>
    <meta name="description" content="The access to this link is restricted. Please enter your password to view it.">
    <meta name="keywords" content="url, shortener, awesome, the best shortener, amazing">
    <meta property="og:locale" content="en_US">
    <meta property="og:type" content="website">
    {{-- <meta property="og:url" content="https://demo.gempixel.com/short/TAqCC"> --}}
    <meta property="og:title" content="Enter your password to unlock this link - Premium URL Shortener Demo">
    <meta property="og:description"
        content="The access to this link is restricted. Please enter your password to view it.">
    <meta property="og:site_name" content="Enter your password to unlock this link - Premium URL Shortener Demo">
    {{-- <meta name="twitter:card" content="summary_large_image"> --}}
    {{-- <meta name="twitter:site" content="@http://www.twitter.com/kbrmedia"> --}}
    {{-- <meta name="twitter:title" content="Enter your password to unlock this link - Premium URL Shortener Demo">
    <meta name="twitter:description"
        content="The access to this link is restricted. Please enter your password to view it."> --}}
    {{-- <meta name="twitter:creator" content="@http://www.twitter.com/kbrmedia">
    <meta name="twitter:domain" content="https://demo.gempixel.com/short"> --}}
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script type="text/javascript" async=""
        src="https://www.googletagmanager.com/gtag/js?id=G-2SN78NB32S&amp;l=dataLayer&amp;cx=c"></script>
    <script type="text/javascript" async=""
        src="https://www.googletagmanager.com/gtag/js?id=UA-37726302-3&amp;l=dataLayer&amp;cx=c"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    {{-- <script src="/cdn-cgi/apps/head/LEIgX-ZAENnAobbLWqiPNFedyOE.js"></script> --}}
    <script src="https://www.googletagmanager.com/gtag/js?id=UA-37726302-1"></script>
    <link rel="icon" type="image/png" href="https://demo.gempixel.com/short/content/logo.square.png" sizes="32x32">
    {{-- <link rel="canonical" href="https://demo.gempixel.com/short/TAqCC"> --}}
    <link rel="stylesheet" type="text/css" href="https://demo.gempixel.com/short/static/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
        href="https://demo.gempixel.com/short/static/frontend/libs/fontawesome/all.min.css">
    <link rel="stylesheet" href="https://demo.gempixel.com/short/static/style.min.css" id="stylesheet">
    {{-- <script>
        var appurl = 'https://demo.gempixel.com/short/';
    </script> --}}
    {{-- <meta http-equiv="origin-trial"
        content="AymqwRC7u88Y4JPvfIF2F37QKylC04248hLCdJAsh8xgOfe/dVJPV3XS3wLFca1ZMVOtnBfVjaCMTVudWM//5g4AAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1RoaXJkUGFydHkiOnRydWV9"> --}}
</head>

<body>
    <section class="bg-primary py-4 py-sm-0">
        <div class="container-fluid d-flex flex-column">
            <div class="row align-items-center min-vh-100">
                <div class="col-md-6 col-lg-5 col-xl-4 mx-auto">
                    <div class="card shadow-sm border-0 mb-0">
                        <div class="card-body py-5 px-sm-5">
                            <div>
                                <div class="mb-5 text-center">
                                    <h6 class="h3 mb-2">Enter Password</h6>
                                    <p>The access to this URL is restricted. Please enter your password to view it.</p>
                                </div>
                                <span class="clearfix"></span>
                                <form method="post" action="{{ route('check.password', ['id' => $link]) }}">
                                    @csrf
                                    {{-- <input type="hidden" name="_token"
                                        > --}}
                                    <div class="my-4">
                                        <div class="form-floating">
                                            <input type="password" class="form-control" name="password" id="input-pass"
                                                placeholder="Please enter a valid password.">
                                            <label>Password</label>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <button type="submit" class="btn btn-block btn-primary">Unlock</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    {{-- <script src="https://demo.gempixel.com/short/static/webpack.pack.js"></script>
    <div id="demo-modal"
        class="position-fixed bottom-0 start-0 ms-2 mb-5 card bg-success text-white shadow p-3 fw-bolder"
        style="width:100%;max-width:300px;z-index:999999">Welcome to Premium URL Shortener Demo. The demo will reset
        every 15 mins. <p class="mt-3 mb-0"><a href="https://gemp.me/buy" class="btn btn-light text-dark"
                style="color:#000 !important">Buy Now</a> <a href="#close" onclick="$('#demo-modal').fadeOut()"
                class="btn btn-xs" style="color:#fff !important">close</a></p>
    </div>
    <script src="https://demo.gempixel.com/short/static/frontend/libs/blockadblock/blockadblock.min.js"></script>
    <script type="text/javascript">
        var detect = {
            "on": "Adblock Detected",
            "detail": "Please disable Adblock and refresh the page again."
        }
    </script>
    <script src="https://demo.gempixel.com/short/static/detect.app.js"></script>
    <script type="text/javascript">
        var lang = {
            "error": "Please enter a valid URL.",
            "couponinvalid": "The coupon enter is not valid",
            "minurl": "You must select at least 1 url.",
            "minsearch": "Keyword must be more than 3 characters!",
            "nodata": "No data is available for this request.",
            "datepicker": {
                "7d": "Last 7 Days",
                "3d": "Last 30 Days",
                "tm": "This Month",
                "lm": "Last Month"
            },
            "cookie": {
                "title": "Cookie Preferences",
                "description": "This website uses essential cookies to ensure its proper operation and tracking cookies to understand how you interact with it. You have the option to choose which one to allow.",
                "button": " <button type=\"button\" data-cc=\"c-settings\" class=\"cc-link\" aria-haspopup=\"dialog\">Let me choose<\/button>",
                "accept_all": "Accept All",
                "accept_necessary": "Accept Necessary",
                "close": "Close",
                "save": "Save Settings",
                "necessary": {
                    "title": "Strictly Necessary Cookies",
                    "description": "These cookies are required for the correct functioning of our service and without these cookies you will not be able to use our product."
                },
                "analytics": {
                    "title": "Targeting and Analytics",
                    "description": "Providers such as Google use these cookies to measure and provide us with analytics on how you interact with our website. All of the data is anonymized and cannot be used to identify you."
                },
                "ads": {
                    "title": "Advertisement",
                    "description": "These cookies are set by our advertisers so they can provide you with relevant ads."
                },
                "extra": {
                    "title": "Additional Functionality",
                    "description": "We use various providers to enhance our products and they may or may not set cookies. Enhancement can include Content Delivery Networks, Google Fonts, etc"
                },
                "privacy": {
                    "title": "Privacy Policy",
                    "description": "You can view our privacy policy <a target=\"_blank\" class=\"cc-link\" href=\"https:\/\/demo.gempixel.com\/short\/page\/privacy\">here<\/a>. If you have any questions, please do not hesitate to <a href=\"https:\/\/demo.gempixel.com\/short\/contact\" target=\"_blank\" class=\"cc-link\">Contact us<\/a>"
                }
            }
        }
    </script>
    <script src="https://demo.gempixel.com/short/static/app.min.js"></script>
    <script src="https://demo.gempixel.com/short/static/custom.min.js"></script>
    <script src="https://demo.gempixel.com/short/static/server.min.js?v=1.2"></script>
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-37726302-3"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());
        gtag('config', 'UA-37726302-3');
    </script>
 --}}

</body>
<style>
    @import '../content/variables.css';

    @font-face {
        font-family: 'Nunito Sans';
        font-style: normal;
        font-weight: 400;
        src: url(frontend/fonts/nunito-sans-v12-latin-regular.eot);
        src: local(''), url(frontend/fonts/nunito-sans-v12-latin-regular.eot?#iefix) format('embedded-opentype'), url(frontend/fonts/nunito-sans-v12-latin-regular.woff2) format('woff2'), url(frontend/fonts/nunito-sans-v12-latin-regular.woff) format('woff'), url(frontend/fonts/nunito-sans-v12-latin-regular.ttf) format('truetype'), url(frontend/fonts/nunito-sans-v12-latin-regular.svg#NunitoSans) format('svg')
    }

    @font-face {
        font-family: 'Nunito Sans';
        font-style: italic;
        font-weight: 400;
        src: url(frontend/fonts/nunito-sans-v12-latin-italic.eot);
        src: local(''), url(frontend/fonts/nunito-sans-v12-latin-italic.eot?#iefix) format('embedded-opentype'), url(frontend/fonts/nunito-sans-v12-latin-italic.woff2) format('woff2'), url(frontend/fonts/nunito-sans-v12-latin-italic.woff) format('woff'), url(frontend/fonts/nunito-sans-v12-latin-italic.ttf) format('truetype'), url(frontend/fonts/nunito-sans-v12-latin-italic.svg#NunitoSans) format('svg')
    }

    @font-face {
        font-family: 'Nunito Sans';
        font-style: normal;
        font-weight: 600;
        src: url(frontend/fonts/nunito-sans-v12-latin-600.eot);
        src: local(''), url(frontend/fonts/nunito-sans-v12-latin-600.eot?#iefix) format('embedded-opentype'), url(frontend/fonts/nunito-sans-v12-latin-600.woff2) format('woff2'), url(frontend/fonts/nunito-sans-v12-latin-600.woff) format('woff'), url(frontend/fonts/nunito-sans-v12-latin-600.ttf) format('truetype'), url(frontend/fonts/nunito-sans-v12-latin-600.svg#NunitoSans) format('svg')
    }

    @font-face {
        font-family: 'Nunito Sans';
        font-style: normal;
        font-weight: 700;
        src: url(frontend/fonts/nunito-sans-v12-latin-700.eot);
        src: local(''), url(frontend/fonts/nunito-sans-v12-latin-700.eot?#iefix) format('embedded-opentype'), url(frontend/fonts/nunito-sans-v12-latin-700.woff2) format('woff2'), url(frontend/fonts/nunito-sans-v12-latin-700.woff) format('woff'), url(frontend/fonts/nunito-sans-v12-latin-700.ttf) format('truetype'), url(frontend/fonts/nunito-sans-v12-latin-700.svg#NunitoSans) format('svg')
    }

    @font-face {
        font-family: 'Nunito Sans';
        font-style: normal;
        font-weight: 800;
        src: url(frontend/fonts/nunito-sans-v12-latin-800.eot);
        src: local(''), url(frontend/fonts/nunito-sans-v12-latin-800.eot?#iefix) format('embedded-opentype'), url(frontend/fonts/nunito-sans-v12-latin-800.woff2) format('woff2'), url(frontend/fonts/nunito-sans-v12-latin-800.woff) format('woff'), url(frontend/fonts/nunito-sans-v12-latin-800.ttf) format('truetype'), url(frontend/fonts/nunito-sans-v12-latin-800.svg#NunitoSans) format('svg')
    }

    html[data-theme=dark]:root {
        --body: #0f172a;
        --body-color: #ffffff;
        --hamburger-color: #ffffff;
        --bg-primary: #02061a;
        --bg-secondary: #3b424d;
        --bs-primary-rgb: 2, 6, 26;
        --bg-header: #0f172a;
        --bs-border-color: #485263
    }

    html[data-theme=dark2]:root {
        --body: #2a323e;
        --body-color: #ffffff;
        --hamburger-color: #ffffff;
        --bg-primary: #485263;
        --bg-secondary: #3b424d;
        --bs-primary-rgb: 34, 43, 51;
        --bg-header: #2a323e;
        --bs-border-color: #485263
    }

    ::-webkit-scrollbar {
        width: 10px
    }

    ::-webkit-scrollbar-track {
        background: var(--bg-primary)
    }

    ::-webkit-scrollbar-thumb {
        background: var(--scrollbar-color);
        border-radius: 0
    }

    ::selection {
        background-color: var(--bs-primary);
        color: #fff
    }

    .btn-light {
        --bs-btn-color: var(--body-color);
        --bs-btn-hover-color: var(--body-color);
        --bs-btn-active-color: var(--body-color);
        --bs-btn-disabled-color: var(--body-color)
    }

    .btn-primary {
        --bs-btn-color: #fff;
        --bs-btn-bg: var(--bs-primary);
        --bs-btn-border-color: var(--bs-primary);
        --bs-btn-hover-color: #fff;
        --bs-btn-hover-bg: var(--bs-primary-alt);
        --bs-btn-hover-border-color: var(--bs-primary-alt);
        --bs-btn-focus-shadow-rgb: 249, 158, 141;
        --bs-btn-active-color: #fff;
        --bs-btn-active-bg: var(--bs-primary-alt);
        --bs-btn-active-border-color: var(--bs-primary-alt);
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #fff;
        --bs-btn-disabled-bg: var(--bs-primary);
        --bs-btn-disabled-border-color: var(--bs-primary)
    }

    .btn-outline-primary {
        --bs-btn-color: var(--bs-primary);
        --bs-btn-border-color: var(--bs-primary);
        --bs-btn-hover-color: #fff;
        --bs-btn-hover-bg: var(--bs-primary);
        --bs-btn-hover-border-color: var(--bs-primary);
        --bs-btn-focus-shadow-rgb: 248, 141, 121;
        --bs-btn-active-color: #fff;
        --bs-btn-active-bg: var(--bs-primary);
        --bs-btn-active-border-color: var(--bs-primary);
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: var(--bs-primary);
        --bs-btn-disabled-bg: transparent;
        --bs-btn-disabled-border-color: var(--bs-primary);
        --bs-gradient: none
    }

    .btn-outline-light:hover {
        color: var(--body-color)
    }

    .btn-icon {
        width: 50px;
        height: 50px;
        padding: 9px
    }

    .btn-icon img,
    .btn-icon svg {
        height: 30px;
        width: 30px
    }

    .bg-primary-alt {
        background-color: var(--bs-primary-alt);
        color: #fff
    }

    .dropdown-menu {
        --bs-dropdown-link-active-bg: var(--bs-primary)
    }

    .dropdown-menu.show {
        animation: slidebottom .2s linear
    }

    body {
        background-color: var(--body);
        color: var(--body-color);
        font-family: 'Nunito Sans', sans-serif;
        font-size: 15px;
        font-weight: 400;
        line-height: 1.7;
        margin: 0;
        text-align: left
    }

    body.fixed {
        padding-top: 120px
    }

    a {
        text-decoration: none;
        color: var(--bs-primary)
    }

    a:hover {
        text-decoration: none;
        color: var(--bs-primary-alt)
    }

    .progress {
        --bs-progress-bar-bg: var(--bs-primary)
    }

    .table tr {
        border-color: #ecdfde
    }

    .table tr.border-0,
    .table tr:first-child,
    .table tr:last-child {
        border-color: transparent !important
    }

    .py-8 {
        padding-top: 8rem;
        padding-bottom: 8rem
    }

    .py-10 {
        padding-top: 10rem;
        padding-bottom: 10rem
    }

    .py-15 {
        padding-top: 15rem;
        padding-bottom: 15rem
    }

    .mt-8 {
        margin-top: 8rem
    }

    .mt-10 {
        margin-top: 10rem
    }

    @media screen and (max-width:769px) {
        .py-8 {
            padding-top: 4rem;
            padding-bottom: 4rem
        }

        .py-10 {
            padding-top: 5rem;
            padding-bottom: 5rem
        }

        .py-15 {
            padding-top: 8rem;
            padding-bottom: 8rem
        }

        .mt-8 {
            margin-top: 3rem
        }

        .mt-10 {
            margin-top: 4rem
        }
    }

    .zindex-0 {
        z-index: 0
    }

    .zindex-1 {
        z-index: 1
    }

    .zindex-100 {
        z-index: 100
    }

    .zindex-top {
        z-index: 99999999
    }

    .text-primary {
        color: var(--bs-primary) !important
    }

    .gradient-primary {
        background: var(--bs-primary);
        background: -moz-linear-gradient(135deg, var(--bs-primary) 0, var(--bs-secondary) 100%);
        background: -webkit-linear-gradient(135deg, var(--bs-primary) 0, var(--bs-secondary) 100%);
        background: linear-gradient(135deg, var(--bs-primary) 0, var(--bs-secondary) 100%)
    }

    .gradient-primary-reverse {
        background: var(--bs-primary);
        background: -moz-linear-gradient(180deg, var(--bs-primary) 0, var(--bs-secondary) 100%);
        background: -webkit-linear-gradient(180deg, var(--bs-primary) 0, var(--bs-secondary) 100%);
        background: linear-gradient(180deg, var(--bs-primary) 0, var(--bs-secondary) 100%)
    }

    .gradient-secondary {
        background: var(--bs-danger);
        background: -moz-linear-gradient(135deg, var(--bs-danger) 0, var(--bs-primary) 100%);
        background: -webkit-linear-gradient(135deg, var(--bs-danger) 0, var(--bs-primary) 100%);
        background: linear-gradient(135deg, var(--bs-danger) 0, var(--bs-primary) 100%)
    }

    .gradient-colorful {
        background: var(--bs-primary);
        background-image: linear-gradient(111deg, #60aef8, var(--bs-primary) 50%, var(--bs-secondary))
    }

    .clip-text {
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent
    }

    .avatar {
        width: 80px
    }

    .avatar-xs {
        width: 30px
    }

    .avatar-sm {
        width: 50px
    }

    .avatar-lg {
        width: 100px
    }

    .icon {
        width: 20px;
        height: 20px
    }

    .icon-sm {
        width: 32px;
        height: 32px
    }

    .icon-md {
        width: 50px;
        height: 50px
    }

    .icon-lg {
        width: 100px;
        height: 100px
    }

    .progress-sm {
        height: 10px
    }

    #main-header {
        background-color: var(--bg-header)
    }

    #main-header.affix {
        background: 0 0;
        position: fixed;
        width: 100%;
        min-height: 80px;
        z-index: 999;
        top: 0;
        padding: 0 !important
    }

    #main-header.affix .navbar {
        background: var(--bg-header);
        margin-top: 15px;
        border-radius: 10px;
        padding: 15px;
        box-shadow: 0 10px 20px rgb(0 0 0 / 10%);
        transition: all .2s linear;
        animation: slidedown .1s linear
    }

    #main-menu li {
        margin-right: 10px
    }

    #main-menu .nav-link {
        color: var(--body-color);
        font-weight: 700;
        font-size: 1rem
    }

    #main-menu .nav-link.active,
    #main-menu .nav-link:hover {
        color: var(--bs-primary)
    }

    .dropdown-item:focus,
    .dropdown-item:hover {
        border-radius: .5rem
    }

    .dropdown-menu-lg {
        min-width: 390px
    }

    @media screen and (max-width:765px) {
        #main-menu li {
            margin-right: 0
        }

        .dropdown-menu-lg {
            min-width: 100%
        }
    }

    [data-notify=dismiss] {
        display: none
    }

    @media screen and (max-width:992px) {
        #main-menu {
            display: block;
            margin: 10px 0;
            padding: 0
        }

        #main-menu li a {
            display: block;
            margin: 0;
            padding: 10px 0;
            border-bottom: 1px solid #eee
        }

        #login-menu {
            display: flex;
            width: 100%;
            text-align: center !important;
            margin-top: 15px
        }

        #login-menu a {
            flex-grow: 2;
            padding-top: 12px;
            padding-bottom: 12px
        }
    }

    .animate-float {
        animation: float 3s ease-in-out infinite
    }

    .w-fixed {
        min-width: 769px
    }

    @keyframes float {
        0% {
            transform: translateY(0)
        }

        50% {
            transform: translateY(-10px)
        }

        100% {
            transform: translateY(0)
        }
    }

    @keyframes fadein {
        0% {
            opacity: 0
        }

        100% {
            opacity: 1
        }
    }

    @keyframes fadeinout {
        0% {
            opacity: 0
        }

        50% {
            opacity: 1
        }

        100% {
            opacity: 0
        }
    }

    @keyframes slidedown {
        0% {
            transform: translateY(-120px)
        }

        100% {
            transform: translateY(0)
        }
    }

    @keyframes slidebottom {
        0% {
            transform: translateY(50px);
            opacity: 0
        }

        100% {
            transform: translateY(0);
            opacity: 1
        }
    }

    .select2-p2 .select2-container--default .select2-selection--single {
        padding: .375rem
    }

    html[data-theme=dark] ::-webkit-scrollbar-track {
        background: #515b6e
    }

    html[data-theme=dark] #main-menu .nav-link {
        border-color: #141d31
    }

    html[data-theme=dark] .dropdown-menu {
        --bs-dropdown-bg: #141d31
    }

    html[data-theme=dark] .dropdown-item {
        color: #fff
    }

    html[data-theme=dark] .dropdown-item:focus,
    html[data-theme=dark] .dropdown-item:hover {
        background-color: #485263
    }

    html[data-theme=dark] .card {
        --bs-card-bg: #1e293b
    }

    html[data-theme=dark] .text-muted {
        color: #b1b9c4 !important
    }

    html[data-theme=dark] .text-dark {
        color: #fff !important
    }

    html[data-theme=dark] .text-light {
        color: #222b33 !important
    }

    html[data-theme=dark] .bg-white {
        background-color: #1e293b !important;
        color: #fff !important
    }

    html[data-theme=dark] .border {
        border-color: var(--bs-border-color) !important
    }

    html[data-theme=dark] .form-control {
        background-color: transparent;
        color: #fff;
        border-color: #515b6e
    }

    html[data-theme=dark] .form-select {
        background-color: #3b424d !important;
        color: #fff !important;
        border-color: #515b6e
    }

    html[data-theme=dark] .table {
        --bs-table-color: #fff
    }

    html[data-theme=dark] .table tr {
        border-color: #626b7a
    }

    .navbar-toggler:focus {
        box-shadow: none !important
    }

    .navbar-toggle-icon {
        width: 1.8rem;
        height: 1rem;
        position: relative;
        display: inline-block;
        -webkit-transform: rotate(0);
        -moz-transform: rotate(0);
        -o-transform: rotate(0);
        transform: rotate(0);
        -webkit-transition: .5s ease-in-out;
        -moz-transition: .5s ease-in-out;
        -o-transition: .5s ease-in-out;
        transition: .5s ease-in-out;
        cursor: pointer
    }

    .navbar-toggle-icon span {
        display: block;
        position: absolute;
        height: 4px;
        width: 100%;
        background: var(--hamburger-color);
        border-radius: 36px;
        opacity: 1;
        left: 0;
        -webkit-transform: rotate(0);
        -moz-transform: rotate(0);
        -o-transform: rotate(0);
        transform: rotate(0);
        -webkit-transition: .25s ease-in-out;
        -moz-transition: .25s ease-in-out;
        -o-transition: .25s ease-in-out;
        transition: .25s ease-in-out
    }

    .navbar-toggle-icon span:nth-child(1) {
        top: 0
    }

    .navbar-toggle-icon span:nth-child(2) {
        top: 8px;
        background: var(--hamburger-color);
        opacity: .5
    }

    .navbar-toggle-icon span:nth-child(3) {
        top: 8px;
        display: none
    }

    .navbar-toggle-icon span:nth-child(4) {
        top: 16px
    }

    .navbar-toggler:not(.collapsed) .navbar-toggle-icon span:nth-child(1) {
        top: 18px;
        width: 0%;
        left: 50%
    }

    .navbar-toggler:not(.collapsed) .navbar-toggle-icon span:nth-child(2) {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg)
    }

    .navbar-toggler:not(.collapsed) .navbar-toggle-icon span:nth-child(3) {
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        transform: rotate(-45deg);
        display: inline-block
    }

    .navbar-toggler:not(.collapsed) .navbar-toggle-icon span:nth-child(4) {
        top: 18px;
        width: 0%;
        left: 50%
    }

    #navbar-logo {
        width: 180px
    }

    @media screen and (max-width:992px) {
        #navbar-logo {
            width: 150px
        }
    }

    .with-shapes {
        overflow: hidden;
        position: relative
    }

    .with-shapes:before {
        position: absolute;
        content: ' ';
        width: 200px;
        height: 75px;
        right: -50px;
        top: -25px;
        opacity: .2;
        background: #fff;
        border-radius: 20px
    }

    .with-shapes:after {
        position: absolute;
        content: ' ';
        width: 200px;
        height: 200px;
        left: -50px;
        opacity: .2;
        background: #fff;
        border-radius: 100%
    }

    .lead {
        font-size: 1.15rem
    }

    .backdrop-cards {
        position: relative
    }

    .backdrop-cards:before {
        content: '';
        position: absolute;
        width: 100%;
        height: 100%;
        background: var(--bs-primary);
        z-index: -1;
        bottom: 0;
        left: -50px;
        border-radius: 10px;
        transform: rotateZ(-8deg)
    }

    [data-bs-toggle].border-bottom {
        border-bottom-style: dashed !important;
        padding-bottom: 3px
    }

    pre {
        margin-bottom: 0
    }

    .code-area {
        background: #040811;
        padding: 10px;
        border-radius: 5px;
        color: #fff
    }

    .code-area .hljs {
        background-color: transparent
    }

    .doc-sidebar {
        position: sticky;
        max-height: 100vh;
        overflow-y: auto;
        top: 0
    }

    .fixed .doc-sidebar {
        padding-top: 95px
    }

    .doc-sidebar a.active,
    .doc-sidebar a.active .text-muted {
        color: var(--bs-primary) !important
    }

    @media screen and (max-width:992px) {
        .doc-sidebar {
            position: fixed;
            height: 100%;
            overflow-y: auto;
            top: 0;
            background-color: var(--body);
            width: 80%;
            box-shadow: 0 20px 10px 10px rgb(0, 0, 0, .05);
            z-index: 998
        }
    }

    .btn-stack .btn {
        background: 0 0;
        border: 2px solid #eee;
        margin-right: 8px;
        color: #89939e
    }

    [data-theme=dark] .btn-stack .btn {
        border: 2px solid #46546b;
        color: #fff
    }

    .btn-stack .btn.active {
        background: var(--bs-primary);
        border-color: transparent;
        color: #fff
    }

    .contact-box {
        padding: 15px;
        margin: 10px;
        background: #fff;
        box-shadow: 0 5px 10px rgba(0, 0, 0, .1);
        border-radius: 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px
    }

    .contact-box .contact-label {
        font-size: 22px;
        font-weight: 700;
        color: #000
    }

    .contact-box .contact-description {
        color: #000;
        opacity: .9;
        margin: 15px 0 !important
    }

    .contact-box .form-group {
        margin-top: 20px
    }

    .contact-box .form-group .control-label {
        color: #000
    }

    .contact-box .form-group textarea {
        color: #000;
        border-color: rgba(0, 0, 0, .2);
        box-shadow: none;
        border-radius: 3px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px
    }

    .contact-box .form-group input {
        color: #000;
        border-color: rgba(0, 0, 0, .2);
        padding: 5px 8px;
        border-radius: 3px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px
    }

    .contact-box button {
        background: #000;
        color: #fff;
        border: 0;
        padding: 5px 15px;
        border-radius: 3px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px
    }

    .poll-box {
        padding: 15px;
        margin: 10px;
        background: #fff;
        box-shadow: 0 5px 10px rgba(0, 0, 0, .1);
        border-radius: 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px
    }

    .poll-box .poll-question {
        font-size: 18px;
        font-weight: 700;
        color: #000
    }

    .poll-box ol.poll-answers {
        padding: 0;
        margin: 10px 0
    }

    .poll-box ol.poll-answers>li {
        list-style: none;
        border: 0 !important;
        color: #000;
        opacity: .95;
        padding: 10px 0;
        font-size: 1.1em;
        font-weight: 700
    }

    .poll-box ol.poll-answers>li div {
        margin-right: 5px
    }

    .poll-box button {
        background: #000;
        color: #fff;
        border: 0;
        padding: 5px 15px;
        border-radius: 3px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px
    }

    .custom-overlay {
        overflow: hidden
    }

    .custom-overlay .custom-message {
        position: relative;
        margin: 10px;
        background-color: #0067f4;
        color: #fff;
        padding: 15px 35px 15px 15px;
        max-width: 320px;
        overflow: hidden;
        box-shadow: 0 5px 10px rgba(0, 0, 0, .1);
        border-radius: 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px
    }

    .custom-overlay .custom-message .custom-label {
        position: absolute;
        background-color: #fff;
        top: 13px;
        right: -20px;
        color: #000;
        padding: 0 20px;
        font-size: 11px;
        font-weight: 700;
        width: 75px;
        height: 15px;
        -ms-transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
        transform: rotate(45deg)
    }

    .custom-overlay .custom-message p {
        margin: 0 !important
    }

    .custom-overlay .custom-message .custom-img {
        float: left;
        margin-right: 10px
    }

    .custom-overlay .custom-message .custom-img img {
        max-height: 50px;
        max-width: 50px;
        border-radius: 3px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px
    }

    .custom-overlay .custom-message .custom-text {
        display: block;
        color: #fff
    }

    .custom-overlay .custom-message .btn {
        background-color: #fff;
        font-weight: 700;
        margin-top: 5px
    }

    .custom-overlay .custom-message .btn:hover {
        color: #000
    }

    #main-overlay {
        position: relative
    }

    #main-overlay #site {
        position: absolute;
        z-index: 0
    }

    #main-overlay .clickable {
        cursor: pointer
    }

    #main-overlay .custom-message.custom-bg {
        background-size: cover
    }

    #main-overlay .custom-message {
        z-index: 99999;
        bottom: -500px;
        position: fixed;
        margin: 10px;
        background-color: #0067f4;
        color: #fff;
        padding: 15px 35px 15px 15px;
        max-width: 320px;
        width: 100%;
        overflow: hidden;
        box-shadow: 0 10px 20px rgba(0, 0, 0, .2);
        border-radius: 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px
    }

    #main-overlay .custom-message.tl {
        top: 0;
        left: 0;
        bottom: auto;
        transform: translatey(10px);
        animation: showdown 1s ease-in
    }

    #main-overlay .custom-message.tr {
        top: 0;
        right: 0;
        bottom: auto;
        transform: translatey(10px);
        animation: showdown 1s ease-in
    }

    #main-overlay .custom-message.br {
        bottom: 0;
        right: 0;
        transform: translatey(-10px);
        animation: showup 1s ease-in
    }

    #main-overlay .custom-message.bl {
        bottom: 0;
        left: 0;
        transform: translatey(-10px);
        animation: showup 1s ease-in
    }

    #main-overlay .custom-message.bc {
        bottom: 0;
        left: 38%;
        transform: translatey(-10px);
        animation: showup 1s ease-in
    }

    #main-overlay .custom-message .custom-label {
        position: absolute;
        background-color: #fff;
        top: 13px;
        right: -20px;
        color: #000;
        padding: 0 20px;
        font-size: 11px;
        font-weight: 700;
        width: 75px;
        height: 15px;
        -ms-transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
        transform: rotate(45deg)
    }

    #main-overlay .custom-message a.remove {
        color: #fff;
        position: absolute;
        bottom: 0;
        right: 3px
    }

    #main-overlay .custom-message p {
        margin: 0 !important
    }

    #main-overlay .custom-message .custom-img {
        float: left;
        margin-right: 10px
    }

    #main-overlay .custom-message .custom-img img {
        max-height: 50px;
        max-width: 50px;
        border-radius: 3px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px
    }

    #main-overlay .custom-message .custom-text {
        display: block;
        color: #fff
    }

    #main-overlay .custom-message .btn {
        background-color: #fff;
        font-weight: 700;
        margin-top: 5px
    }

    #main-overlay .custom-message .btn:hover {
        color: #000
    }

    #main-overlay .contact-overlay {
        position: fixed;
        z-index: 9999;
        min-width: 100px
    }

    #main-overlay .contact-overlay.br {
        bottom: 10px;
        right: 15px;
        transform: translatey(-10px);
        animation: showup 1s ease-in
    }

    #main-overlay .contact-overlay.bl {
        bottom: 10px;
        left: 10px;
        transform: translatey(-10px);
        animation: showup 1s ease-in
    }

    #main-overlay .contact-event {
        background: #fff;
        color: #000;
        padding: 8px;
        width: auto;
        display: block;
        box-shadow: 0 10px 15px rgba(0, 0, 0, .1);
        border-radius: 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        font-weight: 700;
        text-decoration: none
    }

    #main-overlay .contact-event i {
        background: #000;
        color: #fff;
        padding: 5px 6px;
        border-radius: 20px;
        margin-right: 5px
    }

    #main-overlay .contact-event i.success {
        background: #82e26f !important
    }

    #main-overlay .contact-box {
        width: 320px;
        position: relative
    }

    #main-overlay .contact-box a.contact-close {
        position: absolute;
        right: 6px;
        top: 6px;
        color: #000;
        opacity: .4
    }

    #main-overlay .contact-box a.contact-close:hover {
        opacity: .6
    }

    #main-overlay .poll-overlay {
        position: fixed;
        z-index: 9999
    }

    #main-overlay .poll-overlay.br {
        bottom: 10px;
        right: 15px;
        transform: translatey(-10px);
        animation: showup 1s ease-in
    }

    #main-overlay .poll-overlay.bl {
        bottom: 10px;
        left: 10px;
        transform: translatey(-10px);
        animation: showup 1s ease-in
    }

    #main-overlay .poll-overlay .poll-box {
        width: 320px;
        position: relative
    }

    @keyframes showdown {
        0% {
            transform: translatey(-300px)
        }

        100% {
            transform: translatey(10px)
        }
    }

    @keyframes showup {
        0% {
            transform: translatey(300px)
        }

        100% {
            transform: translatey(-10px)
        }
    }

    .checkmark {
        width: 18px;
        height: 19px;
        display: inline-block;
        font-size: 12px;
        vertical-align: middle;
        box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
    }

    @media screen and (max-width: 769px) {
        .position-sm-relative {
            position: relative !important;
        }
    }

    [dir=rtl] .backdrop-cards:before {
        left: 0;
        right: -50px;
    }

    html[data-theme=dark] .modal-content {
        background: #1e293b;
    }
</style>

</html>
