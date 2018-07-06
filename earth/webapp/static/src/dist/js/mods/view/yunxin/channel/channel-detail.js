define(function(require,exports,module){require("scaffold/dragula/dragula.css");var e=require("scaffold/util"),t=require("scaffold/dragula/dragula"),n=require("component/pagination"),i=require("component/popupTip"),a=require("component/stepOperation"),s=require("baseView/baseFormView").FormDialogView,o=jQuery,r=global_config.root,l=global_helperObj.RadioCheckboxControl,h=Backbone.Model.extend({defaults:{financialContractUuid:"",businessType:"",accountSide:"",paymentStrategyMode:"0",paymentChannelUuids:[],paymentChannelOrderForBanks:{}},actions:{save:r+"/paymentchannel/switch/strategy/saveResult",getPaymentChannelList:r+"/paymentchannel/switch/strategy/step/2",getAllBank:r+"/paymentchannel/switch/strategy/step/3",previewPaymentChannelOrderForBanks:r+"/paymentchannel/switch/paymentChannelOrder",getBankChannelLimitPreview:r+"/paymentchannel/switch/strategy/bankChannelLimitPreview"},save:function(){var e=this,t=this.toJSON(),n={url:this.actions.save,dataType:"json",processData:!1,type:"post",contentType:"application/json",data:JSON.stringify(t)};n.success=function(t){e.trigger("sync",e,t)},o.ajax(n)},getAllBank:function(e){if(this.bankList)return void e({code:0,data:{list:this.bankList}});var t=this,n={url:this.actions.getAllBank,dataType:"json",data:_.pick(this.toJSON(),"financialContractUuid","businessType","accountSide")};n.success=function(n){t.bankList=n.data.list||[],e&&e(n)},o.ajax(n)},getPaymentChannelList:function(e){if(this.paymentChannelList)return void e({code:0,data:{list:this.paymentChannelList}});var t=this,n={url:this.actions.getPaymentChannelList,dataType:"json",data:_.pick(this.toJSON(),"financialContractUuid","businessType","accountSide")};n.success=function(n){t.paymentChannelList=n.data.list||[],e&&e(n)},o.ajax(n)},updatePaymentChannelOrder:function(){var e=this.get("paymentChannelUuids"),t=this.paymentChannelList,n=[];e.forEach(function(e){for(var i=0,a=t.length;i<a;i++){var s=t[i];if(s.paymentChannelUuid===e){t.splice(i,1),n.push(s);break}}}),this.paymentChannelList=n.concat(t)},getBankChannelLimitPreview:function(e){var t=this,n={dataType:"json",url:t.actions.getBankChannelLimitPreview,data:_.pick(t.toJSON(),"paymentChannelUuid","bankCode","accountSide")};n.success=function(t){e&&e(t)},o.ajax(n)}}),d={enableNextStop:function(){this.$(".next").attr("disabled",null)},disableNextStop:function(){this.$(".next").attr("disabled",!0)},show:function(){this.activate(1),this.$(".next").attr("disabled",null),this.$el.show()},hide:function(){this.$el.hide()}},c=a.extend({templates:o(".no-channel .step-content-item .template").toArray().map(function(e){var t=o(e).html();return _.template(t)}),initialize:function(){this.on("steped",function(e){var t=this.$contentItems.eq(e-1),n=this.templates[e-1];switch(e){case 1:this.enteredStep1(t,n)}}),this.$(".step-tip-item").removeClass("z-active").first().addClass("z-active"),c.__super__.initialize.apply(this,arguments)},enteredStep1:function(e,t){var n=this.model,i=t(n.toJSON());e.html(i)}});o.extend(c.prototype,d);var p=a.extend({templates:o(".single .step-content-item .template").toArray().map(function(e){var t=o(e).html();return _.template(t)}),events:{"click .panel":"onClickPanel"},initialize:function(){this.on("steped",function(e){var t=this.$contentItems.eq(e-1),n=this.templates[e-1];switch(e){case 1:this.enteredStep1(t,n);break;case 2:this.enteredStep2(t,n)}}),this.on("step:done",this.onStepDone),this.$(".step-tip-item").removeClass("z-active").first().addClass("z-active"),p.__super__.initialize.apply(this,arguments)},onClickPanel:function(e){var t=o(e.currentTarget);t.is(".z-active")?(t.removeClass("z-active"),this.$(".tip").hide()):(this.$(".panel").removeClass("z-active"),t.addClass("z-active"),t.is(".closed")?this.$(".tip").show():this.$(".tip").hide())},onStepDone:function(){var e=this.$(".panel.z-active"),t=e.data("payment-channel-uuid");this.model.set("paymentChannelUuids",[t])},enteredStep1:function(e,t){var n=this.model,i=t(n.toJSON());e.html(i),this.enableNextStop()},enteredStep2:function(e,t){var n=this.model,a=this;n.getPaymentChannelList(function(s){if(0!=s.code)return void i.show(s.message);var o=t({list:n.paymentChannelList,model:n});e.html(o),n.paymentChannelList&&n.paymentChannelList.length||a.disableNextStop()})}});o.extend(p.prototype,d);var m=a.extend({templates:o(".issuer .step-content-item .template").toArray().map(function(e){var t=o(e).html();return _.template(t)}),events:{"mouseover .showPopover":"showPopover","mouseout .showPopover":"hidePopover"},showPopover:function(e){var t=this,n=o(e.target);this.timer=setTimeout(function(){t.model.set("paymentChannelUuid",n.data("paymentchanneluuid")),t.model.set("bankCode",n.data("bankcode")),t.model.getBankChannelLimitPreview(function(e){n.popover({content:function(){if(0==e.code){var t=e.data,n=_.isUndefined(t.paymentChannelName)?"--":t.paymentChannelName,i=_.isUndefined(t.bankName)?"--":t.bankName,a=_.isUndefined(t.transactionLimitPerTranscation)?"--":(+t.transactionLimitPerTranscation).formatMoney(2,""),s=_.isUndefined(t.transcationLimitPerDay)?"--":(+t.transcationLimitPerDay).formatMoney(2,""),o=_.isUndefined(t.transactionLimitPerMonth)?"--":(+t.transactionLimitPerMonth).formatMoney(2,"");return"<div>"+n+"<br/>"+i+'<br/><span class="text-muted">单笔限额:</span>'+a+'<br/><span class="text-muted">单日限额:</span>'+s+'<br/><span class="text-muted">单月限额:</span>'+o+"<br/></div>"}return"<div>暂无相关信息</div>"},html:!0}),n.popover("toggle")})},300)},hidePopover:function(e){clearTimeout(this.timer),o("body").find(".popover").popover("hide")},initialize:function(){this.on("step",function(e){switch(e){case 2:this.beforeLeaveStep2();break;case 3:this.beforeLeaveStep3()}}),this.on("steped",function(e){var t=this.$contentItems.eq(e-1),n=this.templates[e-1];switch(e){case 1:this.enteredStep1(t,n);break;case 2:this.enteredStep2(t,n);break;case 3:this.enteredStep3(t,n);break;case 4:this.enteredStep4(t,n)}}),this.on("step:done",this.onStepDone),this.$(".step-tip-item").removeClass("z-active").first().addClass("z-active"),m.__super__.initialize.apply(this,arguments)},onStepDone:function(){},beforeLeaveStep2:function(){var e=this.$(".panel").toArray().map(function(e){return o(e).data("payment-channel-uuid")});this.model.set("paymentChannelUuids",e),this.model.updatePaymentChannelOrder()},beforeLeaveStep3:function(){var e={};this.$("tbody tr").each(function(){var t=o(this),n=t.data("bank-code"),i=t.find("input:checked").data("payment-channel-uuid");e[n]=i}),this.model.set("paymentChannelOrderForBanks",e)},enteredStep1:function(e,t){var n=this.model,i=t(n.toJSON());e.html(i),this.enableNextStop()},enteredStep2:function(e,n){var a=this.model,s=this;a.getPaymentChannelList(function(o){if(0!=o.code)return void i.show(o.message);var r=n({list:a.paymentChannelList,model:a.toJSON()});e.html(r),s.dragController=t([e.find(".drag-wrapper").get(0)]),a.paymentChannelList&&a.paymentChannelList.length?s.enableNextStop():s.disableNextStop()})},enteredStep3:function(e,t){var n=this.model,a=this;n.getAllBank(function(s){if(0!=s.code)return void i.show(s.message);var o=t({paymentChannelList:n.paymentChannelList,bankList:n.bankList,model:n.toJSON()});e.html(o),a.radioController&&a.radioController.remove(),a.radioController=new l(e.find(".data-list tbody"),{groupSelector:"tr"}),n.bankList&&n.bankList.length||a.disableNextStop()})},enteredStep4:function(e,t){var n=this.model,i=n.paymentChannelList.slice(0),a=n.bankList.slice(0),s=n.get("paymentChannelOrderForBanks"),o=a.map(function(e){var t=[],n=[];return i.forEach(function(i){i.paymentChannelUuid===s[e.bankCode]?t.push(i):n.push(i)}),e.paymentChannelOrder=t.concat(n),e}),r=t({previewList:o,paymentChannelList:i,model:n.toJSON()});e.html(r)}});o.extend(m.prototype,d);var u=s.extend({el:o("#setChannelStrategy").get(0),events:{"change [name=channel-mode]":"onChangeChannelMode"},initialize:function(){u.__super__.initialize.apply(this,arguments),this.singleStrategy=new p({model:this.model,el:this.$(".single").get(0)}),this.issuerStrategy=new m({model:this.model,el:this.$(".issuer").get(0)}),this.noChannelStrategy=new c({model:this.model,el:this.$(".no-channel").get(0)}),this.listenTo(this.singleStrategy,"step:done",function(){this.model.save(),this.hide()}),this.listenTo(this.issuerStrategy,"step:done",function(){this.model.save(),this.hide()}),this.listenTo(this.noChannelStrategy,"step:done",function(){this.model.save(),this.hide()}),this.listenTo(this.singleStrategy,"step:cancel",function(){this.hide()}),this.listenTo(this.issuerStrategy,"step:cancel",function(){this.hide()}),this.listenTo(this.noChannelStrategy,"step:cancel",function(){this.hide()}),this.singleStrategy.show(),this.issuerStrategy.hide(),this.noChannelStrategy.hide(),this.listenTo(this.model,"change:paymentStrategyMode",function(e,t){1==t?(this.issuerStrategy.show(),this.singleStrategy.hide(),this.noChannelStrategy.hide()):t==-1?(this.noChannelStrategy.show(),this.singleStrategy.hide(),this.issuerStrategy.hide()):(this.singleStrategy.show(),this.issuerStrategy.hide(),this.noChannelStrategy.hide())}),this.listenTo(this.model,"sync",function(t,n){0==n.code?(i.show("提交成功"),e.delayReload()):i.show(n.message)})},onChangeChannelMode:function(e){var t=o(e.target).val();this.model.set("paymentStrategyMode",t)}}),y=s.extend({el:o("#priorityPreview").get(0),events:{"mouseover .showPopover":"showPopover","mouseout .showPopover":"hidePopover"},showPopover:function(e){var t=o(e.target),n=this;this.timer=setTimeout(function(){n.model.set("paymentChannelUuid",t.data("paymentchanneluuid")),n.model.set("bankCode",t.data("bankcode")),n.model.getBankChannelLimitPreview(function(e){t.popover({content:function(){if(0==e.code){var t=e.data,n=_.isUndefined(t.paymentChannelName)?"--":t.paymentChannelName,i=_.isUndefined(t.bankName)?"--":t.bankName,a=_.isUndefined(t.transactionLimitPerTranscation)?"--":(+t.transactionLimitPerTranscation).formatMoney(2,""),s=_.isUndefined(t.transcationLimitPerDay)?"--":(+t.transcationLimitPerDay).formatMoney(2,""),o=_.isUndefined(t.transactionLimitPerMonth)?"--":(+t.transactionLimitPerMonth).formatMoney(2,"");return"<div>"+n+"<br/>"+i+'<br/><span class="text-muted">单笔限额:</span>'+a+'<br/><span class="text-muted">单日限额:</span>'+s+'<br/><span class="text-muted">单月限额:</span>'+o+"<br/></div>"}return"<div>暂无相关信息</div>"},html:!0}),t.popover("toggle")})},300)},hidePopover:function(e){clearTimeout(this.timer),o("body").find(".popover").popover("hide")},initialize:function(){var e=this,t=n.extend({refreshTableDataList:function(e,t,n,i){if(this.template){var a;a=e.length<1?'<tr class="nomore"><td style="text-align: center;" colspan="'+this.rowNum+'">没有更多数据</td></tr>':this.template({list:this.polish(e),paymentChannelSize:e[0].paymentChannelList.length}),this.tableListEl.html(a),this.trigger("refresh",e,t,n,i)}},collectParams:function(){return e.model.toJSON()}});this.pagination=t.find(".block")}}),f=Backbone.View.extend({el:o(".content").get(0),events:{"click .set-channel-strategy":"onClickSetChannelStrategy","click .btn-priority-preview":"onClickPreviewPriority"},onClickSetChannelStrategy:function(e){e.preventDefault();var t=o(e.target),n=new h({financialContractUuid:this.financialContractUuid,accountSide:t.parents("[data-account-side]").data("account-side"),businessType:t.parents("[data-business-type]").data("business-type")}),i=new u({model:n});i.show()},onClickPreviewPriority:function(e){e.preventDefault();var t=o(e.target),n=new h({financialContractUuid:this.financialContractUuid,accountSide:t.parents("[data-account-side]").data("account-side"),businessType:t.parents("[data-business-type]").data("business-type")}),i=new y({model:n});i.show()},initialize:function(e){this.financialContractUuid=e}});module.exports=f});