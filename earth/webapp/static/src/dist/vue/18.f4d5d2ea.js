webpackJsonp([18,23],{750:function(e,t,a){"use strict";function n(e){return e&&e.__esModule?e:{default:e}}Object.defineProperty(t,"__esModule",{value:!0});var s=a(1),o=a(2),i=n(o);t.default={components:{AddTagModal:a(1626)},data:function(){return{action:"tag/query",pageConds:{perPageRecordNumber:12,pageIndex:1,page:1,pageNumber:12},queryConds:{name:""},addTagModel:{show:!1},dataSource:{list:[],size:0}}},activated:function(){this.fetch()},watch:{"pageConds.pageIndex":function(){this.pageConds.page=this.pageConds.pageIndex,this.fetch()}},methods:{fetch:function(){var e=this;(0,s.ajaxPromise)({url:this.action,data:Object.assign({},this.queryConds,this.pageConds)}).then(function(t){e.dataSource.list=t.list,e.dataSource.size=t.size}).catch(function(e){i.default.open(e)})},showAddTagModal:function(){this.addTagModel.show=!0},handleClickDeleteTag:function(e){var t=this;i.default.open("确认删除该条标签？","提示",[{text:"取消",handler:function(){i.default.close()}},{text:"确定",type:"success",handler:function(){(0,s.ajaxPromise)({url:"tag/delete",data:{uuid:e.uuid},type:"POST"}).then(function(a){var n=t.dataSource.list.findIndex(function(t){return t.uuid===e.uuid});n!=-1&&t.dataSource.list.splice(n,1)}).then(function(){i.default.close()}).catch(function(e){i.default.open(e)})}}])},reloadDataSource:function(){this.fetch()}}}},1208:function(e,t){},1625:function(e,t,a){var n,s;a(1208),n=a(750);var o=a(1781);s=n=n||{},"object"!=typeof n.default&&"function"!=typeof n.default||(s=n=n.default),"function"==typeof s&&(s=s.options),s.render=o.render,s.staticRenderFns=o.staticRenderFns,s._scopeId="data-v-54f43ed3",e.exports=n},1781:function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"content"},[a("div",{staticClass:"scroller"},[a("div",{staticClass:"query-area"},[a("el-form",{staticClass:"sdf-form sdf-query-form",attrs:{inline:!0},nativeOn:{submit:function(e){e.preventDefault()}}},[a("el-form-item",[a("el-input",{directives:[{name:"model",rawName:"v-model",value:e.queryConds.name,expression:"queryConds.name"}],attrs:{placeholder:"请输入标签名称",size:"small"},domProps:{value:e.queryConds.name},on:{input:function(t){e.queryConds.name=t}}})]),e._v(" "),a("el-form-item",[a("el-button",{attrs:{size:"small",type:"primary"},on:{click:e.fetch}},[e._v("查询")])]),e._v(" "),a("el-form-item",[a("el-button",{staticStyle:{color:"#ddd"},attrs:{size:"small",type:"success"},on:{click:e.showAddTagModal}},[e._v("新增标签")])])])]),e._v(" "),a("div",{staticClass:"table-area"},[a("el-table",{staticClass:"no-table-bottom-border",attrs:{data:e.dataSource.list,stripe:""}},[a("el-table-column",{attrs:{label:"标签名称",prop:"name"},inlineTemplate:{render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("a",{staticStyle:{cursor:"pointer"},attrs:{href:e.ctx+"#/system/tagmanage/"+e.row.uuid+"/detail"}},[e._v(e._s(e.row.name))])},staticRenderFns:[]}}),e._v(" "),a("el-table-column",{attrs:{label:"标签描述",prop:"description"}}),e._v(" "),a("el-table-column",{attrs:{label:"创建时间",prop:"createTime"},inlineTemplate:{render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[e._v(e._s(e._f("formatDate")(e.row.createTime,"yyyy-MM-dd HH:mm:ss")))])},staticRenderFns:[]}}),e._v(" "),a("el-table-column",{attrs:{label:"修改时间",prop:"lastModifiedTime"},inlineTemplate:{render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[e._v(e._s(e._f("formatDate")(e.row.lastModifiedTime,"yyyy-MM-dd HH:mm:ss")))])},staticRenderFns:[]}}),e._v(" "),a("el-table-column",{attrs:{label:"操作",prop:""},inlineTemplate:{render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("a",{staticStyle:{cursor:"pointer"},attrs:{href:e.ctx+"#/system/tagmanage/"+e.row.uuid+"/edit"}},[e._v("编辑")]),e._v(" "),a("a",{staticStyle:{cursor:"pointer","margin-left":"15px"},on:{click:function(t){t.preventDefault(),e.handleClickDeleteTag(e.row)}}},[e._v("删除")])])},staticRenderFns:[]}})])])]),e._v(" "),a("div",{staticClass:"operations"},[a("div",{staticClass:"pull-right"},[a("PageControl",{directives:[{name:"model",rawName:"v-model",value:e.pageConds.pageIndex,expression:"pageConds.pageIndex"}],attrs:{size:e.dataSource.size,"per-page-record-number":e.pageConds.perPageRecordNumber},domProps:{value:e.pageConds.pageIndex},on:{input:function(t){e.pageConds.pageIndex=t}}})])]),e._v(" "),a("AddTagModal",{directives:[{name:"model",rawName:"v-model",value:e.addTagModel.show,expression:"addTagModel.show"}],domProps:{value:e.addTagModel.show},on:{reloadDataSource:e.reloadDataSource,input:function(t){e.addTagModel.show=t}}})])},staticRenderFns:[]}},751:function(e,t,a){"use strict";function n(e){return e&&e.__esModule?e:{default:e}}Object.defineProperty(t,"__esModule",{value:!0});var s=a(1),o=a(2),i=n(o);t.default={props:{value:{default:!1}},data:function(){return{fields:{name:"",description:""},rules:{name:[{required:!0,message:"请输入标签名称",trigger:"blur"},{min:1,max:20,message:"长度在 1 到 20 个字符",trigger:"blur"}],description:{max:200,trigger:"blur",message:"长度不要超过200个字符"}},show:!1,uploading:!1}},watch:{value:function(e){this.show=e},show:function(e){this.$emit("input",e),!e&&this.$refs.form&&this.$refs.form.resetFields()}},methods:{submit:function(){var e=this;this.$refs.form.validate(function(t){t&&(e.uploading=!0,(0,s.ajaxPromise)({url:"tag/create-tag",data:{name:e.fields.name,description:e.fields.description},type:"post"}).then(function(t){e.show=!1,i.default.open("新增标签成功！"),e.$emit("reloadDataSource")}).catch(function(e){i.default.open(e)}).then(function(){e.uploading=!1}))})}}}},1626:function(e,t,a){var n,s;n=a(751);var o=a(1935);s=n=n||{},"object"!=typeof n.default&&"function"!=typeof n.default||(s=n=n.default),"function"==typeof s&&(s=s.options),s.render=o.render,s.staticRenderFns=o.staticRenderFns,e.exports=n},1935:function(e,t){e.exports={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("Modal",{directives:[{name:"model",rawName:"v-model",value:e.show,expression:"show"}],domProps:{value:e.show},on:{input:function(t){e.show=t}}},[a("ModalHeader",{attrs:{title:"新增标签"}}),e._v(" "),a("ModalBody",{attrs:{align:"left"}},[a("el-form",{ref:"form",staticClass:"sdf-form",attrs:{rules:e.rules,model:e.fields,"label-width":"100px"},nativeOn:{submit:function(e){e.preventDefault()}}},[a("el-form-item",{staticClass:"form-item-legend",staticStyle:{padding:"5px 0"},attrs:{label:"标签信息"}}),e._v(" "),a("el-form-item",{attrs:{label:"标签名称",prop:"name",required:""}},[a("el-input",{directives:[{name:"model",rawName:"v-model",value:e.fields.name,expression:"fields.name"}],staticClass:"long",attrs:{size:"middle"},domProps:{value:e.fields.name},on:{input:function(t){e.fields.name=t}}}),e._v(" "),a("div",{staticStyle:{"font-size":"11px",color:"#666666","line-height":"24px"}},[e._v("1~20个字符，区分大小写")])]),e._v(" "),a("el-form-item",{attrs:{label:"标签描述",prop:"description"}},[a("el-input",{directives:[{name:"model",rawName:"v-model",value:e.fields.description,expression:"fields.description"}],staticClass:"long",attrs:{type:"textarea",autosize:{minRows:2,maxRows:4},placeholder:"200字符以内"},domProps:{value:e.fields.description},on:{input:function(t){e.fields.description=t}}})])])]),e._v(" "),a("ModalFooter",[a("el-button",{on:{click:function(t){e.show=!1}}},[e._v("取消")]),e._v(" "),a("el-button",{attrs:{type:"success",loading:e.uploading},on:{click:e.submit}},[e._v("确定")])])])},staticRenderFns:[]}}});