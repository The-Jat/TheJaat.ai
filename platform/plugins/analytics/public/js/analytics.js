(()=>{function a(a,t){for(var e=0;e<t.length;e++){var n=t[e];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(a,n.key,n)}}var t=function(){function t(){!function(a,t){if(!(a instanceof t))throw new TypeError("Cannot call a class as a function")}(this,t)}var e,n,i;return e=t,i=[{key:"initCharts",value:function(){var a=window.analyticsStats||{},t=$("#stats-chart"),e=$("#world-map"),n=[];$.each(a.stats,(function(a,t){n.push({axis:t.axis,visitors:t.visitors,pageViews:t.pageViews})})),t.length&&new Morris.Area({element:"stats-chart",resize:!0,data:n,xkey:"axis",ykeys:["visitors","pageViews"],labels:[a.translations.visits,a.translations.pageViews],lineColors:["#d6336c","#4299e1"],hideHover:"auto",parseTime:!1});var i={};$.each(a.countryStats,(function(a,t){i[t[0]]=t[1]})),e.length&&e.vectorMap({map:"world_mill_en",backgroundColor:"transparent",regionStyle:{initial:{fill:"#f6f8fb",stroke:"#dce1e7","stroke-width":2}},series:{regions:[{values:i,scale:["#ffffff","#206bc4"],normalizeFunction:"polynomial"}]},onRegionLabelShow:function(t,e,n){void 0!==i[n]&&e.html(e.html()+": "+i[n]+" "+a.translations.visits)}})}}],(n=null)&&a(e.prototype,n),i&&a(e,i),Object.defineProperty(e,"prototype",{writable:!1}),t}();$((function(){var a=$("#widget_analytics_general");BDashboard.loadWidget(a.find(".widget-content"),a.data("url"),null,(function(){var e;t.initCharts(),null!==(e=(window.analyticsStats.stats||[])[1])&&void 0!==e&&e.visitors?(a.find(".stats-warning").addClass("d-none"),a.find(".stats-warning").removeClass("d-block")):(a.find(".stats-warning").addClass("d-block"),a.find(".stats-warning").removeClass("d-none"))})),BDashboard.loadWidget($("#widget_analytics_page").find(".widget-content"),$("#widget_analytics_page").data("url")),BDashboard.loadWidget($("#widget_analytics_browser").find(".widget-content"),$("#widget_analytics_browser").data("url")),BDashboard.loadWidget($("#widget_analytics_referrer").find(".widget-content"),$("#widget_analytics_referrer").data("url"))}))})();