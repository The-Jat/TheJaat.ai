/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./platform/themes/ultra/assets/js/backend.js":
/*!****************************************************!*\
  !*** ./platform/themes/ultra/assets/js/backend.js ***!
  \****************************************************/
/***/ (() => {

"use strict";


var showError = function showError(message) {
  window.showAlert('alert-danger', message);
};
var showSuccess = function showSuccess(message) {
  window.showAlert('alert-success', message);
};
var handleError = function handleError(data) {
  if (typeof data.errors !== 'undefined' && data.errors.length) {
    handleValidationError(data.errors);
  } else if (typeof data.responseJSON !== 'undefined') {
    if (typeof data.responseJSON.errors !== 'undefined') {
      if (data.status === 422) {
        handleValidationError(data.responseJSON.errors);
      }
    } else if (typeof data.responseJSON.message !== 'undefined') {
      showError(data.responseJSON.message);
    } else {
      $.each(data.responseJSON, function (index, el) {
        $.each(el, function (key, item) {
          showError(item);
        });
      });
    }
  } else {
    showError(data.statusText);
  }
};
var handleValidationError = function handleValidationError(errors) {
  var message = '';
  $.each(errors, function (index, item) {
    if (message !== '') {
      message += '<br />';
    }
    message += item;
  });
  showError(message);
};
window.showAlert = function (messageType, message) {
  if (messageType && message !== '') {
    var alertId = Math.floor(Math.random() * 1000);
    var html = "<div class=\"alert ".concat(messageType, " alert-dismissible\" id=\"").concat(alertId, "\">\n                            <span class=\"close elegant-icon icon_close\" data-dismiss=\"alert\" aria-label=\"close\"><i class=\"ti-close\"></i></span>\n                            <i class=\"") + (messageType === 'alert-success' ? 'ti-check' : 'ti-face-sad') + " \"></i>\n                            ".concat(message, "\n                        </div>");
    $('#alert-container').append(html).ready(function () {
      window.setTimeout(function () {
        $("#alert-container #".concat(alertId)).remove();
      }, 6000);
    });
  }
};
$(document).on('click', '.newsletter-form button[type=submit]', function (event) {
  event.preventDefault();
  event.stopPropagation();
  var _self = $(this);
  _self.addClass('button-loading');
  $.ajax({
    type: 'POST',
    cache: false,
    url: _self.closest('form').prop('action'),
    data: new FormData(_self.closest('form')[0]),
    contentType: false,
    processData: false,
    success: function success(res) {
      _self.removeClass('button-loading');
      if (typeof refreshRecaptcha !== 'undefined') {
        refreshRecaptcha();
      }
      if (res.error) {
        showError(res.message);
        return false;
      }
      _self.closest('form').find('input[type=email]').val('');
      showSuccess(res.message);
    },
    error: function error(res) {
      if (typeof refreshRecaptcha !== 'undefined') {
        refreshRecaptcha();
      }
      _self.removeClass('button-loading');
      handleError(res);
    }
  });
});
$(document).on('click', '.contact-form button[type=submit]', function (event) {
  event.preventDefault();
  event.stopPropagation();
  var _self = $(this);
  _self.addClass('button-loading');
  $.ajax({
    type: 'POST',
    cache: false,
    url: _self.closest('form').prop('action'),
    data: new FormData(_self.closest('form')[0]),
    contentType: false,
    processData: false,
    success: function success(res) {
      _self.removeClass('button-loading');
      if (typeof refreshRecaptcha !== 'undefined') {
        refreshRecaptcha();
      }
      if (res.error) {
        showError(res.message);
        return false;
      }
      _self.closest('form').find('input[type=email]').val('');
      showSuccess(res.message);
    },
    error: function error(res) {
      if (typeof refreshRecaptcha !== 'undefined') {
        refreshRecaptcha();
      }
      _self.removeClass('button-loading');
      handleError(res);
    }
  });
});
$(document).ready(function () {
  $.ajax({
    type: 'GET',
    url: $('#sidebar-wrapper').data('load-url'),
    success: function success(res) {
      if (res.error) {
        return false;
      }
      $('#sidebar-wrapper .sidebar-inner').html(res.data);
    },
    error: function error(res) {
      console.log(res);
    }
  });
});

/***/ }),

/***/ "./platform/themes/ultra/assets/js/main.js":
/*!*************************************************!*\
  !*** ./platform/themes/ultra/assets/js/main.js ***!
  \*************************************************/
