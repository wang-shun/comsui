define(function(require,exports,module){var e=require("component/fileUpload"),t=require("baseView/baseFormView"),n=t.FieldsetView,a=(jQuery,global_config.root,image_oss_host,n.extend({initialize:function(){a.__super__.initialize.apply(this,arguments),this.initFileUploadPlugin()},initFileUploadPlugin:function(){var t=this;e.globalUploadFile(this.$(".contract-scanfile"),{fileFilter:[".jpg",".png",".pdf"],onSuccess:function(e,t){t.removeClass("error")},onPlacement:function(e,n){t.$(n.data("target")).append(e)}}),e.globalUploadFile(this.$(".other-file"),{onSuccess:function(e,t){t.removeClass("error")},onPlacement:function(e,n){t.$(n.data("target")).append(e)}})},extractDomData:function(){var e=this._extractDomData(this.$(".real-value"),!0),t=function(e){var t=e.data();return t?{imgKey:t.original,imageName:t.filename}:{}},n=function(e){var t=e.data();return t?{fileUrlKey:t.original,fileName:t.filename}:{}};e.contractScanning=[];for(var a=this.$(".contract-scanning").children(),i=0,o=a.length;i<o;i++)e.contractScanning.push(t(a.eq(i)));e.otherAttachment=[];for(var r=this.$(".other-attachment").children(),i=0,o=r.length;i<o;i++)e.otherAttachment.push(n(r.eq(i)));return e},validate:function(){var e=!0;return e}}));module.exports=a});