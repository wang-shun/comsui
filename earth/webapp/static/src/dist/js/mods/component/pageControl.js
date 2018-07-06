define(function(require,exports,module){var t=(require("component/popupTip"),{pageIndex:1,pageRecordNum:12,curPageRecordNum:null,totalNum:!1}),e=jQuery,i=e(document),s=function(t,e){var i=Math.max(1,Math.ceil(t/e));return i},a=Backbone.View.extend({el:".page-control",events:{"click .popup-redirect-form":"openRedirectForm"},initialize:function(t){this.indicateEl=this.$(".tip"),this.nextEl=this.$(".next"),this.prevEl=this.$(".prev"),this.lastEl=this.$(".last-page"),this.firstEl=this.$(".first-page"),t=this.processOptions(t),this.setOptions(t)},render:function(){var t=this.getTotalPageNum();this.pageIndex<=1?this.prevDisabled=!0:this.prevDisabled=!1,1===t||this.isGteTotalPageNum(this.pageIndex,!0)||null!=this.curPageRecordNum&&this.curPageRecordNum<this.pageRecordNum?this.nextDisabled=!0:this.nextDisabled=!1,this.prevDisabled?(this.prevEl.addClass("disabled"),this.firstEl.addClass("disabled")):(this.prevEl.removeClass("disabled"),this.firstEl.removeClass("disabled")),this.nextDisabled?(this.lastEl.addClass("disabled"),this.nextEl.addClass("disabled")):(this.nextEl.removeClass("disabled"),this.lastEl.removeClass("disabled")),0===t||t?(this.indicateEl.html(this.pageIndex+"/"+t+"页"),this.$(".total").text(this.totalNum)):this.indicateEl.html("第"+this.pageIndex+"页")},reset:function(){this.setOptions({pageIndex:1})},setOptions:function(t){e.extend(this,t),this.render()},getOptions:function(){var t=_.pick(this,"pageIndex","pageRecordNum","curPageRecordNum","totalNum");return t},getTotalPageNum:function(){return this.totalNum!==!1&&s(this.totalNum,this.pageRecordNum)},processOptions:function(i){var s=this.processHtmlOptions(this.$el),a=e.extend({},t,i,s),r=this.$(".total").text().trim();return a.totalNum=""!==r&&+r,a},processHtmlOptions:function(t){var e=t.data(),i={};for(var s in e)if(e[s]){var a=s.split("_");a=a.map(function(t,e){return 0===e?t:t[0].toUpperCase()+t.slice(1)}),i[a.join("")]=e[s]}return i},openRedirectForm:function(){var t=this,s=this.$(".redirect-form");s.hasClass("hide")&&(s.find(".page-index").val("").removeClass("form-control-error"),s.removeClass("hide"),i.on("click",function a(r){e.contains(t.el,r.target)||(s.addClass("hide"),i.off("click",a))}))},getCurrentPageIndex:function(){return this.pageIndex},combineParams:function(t){var i={pageIndex:this.pageIndex,page:this.pageIndex,pageNumber:this.pageRecordNum};return e.extend(i,t),i},isGteTotalPageNum:function(t,e){var i=this.getTotalPageNum();return"number"==typeof i&&(e===!0?t>=i:t>i)},importPageIndexRedirect:function(t){var e=this.$(".redirect-form .page-index"),i=+e.val();isNaN(i)||this.isGteTotalPageNum(i)?e.addClass("form-control-error"):(e.removeClass("form-control-error"),this.redirect(i,t))},redirect:function(t,e){if(!this.isGteTotalPageNum(t)){this.pageIndex=t||1;var i=this.combineParams(e);this.getData(i,"redirect")}},first:function(t){this.prevDisabled||this.redirect(1,t)},last:function(t){this.nextDisabled||this.redirect(this.getTotalPageNum(),t)},next:function(t){if(!this.nextDisabled){this.pageIndex++;var e=this.combineParams(t);this.getData(e,"next")}},prev:function(t){if(!this.prevDisabled){this.pageIndex--;var e=this.combineParams(t);this.getData(e,"prev")}},getData:function(t,i,a){this.curXhrObj&&!this.curXhrObj.isDone&&this.curXhrObj.abort();var r=this,n={url:this.url,data:t,dataType:"json",type:"get"};this.trigger("request",i,t),n.success=function(n,o,l){if(0==n.code){var d,h={};if(d=e.isArray(n.data.list)?n.data.list:JSON.parse(n.data.list),r.trigger(i+":pagecontrol",d,i,n,t),h.curPageRecordNum=d.length,e.isFunction(a)&&a(d),null==n.data.size)h.totalNum=!1;else if(h.totalNum=n.data.size,0==h.totalNum)h.pageIndex=1;else{var c=s(h.totalNum,r.pageRecordNum);c<r.pageIndex&&(h.pageIndex=c)}r.setOptions(h)}else r.trigger("pagecontrol:bad",n)},n.complete=function(t,e){r.curXhrObj.isDone=!0},this.curXhrObj=e.ajax(n)},refresh:function(t){var e=this.combineParams(t);this.getData(e,"redirect")}});module.exports=a});