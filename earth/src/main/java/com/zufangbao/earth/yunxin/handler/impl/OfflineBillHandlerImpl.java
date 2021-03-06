package com.zufangbao.earth.yunxin.handler.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.demo2do.core.utils.JsonUtils;
import com.demo2do.core.web.resolver.Page;
import com.zufangbao.earth.yunxin.exception.OfflineBillAutidtException;
import com.zufangbao.earth.yunxin.exception.SourceDocumentNotExistException;
import com.zufangbao.earth.yunxin.handler.OfflineBillHandler;
import com.zufangbao.earth.yunxin.web.controller.YunxinOfflinePaymentControllerSpec;
import com.zufangbao.sun.entity.account.AccountSide;
import com.zufangbao.sun.entity.account.DepositeAccountInfo;
import com.zufangbao.sun.entity.contract.Contract;
import com.zufangbao.sun.entity.directbank.business.ContractAccount;
import com.zufangbao.sun.entity.financial.FinancialContract;
import com.zufangbao.sun.entity.order.Order;
import com.zufangbao.sun.ledgerbook.BankAccountCache;
import com.zufangbao.sun.ledgerbook.stat.LedgerBookStatHandler;
import com.zufangbao.sun.service.ContractAccountService;
import com.zufangbao.sun.service.FinanceCompanyService;
import com.zufangbao.sun.service.FinancialContractService;
import com.zufangbao.sun.service.OrderService;
import com.zufangbao.sun.yunxin.entity.AssetRecoverType;
import com.zufangbao.sun.yunxin.entity.AssetSet;
import com.zufangbao.sun.yunxin.entity.ExecutingSettlingStatus;
import com.zufangbao.sun.yunxin.entity.GuaranteeStatus;
import com.zufangbao.sun.yunxin.entity.IllegalInputAmountException;
import com.zufangbao.sun.yunxin.entity.OfflineBill;
import com.zufangbao.sun.yunxin.entity.OfflineBillStatus;
import com.zufangbao.sun.yunxin.entity.OrderClearStatus;
import com.zufangbao.sun.yunxin.entity.OrderType;
import com.zufangbao.sun.yunxin.entity.SourceDocumentStatus;
import com.zufangbao.sun.yunxin.entity.model.OfflineBillCreateModel;
import com.zufangbao.sun.yunxin.entity.model.OrderMatchModel;
import com.zufangbao.sun.yunxin.entity.model.OrderMatchQueryModel;
import com.zufangbao.sun.yunxin.entity.model.OrderMatchShowModel;
import com.zufangbao.sun.yunxin.log.LogFunctionType;
import com.zufangbao.sun.yunxin.log.LogOperateType;
import com.zufangbao.sun.yunxin.log.SystemOperateLog;
import com.zufangbao.sun.yunxin.service.OfflineBillService;
import com.zufangbao.sun.yunxin.service.RepaymentPlanService;
import com.zufangbao.sun.yunxin.service.SettlementOrderService;
import com.zufangbao.sun.yunxin.service.SystemOperateLogService;
import com.zufangbao.sun.yunxin.service.account.ClearingExecLogService;
import com.zufangbao.wellsfargo.exception.OfflineBillCreateException;
import com.zufangbao.wellsfargo.exception.VoucherException;
import com.zufangbao.wellsfargo.silverpool.cashauditing.entity.voucher.BusinessVoucher;
import com.zufangbao.wellsfargo.silverpool.cashauditing.entity.voucher.JournalAccount;
import com.zufangbao.wellsfargo.silverpool.cashauditing.entity.voucher.JournalVoucher;
import com.zufangbao.wellsfargo.silverpool.cashauditing.entity.voucher.JournalVoucherStatus;
import com.zufangbao.sun.yunxin.enums.voucher.JournalVoucherType;
import com.zufangbao.wellsfargo.silverpool.cashauditing.entity.voucher.SourceDocument;
import com.zufangbao.wellsfargo.silverpool.cashauditing.entity.voucher.SourceDocumentType;
import com.zufangbao.wellsfargo.silverpool.cashauditing.handler.BusinessVoucherHandler;
import com.zufangbao.wellsfargo.silverpool.cashauditing.service.BusinessVoucherService;
import com.zufangbao.wellsfargo.silverpool.cashauditing.service.JournalVoucherService;
import com.zufangbao.wellsfargo.silverpool.cashauditing.service.SourceDocumentService;
import com.zufangbao.wellsfargo.yunxin.handler.JournalVoucherHandler;
import com.zufangbao.wellsfargo.yunxin.handler.OrderHandler;
import com.zufangbao.wellsfargo.yunxin.handler.SourceDocumentHandler;

