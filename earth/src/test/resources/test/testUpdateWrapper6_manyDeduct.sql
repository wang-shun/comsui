SET FOREIGN_KEY_CHECKS=0;

delete from `t_deduct_plan`;

delete from `source_document`;

delete from `source_document_detail`;

delete from `asset_set`;

delete from `journal_voucher`;

delete from `rent_order`;

delete from `financial_contract`;

delete from `ledger_book`;

delete from `ledger_book_shelf`;

INSERT INTO  `t_deduct_plan` (`id`, `deduct_plan_uuid`, `deduct_application_uuid`, `deduct_application_detail_uuid`, `financial_contract_uuid`, `contract_unique_id`, `contract_no`, `payment_gateway`, `payment_channel_uuid`, `pg_account`, `pg_clearing_account`, `transaction_type`, `transaction_remark`, `cp_bank_code`, `cp_bank_card_no`, `cp_bank_account_holder`, `cp_id_type`, `cp_id_number`, `cp_bank_province`, `cp_bank_city`, `cp_bank_name`, `planned_payment_date`, `complete_payment_date`, `planned_total_amount`, `actual_total_amount`, `execution_precond`, `execution_status`, `execution_remark`, `create_time`, `creator_name`, `last_modified_time`, `transaction_serial_no`, `mobile`, `transaction_recipient`, `trade_uuid`, `repayment_type`, `source_type`, `complete_time`, `transaction_time`)
 VALUES ('13', 'b1581eb6-2509-4055-894b-1dc4d812d9cc', '9a343280-3f2b-4b38-8339-51f2bd0f9afd', NULL, 'db36ecc9-d80c-4350-bd0d-59b1139d550d', NULL, '2c1ebc2a-a6ce-4709-a20f-b4d6b56460a2', NULL, 'f8bb9956-1952-4893-98c8-66683d25d7ce', 't_test_zfb', NULL, '1', NULL, NULL, '23456787654323456', '郑航波', '0', '330683199403062411', '330000', '110100', '中国工商银行 ', NULL, NULL, '20.00', '0.00', NULL, '3', '系统繁忙，请稍后再试', '2016-08-30 17:31:09', 't_test_zfb', '2016-08-30 17:31:09', NULL, NULL, '0', NULL, '0', '1', '2016-08-30 17:31:09', '2016-08-30 17:31:09');

--INSERT INTO `journal_voucher` (`id`, `account_side`, `bank_identity`, `billing_plan_uuid`, `booking_amount`, `business_voucher_type_uuid`, `business_voucher_uuid`, `cash_flow_amount`, `cash_flow_breif`, `cash_flow_channel_type`, `cash_flow_serial_no`, `cash_flow_uuid`, `checking_level`, `company_id`, `completeness`, `counter_party_account`, `counter_party_name`, `journal_voucher_uuid`, `notification_identity`, `notification_memo`, `notification_record_uuid`, `notified_date`, `settlement_modes`, `source_document_amount`, `source_document_breif`, `source_document_cash_flow_serial_no`, `source_document_counter_party_uuid`, `source_document_identity`, `source_document_uuid`, `status`, `trade_time`, `batch_uuid`, `created_date`, `source_document_counter_party_account`, `source_document_counter_party_name`, `issued_time`, `journal_voucher_type`, `counter_account_type`, `related_bill_contract_info_lv_1`, `related_bill_contract_info_lv_2`, `related_bill_contract_info_lv_3`, `cash_flow_account_info`, `journal_voucher_no`, `related_bill_contract_no_lv_1`, `related_bill_contract_no_lv_2`, `related_bill_contract_no_lv_3`, `related_bill_contract_no_lv_4`, `source_document_no`, `appendix`, `last_modified_time`, `local_party_account`, `local_party_name`, `source_document_local_party_account`, `source_document_local_party_name`, `second_journal_voucher_type`, `third_journal_voucher_type`, `is_has_data_sync_log`) VALUES ('3051473', '1', '', 'c9ff508e-79ac-4252-a456-f1b81afb6a51', '2152.81', '2b784ef2-a1ab-41fa-b315-8e1bf8cfa2ba', '', '2152.81', NULL, '8', NULL, NULL, '0', '1', '3', '6217001630026571148', '管涛', '1494fc62-77e5-4353-ad77-948b2aa2c30a', NULL, NULL, NULL, NULL, NULL, '2152.81', NULL, NULL, NULL, '8f36511d-a963-41db-b003-90dcacd378d0', '616afc6b-1db1-4738-acfb-d171253bc725', '1', '2017-05-08 14:25:19', NULL, '2017-05-08 13:38:51', '6217001630026571148', '管涛', NULL, '7', '0', '4d6c719f-c70b-4661-baf9-43d7cfbb2461', 'c5f7a0c1-b298-4577-a3f8-c703b574cc1c', 'c9ff508e-79ac-4252-a456-f1b81afb6a51', '', 'b61cc4d8-aeaf-4813-886b-ae4c9010c7ec', '云南信托普惠33号维信金科第1期单一资金信托', '云信信2017-773-DK(KK183170017019010239)号', 'ZC1890335471647318016', 'JS2730FAE57E8F1E67', 'KK1890358114191843328', NULL, '2017-05-08 21:38:51', '19014528261386', '云南国际信托有限公司', '19014528261386', '云南国际信托有限公司', '2', '1', '0');

