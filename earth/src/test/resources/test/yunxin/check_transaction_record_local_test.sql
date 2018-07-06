SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM  `rent_order`;
DELETE FROM  `financial_contract`;
DELETE FROM  `asset_set`;
DELETE FROM  `journal_voucher`;
DELETE FROM  `source_document_detail`;
DELETE FROM  `source_document`;
DELETE FROM  `t_deduct_plan`;
DELETE FROM  `t_deduct_application`;
DELETE FROM  `contract`;
DELETE FROM  `ledger_book`;
DELETE FROM  `ledger_book_shelf`;
DELETE FROM  `audit_job`;
DELETE FROM  `beneficiary_audit_result`;
DELETE FROM  `app`;
DELETE FROM  `contract`;
DELETE FROM  `company`;
DELETE FROM  `account`;

INSERT INTO `audit_job` (`id`, `uuid`, `audit_job_no`, `financial_contract_uuid`, `capital_account_no`, `payment_channel_uuid`, `payment_channel_service_uuid`, `pg_clearing_account`, `payment_institution`, `audit_job_source`, `account_side`, `start_time`, `end_time`, `audit_result`, `create_time`, `last_modified_time`, `clearing_status`, `merchant_no`) VALUES 
('3150', 'd4aa03af-e785-460d-b9d3-f206fe024df2', 'DZ1818569645060194304', 'd2812bc5-5057-4a91-b3fd-9019506f0499', '600000000001', '16ea0d08-735f-11e6-bf08-00163e002839', 'f1ccca57-7c80-4429-b226-8ad31a729609', NULL, '0', '1', '1', '2017-05-02 00:00:00', '2017-05-02 23:59:59', '1', '2017-05-02 17:04:25', '2017-05-03 03:00:03', '0', '001053110000001');

