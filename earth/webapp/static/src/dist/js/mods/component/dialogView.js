define(function(require,exports,module){var t=jQuery,e=(t("body"),Array.prototype.slice),a={title:"提示",cancelBtnTxt:"关闭",goaheadBtnTxt:"确定",bodyInnerTxt:"",excludeGoahed:!1,isShowCancelBtn:!0},i=['    <div class="modal-dialog">','        <div class="modal-content">','            <div class="modal-header">','                <button type="button" class="close close-dialog" aria-label="关闭" data-dismiss="modal">','                    <span aria-hidden="true">&times;</span>',"                </button>",'                <h4 class="modal-title" id="dialoglabel">{%= title %}</h4>',"            </div>",'            <div class="modal-body">','                <p class="inner" style="margin: 50px 0;">{%= bodyInnerTxt %}</p>',"            </div>",'            <div class="modal-footer">','                <button type="button" class="btn btn-default cancel" data-dismiss="modal">{%= cancelBtnTxt %}</button>','                <button type="button" class="btn btn-success goahead">{%= goaheadBtnTxt %}</button>',"            </div>","        </div>","    </div>"].join(""),n=Backbone.View.extend({template:_.template(i),tagName:"div",className:"modal fade",attributes:{role:"dialog",tabindex:"-1"},events:{"click .goahead":"goaheadHandler","click .cancel":"cancelHandler","hidden.bs.modal":"closeDialogHandler"},initialize:function(e){this.currentImportArgs=null,this.options=t.extend({},a,e),this.txtEl=this.$(".modal-body .inner"),this.txtEl.length<1&&(this.render(),this.txtEl=this.$(".modal-body .inner")),this.options.bodyInnerTxt&&this.txtEl.html(this.options.bodyInnerTxt),this.controlOperateBtns(this.options)},render:function(){var t=this.template(this.options);return this.$el.html(t),this},cancelHandler:function(){this.trigger.apply(this,["cancel"].concat(this.currentImportArgs))},goaheadHandler:function(){this.trigger.apply(this,["goahead"].concat(this.currentImportArgs))},closeDialogHandler:function(){this.trigger.apply(this,["closedialog"].concat(this.currentImportArgs)),this.currentImportArgs=null,this.$el.detach()},controlOperateBtns:function(t){var e=0;return t.excludeGoahed?(this.$(".goahead").hide(),e++):this.$(".goahead").show(),t.excludeCancel?(this.$(".cancel").hide(),e++):this.$(".cancel").show(),2==e?this.$(".modal-footer").css({"padding-top":0,"padding-bottom":0}):this.$(".modal-footer").css({"padding-top":null,"padding-bottom":null}),t.isShowCancelBtn||this.$(".cancel").hide(),this},showRichText:function(){this.txtEl.css({"margin-top":0,"margin-bottom":0}),this.show.apply(this,arguments)},show:function(t){"string"==typeof t?(this.txtEl.html(t),args=e.call(arguments,1)):args=e.call(arguments,0),args.length>0?this.currentImportArgs=args:this.currentImportArgs=null,this.$el.modal("show")},hide:function(){this.$el.modal("hide")}});module.exports=n});