INSERT INTO  `journal_voucher` (`id`, `account_side`, `bank_identity`, `billing_plan_uuid`, `booking_amount`, `business_voucher_type_uuid`, `business_voucher_uuid`, `cash_flow_amount`, `cash_flow_breif`, `cash_flow_channel_type`, `cash_flow_serial_no`, `cash_flow_uuid`, `checking_level`, `company_id`, `completeness`, `counter_party_account`, `counter_party_name`, `journal_voucher_uuid`, `notification_identity`, `notification_memo`, `notification_record_uuid`, `notified_date`, `settlement_modes`, `source_document_amount`, `source_document_breif`, `source_document_cash_flow_serial_no`, `source_document_counter_party_uuid`, `source_document_identity`, `source_document_uuid`, `status`, `trade_time`, `batch_uuid`, `created_date`, `source_document_counter_party_account`, `source_document_counter_party_name`, `issued_time`, `journal_voucher_type`, `counter_account_type`, `related_bill_contract_info_lv_1`, `related_bill_contract_info_lv_2`, `related_bill_contract_info_lv_3`, `cash_flow_account_info`, `journal_voucher_no`, `related_bill_contract_no_lv_1`, `related_bill_contract_no_lv_2`, `related_bill_contract_no_lv_3`, `related_bill_contract_no_lv_4`, `source_document_no`, `appendix`, `last_modified_time`, `local_party_account`, `local_party_name`, `source_document_local_party_account`, `source_document_local_party_name`, `second_journal_voucher_type`, `third_journal_voucher_type`, `is_has_data_sync_log`)
 VALUES ('3051473', '1', '', 'c9ff508e-79ac-4252-a456-f1b81afb6a51', '2152.81', '2b784ef2-a1ab-41fa-b315-8e1bf8cfa2ba', '', '2152.81', NULL, '8', NULL, NULL, '0', '1', '3', '6217001630026571148', '管涛', '1494fc62-77e5-4353-ad77-948b2aa2c30a', NULL, NULL, NULL, NULL, NULL, '2152.81', NULL, NULL, NULL, '8f36511d-a963-41db-b003-90dcacd378d0', '616afc6b-1db1-4738-acfb-d171253bc725', '1', '2017-05-08 14:25:19', NULL, '2017-05-08 13:38:51', '6217001630026571148', '管涛', NULL, '7', '0', '4d6c719f-c70b-4661-baf9-43d7cfbb2461', 'c5f7a0c1-b298-4577-a3f8-c703b574cc1c', '11111111-0691-463e-b08d-6ff0c0bcf4a6', '', 'b61cc4d8-aeaf-4813-886b-ae4c9010c7ec', '云南信托普惠33号维信金科第1期单一资金信托', '云信信2017-773-DK(KK183170017019010239)号', 'ZC1890335471647318016', 'JS2730FAE57E8F1E67', 'KK1890358114191843328', NULL, '2017-05-08 21:38:51', '19014528261386', '云南国际信托有限公司', '19014528261386', '云南国际信托有限公司', '2', '1', '0');