@Component("offlineBillHandler")
public class OfflineBillHandlerImpl implements OfflineBillHandler {

	@Autowired
	private OrderService orderSerivce;

	@Autowired
	private RepaymentPlanService repaymentPlanService;

	@Autowired
	private SourceDocumentHandler sourceDocumentHandler;

	@Autowired
	private SourceDocumentService sourceDocumentService;

	@Autowired
	private JournalVoucherHandler journalVoucherHandler;

	@Autowired FinanceCompanyService financeCompanyService;

	@Autowired
	private OfflineBillService offlineBillService;

	@Autowired
	private ContractAccountService contractAccountService;

	@Autowired
	private BusinessVoucherService businessVoucherService;

	@Autowired
	private BusinessVoucherHandler businessVoucherHandler;

	@Autowired
	private OrderHandler orderHandler;

	@Autowired
	private SystemOperateLogService systemOperateLogService;

	@Autowired
	private FinancialContractService financialContractService;

	@Autowired
	private JournalVoucherService journalVoucherService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SettlementOrderService settlementOrderService;
	@Autowired
	@Qualifier("dataStatisticsCacheHandler")
	private BankAccountCache bankAccountCache;

	@Autowired
	private LedgerBookStatHandler ledgerBookStatHandler;
	
	@Autowired
	private ClearingExecLogService clearingExecLogService;

	private static final Log logger = LogFactory.getLog(OfflineBillHandlerImpl.class);

	@Override
	public void createOfflineBillForGuaranteOrderMatch(OfflineBillCreateModel offlineBillCreateModel) throws OfflineBillCreateException, VoucherException {
		List<String> guaranteeRepaymentUuidList = offlineBillCreateModel.parseGuaranteeRepaymentUuidList();

		List<Order> guaranteeOrders = orderSerivce.listOrder(guaranteeRepaymentUuidList, OrderType.GUARANTEE);
		validOrderStatus(guaranteeOrders);
		BigDecimal totalAmount = getTotalAmount(guaranteeOrders);

		OfflineBill offlineBill= new OfflineBill(offlineBillCreateModel.getBankShowName(), offlineBillCreateModel.getPayerAccountName(), offlineBillCreateModel.getSerialNo(),
				offlineBillCreateModel.getPayerAccountNo(), totalAmount, new Date(), offlineBillCreateModel.getComment());
		offlineBill.setOfflineBillStatus(OfflineBillStatus.PAID);
		offlineBillService.save(offlineBill);

		Long companyId = getCompanyId(guaranteeOrders);
		//创建原始凭证
		sourceDocumentHandler.createVouchersForOfflineBill(offlineBill, companyId, guaranteeOrders);
		updateOrderAndAsset(guaranteeOrders);
	}

	private Long getCompanyId(List<Order> guaranteeOrders) {
		Order guaranteeOrder = guaranteeOrders.get(0);
		FinancialContract financialContract = guaranteeOrder.getFinancialContract();
		return financialContract.getCompany().getId();
	}

	@Override
	public String extractOrderNoSet(List<Order> guaranteeOrders) {
		Set<String> orderNoSet = new HashSet<String>();
		for (Order order : guaranteeOrders) {
			if(order==null) continue;
			orderNoSet.add(order.getOrderNo());
		}
		return JsonUtils.toJsonString(orderNoSet);
	}

	@Override
	public void validOrderStatus(List<Order> guaranteeOrders) throws OfflineBillCreateException {
		if(CollectionUtils.isEmpty(guaranteeOrders)){
			throw new OfflineBillCreateException();
		}
		for (Order order : guaranteeOrders) {
			AssetSet assetSet = repaymentPlanService.getUniqueRepaymentPlanByUuid(order.getAssetSetUuid());
			if(assetSet.getGuaranteeStatus()==GuaranteeStatus.HAS_GUARANTEE ||assetSet.getGuaranteeStatus()==GuaranteeStatus.LAPSE_GUARANTEE){
				throw new OfflineBillCreateException();
			}
		}
	}

