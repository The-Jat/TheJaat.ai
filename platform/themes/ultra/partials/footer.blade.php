<footer>
    <!-- Footer Start-->
    <div class="footer-area fix pt-50 background-black">
        <div class="container">
            <div class="row d-flex justify-content-between">
                {{-- <div class="col-lg-3 col-md-6 mb-lg-0 mb-30"> --}}
                <div class="col-lg-3 col-md-6 mb-lg-0 mb-30"
                    style="background-image: url(https://flow.thesky9.com/themes/flow/images/sketch-3.png); background-position: 100% 100%; background-repeat: no-repeat;">
                    {!! dynamic_sidebar('footer_sidebar_1') !!}
                </div>

                <div class="col-lg-3 col-md-6 mb-lg-0 mb-30">
                    {!! dynamic_sidebar('footer_sidebar_2') !!}
                </div>

                <div class="col-lg-3 col-md-6">
                    {!! dynamic_sidebar('footer_sidebar_3') !!}
                </div>

                {{-- <div class="col-lg-3 col-md-6"> --}}
                <div class="col-lg-3 col-md-6"
                    style="background-image: url(https://flow.thesky9.com/themes/flow/images/sketch-1.png); background-position: 100% 100%; background-repeat: no-repeat;">
                    {!! dynamic_sidebar('footer_sidebar_4') !!}
                </div>
            </div>
        </div>
    </div>
    {{-- the heart thing. --}}
    <style>
        .tagline {
            color: #aaaaaa !important;
        }

        .fa {
            color: #E90606;
            margin: 0 10px;
            font-size: 10px;
            animation: pound 0.35s infinite alternate;
            -webkit-animation: pound 0.35s infinite alternate;
        }

        @-webkit-keyframes pound {
            to {
                transform: scale(2.1);
            }
        }

        @keyframes pound {
            to {
                transform: scale(2.1);
            }
        }
    </style>
    <!-- footer-bottom aera -->
    <div class="footer-bottom-area background-black">
        <div class="container">
            <div class="footer-border pt-30 pb-30">
                <div class="row d-flex align-items-center justify-content-between">
                    <div class="col-lg-6">
                        <div class="footer-copy-right">
                            {{-- <p class="font-medium">
                                {!! clean(theme_option('copyright')) !!} {!! clean(theme_option('designed_by')) !!}
                            </p> --}}
                            <p class="font-medium tagline">
                                {!! clean(theme_option('designed_by')) !!}
                                <i class="fa fa-heart pulse"></i>
                                {!! clean(theme_option('copyright')) !!}
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="footer-menu float-lg-right mt-lg-0 mt-3">
                            {!! dynamic_sidebar('footer_copyright_menu') !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End-->
</footer>

<!-- End Footer -->
<div class="dark-mark"></div>
<!-- Vendor JS-->
{!! Theme::footer() !!}

<script>
    "use strict";

    function setCookie(cname, cvalue, exdays) {
        const d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        let expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }

    setCookie('account_logged', {{ auth('member')->check() ? 1 : 0 }});
</script>
</body>

</html>
