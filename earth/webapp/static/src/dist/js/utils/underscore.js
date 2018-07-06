(function(){function n(n){function t(t,r,e,u,i,o){for(;i>=0&&i<o;i+=n){var a=u?u[i]:i;e=r(e,t[a],a,t)}return e}return function(r,e,u,i){if(null==r)return u;e=d(e,i,4);var o=r.length!==+r.length&&y.keys(r),a=(o||r).length,l=n>0?0:a-1;return arguments.length<3&&(u=r[o?o[l]:l],l+=n),t(r,e,u,o,l,a)}}function t(n,t){for(var r=k.length,e="function"==typeof n.constructor?o:i;r--;){var u=k[r];("constructor"===u?y.has(n,u):u in n&&n[u]!==e[u]&&!y.contains(t,u))&&t.push(u)}}var r=this,e=r._,u=Array.prototype,i=Object.prototype,o=Function.prototype,a=u.push,l=u.slice,c=i.toString,f=i.hasOwnProperty,s=Array.isArray,p=Object.keys,h=o.bind,v=Object.create,g=function(){},y=function(n){return n instanceof y?n:this instanceof y?void(this._wrapped=n):new y(n)};"undefined"!=typeof exports?("undefined"!=typeof module&&module.exports&&(exports=module.exports=y),exports._=y):r._=y,y.VERSION="1.7.0";var d=function(n,t,r){if(void 0===t)return n;switch(null==r?3:r){case 1:return function(r){return n.call(t,r)};case 2:return function(r,e){return n.call(t,r,e)};case 3:return function(r,e,u){return n.call(t,r,e,u)};case 4:return function(r,e,u,i){return n.call(t,r,e,u,i)}}return function(){return n.apply(t,arguments)}},m=function(n,t,r){return null==n?y.identity:y.isFunction(n)?d(n,t,r):y.isObject(n)?y.matches(n):y.property(n)};y.iteratee=function(n,t){return m(n,t,1/0)};var b=function(n){return function(t){var r=arguments.length;if(r<2||null==t)return t;for(var e=0;e<r;e++)for(var u=arguments[e],i=n(u),o=i.length,a=0;a<o;a++){var l=i[a];t[l]=u[l]}return t}},j=function(n){if(!y.isObject(n))return{};if(v)return v(n);g.prototype=n;var t=new g;return g.prototype=null,t};y.each=y.forEach=function(n,t,r){if(null==n)return n;t=d(t,r);var e,u=n.length;if(u===+u)for(e=0;e<u;e++)t(n[e],e,n);else{var i=y.keys(n);for(e=0,u=i.length;e<u;e++)t(n[i[e]],i[e],n)}return n},y.map=y.collect=function(n,t,r){if(null==n)return[];t=m(t,r);for(var e,u=n.length!==+n.length&&y.keys(n),i=(u||n).length,o=Array(i),a=0;a<i;a++)e=u?u[a]:a,o[a]=t(n[e],e,n);return o},y.reduce=y.foldl=y.inject=n(1),y.reduceRight=y.foldr=n(-1),y.transform=function(n,t,r,e){if(null==r)if(y.isArray(n))r=[];else if(y.isObject(n)){var u=n.constructor;r=j("function"==typeof u&&u.prototype)}else r={};if(null==n)return r;t=d(t,e,4);var i,o,a=n.length!==+n.length&&y.keys(n),l=(a||n).length;for(i=0;i<l&&(o=a?a[i]:i,t(r,n[o],o,n)!==!1);i++);return r},y.find=y.detect=function(n,t,r){var e;if(e=n.length===+n.length?y.findIndex(n,t,r):y.findKey(n,t,r),void 0!==e&&e!==-1)return n[e]},y.filter=y.select=function(n,t,r){var e=[];return null==n?e:(t=m(t,r),y.each(n,function(n,r,u){t(n,r,u)&&e.push(n)}),e)},y.reject=function(n,t,r){return y.filter(n,y.negate(m(t)),r)},y.every=y.all=function(n,t,r){if(null==n)return!0;t=m(t,r);var e,u,i=n.length!==+n.length&&y.keys(n),o=(i||n).length;for(e=0;e<o;e++)if(u=i?i[e]:e,!t(n[u],u,n))return!1;return!0},y.some=y.any=function(n,t,r){if(null==n)return!1;t=m(t,r);var e,u,i=n.length!==+n.length&&y.keys(n),o=(i||n).length;for(e=0;e<o;e++)if(u=i?i[e]:e,t(n[u],u,n))return!0;return!1},y.contains=y.includes=y.include=function(n,t,r){return null!=n&&(n.length!==+n.length&&(n=y.values(n)),y.indexOf(n,t,"number"==typeof r&&r)>=0)},y.invoke=function(n,t){var r=l.call(arguments,2),e=y.isFunction(t);return y.map(n,function(n){var u=e?t:n[t];return null==u?u:u.apply(n,r)})},y.pluck=function(n,t){return y.map(n,y.property(t))},y.where=function(n,t){return y.filter(n,y.matches(t))},y.findWhere=function(n,t){return y.find(n,y.matches(t))},y.max=function(n,t,r){var e,u,i=-(1/0),o=-(1/0);if(null==t&&null!=n){n=n.length===+n.length?n:y.values(n);for(var a=0,l=n.length;a<l;a++)e=n[a],e>i&&(i=e)}else t=m(t,r),y.each(n,function(n,r,e){u=t(n,r,e),(u>o||u===-(1/0)&&i===-(1/0))&&(i=n,o=u)});return i},y.min=function(n,t,r){var e,u,i=1/0,o=1/0;if(null==t&&null!=n){n=n.length===+n.length?n:y.values(n);for(var a=0,l=n.length;a<l;a++)e=n[a],e<i&&(i=e)}else t=m(t,r),y.each(n,function(n,r,e){u=t(n,r,e),(u<o||u===1/0&&i===1/0)&&(i=n,o=u)});return i},y.shuffle=function(n){for(var t,r=n&&n.length===+n.length?n:y.values(n),e=r.length,u=Array(e),i=0;i<e;i++)t=y.random(0,i),t!==i&&(u[i]=u[t]),u[t]=r[i];return u},y.sample=function(n,t,r){return null==t||r?(n.length!==+n.length&&(n=y.values(n)),n[y.random(n.length-1)]):y.shuffle(n).slice(0,Math.max(0,t))},y.sortBy=function(n,t,r){return t=m(t,r),y.pluck(y.map(n,function(n,r,e){return{value:n,index:r,criteria:t(n,r,e)}}).sort(function(n,t){var r=n.criteria,e=t.criteria;if(r!==e){if(r>e||void 0===r)return 1;if(r<e||void 0===e)return-1}return n.index-t.index}),"value")};var _=function(n){return function(t,r,e){var u={};return r=m(r,e),y.each(t,function(e,i){var o=r(e,i,t);n(u,e,o)}),u}};y.groupBy=_(function(n,t,r){y.has(n,r)?n[r].push(t):n[r]=[t]}),y.indexBy=_(function(n,t,r){n[r]=t}),y.countBy=_(function(n,t,r){y.has(n,r)?n[r]++:n[r]=1}),y.toArray=function(n){return n?y.isArray(n)?l.call(n):n.length===+n.length?y.map(n,y.identity):y.values(n):[]},y.size=function(n){return null==n?0:n.length===+n.length?n.length:y.keys(n).length},y.partition=function(n,t,r){t=m(t,r);var e=[],u=[];return y.each(n,function(n,r,i){(t(n,r,i)?e:u).push(n)}),[e,u]},y.first=y.head=y.take=function(n,t,r){if(null!=n)return null==t||r?n[0]:y.initial(n,n.length-t)},y.initial=function(n,t,r){return l.call(n,0,Math.max(0,n.length-(null==t||r?1:t)))},y.last=function(n,t,r){if(null!=n)return null==t||r?n[n.length-1]:y.rest(n,Math.max(0,n.length-t))},y.rest=y.tail=y.drop=function(n,t,r){return l.call(n,null==t||r?1:t)},y.compact=function(n){return y.filter(n,y.identity)};var x=function(n,t,r,e){for(var u,i=[],o=0,a=e||0,l=n&&n.length;a<l;a++)if(u=n[a],u&&u.length>=0&&(y.isArray(u)||y.isArguments(u))){t||(u=x(u,t,r));var c=0,f=u.length;for(i.length+=f;c<f;)i[o++]=u[c++]}else r||(i[o++]=u);return i};y.flatten=function(n,t){return x(n,t,!1)},y.without=function(n){return y.difference(n,l.call(arguments,1))},y.uniq=y.unique=function(n,t,r,e){if(null==n)return[];y.isBoolean(t)||(e=r,r=t,t=!1),null!=r&&(r=m(r,e));for(var u=[],i=[],o=0,a=n.length;o<a;o++){var l=n[o],c=r?r(l,o,n):l;t?(o&&i===c||u.push(l),i=c):r?y.contains(i,c)||(i.push(c),u.push(l)):y.contains(u,l)||u.push(l)}return u},y.union=function(){return y.uniq(x(arguments,!0,!0))},y.intersection=function(n){if(null==n)return[];for(var t=[],r=arguments.length,e=0,u=n.length;e<u;e++){var i=n[e];if(!y.contains(t,i)){for(var o=1;o<r&&y.contains(arguments[o],i);o++);o===r&&t.push(i)}}return t},y.difference=function(n){var t=x(arguments,!0,!0,1);return y.filter(n,function(n){return!y.contains(t,n)})},y.zip=function(n){if(null==n)return[];for(var t=y.max(arguments,"length").length,r=Array(t);t-- >0;)r[t]=y.pluck(arguments,t);return r},y.unzip=function(n){return y.zip.apply(null,n)},y.object=function(n,t){if(null==n)return{};for(var r={},e=0,u=n.length;e<u;e++)t?r[n[e]]=t[e]:r[n[e][0]]=n[e][1];return r},y.indexOf=function(n,t,r){var e=0,u=n&&n.length;if("number"==typeof r)e=r<0?Math.max(0,u+r):r;else if(r&&u)return e=y.sortedIndex(n,t),n[e]===t?e:-1;for(;e<u;e++)if(n[e]===t)return e;return-1},y.lastIndexOf=function(n,t,r){var e=n?n.length:0;for("number"==typeof r&&(e=r<0?e+r+1:Math.min(e,r+1));--e>=0;)if(n[e]===t)return e;return-1},y.findIndex=function(n,t,r){t=m(t,r);for(var e=null!=n?n.length:0,u=0;u<e;u++)if(t(n[u],u,n))return u;return-1},y.sortedIndex=function(n,t,r,e){r=m(r,e,1);for(var u=r(t),i=0,o=n.length;i<o;){var a=Math.floor((i+o)/2);r(n[a])<u?i=a+1:o=a}return i},y.range=function(n,t,r){arguments.length<=1&&(t=n||0,n=0),r=r||1;for(var e=Math.max(Math.ceil((t-n)/r),0),u=Array(e),i=0;i<e;i++,n+=r)u[i]=n;return u};var w=function(n,t,r,e,u){if(!(e instanceof t))return n.apply(r,u);var i=j(n.prototype),o=n.apply(i,u);return y.isObject(o)?o:i};y.bind=function(n,t){if(h&&n.bind===h)return h.apply(n,l.call(arguments,1));if(!y.isFunction(n))throw new TypeError("Bind must be called on a function");var r=l.call(arguments,2);return function e(){return w(n,e,t,this,r.concat(l.call(arguments)))}},y.partial=function(n){var t=l.call(arguments,1);return function r(){for(var e=0,u=t.slice(),i=0,o=u.length;i<o;i++)u[i]===y&&(u[i]=arguments[e++]);for(;e<arguments.length;)u.push(arguments[e++]);return w(n,r,this,this,u)}},y.bindAll=function(n){var t,r,e=arguments.length;if(e<=1)throw new Error("bindAll must be passed function names");for(t=1;t<e;t++)r=arguments[t],n[r]=y.bind(n[r],n);return n},y.memoize=function(n,t){var r=function(e){var u=r.cache,i=""+(t?t.apply(this,arguments):e);return y.has(u,i)||(u[i]=n.apply(this,arguments)),u[i]};return r.cache={},r},y.delay=function(n,t){var r=l.call(arguments,2);return setTimeout(function(){return n.apply(null,r)},t)},y.defer=y.partial(y.delay,y,1),y.throttle=function(n,t,r){var e,u,i,o=null,a=0;r||(r={});var l=function(){a=r.leading===!1?0:y.now(),o=null,i=n.apply(e,u),o||(e=u=null)};return function(){var c=y.now();a||r.leading!==!1||(a=c);var f=t-(c-a);return e=this,u=arguments,f<=0||f>t?(o&&(clearTimeout(o),o=null),a=c,i=n.apply(e,u),o||(e=u=null)):o||r.trailing===!1||(o=setTimeout(l,f)),i}},y.debounce=function(n,t,r){var e,u,i,o,a,l=function(){var c=y.now()-o;c<t&&c>=0?e=setTimeout(l,t-c):(e=null,r||(a=n.apply(i,u),e||(i=u=null)))};return function(){i=this,u=arguments,o=y.now();var c=r&&!e;return e||(e=setTimeout(l,t)),c&&(a=n.apply(i,u),i=u=null),a}},y.wrap=function(n,t){return y.partial(t,n)},y.negate=function(n){return function(){return!n.apply(this,arguments)}},y.compose=function(){var n=arguments,t=n.length-1;return function(){for(var r=t,e=n[t].apply(this,arguments);r--;)e=n[r].call(this,e);return e}},y.after=function(n,t){return function(){if(--n<1)return t.apply(this,arguments)}},y.before=function(n,t){var r;return function(){return--n>0&&(r=t.apply(this,arguments)),n<=1&&(t=null),r}},y.once=y.partial(y.before,2);var A=!{toString:null}.propertyIsEnumerable("toString"),k=["constructor","valueOf","isPrototypeOf","toString","propertyIsEnumerable","hasOwnProperty","toLocaleString"];y.keys=function(n){if(!y.isObject(n))return[];if(p)return p(n);var r=[];for(var e in n)y.has(n,e)&&r.push(e);return A&&t(n,r),r},y.keysIn=function(n){if(!y.isObject(n))return[];var r=[];for(var e in n)r.push(e);return A&&t(n,r),r},y.values=function(n){for(var t=y.keys(n),r=t.length,e=Array(r),u=0;u<r;u++)e[u]=n[t[u]];return e},y.pairs=function(n){for(var t=y.keys(n),r=t.length,e=Array(r),u=0;u<r;u++)e[u]=[t[u],n[t[u]]];return e},y.invert=function(n){for(var t={},r=y.keys(n),e=0,u=r.length;e<u;e++)t[n[r[e]]]=r[e];return t},y.functions=y.methods=function(n){var t=[];for(var r in n)y.isFunction(n[r])&&t.push(r);return t.sort()},y.extend=b(y.keysIn),y.assign=b(y.keys),y.findKey=function(n,t,r){t=m(t,r);for(var e,u=y.keys(n),i=0,o=u.length;i<o;i++)if(e=u[i],t(n[e],e,n))return e},y.pick=function(n,t,r){var e,u={};if(null==n)return u;if(y.isFunction(t)){t=d(t,r);for(e in n){var i=n[e];t(i,e,n)&&(u[e]=i)}}else{var o=x(arguments,!1,!1,1);n=new Object(n);for(var a=0,l=o.length;a<l;a++)e=o[a],e in n&&(u[e]=n[e])}return u},y.omit=function(n,t,r){if(y.isFunction(t))t=y.negate(t);else{var e=y.map(x(arguments,!1,!1,1),String);t=function(n,t){return!y.contains(e,t)}}return y.pick(n,t,r)},y.defaults=function(n){if(!y.isObject(n))return n;for(var t=1,r=arguments.length;t<r;t++){var e=arguments[t];for(var u in e)void 0===n[u]&&(n[u]=e[u])}return n},y.create=function(n,t){var r=j(n);return t&&y.assign(r,t),r},y.clone=function(n){return y.isObject(n)?y.isArray(n)?n.slice():y.extend({},n):n},y.tap=function(n,t){return t(n),n};var O=function(n,t,r,e){if(n===t)return 0!==n||1/n===1/t;if(null==n||null==t)return n===t;n instanceof y&&(n=n._wrapped),t instanceof y&&(t=t._wrapped);var u=c.call(n);if(u!==c.call(t))return!1;switch(u){case"[object RegExp]":case"[object String]":return""+n==""+t;case"[object Number]":return+n!==+n?+t!==+t:0===+n?1/+n===1/t:+n===+t;case"[object Date]":case"[object Boolean]":return+n===+t}var i="[object Array]"===u;if(!i){if("object"!=typeof n||"object"!=typeof t)return!1;var o=n.constructor,a=t.constructor;if(o!==a&&!(y.isFunction(o)&&o instanceof o&&y.isFunction(a)&&a instanceof a)&&"constructor"in n&&"constructor"in t)return!1}r=r||[],e=e||[];for(var l=r.length;l--;)if(r[l]===n)return e[l]===t;if(r.push(n),e.push(t),i){if(l=n.length,l!==t.length)return!1;for(;l--;)if(!O(n[l],t[l],r,e))return!1}else{var f,s=y.keys(n);if(l=s.length,y.keys(t).length!==l)return!1;for(;l--;)if(f=s[l],!y.has(t,f)||!O(n[f],t[f],r,e))return!1}return r.pop(),e.pop(),!0};y.isEqual=function(n,t){return O(n,t)},y.isEmpty=function(n){if(null==n)return!0;if(y.isArray(n)||y.isString(n)||y.isArguments(n))return 0===n.length;for(var t in n)if(y.has(n,t))return!1;return!0},y.isElement=function(n){return!(!n||1!==n.nodeType)},y.isArray=s||function(n){return"[object Array]"===c.call(n)},y.isObject=function(n){var t=typeof n;return"function"===t||"object"===t&&!!n},y.each(["Arguments","Function","String","Number","Date","RegExp","Error"],function(n){y["is"+n]=function(t){return c.call(t)==="[object "+n+"]"}}),y.isArguments(arguments)||(y.isArguments=function(n){return y.has(n,"callee")}),"function"!=typeof/./&&"object"!=typeof Int8Array&&(y.isFunction=function(n){return"function"==typeof n||!1}),y.isFinite=function(n){return isFinite(n)&&!isNaN(parseFloat(n))},y.isNaN=function(n){return y.isNumber(n)&&n!==+n},y.isBoolean=function(n){return n===!0||n===!1||"[object Boolean]"===c.call(n)},y.isNull=function(n){return null===n},y.isUndefined=function(n){return void 0===n},y.has=function(n,t){return null!=n&&f.call(n,t)},y.noConflict=function(){return r._=e,this},y.identity=function(n){return n},y.constant=function(n){return function(){return n}},y.noop=function(){},y.property=function(n){return function(t){return null==t?void 0:t[n]}},y.propertyOf=function(n){return null==n?function(){}:function(t){return n[t]}},y.matches=function(n){var t=y.pairs(n),r=t.length;return function(n){if(null==n)return!r;n=new Object(n);for(var e=0;e<r;e++){var u=t[e],i=u[0];if(u[1]!==n[i]||!(i in n))return!1}return!0}},y.times=function(n,t,r){var e=Array(Math.max(0,n));t=d(t,r,1);for(var u=0;u<n;u++)e[u]=t(u);return e},y.random=function(n,t){return null==t&&(t=n,n=0),n+Math.floor(Math.random()*(t-n+1))},y.now=Date.now||function(){return(new Date).getTime()};var F={"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#x27;","`":"&#x60;"},E=y.invert(F),S=function(n){var t=function(t){return n[t]},r="(?:"+y.keys(n).join("|")+")",e=RegExp(r),u=RegExp(r,"g");return function(n){return n=null==n?"":""+n,e.test(n)?n.replace(u,t):n}};y.escape=S(F),y.unescape=S(E),y.result=function(n,t,r){var e=null==n?void 0:n[t];return void 0===e&&(e=r),y.isFunction(e)?e.call(n):e};var I=0;y.uniqueId=function(n){var t=++I+"";return n?n+t:t},y.templateSettings={evaluate:/<%([\s\S]+?)%>/g,interpolate:/<%=([\s\S]+?)%>/g,escape:/<%-([\s\S]+?)%>/g};var M=/(.)^/,B={"'":"'","\\":"\\","\r":"r","\n":"n","\u2028":"u2028","\u2029":"u2029"},N=/\\|'|\r|\n|\u2028|\u2029/g,T=function(n){return"\\"+B[n]};y.template=function(n,t,r){!t&&r&&(t=r),t=y.defaults({},t,y.templateSettings);var e=RegExp([(t.escape||M).source,(t.interpolate||M).source,(t.evaluate||M).source].join("|")+"|$","g"),u=0,i="__p+='";n.replace(e,function(t,r,e,o,a){return i+=n.slice(u,a).replace(N,T),u=a+t.length,r?i+="'+\n((__t=("+r+"))==null?'':_.escape(__t))+\n'":e?i+="'+\n((__t=("+e+"))==null?'':__t)+\n'":o&&(i+="';\n"+o+"\n__p+='"),t}),i+="';\n",t.variable||(i="with(obj||{}){\n"+i+"}\n"),i="var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};\n"+i+"return __p;\n";try{var o=new Function(t.variable||"obj","_",i)}catch(n){throw n.source=i,n}var a=function(n){return o.call(this,n,y)},l=t.variable||"obj";return a.source="function("+l+"){\n"+i+"}",a},y.chain=function(n){var t=y(n);return t._chain=!0,t};var R=function(n,t){return n._chain?y(t).chain():t};y.mixin=function(n){y.each(y.functions(n),function(t){var r=y[t]=n[t];y.prototype[t]=function(){var n=[this._wrapped];return a.apply(n,arguments),R(this,r.apply(y,n))}})},y.mixin(y),y.each(["pop","push","reverse","shift","sort","splice","unshift"],function(n){var t=u[n];y.prototype[n]=function(){var r=this._wrapped;return t.apply(r,arguments),"shift"!==n&&"splice"!==n||0!==r.length||delete r[0],R(this,r)}}),y.each(["concat","join","slice"],function(n){var t=u[n];y.prototype[n]=function(){return R(this,t.apply(this._wrapped,arguments))}}),y.prototype.value=function(){return this._wrapped},"function"==typeof define&&define.amd&&define("underscore",[],function(){return y})}).call(this);