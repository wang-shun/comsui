package com.zufangbao.earth.yunxin.handler;

import com.demo2do.core.persistence.support.Filter;
import com.suidifu.hathaway.job.Priority;
import com.zufangbao.sun.entity.account.AccountSide;
import com.zufangbao.sun.entity.account.VirtualAccount;
import com.zufangbao.sun.entity.account.special.account.SpecialAccount;
import com.zufangbao.sun.entity.account.special.account.SpecialAccountFlow;
import com.zufangbao.sun.entity.repayment.order.RefundOrder;
import com.zufangbao.sun.entity.repayment.order.RefundStatus;
import com.zufangbao.sun.entity.repayment.order.RefundType;
import com.zufangbao.sun.ledgerbook.ChartOfAccount;
import com.zufangbao.sun.ledgerbook.LedgerBook;
import com.zufangbao.sun.ledgerbook.LedgerItem;
import com.zufangbao.sun.ledgerbook.LedgerItemService;
import com.zufangbao.sun.service.LedgerBookService;
import com.zufangbao.sun.service.RefundOrderService;
import com.zufangbao.sun.service.VirtualAccountService;
import com.zufangbao.sun.yunxin.entity.api.AssetRefundMode;
import com.zufangbao.sun.yunxin.service.account.SpecialAccountFlowService;
import com.zufangbao.sun.yunxin.service.account.SpecialAccountService;
import com.zufangbao.wellsfargo.silverpool.cashauditing.entity.voucher.*;
import com.zufangbao.wellsfargo.silverpool.cashauditing.handler.AutoRecoverAssesNoSession;
import com.zufangbao.wellsfargo.silverpool.cashauditing.service.JournalVoucherService;
import com.zufangbao.wellsfargo.yunxin.handler.RefundOrderHandler;
import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {

        "classpath:/local/applicationContext-*.xml",
        "classpath:/DispatcherServlet.xml"})

@WebAppConfiguration(value="webapp")
@Transactional
@Rollback(true)
public class RefundOrderHandlerTest extends AbstractTransactionalJUnit4SpringContextTests{

	@Autowired
	private RefundOrderHandler refundOrderHandler ;
	
	@Autowired
	private RefundOrderService refundOrderService;
	
	@Autowired
	private VirtualAccountService virtualAccountService;
	
	@Autowired
	private JournalVoucherService journalVoucherService;

	@Autowired
	private SpecialAccountService specialAccountService;
	
	@Autowired
	private SpecialAccountFlowService specialAccountFlowService;
	
	@Autowired
	private LedgerItemService ledgerItemService;
	
	@Autowired
	private LedgerBookService ledgerBookService;
	
	@Autowired
	private AutoRecoverAssesNoSession autoRecoverAssesNoSession;
	
	@Before
	public void setUp() {
	}
	
