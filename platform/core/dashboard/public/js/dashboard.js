(()=>{function t(t,e){for(var a=0;a<e.length;a++){var n=e[a];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(t,n.key,n)}}var e={},a=function(){function a(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,a)}var n,o,i;return n=a,i=[{key:"loadWidget",value:function(t,n,o,i){var d=t.closest(".widget-item"),l=d.prop("id"),r=d.find(".card");void 0!==i&&(e[l]=i);var s=d.find("a.collapse-expand");if(!s.length||!s.hasClass("collapse")){Botble.showLoading(r),void 0!==o&&null!=o||(o={});var c=d.find(".dropdown.predefined_range .dropdown-item.active");c.length&&(o.predefined_range=c.data("key")),$httpClient.makeWithoutErrorHandler().get(n,o).then((function(n){var o=n.data;t.html(o.data),void 0!==i?i():e[l]&&e[l](),a.initSortable()})).catch((function(e){var a,n=e.response,o=e.message,i=null==n||null===(a=n.data)||void 0===a?void 0:a.data;!i&&o&&(i='<div class="empty"><p class="empty-subtitle text-muted">'.concat(o,"</p></div>")),t.html(i)})).finally((function(){Botble.hideLoading(r)}))}}},{key:"initSortable",value:function(){var t=$('[data-bb-toggle="widgets-list"]');t.length>0&&Sortable.create(t[0],{group:"widgets",sort:!0,delay:0,disabled:!1,store:null,animation:150,handle:".card-header",ghostClass:"sortable-ghost",chosenClass:"sortable-chosen",dataIdAttr:"data-id",forceFallback:!1,fallbackClass:"sortable-fallback",fallbackOnBody:!1,scroll:!0,scrollSensitivity:30,scrollSpeed:10,onUpdate:function(){var e=[];$.each($(".widget-item"),(function(t,a){e.push($(a).prop("id"))})),$httpClient.makeWithoutErrorHandler().post(t.data("url"),{items:e}).then((function(t){var e=t.data;Botble.showSuccess(e.message)}))}})}}],(o=[{key:"init",value:function(){$('[data-bb-toggle="widgets-list"]').on("click",".page-link",(function(t){t.preventDefault();var e=$(t.currentTarget),n=e.prop("href");n&&a.loadWidget(e.closest(".widget-item").find(".widget-content"),n)})),$(document).on("click",".card-actions .dropdown.predefined_range .dropdown-item",(function(t){t.preventDefault();var e=$(t.currentTarget);e.closest(".dropdown").find(".dropdown-toggle").text(e.data("label")),e.closest(".dropdown").find(".dropdown-item").removeClass("active"),e.addClass("active"),a.loadWidget(e.closest(".widget-item").find(".widget-content"),e.closest(".widget-item").data("url"),{changed_predefined_range:1})}))}}])&&t(n.prototype,o),i&&t(n,i),Object.defineProperty(n,"prototype",{writable:!1}),a}();$((function(){(new a).init(),window.BDashboard=a,$(document).on("submit",'[data-bb-toggle="widgets-management-modal"] form',(function(t){t.preventDefault();var e=$(t.currentTarget),a=$(this).closest(".modal");$httpClient.make().withButtonLoading(e.find('button[type="submit"]')).postForm(e.prop("action"),new FormData(e[0])).then((function(t){var e=t.data;Botble.showSuccess(e.message),setTimeout((function(){window.location.reload()}),1e3)})).finally((function(){a.modal("hide")}))})).on("change",'[data-bb-toggle="widgets-management-item"]',(function(t){var e=$(t.currentTarget);e.prop("checked")?e.closest("td").removeClass("text-decoration-line-through text-muted"):e.closest("td").addClass("text-decoration-line-through text-muted")}))}))})();