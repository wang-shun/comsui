define(function(require,exports,module){function e(e,t){e.on("click",".submit",function(e){e.preventDefault();var t=u(this).data("customer-uuid"),o={url:l+"/preloan/customer/apply-project",type:"post",data:{customerUuid:t},dataType:"json"};o.success=function(e){0==e.code?(a.show("提交立项成功，请耐心等待审核！"),a.once("hidden",function(){location.reload()})):a.show(e.message)},u.ajax(o)}),e.on("click",".audit",function(e){e.preventDefault();var o=new d(t.customerUuid);o.show()})}function t(e,t){u(".alert").html()&&setInterval(function(){u(".alert").fadeOut("5000")},1e3),e.on("click",".arrow",function(e){e.preventDefault();var t=u(e.target).parents(".item");t.toggleClass("expand")})}function o(e,t){}function n(e,t){var o=!1,n=new r({title:"查询工商信息",bodyInnerTxt:"首次(仅限)工商信息查询为计费检索，是否继续？"});n.on("goahead",function(e,t){o=!0,e.parent().append(s);var i=t.success;t.success=function(e){o=!1,i(e)},u.ajax(t),n.hide()}),e.on("click",".queryEnterpriseCredit",function(e){if(e.preventDefault(),!o){var t=u(e.target),i={url:l+"/preloan/enterprise-credit",data:{name:t.data("name")},dataType:"JSON"};i.success=function(e){if(0!=e.code)a.show(e.message||"未查询到该企业或该企业不存在！");else{var t=e.data.regNo;location.href=l+"/preloan/customer?k=commerce&regNo="+t}s.remove()},n.show(t,i)}})}function i(e,t){var o=u("form");u("select").change(function(){o.submit()})}var a=require("component/popupTip"),c=require("view/baseFormView").FormDialogView,r=require("component/dialogView"),s=(require("scaffold/util").execOnceBeforeDone,global_const.loadingImg.clone()),u=jQuery,l=global_config.root,d=c.extend({template:_.template(u("#auditDialogTmpl").html()||""),action:l+"/preloan/sales-projects/audit",initialize:function(e){d.__super__.initialize.apply(this,arguments),this.validator=this.$(".form").validate(),this.customerUuid=e},validate:function(){return this.validator.form()},submitHandler:function(){if(this.validate()){var e=this.extractDomData();e.customerUuid=this.customerUuid;var t=function(e){e=JSON.parse(e),a.show(0==e.code?"审核成功":e.message),a.once("hidden",function(){location.reload()})};u.post(this.action,e,t),this.hide()}}});exports.init=function(a){var c={project:e,questionnaire:t,other:o,commerce:n,duediligence:i},r=c[a.k];if("function"==typeof r){var s=u("."+a.k);r(s,a)}}});