	@Test
	@Sql("classpath:test/yunxin/refundOrder/test_asset_create_refund.sql")
	public void testCreateRefundOrder() {
		
		String contractUuid = "contract_uuid_1";
		AssetRefundMode assetRefundMode = new AssetRefundMode();
		assetRefundMode.setAssetUuid("asset_uuid_1");
		assetRefundMode.setContractId(new Long("1"));
		assetRefundMode.setInterest(new BigDecimal("50"));
		assetRefundMode.setLateFee(new BigDecimal("0"));
		assetRefundMode.setLateOtherCost(new BigDecimal("0"));
		assetRefundMode.setLatePenalty(new BigDecimal("0"));
		assetRefundMode.setMaintenanceCharge(new BigDecimal("0"));
		assetRefundMode.setPenaltyFee(new BigDecimal("0"));
		assetRefundMode.setOtherCharge(new BigDecimal("0"));
		assetRefundMode.setPrincipal(new BigDecimal("300"));
		assetRefundMode.setRemark("hahaha");
		assetRefundMode.setRepaymentPlanNo("repayment_plan_no_1");
		assetRefundMode.setServiceCharge(new BigDecimal("0"));
		assetRefundMode.setTotalAmount(new BigDecimal("350"));
		
		refundOrderHandler.createRefundOrder(assetRefundMode, contractUuid);
		
		VirtualAccount virtualAccount = virtualAccountService.getVirtualAccountByCustomerUuid("customerUuid1");
		
		List<RefundOrder> refundOrderList = refundOrderService.loadAll(RefundOrder.class);
		RefundOrder refundOrder = refundOrderList.get(0);
		
		assertEquals(1, refundOrderList.size());
		
		assertEquals(virtualAccount.getVirtualAccountAlias(), refundOrder.getAccountName());
		assertEquals(virtualAccount.getVirtualAccountNo(), refundOrder.getAccountNo());
		assertEquals(new BigDecimal("350"), refundOrder.getAmount());
		assertEquals("asset_uuid_1", refundOrder.getAssetUuid());
		assertEquals("contract_uuid_1", refundOrder.getContractUuid());
		assertEquals("financial_contract_uuid_1", refundOrder.getFinancialContractUuid());
		assertEquals(new BigDecimal("50"), refundOrder.getInterest());
		assertEquals(new BigDecimal("300"), refundOrder.getPrincipal());
		assertEquals("repayment_plan_no_1", refundOrder.getRefundAssetNo());
		assertEquals(RefundStatus.CREATED, refundOrder.getRefundStatus());
		assertEquals(RefundType.ASSET_REFUND, refundOrder.getRefundType());
		assertEquals("hahaha", refundOrder.getRemark());
		
	}
	
	
	//退款测试  正常流程 （部分还款）
	@Test
	@Sql("classpath:test/yunxin/refundOrder/test_asset_refund.sql")
	public void testAssetRefund(){
		
		String contractUuid = "contract_uuid_1";
		AssetRefundMode assetRefundMode = new AssetRefundMode();
		assetRefundMode.setAssetUuid("asset_uuid_1");
		assetRefundMode.setContractId(new Long("1"));
		assetRefundMode.setInterest(new BigDecimal("50"));
		assetRefundMode.setLateFee(new BigDecimal("0"));
		assetRefundMode.setLateOtherCost(new BigDecimal("0"));
		assetRefundMode.setLatePenalty(new BigDecimal("0"));
		assetRefundMode.setMaintenanceCharge(new BigDecimal("0"));
		assetRefundMode.setPenaltyFee(new BigDecimal("0"));
		assetRefundMode.setOtherCharge(new BigDecimal("0"));
		assetRefundMode.setPrincipal(new BigDecimal("300"));
		assetRefundMode.setRemark("hahaha");
		assetRefundMode.setRepaymentPlanNo("repayment_plan_no_1");
		assetRefundMode.setServiceCharge(new BigDecimal("0"));
		assetRefundMode.setTotalAmount(new BigDecimal("350"));
		
		SpecialAccount beneficiary_specialaccount_before = specialAccountService.get("3d74b21b-7d4f-49cf-808e-ebe6c2372d78"); //还款户
		SpecialAccount parent_beneficiary_specialaccount_before = specialAccountService.get("3d74b21b-7d4f-49cf-808e-ebe6c2372d72"); //还款户  父
		SpecialAccount independent_specialaccount_before = specialAccountService.get("52aae60c-2aa2-4dda-9079-e63aef2c45d5"); //客户账户
		
		assertEquals(new BigDecimal("2000.00"), beneficiary_specialaccount_before.getBalance());
		assertEquals(new BigDecimal("3000.00"), parent_beneficiary_specialaccount_before.getBalance());
		
		RefundOrder refundOrder = refundOrderService.queryRefundOrderByRefundOrderUuid("refund_order_uuid");
		
		List<LedgerItem> beforeLedgerItemList = ledgerItemService.list(LedgerItem.class,new Filter());
	    assertEquals(7,beforeLedgerItemList.size());
	    
	    VirtualAccount virtualAccount = virtualAccountService.getVirtualAccountByCustomerUuid("customerUuid1");
	    assertEquals(new BigDecimal("500.00"),virtualAccount.getTotalBalance());
		
		refundOrderHandler.handleAssetRefund(contractUuid,refundOrder.getUuid(), assetRefundMode, Priority.High.getPriority());
		
		//退款记录
		List<JournalVoucher> journalVoucherList = journalVoucherService.loadAll(JournalVoucher.class);
		assertEquals(1, journalVoucherList.size());
		
		JournalVoucher journalVoucher = journalVoucherList.get(0);
		assertEquals(AccountSide.DEBIT, journalVoucher.getAccountSide());
		assertEquals(null, journalVoucher.getBankIdentity());
		assertEquals(null, journalVoucher.getBatchUuid());
		assertEquals("asset_uuid_1", journalVoucher.getBillingPlanUuid());
		assertEquals(new BigDecimal("350.00"), journalVoucher.getBookingAmount());
		assertEquals("", journalVoucher.getBusinessVoucherTypeUuid());
		assertEquals(refundOrder.getUuid(), journalVoucher.getBusinessVoucherUuid());
		
		assertEquals(JournalVoucherCheckingLevel.AUTO_BOOKING, journalVoucher.getCheckingLevel());
		assertEquals(new Long("1"), journalVoucher.getCompanyId());
		assertEquals(null, journalVoucher.getCompleteness());
		assertEquals(CounterAccountType.VirtualAccount, journalVoucher.getCounterAccountType());
		assertEquals("testaccount", journalVoucher.getCounterPartyAccount());
		assertEquals("owner_name", journalVoucher.getCounterPartyName());
//		assertEquals(JournalVoucherType.REFUND_VOUCHER, journalVoucher.getJournalVoucherType());
		assertEquals(null, journalVoucher.getSettlementModes());
		
		assertEquals(JournalVoucherStatus.VOUCHER_ISSUED, journalVoucher.getStatus());
		assertEquals("600000000001", journalVoucher.getLocalPartyAccount());
		assertEquals("云南信托国际有限公司", journalVoucher.getLocalPartyName());
		assertEquals("financial_contract_uuid_1", journalVoucher.getRelatedBillContractInfoLv1());
		assertEquals("contract_uuid_1", journalVoucher.getRelatedBillContractInfoLv2());
		assertEquals("asset_uuid_1", journalVoucher.getRelatedBillContractInfoLv3());
		assertEquals("云南信托", journalVoucher.getRelatedBillContractNoLv1());
		assertEquals("DKHD-000", journalVoucher.getRelatedBillContractNoLv2());
		assertEquals("repayment_plan_no_1", journalVoucher.getRelatedBillContractNoLv3());
		assertEquals(refundOrder.getRefundOrderNo(), journalVoucher.getRelatedBillContractNoLv4());
		assertEquals(SecondJournalVoucherType.ASSET_REFUND_VOUCHER, journalVoucher.getSecondJournalVoucherType());
		
		//无凭证
		assertEquals(null, journalVoucher.getSourceDocumentCounterPartyAccount());
		assertEquals(null, journalVoucher.getSourceDocumentCounterPartyName());
		assertEquals(null, journalVoucher.getSourceDocumentLocalPartyAccount());
		assertEquals(null, journalVoucher.getSourceDocumentLocalPartyName());
		
		//专户变动
		SpecialAccount beneficiary_specialaccount = specialAccountService.get("3d74b21b-7d4f-49cf-808e-ebe6c2372d78"); //还款户
		SpecialAccount parent_beneficiary_specialaccount = specialAccountService.get("3d74b21b-7d4f-49cf-808e-ebe6c2372d72"); //还款户  父
		SpecialAccount independent_specialaccount = specialAccountService.get("52aae60c-2aa2-4dda-9079-e63aef2c45d5"); //客户账户
		
		assertEquals(new BigDecimal("1700.00"), beneficiary_specialaccount.getBalance());
		assertEquals(new BigDecimal("1700.00"), parent_beneficiary_specialaccount.getBalance());
		
		List<SpecialAccountFlow> specialAccountFlowList = specialAccountFlowService.loadAll(SpecialAccountFlow.class);
		assertEquals(2, specialAccountFlowList.size());
		
		SpecialAccountFlow specialAccountFlow_1 = specialAccountFlowList.get(0);
		SpecialAccountFlow specialAccountFlow_2 = specialAccountFlowList.get(1);
		
		assertEquals(1, specialAccountFlow_1.getAccountSide());
		assertEquals(9, specialAccountFlow_1.getAccountTransType());
		assertEquals(independent_specialaccount.getBalance(), specialAccountFlow_1.getBalance());
		assertEquals(independent_specialaccount.getBasicAccountType(), specialAccountFlow_1.getBasicAccountType());
		assertEquals("", specialAccountFlow_1.getCashFlowIdentity());
		assertEquals("", specialAccountFlow_1.getCashFlowUuid());
		assertEquals(beneficiary_specialaccount.getAccountTypeCode(), specialAccountFlow_1.getCounterAccountTypeCode());
		assertEquals(beneficiary_specialaccount.getUuid(), specialAccountFlow_1.getCounterAccountUuid());
		assertEquals(independent_specialaccount.getFstLevelContractUuid(), specialAccountFlow_1.getFinancialContractUuid());
		assertEquals(independent_specialaccount.getAccountTypeCode(), specialAccountFlow_1.getHostAccountTypeCode());
		assertEquals(independent_specialaccount.getUuid(), specialAccountFlow_1.getHostAccountUuid());
		assertEquals(new BigDecimal("300.00"), specialAccountFlow_1.getTransactionAmount());
		assertEquals("客户账户", specialAccountFlow_1.getRemark());
		
		assertEquals(0, specialAccountFlow_2.getAccountSide());
		assertEquals(9, specialAccountFlow_2.getAccountTransType());
		assertEquals(beneficiary_specialaccount.getBalance(), specialAccountFlow_2.getBalance());
		assertEquals(beneficiary_specialaccount.getBasicAccountType(), specialAccountFlow_2.getBasicAccountType());
		assertEquals("", specialAccountFlow_2.getCashFlowIdentity());
		assertEquals("", specialAccountFlow_2.getCashFlowUuid());
		assertEquals(independent_specialaccount.getAccountTypeCode(), specialAccountFlow_2.getCounterAccountTypeCode());
		assertEquals(independent_specialaccount.getUuid(), specialAccountFlow_2.getCounterAccountUuid());
		assertEquals(beneficiary_specialaccount.getFstLevelContractUuid(), specialAccountFlow_2.getFinancialContractUuid());
		assertEquals(beneficiary_specialaccount.getAccountTypeCode(), specialAccountFlow_2.getHostAccountTypeCode());
		assertEquals(beneficiary_specialaccount.getUuid(), specialAccountFlow_2.getHostAccountUuid());
		assertEquals(new BigDecimal("300.00"), specialAccountFlow_2.getTransactionAmount());
		assertEquals("还款户", specialAccountFlow_2.getRemark());
		
		//虚户
		VirtualAccount afterVirtualAccount = virtualAccountService.getVirtualAccountByCustomerUuid("customerUuid1");
		assertEquals(new BigDecimal("1350.00"),afterVirtualAccount.getTotalBalance());
		
		LedgerBook book = ledgerBookService.getBookByBookNo("yunxin_ledger_book");
		
		//账本
		List<LedgerItem> ledgerItemList = ledgerItemService.list(LedgerItem.class,new Filter());
	    assertEquals(21,ledgerItemList.size());
	     
		assertEquals(0, new BigDecimal("1200").compareTo(ledgerItemService.getBalancedAmount(book.getLedgerBookNo(), ChartOfAccount.TRD_RECIEVABLE_LOAN_ASSET_PRINCIPLE, "", "", "asset_uuid_1", "", "", "", "")));
		assertEquals(0, new BigDecimal("150").compareTo(ledgerItemService.getBalancedAmount(book.getLedgerBookNo(), ChartOfAccount.TRD_RECIEVABLE_LOAN_ASSET_INTEREST, "", "", "asset_uuid_1", "", "", "", "")));
		assertEquals(new BigDecimal("-1350.00"),ledgerItemService.getBalancedAmount(book.getLedgerBookNo(), ChartOfAccount.FST_LIABILITIES_OF_INDEPENDENT_ACCOUNTS, "customerUuid1", "", "", "", "", "", ""));
		
		BigDecimal bank_saving_principal = BigDecimal.ZERO;
		BigDecimal bank_saving_interest = BigDecimal.ZERO;
		List<LedgerItem> ledgers = ledgerItemService.get_booked_ledgers_of_asset_in_taccounts(Arrays.asList(ChartOfAccount.TRD_BANK_SAVING_GENERAL_PRINCIPAL,ChartOfAccount.TRD_BANK_SAVING_GENERAL_INTEREST), book, "asset_uuid_1", contractUuid);
		for (LedgerItem ledgerItem : ledgers) {
			if(ledgerItem.getSecondAccountName().equals("600000000001") && ledgerItem.getThirdAccountName().equals(ChartOfAccount.TRD_BANK_SAVING_GENERAL_PRINCIPAL) ){
				
				bank_saving_principal = bank_saving_principal.add( ledgerItem.getDebitSubCreditBalance());
				
			}else if (ledgerItem.getSecondAccountName().equals("600000000001") && ledgerItem.getThirdAccountName().equals(ChartOfAccount.TRD_BANK_SAVING_GENERAL_INTEREST)) {
				
				bank_saving_interest = bank_saving_interest.add( ledgerItem.getDebitSubCreditBalance());
			}
		}
		
		assertEquals(new BigDecimal("600.00"),bank_saving_principal);
		assertEquals( new BigDecimal("50.00"),bank_saving_interest);
	}
	
