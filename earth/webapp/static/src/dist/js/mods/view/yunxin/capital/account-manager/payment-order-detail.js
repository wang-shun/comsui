define(function(require,exports,module){var e=require("baseView/baseFormView").FormDialogView,t=require("component/popupTip"),i=jQuery,n=Backbone.View.extend({el:".content",events:{"click #refund":"onClickRefund"},initialize:function(){n.__super__.initialize.apply(this,arguments),this.initModel(),this.listenTo(this.model,"refund-success",this.onRefundSuccess)},onRefundSuccess:function(){},initModel:function(){var e=this.$("#journalVoucherUuid").val(),t=this.$("#bookingAmount").val(),i=this.$("#sourceDocumentNo").val(),n=this.$("#counterPartyAccount").val(),o=this.$("#journalVoucherNo").val(),u=new Backbone.Model({journalVoucherUuid:e,bookingAmount:t,sourceDocumentNo:i,counterPartyAccount:n,journalVoucherNo:o});this.model=u},onClickRefund:function(e){e.preventDefault();var t=new o({model:this.model});t.show()}}),o=e.extend({template:_.template(i("#RefundTmpl").html()),initialize:function(){o.__super__.initialize.apply(this,arguments)},save:function(){var e=this,n=this.extractDomData();n.journalVoucherUuid=this.model.get("journalVoucherUuid");var o={url:"/capital/customer-account-manage/payment-order-list/refund",data:n,type:"post",dataType:"JSON"};o.success=function(i){if(0==i.code){var n=new u({model:e.model});n.show(),e.hide()}else t.show(i.message)},i.ajax(o)},submitHandler:function(e){e.preventDefault(),this.save()}}),u=e.extend({template:_.template(i("#RefundSuccessTmpl").html()),initialize:function(){u.__super__.initialize.apply(this,arguments)},submitHandler:function(e){e.preventDefault(),this.model.trigger("refund-success"),this.hide()}});module.exports=n});