INSERT INTO `source_document` (`id`, `company_id`, `source_document_uuid`, `source_document_type`, `create_time`, `issued_time`, `source_document_status`, `source_account_side`, `booking_amount`, `outlier_document_uuid`, `outlier_trade_time`, `outlier_counter_party_account`, `outlier_counter_party_name`, `outlier_account`, `outlie_account_name`, `outlier_account_id`, `outlier_company_id`, `outlier_serial_global_identity`, `outlier_memo`, `outlier_amount`, `outlier_settlement_modes`, `outlier_breif`, `outlier_account_side`, `appendix`, `first_outlier_doc_type`, `second_outlier_doc_type`, `third_outlier_doc_type`, `currency_type`, `audit_status`, `first_party_id`, `second_party_id`, `virtual_account_uuid`, `first_account_id`, `second_account_id`, `third_account_id`, `excute_status`, `excute_result`, `related_contract_uuid`, `financial_contract_uuid`, `source_document_no`, `first_party_type`, `first_party_name`, `virtual_account_no`, `last_modified_time`, `voucher_uuid`, `plan_booking_amount`)
 VALUES ('356', '1', '8eea2e94-9cd4-4ab6-94e0-d4c48ac4dbad', '1', '2016-09-14 16:40:50', NULL, '1', '1', '1023.00', '9a343280-3f2b-4b38-8339-51f2bd0f9afd', '2016-09-14 15:43:31', '6217000000000000000', '阿沛·阿旺晋美', NULL, NULL, NULL, '1', 'fd4b629f-6d8c-472d-a028-cbe82bf08bab', '', '1023.00', '3', '[\"ZC274928154A28E7E5\"]', '1', NULL, 'deduct_application', 'interface_on_line_payment', NULL, NULL, '0', 'a02c02b9-6f98-11e6-bf08-00163e002839', '7ce7ebff-29e7-485e-9483-e0f73f0dac12', NULL, 'b6f2c0fc-2ee9-4cfc-9b85-eb02937c4364', 'd8130a85-145e-4129-8f41-8e24a2e004dc', NULL, '2', NULL, '5f380588-0691-463e-b08d-6ff0c0bcf4a6', 'db36ecc9-d80c-4350-bd0d-59b1139d550d', 'KK274929C7353ECFFD', NULL, '测试金融', NULL, '2016-09-14 16:40:50', NULL, '0.00');

INSERT INTO `source_document_detail` (`id`, `uuid`, `source_document_uuid`, `contract_unique_id`, `repayment_plan_no`, `amount`, `status`, `first_type`, `first_no`, `second_type`, `second_no`, `payer`, `receivable_account_no`, `payment_account_no`, `payment_name`, `payment_bank`, `check_state`, `comment`, `financial_contract_uuid`, `principal`, `interest`, `service_charge`, `maintenance_charge`, `other_charge`, `penalty_fee`, `late_penalty`, `late_fee`, `late_other_cost`, `voucher_uuid`, `actual_payment_time`)
 VALUES ('10395', '616afc6b-1db1-4738-acfb-d171253bc725', '8eea2e94-9cd4-4ab6-94e0-d4c48ac4dbad', '0ed74914-703f-460a-9d5f-7cf5cf275870', 'ZC274928154A28E7E5', '20.00', '0', 'enum.voucher-source.third-party-deduction-voucher', 'b6f2c0fc-2ee9-4cfc-9b85-eb02937c4364', 'enum.voucher-type.third_party_deduction_voucher', 'fd4b629f-6d8c-472d-a028-cbe82bf08bab', '0', '6600000000000000001', '6217000000000000000', '阿沛·阿旺晋美', '中国建设银行', '0', NULL, 'db36ecc9-d80c-4350-bd0d-59b1139d550d', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL);

INSERT INTO  `asset_set` (`id`, `guarantee_status`, `settlement_status`, `asset_fair_value`, `asset_principal_value`, `asset_interest_value`, `asset_initial_value`, `asset_recycle_date`, `confirm_recycle_date`, `refund_amount`, `asset_status`, `on_account_status`, `repayment_plan_type`, `last_valuation_time`, `asset_uuid`, `create_time`, `last_modified_time`, `comment`, `single_loan_contract_no`, `contract_id`, `actual_recycle_date`, `current_period`, `overdue_status`, `overdue_date`, `version_no`, `active_status`, `sync_status`, `active_deduct_application_uuid`, `repurchase_status`, `financial_contract_uuid`, `asset_finger_print`, `asset_extra_fee_finger_print`, `asset_finger_print_update_time`, `asset_extra_fee_finger_print_update_time`, `plan_type`, `write_off_reason`, `can_be_rollbacked`, `time_interval`, `deduction_status`, `executing_status`, `executing_status_bak`, `customer_uuid`, `contract_uuid`, `contract_funding_status`)
 VALUES ('1', '2', '0', '1324.80', '0.00', '1200.00', '1200.00', '2016-05-17', NULL, '0.00', '0', '1', '0', '2016-12-11 03:00:38', '11111111-0691-463e-b08d-6ff0c0bcf4a6', '2016-05-27 18:27:16', '2016-12-11 03:00:38', '2656', 'ZC274928154A28E7E5', '1', NULL, '1', '2', '2016-07-29', '1', '0', '0', 'repurchasing', '2', '2d380fe1-7157-490d-9474-12c5a9901e29', NULL, NULL, NULL, NULL, '0', '0', '0', '2', '0', '5', NULL, '81cbfcab-aac4-4c92-9580-0b1d3d5b768f', 'a0afc961-5fa8-11e6-b2c2-00163e002839', '1');