	@Autowired	
	private SessionFactory sessionFactory;
	
	//系统自动   资产退款  
	@Test
	@Sql("classpath:test/yunxin/refundOrder/test_asset_refund3.sql")
	public void testAssetRefund_3(){
		
		RefundOrder refundOrder = refundOrderService.queryRefundOrderByRefundOrderUuid("refund_order_uuid");
		assertEquals(new Integer(0), refundOrder.getRetriedNums());
		
		assertEquals(RefundStatus.REFUNDING, refundOrder.getRefundStatus());
		
		autoRecoverAssesNoSession.system_auto_asset_refund();
		
		sessionFactory.getCurrentSession().flush();
		sessionFactory.getCurrentSession().clear();
		
		RefundOrder afterRefundOrder = refundOrderService.queryRefundOrderByRefundOrderUuid("refund_order_uuid");
		
		assertEquals(new Integer(1), afterRefundOrder.getRetriedNums());
		assertEquals(RefundStatus.REFUNDED, afterRefundOrder.getRefundStatus());
	}
	
	
	//系统自动   资产退款   异常
	@Test
	@Sql("classpath:test/yunxin/refundOrder/test_asset_refund6.sql")
	public void testAssetRefund_6(){
		
		RefundOrder refundOrder = refundOrderService.queryRefundOrderByRefundOrderUuid("refund_order_uuid");
		
		assertEquals(new Integer(2), refundOrder.getRetriedNums());
		
		assertEquals(RefundStatus.REFUNDING, refundOrder.getRefundStatus());
		
		autoRecoverAssesNoSession.system_auto_asset_refund();
		
		sessionFactory.getCurrentSession().flush();
		sessionFactory.getCurrentSession().clear();
		
		RefundOrder afterRefundOrder = refundOrderService.queryRefundOrderByRefundOrderUuid("refund_order_uuid");
		RefundOrder afterRefundOrder3 = refundOrderService.queryRefundOrderByRefundOrderUuid("refund_order_uuid3");
		
		assertEquals(new Integer(3), afterRefundOrder.getRetriedNums());
		assertEquals(new Integer(1), afterRefundOrder3.getRetriedNums());
		assertEquals(RefundStatus.ABNORMAL, afterRefundOrder.getRefundStatus());
		assertEquals(RefundStatus.REFUNDING, afterRefundOrder3.getRefundStatus());
	}
	
