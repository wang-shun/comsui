!function(t,r){"function"==typeof define?define(function(require,exports,module){t.MyMock=r(t,exports)}):"undefined"!=typeof exports?r(t,exports):t.MyMock=r(t,{})}(this,function(t,r){var n=Array.prototype.slice,e=Object.prototype.toString,o=Array.isArray||function(t){return"[object Array]"===e.call(t)},i=function(t){return"function"==typeof t},u=function(t){return"object"==typeof t},a=function(t,r){return"1"in arguments||(r=t,t=0),Math.floor(Math.random()*r+t)},s=function(t){return u(t)&&Object.getPrototypeOf(t)==Object.prototype},c=function(t,r){for(var n in r){var e=r[n];o(e)?(t[n]=[],c(t[n],e)):s(e)?(t[n]={},c(t[n],e)):void 0!==e&&(t[n]=r[n])}},p=function(){for(var t=n.call(arguments),r=t[0],e=0,o=t.length;e<o;e++)c(r,t[e]);return r};return function(exports){var t=["abcdefghijklmnopqrstuvwxyz0123456789","其实无非是想破坏草原生态环境嘛好点子元狩年春正月赵游士进烧荒之策上大悦以国待出入同车言欢尽夜汲黯为不可听二令边民开焚 赐爵一级夏四三北冬十起狂沙越明流南侵郡耕地没人相食谷贼x自号将军攻略县杀太守长吏下千陇西天师围陈仓王败绩罪己妖谢公孙讨于荥阳所爱的题主这就当你穿到汉武帝间并力改变了历史后某些记载"],r={};r._string=function(r){r||(r=t.join(""));var n=r.split("").sort(function(){return Math.random()-.5>0});return n.slice(a(n.length)).join("")},r._boolean=function(){var t=Math.random()-.5;return t>0},r._stringEn=function(){return this._string(t[0])},r._stringZh=function(){return this._string(t[1])},r._date=function(){var t=(new Date).getFullYear()-a(0,15),r=a(0,12),n=a(0,31);return new Date(t,r,n).getTime()},r._number=function(){return a(0,9)},r._uuid=function(){return"xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,function(t){var r=16*Math.random()|0,n="x"==t?r:3&r|8;return n.toString(16)})},exports.DataCharSet={TYPES:["_string","_uuid","_date","_stringZh","_stringEn","_number","_boolean"],isTrueType:function(t){return~this.TYPES.indexOf(t)},get:function(t){return this.isTrueType(t)?r[t]():null},addDataType:function(){}}}(r),function(exports,t){var n,e=/[http(s)?|ftp]:\/\/([\w\.:]+)(\/[\s\S]*)?/,i=function(t){n||(n=document.createElement("a")),n.href=t;var r=n.href.match(e);if(r)return r[2]?r[2]:"";throw"无效的Mck URL："+t},u=function(t,r){return t.test(r)},c=function(t,r){for(var n in t)if("require"===t[n]&&null==r[n])return!1;return!0},f=function(t,r){return t===r},h={routes:{},_routes:[],route:function(t){this._routes.push(t)},decode:function(t){var r={};for(var n in t){var e=t[n],o=this.analysisUrl(n);r[o.source]={schema:e.response,httpType:e.request.type||"get",params:this.analysisParams(e.request.params),regUrl:o}}return r},analysisParams:function(t){var r={};if(!t)return r;for(var n in t)r[n]=~["require","optional"].indexOf(t[n])?t[n]:"require";return r},analysisUrl:function(t){var r=(this.root+t).replace(/\/\//g,"/").replace(/\(\/\)&/,"/?").replace(/\/:\w+/g,"/(\\w+)");return new RegExp(r+"$")},start:function(t){t||(t={}),this.root=(t.root||"/").replace(/.+\/$/,""),this.status="run";for(var r=0,n=this._routes.length;r<n;r++){var e=this.decode(this._routes[r]);p(this.routes,e)}this._routes=[]},match:function(t,r,n){if("run"!==this.status)throw"mock没有启动";var e=this.routes,o=i(t);for(var a in e){var s=e[a];if(f(s.httpType.toLowerCase(),n.toLowerCase())&&u(s.regUrl,o)&&c(s.params,r))return this.generate(s.schema)}return null},generate:function(r){var n=function(t){return~["number","string","boolean"].indexOf(typeof t)},e=function(r){var i={};if(n(r))return r;for(var u in r){var c=r[u];if(o(c)){i[u]=[];var p,f=c,h=f.length;2===c.length&&(f=[c[0]],"..."===c[1]?(p=!0,h=a(20)):h=+c[1],"number"!=typeof h?(f.push(c[1]),h=f.length):p=!0);for(var l=0;l<h;l++){var y=f[p?0:l];i[u].push(e(y))}}else s(c)?i[u]=e(c):t.isTrueType(c)?i[u]=t.get(c):i[u]=c}return i};return e(r)}};r.RespJSON=h}(r,r.DataCharSet),function(exports,t){var r=function(t,r){var n={};return"post"===t?n.type="post":"get"!==t&&"getJSON"!==t||(n.type="get"),"getJSON"===t&&(n.dataType="json"),arguments.length>2?(n.url=r,i(arguments[3])?(n.success=arguments[3],n.data=arguments[2]):(n.success=arguments[2],n.data={})):(n=r,n.type||(n.type="get")),n},e=function(){return this instanceof e?(this.proxyLib=null,this.proxyMethods=null,void this._init()):new e};e.prototype._init=function(){},e.prototype._generateResponse=function(r,n,e){var o=r[0],i=setTimeout(function(){var i=t.match(n.url,n.data,n.type);i?(n.success(i,200,o),n.complete&&n.complete(o,200)):(e&&e.apply(null,r),n.complete&&n.complete(o,404))},a(100,1e3));return i},e.prototype.isProxying=function(t){return this.proxyLib===t&&null!=this.proxyMethods},e.prototype.packLibMethod=function(t){var e=this;return function(){var o=n.call(arguments);o.unshift(t);var i=r.apply(null,o),u=i.error;i.error=function(){var t=n.call(arguments,0),r=t[0];404!=r.status?u&&u.apply(null,t):e._generateResponse(t,i,u)},e.proxyMethods.ajax.call(e.proxyLib,i)}},e.prototype.saveProxyMethods=function(t){var r=this,n={};return["ajax","get","post","getJSON"].forEach(function(e){i(t[e])&&(n[e]=t[e],t[e]=r.packLibMethod(e))}),n},e.prototype.proxy=function(t){var r=this;return r.isProxying(t)?this:(r.unproxy(),r.proxyLib=t,r.proxyMethods=this.saveProxyMethods(t),this)},e.prototype.unproxy=function(){var t=this,r=t.proxyLib,n=t.proxyMethods;for(var e in n)r[e]=n[e];return t.proxyLib=null,t.proxyMethods=null,this},exports.Mock=e}(r,r.RespJSON),r});