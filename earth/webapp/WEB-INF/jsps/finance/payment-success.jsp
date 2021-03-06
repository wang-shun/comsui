<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.zufangbao.gluon.spec.global.GlobalCodeSpec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

<fmt:setBundle basename="ApplicationMessage" />
<fmt:setLocale value="zh_CN" />

<%@ include file="/WEB-INF/include/meta.jsp"%>
<%@ include file="/WEB-INF/include/css-newlayout.jsp"%>
<title>系统线上支付单列表 - 五维金融金融管理平台</title>

</head>
<body>

	<%@ include file="/WEB-INF/include/header.jsp"%>

	<div class="web-g-main">
		<%@ include file="/WEB-INF/include/aside.jsp"%>

		<div data-commoncontent='true' class="content">
			<div class="scroller">
				<div class="lookup-params">
					<div class="inner clearfix">
						<input type="hidden" name="filter" value="true">
						<span class="item">
							<select name="financialContractIds" class="form-control real-value selectpicker" multiple data-title="信托合同项目"  data-actions-box="true">
								<c:forEach var="item" items="${financialContracts}">
									<option value="${item.id}">${item.contractName}(${item.contractNo })</option>
								</c:forEach>
							</select>
						</span> 
						<span class="item">
							<select name="paymentWay" class="form-control real-value">
								<option value="-1">支付通道</option>
								<c:forEach var="item" items="${paymentWayList}">
									<option value="${item.ordinal }">
										<fmt:message key="${item.key}" /></option>
								</c:forEach>
							</select>
						</span>
						<span class="item">
							<select name="executingDeductStatus" class="form-control real-value">
								<option value="-1">支付单状态</option>
								<c:forEach var="item" items="${executingDeductStatusList}">
									<option value="${item.ordinal }">
										<fmt:message key="${item.key}" /></option>
								</c:forEach>
							</select>
						</span>  
						<span class="item beginend-datepicker"> 
						 	<jsp:include page="/WEB-INF/include/plugins/datetimepicker.jsp">
								<jsp:param value="group" name="type" />
								<jsp:param value="startDateString" name="paramName1" />
								<jsp:param value="endDateString" name="paramName2" />
								<jsp:param value="请输入变更起始日期" name="placeHolder1" />
								<jsp:param value="请输入变更终止日期" name="placeHolder2" />
							</jsp:include>
						</span>
						<span class="item vertical-line"></span>
						<span class="item">
							<select class="form-control real-value select-key-word" name="selectKeyWord" autoquery="false">
								<option value="paymentNo">支付单号</option>
								<option value="repaymentNo">还款编号</option>
								<option value="billingNo">结算单号</option>
								<option value="accountName">账户姓名</option>
								<option value="payAcNo">银行账户号</option>
								<option value="bank">银行名称</option>
							</select>
							<input type="text" name="keyWords" class="form-control real-value input-key-words" placeholder="请输入关键字..." >
						</span>
						<span class="item">
							<button type="submit" id="lookup" class="btn btn-primary">
								查询
							</button>
						</span>
					</div>
				</div>
				<div class="table-area">
					<table class="data-list" 
						data-action="./query" 
						data-autoload="true">
						<thead>
							<tr>
								<th>支付单号</th>
								<th>结算单号</th>
								<th>银行名称</th>
								<th>账户姓名</th>
								<th>银行账户号</th>
								<th>
									<a data-paramname="amount" class="sort none">
										代扣金额<i class="icon"></i>
									</a>
								</th>
								<th>
									<a data-paramname="lastModifiedTime" class="sort none">
										状态变更时间<i class="icon"></i>
									</a>
								</th>
								<th>支付通道</th>
								<th>状态</th>
								<th width="15%">备注</th>
							</tr>
						</thead>
						<tbody>
							<script type="script/template" id="tableFieldTmpl">
							    {% _.each(list, function(item, index) { %}
							        <tr class="record-item">
							            <td>
											<a href="${ctx}/payment-manage/payment/{%= item.id %}/detail">{%= item['transferApplicationNo'] %}</a>
										</td>
							            <td>
											<a href="${ctx}/payment-manage/order/{%= item['order.id'] %}/detail">{%= item['order.orderNo'] %}</a>
										</td>
							            <td>{%= item['contractAccount.bank'] %}</td>
							            <td>{%= item['contractAccount.payerName'] %}</td>
							            <td>{%= item['contractAccount.payAcNo'] %}</td>
							            <td>{%= (+item.amount).formatMoney(2,'') %}</td>
							            <td style="max-width: 100px;">{%= item.lastModifiedTime %}</td>
							            <td>{%= item.paymentWayMsg %}</td>
							            <td>
							            	{% if(item.executingDeductStatusMsg =='异常'){ %}
												<span class="color-warning">异常</span>
											{%	}else if(item.executingDeductStatusMsg == '失败'){ %}
												<span class="color-danger">失败</span>
											{%  }else{  %}
												{%= item.executingDeductStatusMsg%}
											{%  }  %}
							            </td>
							            <td>{%= item.comment %}</td>
							        </tr>
							    {% }); %}
							</script>
						</tbody>
					</table>
				</div>
			</div>

			<div class="operations">
				<div class="lookup-params pull-left" style="background-image: none; border: none; padding: 0;">
					<form id="myForm" action="${ctx}/payment-manage/payment/exportexcel" method="POST">
						<span class="item"> 对账单导出： </span>
						<span class="item">
							<jsp:include page="/WEB-INF/include/plugins/datetimepicker.jsp">
								<jsp:param value="startDateString" name="paramName1" />
								<jsp:param value="请输入发生时间" name="placeholder1" />
								<jsp:param value="top-right" name="pickerPosition" />
							</jsp:include>
						</span>
						<span class="item">
							<label>信托合同：</label>
							<select name="financialContractId" class="form-control">
								<c:forEach var="item" items="${financialContracts}">
									<option value="${item.id }"
										${item.id eq financialContract.id ? 'selected' : ''}>${item.contractNo}</option>
								</c:forEach>
							</select>
						</span>
						<span class="item">
							<button id="exportData" class="btn btn-primary">导出对账单</button>
						</span>
						<span class="item">
							<button id="exportDailyRepaymentList" type="button" class="btn btn-primary">导出当日还款清单</button>
						</span>
					</form>
				</div>
				
                <div class="rt pull-right page-control advanced" data-page_record_num="${param.pageRecordNum}">
            		<div class="inner">
            			<a class="statistical-amount" 
	                      href="javascript: void 0;" 
	                      style="margin-right: 10px;color:#436ba7"
	                      data-container="body"
	                      data-placement="top"
	                      data-html="true"
	                      data-trigger="click"
	                      data-toggle="popover"
	                      >统计金额</a>
            			共
            			<a 
            				href="javascript: void 0;" 
            				class="total pagecontrol-show-popover"
            				data-container="body"
            				data-placement="top"
            				data-html="true"
            				data-trigger="click"
	                      	data-toggle="popover"
            			></a>
            			条
	                    <span class="nav">
	                    	<a href="javascript: void 0;" class="first-page">首页</a>
	                    	<a href="javascript: void 0;" class="prev">&lt; 上一页</a>
	                    	<span class="tip">1/页</span>
	                    	<a href="javascript: void 0;" class="next">下一页 &gt;</a>
	                    	<a href="javascript: void 0;" class="last-page">尾页</a>
	                    </span>
	                    <span class="popup-redirect-form">跳转</span>
	                </div>
		            <div class="redirect-form hide">
		                跳转至<input type="text" class="form-control page-index" name="" id="">页
		                <button class="btn btn-defalut redirect">确定</button>
		            </div>
                </div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/include/script-newlayout.jsp"%>

	<script type="text/javascript">
		$(function() {
			$("#exportDailyRepaymentList").click(function() {
				var data = $("#myForm").serialize();
				window.location.href = "${ctx}/payment-manage/payment/export/daily-return-list?" + data;
			});
		});
	</script>
</body>
</html>