	//退款测试  全部还款
	@Test
	@Sql("classpath:test/yunxin/refundOrder/test_asset_refund4.sql")
	public void testAssetRefund_4(){
		
		String contractUuid = "contract_uuid_1";
		AssetRefundMode assetRefundMode = new AssetRefundMode();
		assetRefundMode.setAssetUuid("asset_uuid_1");
		assetRefundMode.setContractId(new Long("1"));
		assetRefundMode.setInterest(new BigDecimal("100"));
		assetRefundMode.setLateFee(new BigDecimal("0"));
		assetRefundMode.setLateOtherCost(new BigDecimal("0"));
		assetRefundMode.setLatePenalty(new BigDecimal("0"));
		assetRefundMode.setMaintenanceCharge(new BigDecimal("0"));
		assetRefundMode.setPenaltyFee(new BigDecimal("0"));
		assetRefundMode.setOtherCharge(new BigDecimal("0"));
		assetRefundMode.setPrincipal(new BigDecimal("900"));
		assetRefundMode.setRemark("hahaha");
		assetRefundMode.setRepaymentPlanNo("repayment_plan_no_1");
		assetRefundMode.setServiceCharge(new BigDecimal("0"));
		assetRefundMode.setTotalAmount(new BigDecimal("1000"));
		
		
		RefundOrder refundOrder = refundOrderService.queryRefundOrderByRefundOrderUuid("refund_order_uuid");
		
		List<LedgerItem> beforeLedgerItemList = ledgerItemService.list(LedgerItem.class,new Filter());
	    assertEquals(7,beforeLedgerItemList.size());
	    
	    VirtualAccount virtualAccount = virtualAccountService.getVirtualAccountByCustomerUuid("customerUuid1");
	    assertEquals(new BigDecimal("500.00"),virtualAccount.getTotalBalance());
		
		refundOrderHandler.handleAssetRefund(contractUuid,refundOrder.getUuid(), assetRefundMode, Priority.High.getPriority());
		
		//虚户
		VirtualAccount afterVirtualAccount = virtualAccountService.getVirtualAccountByCustomerUuid("customerUuid1");
		assertEquals(new BigDecimal("2000.00"),afterVirtualAccount.getTotalBalance());
		
		LedgerBook book = ledgerBookService.getBookByBookNo("yunxin_ledger_book");
		
		//账本
		List<LedgerItem> ledgerItemList = ledgerItemService.list(LedgerItem.class,new Filter());
	    assertEquals(21,ledgerItemList.size());
	     
		assertEquals(0, new BigDecimal("1800").compareTo(ledgerItemService.getBalancedAmount(book.getLedgerBookNo(), ChartOfAccount.TRD_RECIEVABLE_LOAN_ASSET_PRINCIPLE, "", "", "asset_uuid_1", "", "", "", "")));
		assertEquals(0, new BigDecimal("200").compareTo(ledgerItemService.getBalancedAmount(book.getLedgerBookNo(), ChartOfAccount.TRD_RECIEVABLE_LOAN_ASSET_INTEREST, "", "", "asset_uuid_1", "", "", "", "")));
		assertEquals(new BigDecimal("-2000.00"),ledgerItemService.getBalancedAmount(book.getLedgerBookNo(), ChartOfAccount.FST_LIABILITIES_OF_INDEPENDENT_ACCOUNTS, "customerUuid1", "", "", "", "", "", ""));
		
		BigDecimal bank_saving_principal = BigDecimal.ZERO;
		BigDecimal bank_saving_interest = BigDecimal.ZERO;
		List<LedgerItem> ledgers = ledgerItemService.get_booked_ledgers_of_asset_in_taccounts(Arrays.asList(ChartOfAccount.TRD_BANK_SAVING_GENERAL_PRINCIPAL,ChartOfAccount.TRD_BANK_SAVING_GENERAL_INTEREST), book, "asset_uuid_1", contractUuid);
		for (LedgerItem ledgerItem : ledgers) {
			if(ledgerItem.getSecondAccountName().equals("600000000001") && ledgerItem.getThirdAccountName().equals(ChartOfAccount.TRD_BANK_SAVING_GENERAL_PRINCIPAL) ){
				
				bank_saving_principal = bank_saving_principal.add( ledgerItem.getDebitSubCreditBalance());
				
			}else if (ledgerItem.getSecondAccountName().equals("600000000001") && ledgerItem.getThirdAccountName().equals(ChartOfAccount.TRD_BANK_SAVING_GENERAL_INTEREST)) {
				
				bank_saving_interest = bank_saving_interest.add( ledgerItem.getDebitSubCreditBalance());
			}
		}
		
		assertEquals(new BigDecimal("0.00"),bank_saving_principal);
		assertEquals( new BigDecimal("0.00"),bank_saving_interest);
	     
	}
	
