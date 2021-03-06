package com.zufangbao.earth.yunxin.web;

import static org.junit.Assert.assertTrue;

import com.zufangbao.sun.yunxin.entity.AssetSet;
import com.zufangbao.sun.yunxin.service.RepaymentPlanService;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import com.alibaba.fastjson.JSON;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.servlet.ModelAndView;

import com.demo2do.core.entity.Result;
import com.demo2do.core.utils.JsonUtils;
import com.demo2do.core.web.resolver.Page;
import com.zufangbao.sun.entity.security.Principal;
import com.zufangbao.earth.service.PrincipalService;
import com.zufangbao.earth.yunxin.web.controller.SettlementOrderController;
import com.zufangbao.sun.yunxin.SettlementStatus;
import com.zufangbao.sun.yunxin.entity.GuaranteeStatus;
import com.zufangbao.sun.yunxin.entity.SettlementOrder;
import com.zufangbao.sun.yunxin.entity.model.SettlementOrderQueryModel;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {

		"classpath:/local/applicationContext-*.xml",
		"classpath:/DispatcherServlet.xml" })
@TransactionConfiguration(defaultRollback = true)
@Transactional()
@WebAppConfiguration(value="webapp")
public class SettlementOrderControllerTest extends
		AbstractTransactionalJUnit4SpringContextTests {

	private SettlementOrderController settlementOrderController;

	@Autowired
	private PrincipalService principalService;

	@Autowired
	private RepaymentPlanService repaymentPlanService;

	@Before
	public void init() {
		settlementOrderController = this.applicationContext
				.getBean(SettlementOrderController.class);
	}

	@Test
	@Sql("classpath:test/testSettlementOrder.sql")
	public void testSettlementOrder() {
		MockHttpServletRequest request = new MockHttpServletRequest();
		Page page = new Page(1, 12);
		Principal principal = principalService.load(Principal.class, 1l);
		SettlementOrderQueryModel model = new SettlementOrderQueryModel();
		model.setFinancialContractIds("[1]");
		String resultString = settlementOrderController.querySettlementOrder(request, model, principal, page);
		Result result = JsonUtils.parse(resultString, Result.class);
		assertTrue(result.isValid());
		List<SettlementOrder> settlementOrderList = JsonUtils.parseArray(result.get("list").toString(),SettlementOrder.class);
		SettlementOrder settlementOrder = settlementOrderList.get(0);
		Assert.assertEquals(null, settlementOrder.getComment());
		Assert.assertEquals(new BigDecimal("0.00"),
				settlementOrder.getSettlementAmount());
		Assert.assertEquals(new String("qs123456"),
				settlementOrder.getSettleOrderNo());
		Assert.assertEquals(new String("bc123456"),
				settlementOrder.getGuaranteeOrderNo());
		Assert.assertEquals(new BigDecimal("0.00"),
				settlementOrder.getOverduePenalty());

	}

	@Test
	@Sql("classpath:test/testQuerySettlementOrder.sql")
	public void testQuerySettlementOrder() {

		MockHttpServletRequest request = new MockHttpServletRequest();
		request.setQueryString("21323");
		Page page = new Page(1, 12);

		SettlementOrderQueryModel settlementOrderQueryModel = new SettlementOrderQueryModel("[1]",
				0, "qs123456", "DKHD-001-01", "anmeitu");
		Principal principal = principalService.load(Principal.class, 1l);
		String resultString = settlementOrderController
				.querySettlementOrder(request, settlementOrderQueryModel,
						principal, page);
		Result result = JsonUtils.parse(resultString, Result.class);
		assertTrue(result.isValid());
		List<SettlementOrder> settlementOrderList = JsonUtils.parseArray(result.get("list").toString(),SettlementOrder.class);
		SettlementOrder settlementOrder = settlementOrderList.get(0);
		Assert.assertEquals(null, settlementOrder.getComment());
		Assert.assertEquals(new BigDecimal("0.00"),
				settlementOrder.getSettlementAmount());
		Assert.assertEquals(new String("qs123456"),
				settlementOrder.getSettleOrderNo());
		Assert.assertEquals(new String("bc123456"),
				settlementOrder.getGuaranteeOrderNo());
		Assert.assertEquals(new BigDecimal("0.00"),
				settlementOrder.getOverduePenalty());

	}

	@Test
	@Sql("classpath:test/testQuerySettlementOrder.sql")
	public void testShowSettlementOrderDetail() {
		Principal principal = principalService.load(Principal.class, 1l);
		String json = settlementOrderController.getSettlementOrderDetail(1L, principal);
		Result result = JSON.parseObject(json, Result.class);
		Map<String,Object> params = result.getData();
		SettlementOrder settlementOrder =JSON.parseObject( JSON.toJSONString(params.get("settlementOrder")),SettlementOrder.class);
		Assert.assertEquals(null, settlementOrder.getComment());
		Assert.assertEquals(new BigDecimal("0.00"),settlementOrder.getSettlementAmount());
		Assert.assertEquals("qs123456",settlementOrder.getSettleOrderNo());
		Assert.assertEquals("bc123456",settlementOrder.getGuaranteeOrderNo());
		Assert.assertEquals(new BigDecimal("0.00"),settlementOrder.getOverduePenalty());
		AssetSet assetSet = repaymentPlanService.getUniqueRepaymentPlanByUuid(settlementOrder.getAssetSetUuid());
		Assert.assertEquals(GuaranteeStatus.fromValue(0), assetSet.getGuaranteeStatus());
		Assert.assertEquals(SettlementStatus.formValue(0), assetSet.getSettlementStatus());
	}

}