	@Override
	public BigDecimal getTotalAmount(List<Order> guaranteeOrders) {
		BigDecimal totalAmount = BigDecimal.ZERO;
		for (Order order : guaranteeOrders) {
			if(order==null) continue;
			totalAmount = totalAmount.add(order.getTotalRent());
		}
		return totalAmount;
	}

	@Override
	public void updateOrderAndAsset(List<Order> orderList) {
		for (Order order : orderList) {
			if(order==null){
				continue;
			}
			order.setExecutingSettlingStatus(ExecutingSettlingStatus.SUCCESS);
			order.setClearingStatus(OrderClearStatus.CLEAR);
			order.setPayoutTime(new Date());
			orderSerivce.save(order);
			AssetSet assetSet = repaymentPlanService.getUniqueRepaymentPlanByUuid(order.getAssetSetUuid());
			assetSet.setGuaranteeStatus(GuaranteeStatus.HAS_GUARANTEE);
			repaymentPlanService.save(assetSet);
		}
	}
	@Override
	public OfflineBill create_offline_bill_and_create_source_document(OfflineBillCreateModel offlineBillCreateModel){
		OfflineBill offlineBill = create_offline_bill(offlineBillCreateModel);
		Long companyId = financeCompanyService.getCompanyIdOfOneFinanceCompany();
		sourceDocumentService.createSourceDocumentBy(companyId, offlineBill);
		return offlineBill;
	}

	@Override
    public OfflineBill create_offline_bill(OfflineBillCreateModel offlineBillCreateModel){
		OfflineBill offlineBill =new OfflineBill(offlineBillCreateModel.getBankShowName(), offlineBillCreateModel.getPayerAccountName(), offlineBillCreateModel.getSerialNo(), offlineBillCreateModel.getPayerAccountNo(), offlineBillCreateModel.getAmount(), offlineBillCreateModel.getTradeTime(), offlineBillCreateModel.getComment(), offlineBillCreateModel.getFinancialContractUuid());
		offlineBillService.save(offlineBill);
		return offlineBill;
	}

	@Override
	public List<Order> smartMatchOrderListBy(String offlineBillUuid) {
		OfflineBill offlineBill = offlineBillService.getOfflineBillBy(offlineBillUuid);
		if(offlineBill == null) {
			return Collections.emptyList();
		}
		List<ContractAccount> contractAccountList = contractAccountService.get_match_contract_account_list_by_payerName_accountNo_bankName(offlineBill.getPayerAccountName(),offlineBill.getPayerAccountNo(),offlineBill.getBankShowName(), org.apache.commons.lang.StringUtils.EMPTY);
		if(CollectionUtils.isEmpty(contractAccountList)) {
			//TODO:根据收款单三要素定位到具体的商户 return orderSerivce.getGuaranteeOrderSortByModifyTime("" + GuaranteeStatus.WAITING_GUARANTEE.ordinal(), null, null, null, null, null, null, null);
			return Collections.emptyList();
		}
		List<Order> orderList = new ArrayList<>();
		for (ContractAccount contractAccount : contractAccountList) {
			List<Order> orders = orderSerivce.getOrderListBy(contractAccount);
			orderList.addAll(orders);
		}
		return orderList;
	}

	private List<OrderMatchModel> showSmartMatchModelOrderList(List<Order> smartMatchOrderList) {
		if(CollectionUtils.isEmpty(smartMatchOrderList)) {
			return Collections.emptyList();
		}
		List<OrderMatchModel> orderMatchModelList = new ArrayList<>();
		for (Order order : smartMatchOrderList) {

			AssetSet assetSet = repaymentPlanService.getUniqueRepaymentPlanByUuid(order.getAssetSetUuid());

			OrderMatchModel orderMatchModel = businessVoucherService.orderConvertToMatchModel(order, assetSet);
			if(orderMatchModel == null) {
				continue;
			}
			orderMatchModelList.add(orderMatchModel);
		}
		return orderMatchModelList;
	}