	//退款测试  全部还款  包含逾期
	@Test
	@Sql("classpath:test/yunxin/refundOrder/test_asset_refund5.sql")
	public void testAssetRefund_5(){
		
		String contractUuid = "contract_uuid_1";
		AssetRefundMode assetRefundMode = new AssetRefundMode();
		assetRefundMode.setAssetUuid("asset_uuid_1");
		assetRefundMode.setContractId(new Long("1"));
		assetRefundMode.setInterest(new BigDecimal("100"));
		assetRefundMode.setLateFee(new BigDecimal("0"));
		assetRefundMode.setLateOtherCost(new BigDecimal("0"));
		assetRefundMode.setLatePenalty(new BigDecimal("0"));
		assetRefundMode.setMaintenanceCharge(new BigDecimal("0"));
		assetRefundMode.setPenaltyFee(new BigDecimal("0"));
		assetRefundMode.setOtherCharge(new BigDecimal("0"));
		assetRefundMode.setPrincipal(new BigDecimal("900"));
		assetRefundMode.setRemark("hahaha");
		assetRefundMode.setRepaymentPlanNo("repayment_plan_no_1");
		assetRefundMode.setServiceCharge(new BigDecimal("0"));
		assetRefundMode.setTotalAmount(new BigDecimal("1000"));
		
		
		RefundOrder refundOrder = refundOrderService.queryRefundOrderByRefundOrderUuid("refund_order_uuid");
		
	    VirtualAccount virtualAccount = virtualAccountService.getVirtualAccountByCustomerUuid("customerUuid1");
	    assertEquals(new BigDecimal("500.00"),virtualAccount.getTotalBalance());
		
		refundOrderHandler.handleAssetRefund(contractUuid,refundOrder.getUuid(), assetRefundMode, Priority.High.getPriority());
	}
	
