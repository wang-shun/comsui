define(function(require,exports,i){var n=global_config.root,t=Backbone.Model.extend({initialize:function(i){this.userId=i.userId},actions:{submit:n+"/edit-user-role",bind:n+"/bind-financial-contract/bind",unbind:n+"/bind-financial-contract/unbind"},bind:function(i){this.idList=i,this.bindAction(this.actions.bind,"model:bind")},unbind:function(i){this.idList=i,this.bindAction(this.actions.unbind,"model:unbind")},bindAction:function(i,n){var t=this,s={type:"post",dataType:"json",url:i,data:{principalId:t.userId,financialContractIds:JSON.stringify(t.idList)}};s.success=function(i){t.trigger(n,i)},$.ajax(s)},submit:function(i){var n={type:"post",dataType:"json",url:this.actions.submit,data:i};n.success=function(i){this.trigger("model:submit",i)}.bind(this),$.ajax(n)}});exports.UserRoleModel=t});