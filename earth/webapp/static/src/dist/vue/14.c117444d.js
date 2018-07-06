webpackJsonp([14,23],{153:function(t,e){t.exports=Highcharts},626:function(t,e,a){(function(t){"use strict";function n(t){return t&&t.__esModule?t:{default:t}}Object.defineProperty(e,"__esModule",{value:!0});var i=a(1),r=a(153),s=n(r);e.default={props:{channelData:Array},data:function(){return{type:"0"}},watch:{type:function(){this.$parent.getChannelData()},channelData:function(t){this.clearCharts();for(var e=0;e<t.length;e++){var a=this.createChart();this.setChartData(a,t[e]),this.channelCharts.push(a)}}},methods:{clearCharts:function(){(this.channelCharts||[]).forEach(function(e){t(e.container).parent().remove(),e.destroy()}),this.channelCharts=[]},setChartData:function(e,a){var n=function(e){var a=[];return t.isEmptyObject(e)&&(e.SUCCESS=0,e.FAIL=0,e.TIME_OUT=0,e.DOING=0,e.CREATE=1),a.push(["成功",e.SUCCESS]),a.push(["失败",e.FAIL]),a.push(["异常",e.TIME_OUT]),a.push(["处理中",e.DOING]),a.push(["等待处理",e.CREATE]),a},i=n(a.data);0==e.series.length?e.addSeries({data:i}):e.series[0].setData(i),e.setTitle({text:a.paymentChannelName})},createChart:function(){var e=t('<div class="draw" />'),a=t(this.$refs.container),n={credits:{enabled:!1},legend:{align:"right",verticalAlign:"top",y:-10},tooltip:{enabled:!1},chart:{type:"pie",renderTo:e.get(0)},colors:["#90ed7d","#f04f76","#f7a35c","#7cb5ec","#434348"],title:{text:"",verticalAlign:"bottom",y:-20,style:{fontSize:"12px"}},plotOptions:{pie:{allowPointSelect:!0,cursor:"pointer",size:150,dataLabels:{enabled:!1}}},series:[]};return a.append(e),new s.default.Chart(n)},handleChangeLegendType:function(e,a){var n=t(a.currentTarget),i=!!n.hasClass("invisible");t(this.channelCharts||[]).each(function(a,n){t(this.series[0].data).each(function(t,a){a.name==e&&a.setVisible(i)})}),i?n.removeClass("invisible"):n.addClass("invisible")},getChannelData:function(){return(0,i.ajaxPromise)({url:"/paymentchannel/efficentanalysis/statistics",data:{type:this.type}})}}}}).call(e,a(19))},1512:function(t,e,a){var n,i;n=a(626);var r=a(1752);i=n=n||{},"object"!=typeof n.default&&"function"!=typeof n.default||(i=n=n.default),"function"==typeof i&&(i=i.options),i.render=r.render,i.staticRenderFns=r.staticRenderFns,t.exports=n},1752:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"row"},[a("div",{staticClass:"item channel"},[a("span",{staticClass:"legend"},[a("span",{on:{click:function(e){t.handleChangeLegendType("成功",e)}}},[a("i",{staticClass:"rect",staticStyle:{background:"#90ed7d"}}),t._v("成功")]),t._v(" "),a("span",{on:{click:function(e){t.handleChangeLegendType("失败",e)}}},[a("i",{staticClass:"rect",staticStyle:{background:"#f04f76"}}),t._v("失败")]),t._v(" "),a("span",{on:{click:function(e){t.handleChangeLegendType("异常",e)}}},[a("i",{staticClass:"rect",staticStyle:{background:"#f7a35c"}}),t._v("异常")]),t._v(" "),a("span",{on:{click:function(e){t.handleChangeLegendType("处理中",e)}}},[a("i",{staticClass:"rect",staticStyle:{background:"#7cb5ec"}}),t._v("处理中")]),t._v(" "),a("span",{on:{click:function(e){t.handleChangeLegendType("等待处理",e)}}},[a("i",{staticClass:"rect",staticStyle:{background:"#434348"}}),t._v("待处理")])]),t._v(" "),a("div",{staticClass:"hd"},[a("i",{staticClass:"icon icon-circle"}),t._v(" "),a("span",[t._v("24小时通道交易统计   ")]),t._v(" "),a("select",{directives:[{name:"model",rawName:"v-model",value:t.type,expression:"type"}],staticClass:"form-control filter-channel",on:{change:function(e){t.type=Array.prototype.filter.call(e.target.options,function(t){return t.selected}).map(function(t){var e="_value"in t?t._value:t.value;return e})[0]}}},[a("option",{attrs:{value:"0"}},[t._v("收付款")]),t._v(" "),a("option",{attrs:{value:"1"}},[t._v("仅收款")]),t._v(" "),a("option",{attrs:{value:"2"}},[t._v("仅付款")])])]),t._v(" "),a("div",{ref:"container",staticClass:"bd clearfix"})])])},staticRenderFns:[]}},627:function(t,e,a){"use strict";function n(t){return t&&t.__esModule?t:{default:t}}Object.defineProperty(e,"__esModule",{value:!0});var i=a(1),r=a(153),s=n(r);e.default={props:{turnoverData:Object},data:function(){return{time:"7d"}},watch:{time:function(){this.$parent.getTurnoverData()},turnoverData:function(t){0==this.turnoverChart.series?(this.turnoverChart.addSeries({name:"付款交易额",data:t.creditAmountList}),this.turnoverChart.addSeries({name:"收款交易额",data:t.debitAmountList})):(this.turnoverChart.series[0].setData(t.creditAmountList),this.turnoverChart.series[1].setData(t.debitAmountList))}},mounted:function(){this.turnoverChart=new s.default.Chart({credits:{enabled:!1},legend:{align:"right",verticalAlign:"top",y:-10},tooltip:{enabled:!1},chart:{renderTo:this.$refs.draw,marginTop:50},colors:["#69c2e2","#ed4407"],title:{text:null},plotOptions:{line:{marker:{symbol:"circle"}}},xAxis:{lineColor:"#dedede",tickLength:0,labels:{enabled:!1}},yAxis:{lineWidth:1,tickInterval:10,lineColor:"#dedede",gridLineColor:"#cdcdcd",gridLineDashStyle:"Dash",title:{text:null}}})},methods:{getTurnoverData:function(){return(0,i.ajaxPromise)({url:"/paymentchannel/efficentanalysis/tradingVolumeTrend",data:{time:this.time}})}}}},1513:function(t,e,a){var n,i;n=a(627);var r=a(1656);i=n=n||{},"object"!=typeof n.default&&"function"!=typeof n.default||(i=n=n.default),"function"==typeof i&&(i=i.options),i.render=r.render,i.staticRenderFns=r.staticRenderFns,t.exports=n},1656:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"row"},[a("div",{staticClass:"item turnover"},[a("div",{staticClass:"hd"},[a("i",{staticClass:"icon icon-circle"}),t._v(" "),a("span",[t._v("交易额趋势   ")]),t._v(" "),a("select",{directives:[{name:"model",rawName:"v-model",value:t.time,expression:"time"}],staticClass:"form-control filter-turnover",on:{change:function(e){t.time=Array.prototype.filter.call(e.target.options,function(t){return t.selected}).map(function(t){var e="_value"in t?t._value:t.value;return e})[0]}}},[a("option",{attrs:{value:"7d"}},[t._v("最近7天")]),t._v(" "),a("option",{attrs:{value:"6m"}},[t._v("最近6个月")])])]),t._v(" "),a("div",{staticClass:"bd"},[a("div",{ref:"draw",staticClass:"draw",staticStyle:{width:"100%",height:"300px",margin:"auto","max-width":"1160px"}})])])])},staticRenderFns:[]}},628:function(t,e,a){"use strict";function n(t){return t&&t.__esModule?t:{default:t}}Object.defineProperty(e,"__esModule",{value:!0});var i=a(1),r=a(2),s=n(r),o=a(153);n(o);e.default={components:{Trend:a(1513),Statistics:a(1512)},data:function(){return{creditTotalFee:0,creditTotalTradingVolume:0,creditTransferApplicationCount:0,debitTotalFee:0,debitTotalTradingVolume:0,debitTransferApplicationCount:0,turnoverData:{},channelData:[]}},activated:function(){this.getDetailData(this.$route.params.paymentChannelUuid),this.getTurnoverData(),this.getChannelData()},methods:{getDetailData:function(t){var e=this;(0,i.ajaxPromise)({url:"/paymentchannel/efficentanalysis/data"}).then(function(t){e.detail=t}).catch(function(t){s.default.open(t)})},getTurnoverData:function(){var t=this;this.$refs.turnover.getTurnoverData().then(function(e){return t.turnoverData=e})},getChannelData:function(){var t=this;this.$refs.channel.getChannelData().then(function(e){return t.channelData=e.list})}}}},1514:function(t,e,a){var n,i;n=a(628);var r=a(1778);i=n=n||{},"object"!=typeof n.default&&"function"!=typeof n.default||(i=n=n.default),"function"==typeof i&&(i=i.options),i.render=r.render,i.staticRenderFns=r.staticRenderFns,t.exports=n},1778:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"content content-passage",attrs:{id:"financialChannelEdit"}},[a("div",{staticClass:"scroller"},[a("Breadcrumb",{attrs:{routes:[{title:"通道管理"},{title:"效率分析"}]}}),t._v(" "),a("div",{staticClass:"wrapper"},[a("div",{staticClass:"sketch"},[a("div",{staticClass:"bd"},[a("div",{staticClass:"cols"},[a("div",{staticClass:"col"},[a("p",[a("span",{staticClass:"color-warning"},[t._v(t._s(t.debitTransferApplicationCount))])]),t._v(" "),a("p",[t._v("累计收款成功笔数")])]),t._v(" "),a("div",{staticClass:"col"},[a("p",[t._v("\n        \t\t\t\t        "+t._s(t._f("formatMoney")(t.debitTotalTradingVolume))+"\n        \t\t\t\t    ")]),t._v(" "),a("p",[t._v("累计收款交易额")])]),t._v(" "),a("div",{staticClass:"col"},[a("p",[t._v("\n        \t\t\t\t        "+t._s(t._f("formatMoney")(t.debitTotalFee))+"\n        \t\t\t\t    ")]),t._v(" "),a("p",[t._v("累计收款通道费用")])]),t._v(" "),a("div",{staticClass:"col"},[a("p",[a("span",{staticClass:"color-warning"},[t._v(t._s(t.creditTransferApplicationCount))])]),t._v(" "),a("p",[t._v("累计付款成功笔数")])]),t._v(" "),a("div",{staticClass:"col"},[a("p",[t._v("\n        \t\t\t\t        "+t._s(t._f("formatMoney")(t.creditTotalTradingVolume))+"\n        \t\t\t\t    ")]),t._v(" "),a("p",[t._v("累计付款交易额")])]),t._v(" "),a("div",{staticClass:"col"},[a("p",[t._v("\n        \t\t\t\t        "+t._s(t._f("formatMoney")(t.creditTotalFee))+"\n        \t\t\t\t    ")]),t._v(" "),a("p",[t._v("累计付款通道费用")])])])])]),t._v(" "),a("div",{staticClass:"graph"},[a("Trend",{ref:"turnover",attrs:{turnoverData:t.turnoverData}}),t._v(" "),a("Statistics",{ref:"channel",attrs:{channelData:t.channelData}})])])])])},staticRenderFns:[]}}});