	//退款测试  还款已结清
	@Test
	@Sql("classpath:test/yunxin/refundOrder/test_asset_refund7.sql")
	public void testAssetRefund_7(){
		
		String contractUuid = "contract_uuid_1";
		AssetRefundMode assetRefundMode = new AssetRefundMode();
		assetRefundMode.setAssetUuid("asset_uuid_1");
		assetRefundMode.setContractId(new Long("1"));
		assetRefundMode.setInterest(new BigDecimal("100"));
		assetRefundMode.setLateFee(new BigDecimal("0"));
		assetRefundMode.setLateOtherCost(new BigDecimal("0"));
		assetRefundMode.setLatePenalty(new BigDecimal("0"));
		assetRefundMode.setMaintenanceCharge(new BigDecimal("0"));
		assetRefundMode.setPenaltyFee(new BigDecimal("0"));
		assetRefundMode.setOtherCharge(new BigDecimal("0"));
		assetRefundMode.setPrincipal(new BigDecimal("900"));
		assetRefundMode.setRemark("hahaha");
		assetRefundMode.setRepaymentPlanNo("repayment_plan_no_1");
		assetRefundMode.setServiceCharge(new BigDecimal("0"));
		assetRefundMode.setTotalAmount(new BigDecimal("1000"));
		
		
		RefundOrder refundOrder = refundOrderService.queryRefundOrderByRefundOrderUuid("refund_order_uuid");
		
	    VirtualAccount virtualAccount = virtualAccountService.getVirtualAccountByCustomerUuid("customerUuid1");
	    assertEquals(new BigDecimal("500.00"),virtualAccount.getTotalBalance());
		
		refundOrderHandler.handleAssetRefund(contractUuid,refundOrder.getUuid(), assetRefundMode, Priority.High.getPriority());
	}
}




