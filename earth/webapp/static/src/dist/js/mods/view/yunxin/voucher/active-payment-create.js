define(function(require,exports,module){var t=require("component/popupTip"),e=require("baseView/baseFormView"),a=require("component/fileUpload"),n=require("component/dialogView"),o=e.BaseFormView,i=global_config.root,r=Backbone.Model.extend({actions:{searchAccountInfoByContractNoUrl:i+"/voucher/active/create/search-contract",searchAccountInfoByNameUrl:i+"/voucher/active/create/search-name",submitUrl:i+"/voucher/active/create/save"},searchAccountInfoByContractNo:function(t){var e=this,a={url:this.actions.searchAccountInfoByContractNoUrl,dataType:"json",data:{contractNo:t}};a.success=function(t){e.trigger("model:searchAccountInfoByContractNo",t,e)},$.ajax(a)},searchAccountInfoByName:function(t){var e=this;if(!e.loading){e.loading=!0;var a={url:e.actions.searchAccountInfoByNameUrl,dataType:"json",data:{name:t}};a.success=function(t){e.trigger("model:searchAccountInfoByName",t,e)},a.complete=function(){e.loading=!1},$.ajax(a)}},submit:function(t){var e=this,a={dataType:"json",url:this.actions.submitUrl,data:t,type:"post"};a.success=function(t){e.trigger("model:submit",t,e)},$.ajax(a)}}),c=o.extend({el:".form-wrapper",template:_.template($(".form-wrapper .form").html()||" "),events:{"change [name = contractNo]":"onChangeContractNoInput","change [name = payerName]":"onChangePayerNameInput","change [name = voucherType]":"onChangeVoucherType"},initialize:function(){c.__super__.initialize.apply(this,arguments),this.uuidList=[],this.initModel(),this.defineValidator(),this.initFileUpload(),this.confirm=new n({goaheadBtnTxt:"确定"}),this.listenTo(this.confirm,"goahead",function(){window.location.href=i+"/voucher/active"}).listenTo(this.confirm,"closedialog",function(){window.location.href=i+"/voucher/active"})},initFileUpload:function(){var t=this;a.globalUploadFile(this.$(".file-input"),{action:i+"/voucher/active/create/upload-file",fileFilter:[".pdf",".png",".jpg"],uploadParamName:"file",onPlacement:function(t,e){e.removeClass("error"),e.prev().append(t)},createItemDom:function(t,e){var a='<li class="item fileItem" data-uuid="'+t.uuid+'" data-filename="'+e.name+'" data-original="'+t.original+'"><span>'+e.name+'</span><a href="#" class="delete">删除</a></li>';return a},onSuccess:function(e,a){t.uuidList.push(e.uuid)}})},initModel:function(){this.model=new r,this.listenTo(this.model,"model:searchAccountInfoByName",function(e){if(0==e.code){if(_.isEmpty(e.data.contractAccountList))return;var a=e.data.contractAccountList[0],n=a.bank,o=a.province+" "+a.city,i=a.payAcNo;$(".bank").val(n),$(".bankAddress").val(o),$(".payAcNo").val(i)}else t.show(e.messages)}),this.listenTo(this.model,"model:searchAccountInfoByContractNo",function(e){if(0==e.code){var a=e.data.accountInfo;if(_.isEmpty(a))return;var n=a.contractAccount,o=n.payerName,i=n.bank,r=n.province+" "+n.city,c=n.payAcNo,s=a.contract.house.address;if(this.planNolist=a.repaymentPlanList,!_.isEmpty(this.planNolist)){for(var l="",u=0;u<this.planNolist.length;u++){var p='<option class="option" value=" '+this.planNolist[u].singleLoanContractNo+' ">'+this.planNolist[u].singleLoanContractNo+"</option>";l+=p}$(".option").remove(),$(".repaymentPlanNo").last().prepend(l)}$(".repaymentPlanNo").selectpicker("refresh"),$(".payerName").val(o),$(".bank").val(i),$(".bankAddress").val(r),$(".payAcNo").val(c),$(".address").val(s)}else t.show(e.message)}),this.listenTo(this.model,"model:submit",function(e){0==e.code?this.confirm.show("主动还款凭证添加成功"):t.show(e.message)})},onChangeContractNoInput:function(t){var e=$(t.target).val().replace(/\s+/g,"");_.isEmpty(e)||this.model.searchAccountInfoByContractNo(e)},onChangePayerNameInput:function(t){var e=$(t.target).val().replace(/\s+/g,"");_.isEmpty(e)||this.model.searchAccountInfoByName(e)},onChangeVoucherType:function(t){var e=$(t.target).find("option:selected").val();"5"==e&&($(".paymentName").val($(".payerName").val()),$(".paymentBank").val($(".bank").val()),$(".paymentAccountNo").val($(".payAcNo").val()))},defineValidator:function(){$.validator.addMethod("rightformatAmount",function(t,e){return this.optional(e)||/^(([1-9][0-9]*)|(([0]\.\d{1,2}|[1-9][0-9]*\.\d{1,2})))$/.test(t)},"请输入正确的金额格式"),this.validator=this.$("form").validate({rules:{voucherType:"required",contractNo:"required",paymentBank:"required",bankTransactionNo:"required",voucherAmount:{required:!0,rightformatAmount:!0},paymentName:"required",paymentAccountNo:"required",address:"required"},errorPlacement:function(t,e){var a=$(e).parent();a.is(".parcel-input")?a.parent().append(t):$(e).parent().append(t)}})},validate:function(){var t=!0;return"请选择还款编号"===this.$(".filter-option").html()?(this.$(".dropdown-toggle").addClass("error"),t=!1):(t=!0,this.$(".dropdown-toggle").removeClass("error")),this.validator.form()&&t},extractDomData:function(){var t=this._extractDomData(this.$(".real-value"),!0);return t.repaymentPlanNo=this.getRepaymentPlanNoListJsonStr(),t.resourceUuids=JSON.stringify(this.uuidList),t},getRepaymentPlanNoListJsonStr:function(){var t=$(".filter-option").last().text(),e=t.split(", ");return JSON.stringify(e)},submitHandler:function(){if(this.validate()){var t=this.extractDomData();this.model.submit(t)}}});module.exports=c});