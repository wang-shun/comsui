define(function(require,exports,module){var e=require("baseView/baseFormView").FormDialogView,i=(require("component/popupTip"),require("./include/withdraw-dialog")),n=require("component/areaSelect"),t=jQuery,a=e.extend({template:_.template(t("#EditBankCardDialogTmpl").html()),initialize:function(){a.__super__.initialize.apply(this,arguments),this.$(".selectpicker").selectpicker(),this.areaSelect=new n({el:this.$(".area-select")})},submitHandler:function(e){e.preventDefault()}}),l=Backbone.View.extend({el:".content",events:{"click .bind":"onClickBindBankCard","click .edit":"onClickEditBankCard","click .add":"onClickAddBankCard","click #withdraw":"onClickWithdraw"},onClickWithdraw:function(e){e.preventDefault();var n=new i;n.show()},onClickAddBankCard:function(e){e.preventDefault();var i=new a;i.show()},onClickBindBankCard:function(e){e.preventDefault()},onClickEditBankCard:function(e){e.preventDefault();var i=new a;i.show()},initialize:function(){l.__super__.initialize.apply(this,arguments)}});module.exports=l});