--INSERT INTO   `journal_voucher` (`id`, `account_side`, `bank_identity`, `billing_plan_uuid`, `booking_amount`, `business_voucher_type_uuid`, `business_voucher_uuid`, `cash_flow_amount`, `cash_flow_breif`, `cash_flow_channel_type`, `cash_flow_serial_no`, `cash_flow_uuid`, `checking_level`, `company_id`, `completeness`, `counter_party_account`, `counter_party_name`, `journal_voucher_uuid`, `notification_identity`, `notification_memo`, `notification_record_uuid`, `notified_date`, `settlement_modes`, `source_document_amount`, `source_document_breif`, `source_document_cash_flow_serial_no`, `source_document_counter_party_uuid`, `source_document_identity`, `source_document_uuid`, `status`, `trade_time`, `batch_uuid`, `created_date`, `source_document_counter_party_account`, `source_document_counter_party_name`, `issued_time`, `journal_voucher_type`, `counter_account_type`, `related_bill_contract_info_lv_1`, `related_bill_contract_info_lv_2`, `related_bill_contract_info_lv_3`, `cash_flow_account_info`, `journal_voucher_no`, `related_bill_contract_no_lv_1`, `related_bill_contract_no_lv_2`, `related_bill_contract_no_lv_3`, `related_bill_contract_no_lv_4`, `source_document_no`, `appendix`, `last_modified_time`, `local_party_account`, `local_party_name`, `source_document_local_party_account`, `source_document_local_party_name`, `second_journal_voucher_type`, `third_journal_voucher_type`, `is_has_data_sync_log`) VALUES ('3051473', '1', '', 'c9ff508e-79ac-4252-a456-f1b81afb6a51', '2152.81', '2b784ef2-a1ab-41fa-b315-8e1bf8cfa2ba', '', '2152.81', NULL, '8', NULL, NULL, '0', '1', '3', '6217001630026571148', '管涛', '1494fc62-77e5-4353-ad77-948b2aa2c30a', NULL, NULL, NULL, NULL, NULL, '2152.81', NULL, NULL, NULL, '8f36511d-a963-41db-b003-90dcacd378d0', '7fff46d9-f393-4bd9-a6a4-fba8759b7176', '0', '2017-05-08 14:25:19', NULL, '2017-05-08 13:38:51', '6217001630026571148', '管涛', NULL, '7', '0', '4d6c719f-c70b-4661-baf9-43d7cfbb2461', 'c5f7a0c1-b298-4577-a3f8-c703b574cc1c', 'c9ff508e-79ac-4252-a456-f1b81afb6a51', '', 'b61cc4d8-aeaf-4813-886b-ae4c9010c7ec', '云南信托普惠33号维信金科第1期单一资金信托', '云信信2017-773-DK(KK183170017019010239)号', 'ZC1890335471647318016', NULL, 'KK1890358114191843328', NULL, '2017-05-08 21:38:51', '19014528261386', '云南国际信托有限公司', '19014528261386', '云南国际信托有限公司', '2', '1', '0');

INSERT INTO   `rent_order` (`id`, `order_type`, `due_date`, `order_no`, `payout_time`, `total_rent`, `customer_id`, `user_upload_param`, `modify_time`, `financial_contract_id`, `repayment_bill_id`, `asset_set_id`, `create_time`, `clearing_status`, `executing_settling_status`, `comment`, `charges_detail`, `order_source`)
 VALUES ('1', '0', '2016-05-27', 'JS2730FAE57E8F1E67', NULL, '1203.60', '1', '[1,2,3,4,5,6,7,8,9,10,11]', '2016-05-27 18:29:50', '5', '4dee1d4bce2742d19480e236585f2b46', '1', '2016-05-27 18:28:12', '0', '1', NULL, NULL, '0');

