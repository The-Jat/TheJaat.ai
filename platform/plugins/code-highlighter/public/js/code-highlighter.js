/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
var __webpack_exports__ = {};
/*!***********************************************************************************!*\
  !*** ./platform/plugins/code-highlighter/resources/assets/js/code-highlighter.js ***!
  \***********************************************************************************/


if (typeof hljs != 'undefined') {
  document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('pre code').forEach(function (el) {
      hljs.highlightElement(el);
    });
  });
}
/******/ })()
;