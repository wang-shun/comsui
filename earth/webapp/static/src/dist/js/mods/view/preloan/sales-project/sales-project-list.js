define(function(require,exports,module){var e=require("baseView/tableContent"),a=jQuery,t=(global_config.root,e.extend({collectSortParams:function(e){for(var t={},s=this.tableListEl.find("thead .sort"),r=0,n=s.length;r<n;r++){var o=s.eq(r),i=o.data("paramname"),l=o.hasClass("desc")?"DESC":o.hasClass("asc")?"ASC":"";if(i&&l){t.sortField=i,t.isAsc="ASC"===l;break}}return a.extend(e,t),e}}));module.exports=t});