INSERT INTO `beneficiary_audit_result` (`id`, `uuid`, `financial_contract_uuid`, `payment_channel_uuid`, `payment_gateway`, `fst_merchant_no`, `snd_merchant_no`, `system_bill_identity`, `system_bill_plan_amount`, `system_bill_occur_date`, `system_bill_transaction_time`, `system_bill_type`, `trans_excution_status`, `local_party_account_no`, `counter_party_payment_bank`, `counter_party_account_name`, `counter_party_account_no`, `counter_party_id_card_no`, `cash_flow_financial_contract_identity`, `cash_flow_payment_channel_identity`, `cash_flow_payment_gateway`, `cash_flow_fst_merchant_no`, `cash_flow_snd_merchant_no`, `cash_flow_identity`, `cash_flow_type`, `cash_flow_sequence_no`, `cash_flow_transaction_time`, `cash_flow_transaction_amount`, `cash_flow_settle_date`, `cash_flow_account_side`, `cash_flow_remark`, `cash_flow_appendix`, `last_modified_time`, `result_code`, `result_time`, `trade_uuid`) VALUES 
('114245', 'dcd2f832-d69d-4876-a6ad-1d4ed01837ea', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 'f1ccca57-7c80-4429-b226-8ad31a729609', '0', '001053110000001', '', 'fe6aec82-3052-459e-86d1-341e60d2958c', '500.00', '2017-05-02 17:07:21', '2017-05-02 17:06:42', '2', '2', '', '', '李杰', '6214855712106520', '320301198502169142', NULL, '', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-05-02 18:32:51', '1', '2017-05-02 17:07:21', 'mSwVofa6FdCraVOlRLb');

INSERT INTO `financial_contract` (`id`, `asset_package_format`, `adva_matuterm`, `adva_start_date`, `contract_no`, `contract_name`, `app_id`, `company_id`, `adva_repo_term`, `thru_date`, `capital_account_id`, `financial_contract_type`, `loan_overdue_start_day`, `loan_overdue_end_day`, `payment_channel_id`, `ledger_book_no`, `financial_contract_uuid`, `sys_normal_deduct_flag`, `sys_overdue_deduct_flag`, `sys_create_penalty_flag`, `sys_create_guarantee_flag`, `unusual_modify_flag`, `sys_create_statement_flag`, `transaction_limit_per_transcation`, `transaction_limit_per_day`, `remittance_strategy_mode`, `app_account_uuids`, `allow_online_repayment`, `allow_offline_repayment`, `allow_advance_deduct_flag`, `adva_repayment_term`, `penalty`, `overdue_default_fee`, `overdue_service_fee`, `overdue_other_fee`, `create_time`, `last_modified_time`, `repurchase_approach`, `repurchase_rule`, `repurchase_algorithm`, `day_of_month`) VALUES ('38', '0', '0', '2016-09-01 00:00:00', 'G31700', '拍拍贷测试', '3', '1', '10', '2017-08-31 00:00:00', '102', '0', '2', '9', '1', '7dd4ee73-8dcf-4dbc-94ee-932ff9f48b58', 'd2812bc5-5057-4a91-b3fd-9019506f0499', '0', '0', '1', '1', '1', '0', NULL, NULL, NULL, NULL, '0', '1', '1', '1', '', NULL, NULL, NULL, NULL, '2017-03-16 21:41:08', '1', '1', 'outstandingPrincipal+outstandingInterest+outstandingPenaltyInterest', '6');

INSERT INTO `t_deduct_plan` (`id`, `deduct_plan_uuid`, `deduct_application_uuid`, `deduct_application_detail_uuid`, `financial_contract_uuid`, `contract_unique_id`, `contract_no`, `payment_gateway`, `payment_channel_uuid`, `pg_account`, `pg_clearing_account`, `transaction_type`, `transaction_remark`, `cp_bank_code`, `cp_bank_card_no`, `cp_bank_account_holder`, `cp_id_type`, `cp_id_number`, `cp_bank_province`, `cp_bank_city`, `cp_bank_name`, `planned_payment_date`, `complete_payment_date`, `planned_total_amount`, `actual_total_amount`, `execution_precond`, `execution_status`, `execution_remark`, `create_time`, `creator_name`, `last_modified_time`, `transaction_serial_no`, `mobile`, `transaction_recipient`, `trade_uuid`, `repayment_type`, `source_type`, `complete_time`, `transaction_time`) VALUES 
('112774', 'fe6aec82-3052-459e-86d1-341e60d29581', 'bba79c41-6345-4fa9-ba52-e8623b1a4d5c', NULL, 'd2812bc5-5057-4a91-b3fd-9019506f0499', '0609666a-a295-4935-94c4-5c27be174036', '0609666a-a295-4935-94c4-5c27be174036', '0', 'f1ccca57-7c80-4429-b226-8ad31a729609', '001053110000001', NULL, '1', '', 'C10105', '6214855712106520', '李杰', '0', '320301198502169142', '110000', '110100', '中国建设银行 ', NULL, '2017-05-02 17:03:05', '500.00', '500.00', NULL, '2', '交易?成功', '2017-05-02 17:06:42', 't_test_zfb', '2017-05-02 17:07:21', NULL, '13777847783', '1', 'mSwVofa6FdCraVOlRLb', '0', NULL, '2017-05-02 17:07:21', '2017-05-02 17:06:42');


INSERT INTO `t_deduct_application` (`id`, `deduct_application_uuid`, `deduct_id`, `request_no`, `financial_contract_uuid`, `financial_product_code`, `contract_unique_id`, `repayment_plan_code_list`, `contract_no`, `planned_deduct_total_amount`, `actual_deduct_total_amount`, `notify_url`, `transcation_type`, `repayment_type`, `execution_status`, `execution_remark`, `create_time`, `creator_name`, `ip`, `last_modified_time`, `record_status`, `is_available`, `api_called_time`, `transaction_recipient`, `customer_name`, `mobile`, `gateway`, `source_type`, `third_part_voucher_status`, `complete_time`, `transaction_time`) VALUES 
('61162', 'bba79c41-6345-4fa9-ba52-e8623b1a4d5c', '18782809-5181-4987-b20f-2941d7664b60', 'b0d61d6c-d056-456b-b5b9-27c7299b978c', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 'G31700', '0609666a-a295-4935-94c4-5c27be174036', '[\"ZC1818352421183602688\"]', '0609666a-a295-4935-94c4-5c27be174036', '500.00', '500.00', '', '1', '0', '2', '交易成功', '2017-05-02 17:06:25', 't_test_zfb', '192.168.0.105', '2017-05-02 17:07:21', '2', '0', '2017-05-02 00:00:00', '1', '李杰', '13777847783', '', '1', '1', '2017-05-02 17:07:21', '2017-05-02 17:06:25');

INSERT INTO `contract` (`id`, `uuid`, `unique_id`, `begin_date`, `contract_no`, `end_date`, `asset_type`, `month_fee`, `app_id`, `customer_id`, `house_id`, `actual_end_date`, `create_time`, `interest_rate`, `payment_day_in_month`, `payment_frequency`, `periods`, `repayment_way`, `total_amount`, `penalty_interest`, `active_version_no`, `repayment_plan_operate_logs`, `state`, `financial_contract_uuid`, `interest_rate_cycle`, `customer_uuid`) VALUES 
('198827', '2dc1441e-4971-4121-98a3-df5e71623acb', '0609666a-a295-4935-94c4-5c27be174036', '2017-05-02', '0609666a-a295-4935-94c4-5c27be174036', '2099-01-01', NULL, '0.00', '3', '199161', '199316', NULL, '2017-05-02 16:37:26', '0.1560000000', '0', '0', '3', '2', '1500.00', '0.0005000000', '1', NULL, '2', 'd2812bc5-5057-4a91-b3fd-9019506f0499', '1', 'd49bc974-1683-4ac7-b16b-40d3f801c79b');

INSERT INTO `company` (`id`, `address`, `full_name`, `short_name`, `uuid`) VALUES 
('1', '上海', '测试金融公司', '测试金融', 'a02c02b9-6f98-11e6-bf08-00163e002839');

INSERT INTO `app` (`id`, `app_id`, `app_secret`, `is_disabled`, `host`, `name`, `company_id`, `addressee`) VALUES 
('3', 'ppd', NULL, '', NULL, '测试商户ppd', '5', NULL);

INSERT INTO `account` (`id`, `account_name`, `account_no`, `bank_name`, `alias`, `attr`, `scan_cash_flow_switch`, `usb_key_configured`, `uuid`, `bank_code`, `cash_flow_config`) VALUES 
('102', '云南信托国际有限公司', '600000000001', '平安银行深圳分行', NULL, NULL, '\0', '\0', 'bd7dd5b1-aa53-4faf-9647-00ddb8ab4b42', 'PAB', NULL);


SET FOREIGN_KEY_CHECKS = 1;