/***/ (() => {

function _createForOfIteratorHelper(o, allowArrayLike) { var it = typeof Symbol !== "undefined" && o[Symbol.iterator] || o["@@iterator"]; if (!it) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = it.call(o); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }
function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }
function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i]; return arr2; }
(function ($) {
  "use strict";

  var isRTL = $('body').prop('dir') === 'rtl';

  // Page loading
  $(window).on("load", function () {
    $("#preloader-active").delay(450).fadeOut("slow");
    $("body").delay(450).css({
      overflow: "visible"
    });
  });

  // Scroll progress
  var scrollProgress = function scrollProgress() {
    var docHeight = $(document).height(),
      windowHeight = $(window).height(),
      scrollPercent;
    $(window).on("scroll", function () {
      scrollPercent = $(window).scrollTop() / (docHeight - windowHeight) * 100;
      $(".scroll-progress").width(scrollPercent + "%");
    });
  };

  // Off canvas sidebar
  var OffCanvas = function OffCanvas() {
    $("#off-canvas-toggle").on("click", function () {
      $("body").toggleClass("canvas-opened");
    });
    $(".dark-mark").on("click", function () {
      $("body").removeClass("canvas-opened");
    });
    $(".off-canvas-close").on("click", function () {
      $("body").removeClass("canvas-opened");
    });
  };

  // Search form
  var openSearchForm = function openSearchForm() {
    $(".search-close").hide();
    $("button.search-icon").on("click", function () {
      $(this).hide();
      $("body").toggleClass("open-search-form");
      $(".search-close").show();
      $("html, body").animate({
        scrollTop: 0
      }, "slow");
    });
    $(".search-close").on("click", function () {
      $(this).hide();
      $("body").removeClass("open-search-form");
      $("button.search-icon").show();
    });
  };

  // Mobile menu
  var mobileMenu = function mobileMenu() {
    var menu = $("ul#navigation");
    if (menu.length) {
      menu.slicknav({
        prependTo: ".mobile_menu",
        closedSymbol: "+",
        openedSymbol: "-"
      });
    }
  };
  var galleryShortCode = function galleryShortCode() {
    if ($('.gallery-shortcode').length) {
      $('.gallery-shortcode').lightGallery({
        loop: true,
        thumbnail: true,
        fourceAutoply: false,
        autoplay: false,
        pager: false,
        speed: 300,
        scale: 1,
        keypress: true
      });
    }
  };

  // Slick slider
  var customSlickSlider = function customSlickSlider() {
    // Featured slider 1
    $(".featured-slider-1-items").each(function () {
      $(this).slick({
        dots: false,
        infinite: true,
        speed: 500,
        arrows: true,
        slidesToShow: 1,
        autoplay: false,
        loop: true,
        adaptiveHeight: true,
        fade: true,
        cssEase: "linear",
        rtl: isRTL,
        prevArrow: '<button type="button" class="slick-prev"><i class="flaticon-left"></i></button>',
        nextArrow: '<button type="button" class="slick-next"><i class="flaticon-right"></i></button>',
        appendArrows: $(this).parent(".featured-slider-1").find(".arrow-cover")
      });
    });

    // post-carausel-1-items
    $(".post-carausel-1-items").each(function (index, item) {
      var dataSlider = {
        dots: false,
        infinite: true,
        speed: 1000,
        arrows: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        loop: true,
        adaptiveHeight: true,
        cssEase: "linear",
        rtl: isRTL,
        centerPadding: 50,
        responsive: [{
          breakpoint: 1024,
          settings: {
            slidesToShow: 4,
            slidesToScroll: 4,
            infinite: true,
            dots: false
          }
        }, {
          breakpoint: 991,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 3
          }
        }, {
          breakpoint: 480,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2
          }
        }]
      };
      if ($(this).data('number-slide') !== undefined) {
        dataSlider.slidesToShow = $(this).data('number-slide');
      }
      if ($(this).closest('.post-carausel-1').find('.post-carausel-1-arrow').length) {
        dataSlider.prevArrow = '<button type="button" class="slick-prev"><i class="flaticon-left"></i></button>';
        dataSlider.nextArrow = '<button type="button" class="slick-next"><i class="flaticon-right"></i></button>';
        dataSlider.appendArrows = $(this).closest('.post-carausel-1').find(".post-carausel-1-arrow");
      }
      $(this).slick(dataSlider);
    });

    // post-carausel-2
    $(".post-carausel-2").slick({
      dots: true,
      infinite: true,
      speed: 1000,
      arrows: false,
      slidesToShow: 4,
      slidesToScroll: 1,
      autoplay: false,
      loop: true,
      adaptiveHeight: true,
      cssEase: "linear",
      rtl: isRTL,
      centerPadding: 50,
      responsive: [{
        breakpoint: 1024,
        settings: {
          slidesToShow: 4,
          slidesToScroll: 4,
          infinite: true,
          dots: false
        }
      }, {
        breakpoint: 991,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3
        }
      }, {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }]
    });

    // post-carausel-3
    $(".post-carausel-3").slick({
      dots: true,
      infinite: true,
      speed: 1000,
      arrows: false,
      slidesToShow: 4,
      slidesToScroll: 1,
      autoplay: true,
      loop: true,
      adaptiveHeight: true,
      cssEase: "linear",
      rtl: isRTL,
      centerPadding: 50,
      responsive: [{
        breakpoint: 1024,
        settings: {
          slidesToShow: 4,
          slidesToScroll: 4,
          infinite: true,
          dots: false
        }
      }, {
        breakpoint: 991,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 1
        }
      }, {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }]
    });
    $(".featured-slider-2-items").slick({
      fade: true,
      asNavFor: ".featured-slider-2-nav",
      arrows: true,
      prevArrow: '<button type="button" class="slick-prev"><i class="flaticon-left"></i></button>',
      nextArrow: '<button type="button" class="slick-next"><i class="flaticon-right"></i></button>',
      appendArrows: ".arrow-cover",
      rtl: isRTL
    });
    $(".featured-slider-2-nav").slick({
      slidesToShow: 4,
      slidesToScroll: 1,
      asNavFor: ".featured-slider-2-items",
      dots: false,
      arrows: false,
      centerMode: true,
      focusOnSelect: true,
      centerPadding: 0,
      rtl: isRTL,
      responsive: [{
        breakpoint: 1024,
        settings: {
          slidesToShow: 3
        }
      }, {
        breakpoint: 991,
        settings: {
          slidesToShow: 2
        }
      }, {
        breakpoint: 480,
        settings: {
          slidesToShow: 1
        }
      }]
    });
  };

  //Header sticky
  var headerSticky = function headerSticky() {
    $(window).on("scroll", function () {
      var scroll = $(window).scrollTop();
      if (scroll < 245) {
        $(".header-sticky ").removeClass("sticky-bar");
      } else {
        $(".header-sticky").addClass("sticky-bar");
      }
    });
  };

  // Scroll up to top
  var scrollToTop = function scrollToTop() {
    $.scrollUp({
      scrollName: "scrollUp",
      // Element ID
      topDistance: "300",
      // Distance from top before showing element (px)
      topSpeed: 300,
      // Speed back to top (ms)
      animation: "fade",
      // Fade, slide, none
      animationInSpeed: 200,
      // Animation in speed (ms)
      animationOutSpeed: 200,
      // Animation out speed (ms)
      scrollText: '<i class="ti-arrow-up"></i>',
      // Text for element
      activeOverlay: false // Set CSS color to display scrollUp active point, e.g '#00FFFF'
    });
  };

  //VSticker
  var VSticker = function VSticker() {
    $("#datetime").vTicker({
      speed: 500,
      pause: 2000,
      animation: "fade",
      mousePause: false,
      showItems: 1
    });
    $("#news-flash").vTicker({
      speed: 500,
      pause: 2000,
      animation: "fade",
      mousePause: false,
      showItems: 1
    });
  };

  //sidebar sticky
  var stickySidebar = function stickySidebar() {
    if (typeof theiaStickySidebar === "function") {
      $(".sticky-sidebar").theiaStickySidebar();
    }
  };

  //Custom scrollbar
  var customScrollbar = function customScrollbar() {
    var $ = document.querySelector.bind(document);
    var ps = new PerfectScrollbar(".custom-scrollbar");
  };

  //Mega menu
  var megaMenu = function megaMenu() {
    $(".sub-mega-menu .nav-pills > a").on("mouseover", function (event) {
      $(this).tab("show");
    });
  };

  //Counter
  var numberCounter = function numberCounter() {
    var counterUp = window.counterUp["default"];
    var counters = document.querySelectorAll('.counter-number');
    var _iterator = _createForOfIteratorHelper(counters),
      _step;
    try {
      for (_iterator.s(); !(_step = _iterator.n()).done;) {
        var el = _step.value;
        counterUp(el, {
          duration: 2000,
          delay: 10
        });
      }
    } catch (err) {
      _iterator.e(err);
    } finally {
      _iterator.f();
    }
  };

  // Slider Range JS
  var sliderRange = function sliderRange() {
    if ($("#slider-range").length) {
      $("#slider-range").slider({
        range: true,
        min: 0,
        max: 500,
        values: [120, 250],
        slide: function slide(event, ui) {
          $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
        }
      });
      $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));
    }
  };

  //Shop Grid/List view
  /* ===== Grid list active  =====   */
  var gridListActive = function gridListActive() {
    $(".btn-list-grid button").on("click", function () {
      if ($(this).hasClass("grid-view")) {
        $(".btn-list-grid button").addClass("active");
        $(".btn-list-grid button.list-view").removeClass("active");
      } else if ($(this).hasClass("list-view")) {
        $(".btn-list-grid button").addClass("active");
        $(".btn-list-grid button.grid-view").removeClass("active");
      }
    });
  };
  /* Grid list View */
  var gridListView = function gridListView() {
    // Product List
    $("#list-view").on("click", function () {
      $(".product-layout > .clearfix").remove();
      $(".product-layout").attr("class", "product-layout product-list col-md-12");
      $("#column-left .product-layout").attr("class", "product-layout mb_20");
      $("#column-right .product-layout").attr("class", "product-layout mb_20");
    });
    // Product Grid
    $("#grid-view").on("click", function () {
      $(".product-layout").attr("class", "product-layout product-grid col-md-4 col-xs-6");
    });
  };

  /*Product Details*/
  var productDetails = function productDetails() {
    $(".product-image-slider").slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: false,
      asNavFor: ".slider-nav-thumbnails",
      rtl: isRTL
    });
    $(".slider-nav-thumbnails").slick({
      slidesToShow: 5,
      slidesToScroll: 1,
      asNavFor: ".product-image-slider",
      dots: false,
      focusOnSelect: true,
      rtl: isRTL,
      prevArrow: '<button type="button" class="slick-prev"><i class="ti-angle-left"></i></button>',
      nextArrow: '<button type="button" class="slick-next"><i class="ti-angle-right"></i></button>'
    });

    // Remove active class from all thumbnail slides
    $(".slider-nav-thumbnails .slick-slide").removeClass("slick-active");

    // Set active class to first thumbnail slides
    $(".slider-nav-thumbnails .slick-slide").eq(0).addClass("slick-active");

    // On before slide change match active thumbnail to current slide
    $(".product-image-slider").on("beforeChange", function (event, slick, currentSlide, nextSlide) {
      var mySlideNumber = nextSlide;
      $(".slider-nav-thumbnails .slick-slide").removeClass("slick-active");
      $(".slider-nav-thumbnails .slick-slide").eq(mySlideNumber).addClass("slick-active");
    });
    $(".product-image-slider").on("beforeChange", function (event, slick, currentSlide, nextSlide) {
      var img = $(slick.$slides[nextSlide]).find("img");
      $(".zoomWindowContainer,.zoomContainer").remove();
      $(img).elevateZoom({
        zoomType: "inner",
        cursor: "crosshair",
        zoomWindowFadeIn: 500,
        zoomWindowFadeOut: 750
      });
    });
    //Elevate Zoom
    if ($(".product-image-slider").length) {
      $(".product-image-slider .slick-active img").elevateZoom({
        zoomType: "inner",
        cursor: "crosshair",
        zoomWindowFadeIn: 500,
        zoomWindowFadeOut: 750
      });
    }
    //Filter color/Size
    $(".list-filter").each(function () {
      $(this).find("a").on("click", function (event) {
        event.preventDefault();
        $(this).parent().siblings().removeClass("active");
        $(this).parent().toggleClass("active");
        $(this).parents(".attr-detail").find(".current-size").text($(this).text());
        $(this).parents(".attr-detail").find(".current-color").text($(this).attr("data-color"));
      });
    });
    //Qty Up-Down
    $(".detail-qty").each(function () {
      var qtyval = parseInt($(this).find(".qty-val").text(), 10);
      $(".qty-up").on("click", function (event) {
        event.preventDefault();
        qtyval = qtyval + 1;
        $(this).prev().text(qtyval);
      });
      $(".qty-down").on("click", function (event) {
        event.preventDefault();
        qtyval = qtyval - 1;
        if (qtyval > 1) {
          $(this).next().text(qtyval);
        } else {
          qtyval = 1;
          $(this).next().text(qtyval);
        }
      });
    });
    $(document).on('click', ".dropdown-menu .cart_list", function (e) {
      e.stopPropagation();
    });
  };
  /* WOW active */
  new WOW().init();
  function logElementEvent(eventName, element) {
    console.log(Date.now(), eventName, element.getAttribute("data-src"));
  }

  //Load functions
  $(document).ready(function () {
    OffCanvas();
    customScrollbar();
    numberCounter();
    megaMenu();
    scrollToTop();
    headerSticky();
    stickySidebar();
    customSlickSlider();
    mobileMenu();
    scrollProgress();
    openSearchForm();
    VSticker();
    sliderRange();
    gridListActive();
    gridListView();
    productDetails();
    galleryShortCode();
    new LazyLoad();
  });
})(jQuery);

