SET FOREIGN_KEY_CHECKS=0;

DELETE FROM galaxy_autotest_yunxin.t_product_category;

INSERT INTO `t_product_category` (`id`, `uuid`, `product_lv_1_code`, `product_lv_1_name`, `product_lv_2_code`, `product_lv_2_name`, `product_lv_3_code`, `product_lv_3_name`, `pre_process_interface_url`, `pre_process_script`, `status`, `script_md_5_version`, `date_field_one`, `date_field_two`, `date_field_three`, `long_field_one`, `long_field_two`, `long_field_three`, `string_field_one`, `string_field_two`, `string_field_three`, `decimal_field_one`, `decimal_field_two`, `decimal_field_three`)
VALUES
  (4, '380d06b4-90da-4044-a7ef-edc48283a97b', 'zhongan', '众安保险', 'modify-repaymentPlan', '变更还款计划', 'SXH-QXSXH', '随心还-取消随心还', 'modify-repaymentPlan/zhongan/SXH-QXSXH', 'public boolean evaluate(SandboxDataSetHandler sandboxDataSetHandler, Map<String, String> preRequest, Map<String, String> postRequest, Log logger) {\r\n		logger.info(\"SXHCancelServices has been started\");\r\n		String uniqueId = (String) preRequest.getOrDefault(\"uniqueId\",\"\");\r\n		String contractNo = (String)preRequest.getOrDefault(\"contractNo\",\"\");\r\n		if (StringUtils.isEmpty(uniqueId) && StringUtils.isEmpty(contractNo)) {\r\n			logger.error(\"SXHCancelServices:uniqueId和contractNo需要赋值一个\");\r\n			postRequest.put(\"errorMsg\", \"uniqueId和contractNo需要赋值一个\");\r\n			return false;\r\n		}\r\n		String requestData = (String)preRequest.getOrDefault(\"requestData\",\"\");\r\n		List<RepaymentPlanModifyRequestDataModel> models = JsonUtils.parseArray(requestData, RepaymentPlanModifyRequestDataModel.class);\r\n		logger.info(\"SXHCancelServices get sandboxDataSet\");\r\n		SandboxDataSet sandboxDataSet = sandboxDataSetHandler.get_sandbox_for_apply_repurchase_by_contract_uniqueId_contractNo(uniqueId, contractNo);\r\n		if (null == sandboxDataSet) {\r\n			logger.error(\"SXHCancelServices:sandboxDataSet is null\");\r\n			postRequest.put(\"errorMsg\", \"sandboxDataSet is null\");\r\n			return false;\r\n		}\r\n		if (null == sandboxDataSet.getFinancialContractSnapshot()) {\r\n			logger.error(\"SXHCancelServices:financialContractSnapshot is null\");\r\n			postRequest.put(\"errorMsg\", \"financialContractSnapshot is null\");\r\n			return false;\r\n		}\r\n		if(!sandboxDataSet.getFinancialContractSnapshot().isAllowFreewheelingRepayment()){\r\n			logger.error(\"SXHCancelServices:信托合同[\"+sandboxDataSet.getFinancialContractSnapshot().getContractNo()+\"]不支持随心还\");\r\n			postRequest.put(\"errorMsg\", \"信托合同不支持随心还\");\r\n			return false;\r\n		}\r\n		List<PaymentPlanSnapshot> assetSetSnapshotList = sandboxDataSet.getPaymentPlanSnapshotList();\r\n		if (CollectionUtils.isEmpty(models) || models.size() != assetSetSnapshotList.size()) {\r\n			logger.error(\"SXHCancelServices:还款计划数不匹配\");\r\n			postRequest.put(\"errorMsg\", \"还款计划数不匹配\");\r\n			return false;\r\n		}\r\n		try{\r\n			for (int i = 0; i < assetSetSnapshotList.size(); i++) {\r\n				PaymentPlanSnapshot assetSetSnapshot = (PaymentPlanSnapshot) assetSetSnapshotList.get(i);\r\n				RepaymentPlanModifyRequestDataModel modifyRequestDataModel = (RepaymentPlanModifyRequestDataModel) models\r\n						.get(i);\r\n				String asset_interest_principal_fingerPrint = modifyRequestDataModel.assetFingerPrint();\r\n				if (!assetSetSnapshot.checkAssetFingerPrint(asset_interest_principal_fingerPrint)) {\r\n					logger.error(\"SXHCancelServices:还款计划基础费用不匹配\");\r\n					postRequest.put(\"errorMsg\", \"还款计划基础费用不匹配\");\r\n					return false;\r\n				}\r\n					//还款成功和逾期\r\n				if (assetSetSnapshot.is_clear_repayment_plan()) {\r\n					logger.error(\"SXHCancelServices:还款计划[\" + assetSetSnapshot.getSingleLoanContractNo() + \"]已结清不可变更\");\r\n					postRequest.put(\"errorMsg\", \"还款计划已结清\");\r\n					return false;\r\n				}\r\n				if (assetSetSnapshot.is_overdue_repayment_plan()) {\r\n					logger.error(\"SXHCancelServices:还款计划[\" + assetSetSnapshot.getSingleLoanContractNo() + \"]已逾期不可变更\");\r\n					postRequest.put(\"errorMsg\", \"还款计划已逾期\");\r\n					return false;\r\n				}\r\n				OnAccountStatus onAccountStatus = assetSetSnapshot.getOnAccountStatus();\r\n				if (OnAccountStatus.ON_ACCOUNT != onAccountStatus) {\r\n					logger.error(\"SXHCancelServices:还款计划[\" + assetSetSnapshot.getSingleLoanContractNo() + \"]部分结算不可变更\");\r\n					postRequest.put(\"errorMsg\", \"还款计划部分结算\");\r\n					return false;\r\n				}\r\n				if (assetSetSnapshot.is_today_repayment_plan()) {\r\n					logger.error(\"SXHCancelServices:还款计划[\" + assetSetSnapshot.getSingleLoanContractNo() + \"]还款当日不允许变更\");\r\n					postRequest.put(\"errorMsg\", \"还款当日不允许变更\");\r\n					return false;\r\n				}\r\n\r\n			}\r\n\r\n			postRequest.putAll(preRequest);\r\n			postRequest.put(\"fn\",\"200001\");\r\n			postRequest.put(\"requestReason\", RepaymentPlanModifyReason.REASON_7.getOrdinal() + \"\");\r\n			logger.info(\"SXHCancelServices is end\");\r\n			return true;\r\n		} catch (Exception e) {\r\n			e.printStackTrace();\r\n			logger.error(\"SXHCancelServices exception occurred\");\r\n			return false;\r\n		}\r\n	}', 1, 'fc2b7ea16510e117de9904620ce73a0a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

DELETE from galaxy_autotest_yunxin.`t_source_repository`;

INSERT INTO `galaxy_autotest_yunxin`.`t_source_repository` (`id`, `business_type`, `source_code`, `signature`, `compile_import`, `add_time`, `last_modify_time`, `author`) VALUES ('4', 'modify-repaymentPlan/zhongan/SXH-QXSXH', 'public boolean evaluate(SandboxDataSetHandler sandboxDataSetHandler, Map<String, String> preRequest, Map<String, String> postRequest, Log logger) {\r\n		logger.info(\"SXHCancelServices has been started\");\r\n		String uniqueId = (String) preRequest.getOrDefault(\"uniqueId\",\"\");\r\n		String contractNo = (String)preRequest.getOrDefault(\"contractNo\",\"\");\r\n		if (StringUtils.isEmpty(uniqueId) && StringUtils.isEmpty(contractNo)) {\r\n			logger.error(\"SXHCancelServices:uniqueId和contractNo需要赋值一个\");\r\n			postRequest.put(\"errorMsg\", \"uniqueId和contractNo需要赋值一个\");\r\n			return false;\r\n		}\r\n		String requestData = (String)preRequest.getOrDefault(\"requestData\",\"\");\r\n		List<RepaymentPlanModifyRequestDataModel> models = JsonUtils.parseArray(requestData, RepaymentPlanModifyRequestDataModel.class);\r\n		logger.info(\"SXHCancelServices get sandboxDataSet\");\r\n		SandboxDataSet sandboxDataSet = sandboxDataSetHandler.get_sandbox_for_apply_repurchase_by_contract_uniqueId_contractNo(uniqueId, contractNo);\r\n		if (null == sandboxDataSet) {\r\n			logger.error(\"SXHCancelServices:sandboxDataSet is null\");\r\n			postRequest.put(\"errorMsg\", \"sandboxDataSet is null\");\r\n			return false;\r\n		}\r\n		if (null == sandboxDataSet.getFinancialContractSnapshot()) {\r\n			logger.error(\"SXHCancelServices:financialContractSnapshot is null\");\r\n			postRequest.put(\"errorMsg\", \"financialContractSnapshot is null\");\r\n			return false;\r\n		}\r\n		if(!sandboxDataSet.getFinancialContractSnapshot().isAllowFreewheelingRepayment()){\r\n			logger.error(\"SXHCancelServices:信托合同[\"+sandboxDataSet.getFinancialContractSnapshot().getContractNo()+\"]不支持随心还\");\r\n			postRequest.put(\"errorMsg\", \"信托合同不支持随心还\");\r\n			return false;\r\n		}\r\n		List<PaymentPlanSnapshot> assetSetSnapshotList = sandboxDataSet.getPaymentPlanSnapshotList();\r\n		if (CollectionUtils.isEmpty(models) || models.size() != assetSetSnapshotList.size()) {\r\n			logger.error(\"SXHCancelServices:还款计划数不匹配\");\r\n			postRequest.put(\"errorMsg\", \"还款计划数不匹配\");\r\n			return false;\r\n		}\r\n		try{\r\n			for (int i = 0; i < assetSetSnapshotList.size(); i++) {\r\n				PaymentPlanSnapshot assetSetSnapshot = (PaymentPlanSnapshot) assetSetSnapshotList.get(i);\r\n				RepaymentPlanModifyRequestDataModel modifyRequestDataModel = (RepaymentPlanModifyRequestDataModel) models\r\n						.get(i);\r\n				String asset_interest_principal_fingerPrint = modifyRequestDataModel.assetFingerPrint();\r\n				if (!assetSetSnapshot.checkAssetFingerPrint(asset_interest_principal_fingerPrint)) {\r\n					logger.error(\"SXHCancelServices:还款计划基础费用不匹配\");\r\n					postRequest.put(\"errorMsg\", \"还款计划基础费用不匹配\");\r\n					return false;\r\n				}\r\n					//还款成功和逾期\r\n				if (assetSetSnapshot.is_clear_repayment_plan()) {\r\n					logger.error(\"SXHCancelServices:还款计划[\" + assetSetSnapshot.getSingleLoanContractNo() + \"]已结清不可变更\");\r\n					postRequest.put(\"errorMsg\", \"还款计划已结清\");\r\n					return false;\r\n				}\r\n				if (assetSetSnapshot.is_overdue_repayment_plan()) {\r\n					logger.error(\"SXHCancelServices:还款计划[\" + assetSetSnapshot.getSingleLoanContractNo() + \"]已逾期不可变更\");\r\n					postRequest.put(\"errorMsg\", \"还款计划已逾期\");\r\n					return false;\r\n				}\r\n				OnAccountStatus onAccountStatus = assetSetSnapshot.getOnAccountStatus();\r\n				if (OnAccountStatus.ON_ACCOUNT != onAccountStatus) {\r\n					logger.error(\"SXHCancelServices:还款计划[\" + assetSetSnapshot.getSingleLoanContractNo() + \"]部分结算不可变更\");\r\n					postRequest.put(\"errorMsg\", \"还款计划部分结算\");\r\n					return false;\r\n				}\r\n				if (assetSetSnapshot.is_today_repayment_plan()) {\r\n					logger.error(\"SXHCancelServices:还款计划[\" + assetSetSnapshot.getSingleLoanContractNo() + \"]还款当日不允许变更\");\r\n					postRequest.put(\"errorMsg\", \"还款当日不允许变更\");\r\n					return false;\r\n				}\r\n\r\n			}\r\n\r\n			postRequest.putAll(preRequest);\r\n			postRequest.put(\"fn\",\"200001\");\r\n			postRequest.put(\"requestReason\", RepaymentPlanModifyReason.REASON_7.getOrdinal() + \"\");\r\n			logger.info(\"SXHCancelServices is end\");\r\n			return true;\r\n		} catch (Exception e) {\r\n			e.printStackTrace();\r\n			logger.error(\"SXHCancelServices exception occurred\");\r\n			return false;\r\n		}\r\n	}', 'e5b5e95c-2af6-11e7-952e-ba77244e2da4', 'java.math.BigDecimal,java.util.*,com.suidifu.matryoshka.customize.CustomizeServices,com.zufangbao.sun.utils.*,com.suidifu.matryoshka.snapshot.*,com.zufangbao.sun.yunxin.entity.OnAccountStatus,com.zufangbao.sun.yunxin.entity.model.api.modify.*,org.apache.commons.collections.CollectionUtils', '2017-05-04 19:03:42', '2017-05-04 19:03:42', 'sys');

DELETE FROM galaxy_autotest_yunxin.contract;

DELETE FROM galaxy_autotest_yunxin.financial_contract;

DELETE FROM galaxy_autotest_yunxin.asset_set;

DELETE FROM galaxy_autotest_yunxin.customer;

DELETE FROM galaxy_autotest_yunxin.contract_account;

INSERT INTO `contract` (`id`, `uuid`, `unique_id`, `begin_date`, `contract_no`
  , `end_date`, `asset_type`, `month_fee`, `app_id`, `customer_id`
  , `house_id`, `actual_end_date`, `create_time`, `interest_rate`, `payment_day_in_month`
  , `payment_frequency`, `periods`, `repayment_way`, `total_amount`, `penalty_interest`
  , `active_version_no`, `repayment_plan_operate_logs`, `state`, `financial_contract_uuid`, `interest_rate_cycle`
  , `customer_uuid`)
VALUES (124365, 'be834b15-56a7-4175-b926-64c90869a2f0', 'ad6b3053-8625-4eb6-a78a-dcabc6132b5d', '2017-01-01', '云信信2016-241-DK(321515600990709045)'
  , '2027-01-01', NULL, 0.00, 2, 124701
  , 124854, NULL, '2017-04-21 17:50:40', 0.8923000000, 0
  , 0, 3, 2, 20000.00, 0.0050000000
  , 1, NULL, 2, 'b674a323-0c30-4e4b-9eba-b14e05a9d80a', 2
  , 'c714fe88-8ed3-45e9-9807-59ca5bd37ae3');

INSERT INTO `financial_contract` (`id`, `asset_package_format`, `adva_matuterm`, `adva_start_date`, `contract_no`
  , `contract_name`, `app_id`, `company_id`, `adva_repo_term`, `thru_date`
  , `capital_account_id`, `financial_contract_type`, `loan_overdue_start_day`, `loan_overdue_end_day`, `payment_channel_id`
  , `ledger_book_no`, `financial_contract_uuid`, `sys_normal_deduct_flag`, `sys_overdue_deduct_flag`, `sys_create_penalty_flag`
  , `sys_create_guarantee_flag`, `unusual_modify_flag`, `sys_create_statement_flag`, `transaction_limit_per_transcation`, `transaction_limit_per_day`
  , `remittance_strategy_mode`, `app_account_uuids`, `allow_online_repayment`, `allow_offline_repayment`, `allow_advance_deduct_flag`
  , `adva_repayment_term`, `penalty`, `overdue_default_fee`, `overdue_service_fee`, `overdue_other_fee`
  , `create_time`, `last_modified_time`, `repurchase_approach`, `repurchase_rule`, `repurchase_algorithm`
  , `day_of_month`, `pay_for_go`, `repurchase_principal_algorithm`, `repurchase_interest_algorithm`, `repurchase_penalty_algorithm`
  , `repurchase_other_charges_algorithm`, `repayment_check_days`, `repurchase_cycle`, `days_of_cycle`, `temporary_repurchases`
  , `allow_freewheeling_repayment`)
VALUES (37, 0, 3, '2016-09-01 00:00:00', 'G32000'
  , '用钱宝测试', 2, 1, 60, '2017-12-01 00:00:00'
  , 101, 0, 1, 2, 1
  , 'e17d8068-46a0-48bb-b158-8e80168bbfc3', 'b674a323-0c30-4e4b-9eba-b14e05a9d80a', 0, 0, 0
  , 0, 1, 0, NULL, NULL
  , NULL, NULL, 0, 0, 0
  , 0, NULL, NULL, NULL, NULL
  , NULL, NULL, NULL, NULL, NULL
  , NULL, 0, NULL, NULL, NULL
  , NULL, -1, NULL, NULL, NULL
  , 1);

INSERT INTO `asset_set` (`id`, `guarantee_status`, `settlement_status`, `asset_fair_value`, `asset_principal_value`
  , `asset_interest_value`, `asset_initial_value`, `asset_recycle_date`, `confirm_recycle_date`, `refund_amount`
  , `asset_status`, `on_account_status`, `repayment_plan_type`, `last_valuation_time`, `asset_uuid`
  , `create_time`, `last_modified_time`, `comment`, `single_loan_contract_no`, `contract_id`
  , `actual_recycle_date`, `current_period`, `overdue_status`, `overdue_date`, `version_no`
  , `active_status`, `sync_status`, `active_deduct_application_uuid`, `repurchase_status`, `financial_contract_uuid`
  , `asset_finger_print`, `asset_extra_fee_finger_print`, `asset_finger_print_update_time`, `asset_extra_fee_finger_print_update_time`, `plan_type`
  , `write_off_reason`, `can_be_rollbacked`, `time_interval`, `deduction_status`, `executing_status`
  , `executing_status_bak`, `customer_uuid`, `contract_uuid`, `contract_funding_status`)
VALUES (373500, 0, 0, 100.00, 1000.00
  , 100.00, 1100.00, '2099-04-20', NULL, 0.00
  , 0, 1, 0, NULL, '259ef4d2-95d0-478a-b2e3-e9fe3ec1dc0d'
  , '2017-04-21 17:50:40', '2017-04-21 17:53:02', NULL, 'ZC1691381619185422336', 124365
  , NULL, 2, 0, NULL, 1
  , 0, 0, 'empty_deduct_uuid', NULL, 'b674a323-0c30-4e4b-9eba-b14e05a9d80a'
  , '12f2d1ab43432e896004fab5eeac44b2', '513521f46449e01fe6b0e9dc3ee9035b', '2017-04-21 17:50:40', '2017-04-21 17:50:40', 0
  , 0, 0, 0, 0, 0
  , 0, 'c714fe88-8ed3-45e9-9807-59ca5bd37ae3', 'be834b15-56a7-4175-b926-64c90869a2f0', 0),
  (373501, 0, 0, 10010.00, 1000.00
    , 100.00, 1100.00, '2099-05-20', NULL, 0.00
    , 0, 1, 0, NULL, '922b2d45-da2c-4b6b-87a2-30a5303a5da0'
    , '2017-04-21 17:50:40', '2017-04-21 17:50:40', NULL, 'ZC1691381619856510976', 124365
    , NULL, 3, 0, NULL, 1
    , 0, 0, 'empty_deduct_uuid', NULL, 'b674a323-0c30-4e4b-9eba-b14e05a9d80a'
    , 'baed3060329832c3b3c8df6337e1bf35', '513521f46449e01fe6b0e9dc3ee9035b', '2017-04-21 17:50:40', '2017-04-21 17:50:40', 0
    , 0, 0, 0, 0, 0
    , 0, 'c714fe88-8ed3-45e9-9807-59ca5bd37ae3', 'be834b15-56a7-4175-b926-64c90869a2f0', NULL);

INSERT INTO `customer` (`id`, `account`, `mobile`, `name`, `source`
  , `app_id`, `customer_uuid`, `customer_type`)
VALUES (124701, '410402198801111211', NULL, '测试', 'ad6b3053-8625-4eb6-a78a-dcabc6132b5d'
  , 2, 'c714fe88-8ed3-45e9-9807-59ca5bd37ae3', 0);

INSERT INTO `contract_account` (`id`, `pay_ac_no`, `bankcard_type`, `contract_id`, `payer_name`, `bank`, `bind_id`, `id_card_num`, `bank_code`, `province`, `province_code`, `city`, `city_code`, `standard_bank_code`, `from_date`, `thru_date`, `virtual_account_uuid`, `bank_card_status`, `contract_account_uuid`, `contract_account_type`)
VALUES
  (132478, '621700121007322332325327590', NULL, 124365, '测试', '中国建设银行 ', NULL, '410402198801111211', NULL, '上海市',
           '310000', '上海市', '310100', 'C10105', '2017-04-21 17:50:40', '2900-01-01 00:00:00', NULL, 1, 'ee49f71e318b4976876a9fe367f464d0', 0);

SET FOREIGN_KEY_CHECKS=1;