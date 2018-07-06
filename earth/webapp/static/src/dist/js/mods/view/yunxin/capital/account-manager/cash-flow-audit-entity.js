define(function(require,exports,module){var t=Backbone,i=t.Model.extend({submit:function(){var t={url:"./deposit",type:"post",dataType:"json"};t.data=this.toJSON(),t.data.cashFlowUuid=this.collection.cashFlowAuditModel.get("cashFlowUuid"),t.success=function(t){0==t.code&&(this.clear({silent:!0}),this.set(t.data.depositResult)),this.trigger("submited",t,this)}.bind(this),$.ajax(t)},disable:function(){var t={url:"./deposit-cancel",type:"post",dataType:"json"};t.data=this.toJSON(),t.data.cashFlowUuid=this.collection.cashFlowAuditModel.get("cashFlowUuid"),t.success=function(t){this.trigger("disabled",t,this),0==t.code&&this.destroy()}.bind(this),$.ajax(t)},create:function(t){var i={url:"./build-deposit-result",type:"post",dataType:"json",data:{customerUuid:t.customerUuid,financialContractUuid:t.financialContractUuid,cashFlowUuid:this.collection.cashFlowAuditModel.get("cashFlowUuid")}};i.success=function(t){if(0==t.code){var i=this.toJSON(),e=t.data.depositResult,s=$.extend(!0,{},i,e,{isCreated:!0});this.set(s)}this.trigger("created",t,this)}.bind(this),$.ajax(i)}}),e=t.Collection.extend({model:i,initialize:function(t){this.cashFlowAuditModel=t.cashFlowAuditModel},fetch:function(){var t={url:"./show-deposit-result",type:"post",dataType:"json",data:{cashFlowUuid:this.cashFlowAuditModel.get("cashFlowUuid")}};t.success=function(t){0==t.code&&this.reset(t.data.depositResults)}.bind(this),this.trigger("request"),$.ajax(t)}}),s=t.Model.extend({initialize:function(){this.expanded=!1,this.bills=new e({cashFlowAuditModel:this}),this.listenTo(this.bills,"submited disabled",function(t){0==t.code&&this.set(t.data.cashFlow)})},fetchBill:function(){this.bills.fetch()},createBill:function(t){this.bills.create(t)},toggle:function(){this.expanded?this.collapse():this.expand()},expand:function(){this.expanded=!0,this.trigger("expand"),this.fetchBill()},collapse:function(){this.expanded=!1,this.trigger("collapse")},getRemainDepositAmount:function(){var t=+this.get("transactionAmount"),i=this.bills.pluck("depositAmount").reduce(function(t,i){return+t+ +i},0);return t-i}}),o=t.Collection.extend({model:s});exports.CashBillModel=i,exports.CashBillCollection=e,exports.CashFlowAuditModel=s,exports.CashFlowAuditCollection=o});