/***/ }),

/***/ "./platform/themes/ultra/assets/js/script.js":
/*!***************************************************!*\
  !*** ./platform/themes/ultra/assets/js/script.js ***!
  \***************************************************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

__webpack_require__(/*! ./main */ "./platform/themes/ultra/assets/js/main.js");
__webpack_require__(/*! ./backend */ "./platform/themes/ultra/assets/js/backend.js");

/***/ }),

/***/ "./platform/plugins/toc/resources/assets/sass/toc.scss":
/*!*************************************************************!*\
  !*** ./platform/plugins/toc/resources/assets/sass/toc.scss ***!
  \*************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/social-login/resources/sass/social-login.scss":
/*!************************************************************************!*\
  !*** ./platform/plugins/social-login/resources/sass/social-login.scss ***!
  \************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/simple-slider/resources/sass/simple-slider.scss":
/*!**************************************************************************!*\
  !*** ./platform/plugins/simple-slider/resources/sass/simple-slider.scss ***!
  \**************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/newsletter/resources/sass/newsletter.scss":
/*!********************************************************************!*\
  !*** ./platform/plugins/newsletter/resources/sass/newsletter.scss ***!
  \********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/member/resources/sass/dashboard/style.scss":
/*!*********************************************************************!*\
  !*** ./platform/plugins/member/resources/sass/dashboard/style.scss ***!
  \*********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/member/resources/sass/dashboard/style-rtl.scss":
/*!*************************************************************************!*\
  !*** ./platform/plugins/member/resources/sass/dashboard/style-rtl.scss ***!
  \*************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/language/resources/sass/language.scss":
/*!****************************************************************!*\
  !*** ./platform/plugins/language/resources/sass/language.scss ***!
  \****************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/language/resources/sass/language-public.scss":
/*!***********************************************************************!*\
  !*** ./platform/plugins/language/resources/sass/language-public.scss ***!
  \***********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/gallery/resources/sass/gallery.scss":
/*!**************************************************************!*\
  !*** ./platform/plugins/gallery/resources/sass/gallery.scss ***!
  \**************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/gallery/resources/sass/object-gallery.scss":
/*!*********************************************************************!*\
  !*** ./platform/plugins/gallery/resources/sass/object-gallery.scss ***!
  \*********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/gallery/resources/sass/admin-gallery.scss":
/*!********************************************************************!*\
  !*** ./platform/plugins/gallery/resources/sass/admin-gallery.scss ***!
  \********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/cookie-consent/resources/sass/cookie-consent.scss":
/*!****************************************************************************!*\
  !*** ./platform/plugins/cookie-consent/resources/sass/cookie-consent.scss ***!
  \****************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/contact/resources/sass/contact.scss":
/*!**************************************************************!*\
  !*** ./platform/plugins/contact/resources/sass/contact.scss ***!
  \**************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/contact/resources/sass/contact-public.scss":
/*!*********************************************************************!*\
  !*** ./platform/plugins/contact/resources/sass/contact-public.scss ***!
  \*********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/comment/resources/assets/sass/comment.scss":
/*!*********************************************************************!*\
  !*** ./platform/plugins/comment/resources/assets/sass/comment.scss ***!
  \*********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/backup/resources/sass/backup.scss":
/*!************************************************************!*\
  !*** ./platform/plugins/backup/resources/sass/backup.scss ***!
  \************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/announcement/resources/sass/announcement.scss":
/*!************************************************************************!*\
  !*** ./platform/plugins/announcement/resources/sass/announcement.scss ***!
  \************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/packages/widget/resources/sass/widget.scss":
/*!*************************************************************!*\
  !*** ./platform/packages/widget/resources/sass/widget.scss ***!
  \*************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/packages/theme/resources/sass/theme-options.scss":
/*!*******************************************************************!*\
  !*** ./platform/packages/theme/resources/sass/theme-options.scss ***!
  \*******************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/packages/theme/resources/sass/admin-bar.scss":
/*!***************************************************************!*\
  !*** ./platform/packages/theme/resources/sass/admin-bar.scss ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/packages/theme/resources/sass/guideline.scss":
/*!***************************************************************!*\
  !*** ./platform/packages/theme/resources/sass/guideline.scss ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/packages/slug/resources/sass/slug.scss":
/*!*********************************************************!*\
  !*** ./platform/packages/slug/resources/sass/slug.scss ***!
  \*********************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/packages/shortcode/resources/sass/shortcode.scss":
/*!*******************************************************************!*\
  !*** ./platform/packages/shortcode/resources/sass/shortcode.scss ***!
  \*******************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/packages/seo-helper/resources/sass/seo-helper.scss":
/*!*********************************************************************!*\
  !*** ./platform/packages/seo-helper/resources/sass/seo-helper.scss ***!
  \*********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/packages/revision/resources/sass/revision.scss":
/*!*****************************************************************!*\
  !*** ./platform/packages/revision/resources/sass/revision.scss ***!
  \*****************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/packages/menu/resources/sass/menu.scss":
/*!*********************************************************!*\
  !*** ./platform/packages/menu/resources/sass/menu.scss ***!
  \*********************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/packages/installer/resources/sass/style.scss":
/*!***************************************************************!*\
  !*** ./platform/packages/installer/resources/sass/style.scss ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/packages/get-started/resources/sass/get-started.scss":
/*!***********************************************************************!*\
  !*** ./platform/packages/get-started/resources/sass/get-started.scss ***!
  \***********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/core/table/resources/sass/table.scss":
/*!*******************************************************!*\
  !*** ./platform/core/table/resources/sass/table.scss ***!
  \*******************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/core/setting/resources/sass/admin-email.scss":
/*!***************************************************************!*\
  !*** ./platform/core/setting/resources/sass/admin-email.scss ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/core/media/resources/sass/media.scss":
/*!*******************************************************!*\
  !*** ./platform/core/media/resources/sass/media.scss ***!
  \*******************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/core/base/resources/sass/core.scss":
/*!*****************************************************!*\
  !*** ./platform/core/base/resources/sass/core.scss ***!
  \*****************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/core/base/resources/sass/libraries/select2/select2.scss":
/*!**************************************************************************!*\
  !*** ./platform/core/base/resources/sass/libraries/select2/select2.scss ***!
  \**************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/core/base/resources/sass/components/email.scss":
/*!*****************************************************************!*\
  !*** ./platform/core/base/resources/sass/components/email.scss ***!
  \*****************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/core/base/resources/sass/components/error-pages.scss":
/*!***********************************************************************!*\
  !*** ./platform/core/base/resources/sass/components/error-pages.scss ***!
  \***********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/core/base/resources/sass/components/tree-category.scss":
/*!*************************************************************************!*\
  !*** ./platform/core/base/resources/sass/components/tree-category.scss ***!
  \*************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/core/base/resources/sass/components/crop-image.scss":
/*!**********************************************************************!*\
  !*** ./platform/core/base/resources/sass/components/crop-image.scss ***!
  \**********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./public/vendor/core/core/base/css/core.css":
/*!***************************************************!*\
  !*** ./public/vendor/core/core/base/css/core.css ***!
  \***************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./public/vendor/core/core/base/css/libraries/select2.css":
/*!****************************************************************!*\
  !*** ./public/vendor/core/core/base/css/libraries/select2.css ***!
  \****************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/themes/ultra/assets/sass/rtl.scss":
/*!****************************************************!*\
  !*** ./platform/themes/ultra/assets/sass/rtl.scss ***!
  \****************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/themes/ultra/assets/sass/style.scss":
/*!******************************************************!*\
  !*** ./platform/themes/ultra/assets/sass/style.scss ***!
  \******************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/themes/ultra/assets/sass/shop.scss":
/*!*****************************************************!*\
  !*** ./platform/themes/ultra/assets/sass/shop.scss ***!
  \*****************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ }),

/***/ "./platform/plugins/translation/resources/sass/translation.scss":
/*!**********************************************************************!*\
  !*** ./platform/plugins/translation/resources/sass/translation.scss ***!
  \**********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
// extracted by mini-css-extract-plugin


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = __webpack_modules__;
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/chunk loaded */
/******/ 	(() => {
/******/ 		var deferred = [];
/******/ 		__webpack_require__.O = (result, chunkIds, fn, priority) => {
/******/ 			if(chunkIds) {
/******/ 				priority = priority || 0;
/******/ 				for(var i = deferred.length; i > 0 && deferred[i - 1][2] > priority; i--) deferred[i] = deferred[i - 1];
/******/ 				deferred[i] = [chunkIds, fn, priority];
/******/ 				return;
/******/ 			}
/******/ 			var notFulfilled = Infinity;
/******/ 			for (var i = 0; i < deferred.length; i++) {
/******/ 				var [chunkIds, fn, priority] = deferred[i];
/******/ 				var fulfilled = true;
/******/ 				for (var j = 0; j < chunkIds.length; j++) {
/******/ 					if ((priority & 1 === 0 || notFulfilled >= priority) && Object.keys(__webpack_require__.O).every((key) => (__webpack_require__.O[key](chunkIds[j])))) {
/******/ 						chunkIds.splice(j--, 1);
/******/ 					} else {
/******/ 						fulfilled = false;
/******/ 						if(priority < notFulfilled) notFulfilled = priority;
/******/ 					}
/******/ 				}
/******/ 				if(fulfilled) {
/******/ 					deferred.splice(i--, 1)
/******/ 					var r = fn();
/******/ 					if (r !== undefined) result = r;
/******/ 				}
/******/ 			}
/******/ 			return result;
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/jsonp chunk loading */
/******/ 	(() => {
/******/ 		// no baseURI
/******/ 		
/******/ 		// object to store loaded and loading chunks
/******/ 		// undefined = chunk not loaded, null = chunk preloaded/prefetched
/******/ 		// [resolve, reject, Promise] = chunk loading, 0 = chunk loaded
/******/ 		var installedChunks = {
/******/ 			"/themes/ultra/js/script": 0,
/******/ 			"vendor/core/plugins/translation/css/translation": 0,
/******/ 			"themes/ultra/css/shop": 0,
/******/ 			"themes/ultra/css/style": 0,
/******/ 			"themes/ultra/css/rtl": 0,
/******/ 			"vendor/core/core/base/css/libraries/select2.rtl": 0,
/******/ 			"vendor/core/core/base/css/core.rtl": 0,
/******/ 			"vendor/core/core/base/css/crop-image": 0,
/******/ 			"vendor/core/core/base/css/tree-category": 0,
/******/ 			"vendor/core/core/base/css/error-pages": 0,
/******/ 			"vendor/core/core/base/css/email": 0,
/******/ 			"vendor/core/core/base/css/libraries/select2": 0,
/******/ 			"vendor/core/core/base/css/core": 0,
/******/ 			"vendor/core/core/media/css/media": 0,
/******/ 			"vendor/core/core/setting/css/admin-email": 0,
/******/ 			"vendor/core/core/table/css/table": 0,
/******/ 			"vendor/core/packages/get-started/css/get-started": 0,
/******/ 			"vendor/core/packages/installer/css/style": 0,
/******/ 			"vendor/core/packages/menu/css/menu": 0,
/******/ 			"vendor/core/packages/revision/css/revision": 0,
/******/ 			"vendor/core/packages/seo-helper/css/seo-helper": 0,
/******/ 			"vendor/core/packages/shortcode/css/shortcode": 0,
/******/ 			"vendor/core/packages/slug/css/slug": 0,
/******/ 			"vendor/core/packages/theme/css/guideline": 0,
/******/ 			"vendor/core/packages/theme/css/admin-bar": 0,
/******/ 			"vendor/core/packages/theme/css/theme-options": 0,
/******/ 			"vendor/core/packages/widget/css/widget": 0,
/******/ 			"vendor/core/plugins/announcement/css/announcement": 0,
/******/ 			"vendor/core/plugins/backup/css/backup": 0,
/******/ 			"vendor/core/plugins/comment/css/comment": 0,
/******/ 			"vendor/core/plugins/contact/css/contact-public": 0,
/******/ 			"vendor/core/plugins/contact/css/contact": 0,
/******/ 			"vendor/core/plugins/cookie-consent/css/cookie-consent": 0,
/******/ 			"vendor/core/plugins/gallery/css/admin-gallery": 0,
/******/ 			"vendor/core/plugins/gallery/css/object-gallery": 0,
/******/ 			"vendor/core/plugins/gallery/css/gallery": 0,
/******/ 			"vendor/core/plugins/language/css/language-public": 0,
/******/ 			"vendor/core/plugins/language/css/language": 0,
/******/ 			"vendor/core/plugins/member/css/dashboard/style-rtl": 0,
/******/ 			"vendor/core/plugins/member/css/dashboard/style": 0,
/******/ 			"vendor/core/plugins/newsletter/css/newsletter": 0,
/******/ 			"vendor/core/plugins/simple-slider/css/simple-slider": 0,
/******/ 			"vendor/core/plugins/social-login/css/social-login": 0,
/******/ 			"vendor/core/plugins/toc/css/toc": 0
/******/ 		};
/******/ 		
/******/ 		// no chunk on demand loading
/******/ 		
/******/ 		// no prefetching
/******/ 		
/******/ 		// no preloaded
/******/ 		
/******/ 		// no HMR
/******/ 		
/******/ 		// no HMR manifest
/******/ 		
/******/ 		__webpack_require__.O.j = (chunkId) => (installedChunks[chunkId] === 0);
/******/ 		
/******/ 		// install a JSONP callback for chunk loading
/******/ 		var webpackJsonpCallback = (parentChunkLoadingFunction, data) => {
/******/ 			var [chunkIds, moreModules, runtime] = data;
/******/ 			// add "moreModules" to the modules object,
/******/ 			// then flag all "chunkIds" as loaded and fire callback
/******/ 			var moduleId, chunkId, i = 0;
/******/ 			if(chunkIds.some((id) => (installedChunks[id] !== 0))) {
/******/ 				for(moduleId in moreModules) {
/******/ 					if(__webpack_require__.o(moreModules, moduleId)) {
/******/ 						__webpack_require__.m[moduleId] = moreModules[moduleId];
/******/ 					}
/******/ 				}
/******/ 				if(runtime) var result = runtime(__webpack_require__);
/******/ 			}
/******/ 			if(parentChunkLoadingFunction) parentChunkLoadingFunction(data);
/******/ 			for(;i < chunkIds.length; i++) {
/******/ 				chunkId = chunkIds[i];
/******/ 				if(__webpack_require__.o(installedChunks, chunkId) && installedChunks[chunkId]) {
/******/ 					installedChunks[chunkId][0]();
/******/ 				}
/******/ 				installedChunks[chunkId] = 0;
/******/ 			}
/******/ 			return __webpack_require__.O(result);
/******/ 		}
/******/ 		
/******/ 		var chunkLoadingGlobal = self["webpackChunk"] = self["webpackChunk"] || [];
/******/ 		chunkLoadingGlobal.forEach(webpackJsonpCallback.bind(null, 0));
/******/ 		chunkLoadingGlobal.push = webpackJsonpCallback.bind(null, chunkLoadingGlobal.push.bind(chunkLoadingGlobal));
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module depends on other loaded chunks and execution need to be delayed
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/themes/ultra/assets/js/script.js")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/themes/ultra/assets/sass/rtl.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/themes/ultra/assets/sass/style.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/themes/ultra/assets/sass/shop.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/translation/resources/sass/translation.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/toc/resources/assets/sass/toc.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/social-login/resources/sass/social-login.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/simple-slider/resources/sass/simple-slider.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/newsletter/resources/sass/newsletter.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/member/resources/sass/dashboard/style.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/member/resources/sass/dashboard/style-rtl.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/language/resources/sass/language.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/language/resources/sass/language-public.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/gallery/resources/sass/gallery.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/gallery/resources/sass/object-gallery.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/gallery/resources/sass/admin-gallery.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/cookie-consent/resources/sass/cookie-consent.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/contact/resources/sass/contact.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/contact/resources/sass/contact-public.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/comment/resources/assets/sass/comment.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/backup/resources/sass/backup.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/plugins/announcement/resources/sass/announcement.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/packages/widget/resources/sass/widget.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/packages/theme/resources/sass/theme-options.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/packages/theme/resources/sass/admin-bar.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/packages/theme/resources/sass/guideline.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/packages/slug/resources/sass/slug.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/packages/shortcode/resources/sass/shortcode.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/packages/seo-helper/resources/sass/seo-helper.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/packages/revision/resources/sass/revision.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/packages/menu/resources/sass/menu.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/packages/installer/resources/sass/style.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/packages/get-started/resources/sass/get-started.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/core/table/resources/sass/table.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/core/setting/resources/sass/admin-email.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/core/media/resources/sass/media.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/core/base/resources/sass/core.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/core/base/resources/sass/libraries/select2/select2.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/core/base/resources/sass/components/email.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/core/base/resources/sass/components/error-pages.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/core/base/resources/sass/components/tree-category.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./platform/core/base/resources/sass/components/crop-image.scss")))
/******/ 	__webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./public/vendor/core/core/base/css/core.css")))
/******/ 	var __webpack_exports__ = __webpack_require__.O(undefined, ["vendor/core/plugins/translation/css/translation","themes/ultra/css/shop","themes/ultra/css/style","themes/ultra/css/rtl","vendor/core/core/base/css/libraries/select2.rtl","vendor/core/core/base/css/core.rtl","vendor/core/core/base/css/crop-image","vendor/core/core/base/css/tree-category","vendor/core/core/base/css/error-pages","vendor/core/core/base/css/email","vendor/core/core/base/css/libraries/select2","vendor/core/core/base/css/core","vendor/core/core/media/css/media","vendor/core/core/setting/css/admin-email","vendor/core/core/table/css/table","vendor/core/packages/get-started/css/get-started","vendor/core/packages/installer/css/style","vendor/core/packages/menu/css/menu","vendor/core/packages/revision/css/revision","vendor/core/packages/seo-helper/css/seo-helper","vendor/core/packages/shortcode/css/shortcode","vendor/core/packages/slug/css/slug","vendor/core/packages/theme/css/guideline","vendor/core/packages/theme/css/admin-bar","vendor/core/packages/theme/css/theme-options","vendor/core/packages/widget/css/widget","vendor/core/plugins/announcement/css/announcement","vendor/core/plugins/backup/css/backup","vendor/core/plugins/comment/css/comment","vendor/core/plugins/contact/css/contact-public","vendor/core/plugins/contact/css/contact","vendor/core/plugins/cookie-consent/css/cookie-consent","vendor/core/plugins/gallery/css/admin-gallery","vendor/core/plugins/gallery/css/object-gallery","vendor/core/plugins/gallery/css/gallery","vendor/core/plugins/language/css/language-public","vendor/core/plugins/language/css/language","vendor/core/plugins/member/css/dashboard/style-rtl","vendor/core/plugins/member/css/dashboard/style","vendor/core/plugins/newsletter/css/newsletter","vendor/core/plugins/simple-slider/css/simple-slider","vendor/core/plugins/social-login/css/social-login","vendor/core/plugins/toc/css/toc"], () => (__webpack_require__("./public/vendor/core/core/base/css/libraries/select2.css")))
/******/ 	__webpack_exports__ = __webpack_require__.O(__webpack_exports__);
/******/ 	
/******/ })()
;