	@Override
	public void buildAssociationBetweenOrderAndOfflineBill(String offlineBillUuid, Map<String, Object> map, BigDecimal connectionAmount, long userId, String ip) throws SourceDocumentNotExistException, IllegalInputAmountException, OfflineBillAutidtException {
		SourceDocument sourceDocument = getSourceDocumentByOfflineBillUuid(offlineBillUuid);
		check_connection_amount(sourceDocument, connectionAmount);
		Iterator<Entry<String, Object>> iterator = map.entrySet().iterator();
		OfflineBill offlineBill = offlineBillService.getOfflineBillBy(offlineBillUuid);
		while (iterator.hasNext()) {
			Map.Entry<String, Object> entry = iterator.next();
			String orderNo = entry.getKey();
			String inputAmount = (String) entry.getValue();
			Order order = orderSerivce.getOrder(orderNo);
			if(order == null) {
				continue;
			}
			AssetSet set=repaymentPlanService.getUniqueRepaymentPlanByUuid(order.getAssetSetUuid());
			// TODO valid before do for transaction
			if(order.getOrderType()==OrderType.GUARANTEE && set.isGuaranteeStatusLapsed()){
				throw new OfflineBillAutidtException(YunxinOfflinePaymentControllerSpec.AUDIT_WITH_LAPSED_GUARANTEE_ORDER);
			}
			BigDecimal bookingAmount = new BigDecimal(inputAmount);
			Long companyId = sourceDocument.getCompanyId();
			BusinessVoucher businessVoucher= businessVoucherHandler.issueDefaultBusinessVoucher(order, companyId, bookingAmount);

			FinancialContract financialContract = order.getFinancialContract();
			Contract contract = set.getContract();
			JournalVoucher journalVoucher = journalVoucherHandler.issueJournalVoucher(order.getRepaymentBillId(), sourceDocument, bookingAmount, businessVoucher.getBusinessVoucherUuid(), JournalVoucherType.OFFLINE_BILL_ISSUE, financialContract, contract, set, orderNo);
			if(journalVoucher==null){
				throw new OfflineBillAutidtException(YunxinOfflinePaymentControllerSpec.JOURNAL_VOUCHER_ERROR);
			}
			sourceDocumentService.signSourceDocument(sourceDocument, bookingAmount);
			try {
				logger.info("LederBook:begin to build association with order[orderId:"+order.getId()+",orderType:"+order.getOrderType()+"].");
				DepositeAccountInfo bankinfo = this.bankAccountCache.extractFirstBankAccountFrom(financialContract);
				journalVoucherHandler.recover_asset_by_asset_type(set, AssetRecoverType.convertFromOrderType(order.getOrderType()), bookingAmount, journalVoucher.getJournalVoucherUuid(), businessVoucher.getBusinessVoucherUuid(), sourceDocument.getSourceDocumentUuid(), bankinfo, true, new HashMap<String, BigDecimal>(), journalVoucher.getTradeTime());

			} catch(Exception e){
				logger.info("LederBook:eccor error when build association with order[orderId:"+order.getId()+",orderType:"+order.getOrderType()+"].");
				e.printStackTrace();
			}
			logger.info("LederBook:end to build association with order[orderId:"+order.getId()+",orderType:"+order.getOrderType()+"].");

			orderHandler.updateStatusAfterIssueBusinessVoucher(order, offlineBill.getTradeTime());
			settlementOrderService.createSettlementOrder(set);
			saveOrderAssociateLog(userId, ip, offlineBill, orderNo, inputAmount, order);//生成关联操作日志
			
			//创建clearingExecLog
			if(JournalVoucherType.JournalVoucherTypeUsedSpecialAccount().contains(journalVoucher.getJournalVoucherType().ordinal())){
				if(financialContractService.isSpecialAccountConfigured(financialContract.getFinancialContractUuid())) {
					clearingExecLogService.createClearingExecLog(set,
							getChargesDetailMapByLoanAsset(set.getAssetUuid(),
									financialContract.getLedgerBookNo(), journalVoucher.getUuid()),
							journalVoucher.getUuid(), journalVoucher.getJournalVoucherType().ordinal(),
							bookingAmount, contract.getId(), "");
				}
			}
		}
	}
	
