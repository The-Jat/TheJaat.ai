(()=>{function t(e){return t="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},t(e)}function e(t,e){for(var n=0;n<e.length;n++){var a=e[n];a.enumerable=a.enumerable||!1,a.configurable=!0,"value"in a&&(a.writable=!0),Object.defineProperty(t,a.key,a)}}var n=function(){function t(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,t)}var n,a,o;return n=t,(a=[{key:"init",value:function(){var t=$("#post_lang_choice");t.data("prev",t.val()),$(document).on("change","#post_lang_choice",(function(t){$(".change_to_language_text").text($(t.currentTarget).find("option:selected").text()),$("#confirm-change-language-modal").modal("show")})),$(document).on("click","#confirm-change-language-modal .btn-warning.float-start",(function(e){e.preventDefault(),(t=$("#post_lang_choice")).val(t.data("prev")).trigger("change"),$("#confirm-change-language-modal").modal("hide")})),$(document).on("click","#confirm-change-language-button",(function(e){e.preventDefault();var n=$(e.currentTarget),a=$("#language_flag_path").val();Botble.showButtonLoading(n),t=$("#post_lang_choice"),$httpClient.make().post($("div[data-change-language-route]").data("change-language-route"),{lang_meta_current_language:t.val(),reference_id:$("#reference_id").val(),reference_type:$("#reference_type").val(),lang_meta_created_from:$("#lang_meta_created_from").val()}).then((function(e){var n=e.data;if($("#select-post-language img").replaceWith('<img src="'.concat(a).concat(t.find("option:selected").data("flag"),'.svg" class="flag" style="height: 24px" title="').concat(t.find("option:selected").text(),'" alt="').concat(t.find("option:selected").text(),'" />')),!n.error){$(".current_language_text").text(t.find("option:selected").text());var o="";$.each(n.data,(function(t,e){var n='<img src="'.concat(a).concat(e.lang_flag,'.svg" class="flag" style="height: 16px" title="').concat(e.lang_name,'" alt="').concat(e.lang_name,'">');e.reference_id?o+='<a href="'.concat($("#route_edit").val(),'" class="gap-2 d-flex align-items-center text-decoration-none">').concat(n,"\n                                        <span>\n                                            ").concat(e.lang_name,'\n                                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">\n                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>\n                                                <path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1"></path>\n                                                <path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z"></path>\n                                                <path d="M16 5l3 3"></path>\n                                            </svg>\n                                    </span>\n                                </a>'):o+='<a href="'.concat($("#route_create").val(),"?ref_from=").concat($("#content_id").val(),"&ref_lang=").concat(t,'" class="gap-2 d-flex align-items-center text-decoration-none">').concat(n,"\n                                    <span>\n                                        ").concat(e.lang_name,'\n                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">\n                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>\n                                            <path d="M12 5l0 14"></path>\n                                            <path d="M5 12l14 0"></path>\n                                        </svg>\n                                    </span>\n                                </a>')})),$("#list-others-language").html(o),$("#confirm-change-language-modal").modal("hide"),t.data("prev",t.val()).trigger("change")}})).finally((function(){return Botble.hideButtonLoading(n)}))})),$(document).on("click",".change-data-language-item",(function(t){t.preventDefault(),window.location.href=$(t.currentTarget).find("span[data-href]").data("href")}))}}])&&e(n.prototype,a),o&&e(n,o),Object.defineProperty(n,"prototype",{writable:!1}),t}();$((function(){(new n).init(),$httpClient.setup((function(e){e.axios.interceptors.request.use((function(e){var n=$('meta[name="ref_from"]').attr("content"),a=$('meta[name="ref_lang"]').attr("content");return n||a?(e.data instanceof FormData?(e.data.set("ref_from",n),e.data.set("ref_lang",a)):"object"===t(e.data)&&(e.data.ref_from=n,e.data.ref_lang=a),e):e}))}))}))})();