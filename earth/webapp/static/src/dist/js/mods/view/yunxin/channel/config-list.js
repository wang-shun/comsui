define(function(require,exports,module){var e=require("component/popupTip"),a=require("baseView/tableContent"),t=require("baseView/baseFormView").FormDialogView,n=jQuery,i=global_config.root,o=t.extend({className:"modal fade form-modal yunxin-modal",template:_.template(n("#configDetailTmpl").html(),{variable:"data"})}),l=a.extend({actions:{detail:i+"/paymentchannel/config/detail"},events:{"click .detailDialog":"onClickDetatilDialog"},onClickDetatilDialog:function(a){if(a.preventDefault(),!this.loading){this.loading=!0;var t=this,i=n(a.target).parents("tr").data("paymentchanneluuid"),l={url:this.actions.detail,data:{paymentChannelUuid:i},dataType:"json"};l.success=function(a){if(0==a.code){var t=new Backbone.Model(a.data),n=new o({model:t});n.show()}else e.show(a.message)},l.complete=function(){t.loading=!1},n.ajax(l)}}});module.exports=l});