--INSERT INTO   `financial_contract` (`id`, `asset_package_format`, `adva_matuterm`, `adva_start_date`, `contract_no`, `contract_name`, `app_id`, `company_id`, `adva_repo_term`, `thru_date`, `capital_account_id`, `financial_contract_type`, `loan_overdue_start_day`, `loan_overdue_end_day`, `payment_channel_id`, `ledger_book_no`, `financial_contract_uuid`, `sys_normal_deduct_flag`, `sys_overdue_deduct_flag`, `sys_create_penalty_flag`, `sys_create_guarantee_flag`, `unusual_modify_flag`, `sys_create_statement_flag`, `transaction_limit_per_transcation`, `transaction_limit_per_day`, `remittance_strategy_mode`, `app_account_uuids`, `allow_online_repayment`, `allow_offline_repayment`, `allow_advance_deduct_flag`, `adva_repayment_term`, `penalty`, `overdue_default_fee`, `overdue_service_fee`, `overdue_other_fee`, `create_time`, `last_modified_time`, `repurchase_approach`, `repurchase_rule`, `repurchase_algorithm`, `day_of_month`, `pay_for_go`, `repurchase_principal_algorithm`, `repurchase_interest_algorithm`, `repurchase_penalty_algorithm`, `repurchase_other_charges_algorithm`, `repayment_check_days`, `repurchase_cycle`, `days_of_cycle`, `temporary_repurchases`) VALUES ('33', '1', '3', '1900-01-01 00:00:00', 'G00003', 'YQB001', '2', '1', '91', '2900-01-01 00:00:00', '34', '0', '30', '90', '1', 'db8cec9e-8249-4e17-9922-b29a9dc8350e', 'db36ecc9-d80c-4350-bd0d-59b1139d550d', '0', '0', '0', '0', '1', '0', NULL, NULL, NULL, NULL, '0', '0', '0', '29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '-1', NULL, NULL, '0');

INSERT INTO  `financial_contract` (`id`, `asset_package_format`, `adva_matuterm`, `adva_start_date`, `contract_no`, `contract_name`, `app_id`, `company_id`, `adva_repo_term`, `thru_date`, `capital_account_id`, `financial_contract_type`, `loan_overdue_start_day`, `loan_overdue_end_day`, `payment_channel_id`, `ledger_book_no`, `financial_contract_uuid`, `sys_normal_deduct_flag`, `sys_overdue_deduct_flag`, `sys_create_penalty_flag`, `sys_create_guarantee_flag`, `unusual_modify_flag`, `sys_create_statement_flag`, `transaction_limit_per_transcation`, `transaction_limit_per_day`, `remittance_strategy_mode`, `app_account_uuids`, `allow_online_repayment`, `allow_offline_repayment`, `allow_advance_deduct_flag`, `adva_repayment_term`, `penalty`, `overdue_default_fee`, `overdue_service_fee`, `overdue_other_fee`, `create_time`, `last_modified_time`, `repurchase_approach`, `repurchase_rule`, `repurchase_algorithm`, `day_of_month`, `pay_for_go`, `repurchase_principal_algorithm`, `repurchase_interest_algorithm`, `repurchase_penalty_algorithm`, `repurchase_other_charges_algorithm`, `repayment_check_days`, `repurchase_cycle`, `days_of_cycle`, `temporary_repurchases`)
 VALUES ('33', '1', '3', '1900-01-01 00:00:00', 'G00003', 'YQB001', '2', '1', '91', '2900-01-01 00:00:00', '34', '0', '30', '90', '1', 'db8cec9e-8249-4e17-9922-b29a9dc8350e', '2d380fe1-7157-490d-9474-12c5a9901e29', '0', '0', '0', '0', '1', '0', NULL, NULL, NULL, NULL, '0', '0', '0', '29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '-1', NULL, NULL, '0');

INSERT INTO `ledger_book` (`id`, `ledger_book_no`, `ledger_book_orgnization_id`, `book_master_id`, `party_concerned_ids`) VALUES ('1', 'db8cec9e-8249-4e17-9922-b29a9dc8350e', '1', '1', '');
 
INSERT INTO `ledger_book_shelf` (`id`, `ledger_uuid`, `debit_balance`, `credit_balance`, `first_account_name`, `first_account_uuid`, `account_side`, `second_account_name`, `second_account_uuid`, `third_account_name`, `third_account_uuid`, `first_party_id`, `second_party_id`, `third_party_id`, `forward_ledger_uuid`, `backward_ledger_uuid`, `batch_serial_uuid`, `amortized_date`, `book_in_date`, `business_voucher_uuid`, `carried_over_date`, `contract_id`, `contract_uuid`, `default_date`, `journal_voucher_uuid`, `ledger_book_no`, `ledger_book_owner_id`, `life_cycle`, `related_lv_1_asset_outer_idenity`, `related_lv_1_asset_uuid`, `related_lv_2_asset_outer_idenity`, `related_lv_2_asset_uuid`, `related_lv_3_asset_outer_idenity`, `related_lv_3_asset_uuid`, `source_document_uuid`)
VALUES ('1001', '6acc1239-2727-4224-9094-baab0b4bcc50', '20.00', '0.00', 'FST_BANK_SAVING', '60000', '1', 'SND_BANK_SAVING_GENERAL', '60000.1000', 'TRD_BANK_SAVING_GENERAL_PRINCIPAL', '60000.1000.01', 'a02c02b9-6f98-11e6-bf08-00163e002839', '61042cf5-7202-4f1a-af52-09dddfdc9ec8', NULL, '57b5faca-d6a8-4524-ae2f-997f5c131500', NULL, 'bb51e244-e139-4a1a-8736-f46fe660818b', '2017-09-15', '2017-09-18 11:42:04', NULL, NULL, '197592', '383101ae-812f-4135-b6a4-32d8baaf361b', '2017-09-15 00:00:00', '1494fc62-77e5-4353-ad77-948b2aa2c30a', 'db8cec9e-8249-4e17-9922-b29a9dc8350e', '1', '1', 'ZC107121092128985088', '11111111-0691-463e-b08d-6ff0c0bcf4a6', 'e6bcfc3a-bef7-42d7-8400-2be6de77bb6d', NULL, NULL, NULL, NULL);
INSERT INTO `ledger_book_shelf` (`id`, `ledger_uuid`, `debit_balance`, `credit_balance`, `first_account_name`, `first_account_uuid`, `account_side`, `second_account_name`, `second_account_uuid`, `third_account_name`, `third_account_uuid`, `first_party_id`, `second_party_id`, `third_party_id`, `forward_ledger_uuid`, `backward_ledger_uuid`, `batch_serial_uuid`, `amortized_date`, `book_in_date`, `business_voucher_uuid`, `carried_over_date`, `contract_id`, `contract_uuid`, `default_date`, `journal_voucher_uuid`, `ledger_book_no`, `ledger_book_owner_id`, `life_cycle`, `related_lv_1_asset_outer_idenity`, `related_lv_1_asset_uuid`, `related_lv_2_asset_outer_idenity`, `related_lv_2_asset_uuid`, `related_lv_3_asset_outer_idenity`, `related_lv_3_asset_uuid`, `source_document_uuid`)
VALUES ('1002', '57b5faca-d6a8-4524-ae2f-997f5c131500', '0.00', '10.00', 'FST_RECIEVABLE_ASSET', '20000', '1', 'SND_RECIEVABLE_OVERDUE_LOAN_ASSET', '20000.05', 'TRD_RECIEVABLE_OVERDUE_LOAN_ASSET_INTEREST', '20000.05.02', 'a02c02b9-6f98-11e6-bf08-00163e002839', '61042cf5-7202-4f1a-af52-09dddfdc9ec8', NULL, NULL, '6acc1239-2727-4224-9094-baab0b4bcc50', 'bb51e244-e139-4a1a-8736-f46fe660818b', '2017-09-15', '2017-09-18 11:42:04', NULL, NULL, '197592', '383101ae-812f-4135-b6a4-32d8baaf361b', '2017-09-15 00:00:00', '1494fc62-77e5-4353-ad77-948b2aa2c30a', '7dd4ee73-8dcf-4dbc-94ee-932ff9f48b58', '1', '1', 'ZC107121092128985088', '7957b6eb-c9e9-4485-b1c6-b4d7d4c7897c', 'e6bcfc3a-bef7-42d7-8400-2be6de77bb6d', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS=1;