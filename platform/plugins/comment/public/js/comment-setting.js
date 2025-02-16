/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!*************************************************************************!*\
  !*** ./platform/plugins/comment/resources/assets/js/comment-setting.js ***!
  \*************************************************************************/
$(function () {
  var $commentEnableCheckbox = $('#comment-enable');
  var $areaCommentSetting = $('#show-comments-setting');
  if ($commentEnableCheckbox.is(':checked')) {
    $areaCommentSetting.show();
  }
  $commentEnableCheckbox.on('change', function (e) {
    if (e.target.checked) {
      $areaCommentSetting.show();
    } else {
      $areaCommentSetting.hide();
    }
  });
});
/******/ })()
;