	public Map<String, BigDecimal> getChargesDetailMapByLoanAsset(String assetSetUuid,String ledgerBookNo,String journalVoucherUuid){
		Map<String, BigDecimal> chargerDetailMap = new HashMap<>();
		chargerDetailMap = ledgerBookStatHandler.get_jv_asset_detail_amount_of_banksaving_and_independent_accounts(ledgerBookNo, journalVoucherUuid, assetSetUuid);
		return chargerDetailMap;
	}

	public void saveOrderAssociateLog(long userId, String ip, OfflineBill offlineBill, String orderNo, String inputAmount, Order order) {
		String recordContent = order.getOrderType().getChineseName() + "【" + orderNo + "】，关联线下支付单【" + offlineBill.getOfflineBillNo() + "】，关联金额：" + inputAmount;
		SystemOperateLog log = SystemOperateLog.createLog(userId, recordContent, ip, LogFunctionType.OFFLINEBILLASSOCIATE, LogOperateType.ASSOCIATE, order.getRepaymentBillId(), order.getOrderNo());
		systemOperateLogService.saveOrUpdate(log);
	}

	private void check_connection_amount(SourceDocument sourceDocument, BigDecimal connectionAmount) throws IllegalInputAmountException {
		BigDecimal balance = sourceDocument.getOutlierAmount().subtract(sourceDocument.getBookingAmount());
		if(connectionAmount.compareTo(balance) == 1) {
			throw new IllegalInputAmountException();
		}
	}

	private SourceDocument getSourceDocumentByOfflineBillUuid(String offlineBillUuid)
			throws SourceDocumentNotExistException {
		List<SourceDocument> sourceDocuments = sourceDocumentService.getSourceDocumentByOfflineBillUuid(offlineBillUuid);
		if(CollectionUtils.isEmpty(sourceDocuments)) {
			throw new SourceDocumentNotExistException();
		}
		return sourceDocuments.get(0);
	}

	@Override
	public List<OrderMatchModel> searchMatchModelOrderList(OrderMatchQueryModel orderMatchQueryModel, Page page) {
		List<Order> orderList = orderSerivce.getOrderListExceptLapsedGuarantee(orderMatchQueryModel, page);
		return showSmartMatchModelOrderList(orderList);
	}

	@Override
	public List<OrderMatchShowModel> getOrderMatchShowModelBy(String offlineBillUuid) {
		if(StringUtils.isEmpty(offlineBillUuid)){
			return Collections.emptyList();
		}
		SourceDocument sourceDocument = sourceDocumentService.getOneSourceDocuments(SourceDocumentType.NOTIFY, AccountSide.DEBIT, SourceDocumentStatus.SIGNED, SourceDocument.FIRSTOUTLIER_OFFLINEBILL,offlineBillUuid);
		if(sourceDocument==null){
			return Collections.emptyList();
		}
		List<JournalVoucher> journalVoucherList= journalVoucherService.getJournalVoucherBy(sourceDocument.getSourceDocumentUuid(), AccountSide.DEBIT, JournalVoucherStatus.VOUCHER_ISSUED,sourceDocument.getCompanyId());
		List<OrderMatchShowModel> orderMatchShowModelList = new ArrayList<OrderMatchShowModel>();
		for (JournalVoucher journalVoucher : journalVoucherList) {
			if(journalVoucher==null) continue;
			String repaymentBillId = journalVoucher.getBillingPlanUuid();
			com.zufangbao.sun.entity.order.Order order = orderService.getOrderByRepaymentBillId(repaymentBillId);
			if(order==null){
				continue;
			}
			BigDecimal paidAmount = journalVoucherService.getBookingAmountSumOfIssueJournalVoucherBy(repaymentBillId, sourceDocument.getCompanyId(), JournalAccount.generateDebitJournalAccount());
			AssetSet assetSet= repaymentPlanService.getUniqueRepaymentPlanByUuid(order.getAssetSetUuid());

			OrderMatchShowModel orderMatchShowModel = new OrderMatchShowModel(order,paidAmount,journalVoucher.getBookingAmount(),assetSet);
			orderMatchShowModelList.add(orderMatchShowModel);
		}
		return orderMatchShowModelList;
	}

}