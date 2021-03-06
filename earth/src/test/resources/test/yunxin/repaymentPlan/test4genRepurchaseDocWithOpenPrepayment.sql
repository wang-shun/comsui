SET FOREIGN_KEY_CHECKS=0;

DELETE FROM `asset_set`;
DELETE FROM `contract`;
DELETE FROM `customer`;
DELETE FROM `company`;
DELETE FROM `app`;
DELETE FROM `house`;
DELETE FROM `financial_contract`;
DELETE FROM `ledger_book`;
DELETE FROM `repurchase_doc`;

-- INSERT INTO `asset_set` (`id`, `contract_id`, `financial_contract_uuid`, `settlement_status`, `asset_fair_value`, `asset_principal_value`, `asset_interest_value`, `asset_initial_value`, `asset_recycle_date`, `confirm_recycle_date`, `refund_amount`, `asset_status`, `on_account_status`, `repayment_plan_type`, `last_valuation_time`, `asset_uuid`, `create_time`, `last_modified_time`, `comment`, `single_loan_contract_no`, `actual_recycle_date`, `current_period`, `overdue_status`, `overdue_date`, `version_no`, `active_status`, `sync_status`, `active_deduct_application_uuid`, `asset_finger_print`, `asset_extra_fee_finger_print`, `asset_finger_print_update_time`, `asset_extra_fee_finger_print_update_time`) VALUES
-- ('323456','234567','92846f20-87e3-49f4-8f90-fe04a72c0484', '0', '1647.20', '800.00', '800.00', '1600.00', '2016-06-01', NULL, '0.00', '0', '0', '0', '2016-10-11 03:01:09', '168c2fbe-a95f-4cae-8514-eabd7fb73a2a', '2016-06-01 14:54:13', '2016-10-11 03:01:09', NULL, 'ZC293D48AAD6E61017',  NULL, '1', '2', '2016-08-10', '1', '0', '0', 'empty_deduct_uuid',NULL,NULL,NULL,NULL),
-- ('223456','123456','92846f20-87e3-49f4-8f90-fe04a72c0484', '0', '1647.20', '800.00', '800.00', '1600.00', '2016-11-01', NULL, '0.00', '0', '1', '0', '2016-10-11 03:01:09', '168c2fbe-a95f-4cae-8514-eabd7fb73a2a', '2016-06-01 14:54:13', '2016-10-11 03:01:09', NULL, 'ZC293D48AAD6E61016',  NULL, '1', '2', '2016-08-09', '1', '0', '0', 'empty_deduct_uuid',NULL,NULL,NULL,NULL),
-- ('123456','123456','92846f20-87e3-49f4-8f90-fe04a72c0484', '0', '1647.20', '800.00', '800.00', '1600.00', '2016-06-01', NULL, '0.00', '0', '1', '0', '2016-10-11 03:01:09', '168c2fbe-a95f-4cae-8514-eabd7fb73a2a', '2016-06-01 14:54:13', '2016-10-11 03:01:09', NULL, 'ZC293D48AAD6E61015',  NULL, '1', '2', '2016-08-11', '1', '0', '0', 'empty_deduct_uuid',NULL,NULL,NULL,NULL);

INSERT INTO `asset_set` (guarantee_status, settlement_status, asset_fair_value, asset_principal_value, asset_interest_value, asset_initial_value, asset_recycle_date, confirm_recycle_date, refund_amount, asset_status, on_account_status, repayment_plan_type, last_valuation_time, asset_uuid, create_time, last_modified_time, comment, single_loan_contract_no, contract_id, actual_recycle_date, current_period, overdue_status, overdue_date, version_no, active_status, sync_status, active_deduct_application_uuid, repurchase_status, financial_contract_uuid, asset_finger_print, asset_extra_fee_finger_print, asset_finger_print_update_time, asset_extra_fee_finger_print_update_time, plan_type, write_off_reason, can_be_rollbacked, time_interval, deduction_status, executing_status, executing_status_bak, customer_uuid, contract_uuid, contract_funding_status) VALUES
(0, 0, 500.00, 500.00, 0.00, 500.00, '2017-04-15', null, 0.00, 0, 1, 0, null, 'd61dc4bd-cc97-4a35-bb9a-6a37e8d49712', '2017-04-05 13:26:46', '2017-04-05 13:26:46', null, 'ZC1503713801543761920', 123456, null, 1, 0, null, 1, 2, 0, 'empty_deduct_uuid', null, '92846f20-87e3-49f4-8f90-fe04a72c0484', '7e54991c2d86195b52a69814484d774e', '00bfd64b58361d989ac8bf13dccc3c9b', '2017-04-05 13:26:46', '2017-04-05 13:26:46', 0, 0, 0, 0, 0, 0, 0, '08b5ae5f-7b16-48a1-a858-b8fd7bf6d53f', 'cuuid111', null),
(0, 0, 500.00, 500.00, 0.00, 500.00, '2017-04-16', null, 0.00, 0, 1, 0, null, '7f5bca3c-db09-47ab-b39e-3115721c73f8', '2017-04-05 13:26:46', '2017-04-05 13:26:46', null, 'ZC1503713802751721472', 123456, null, 2, 0, null, 1, 2, 0, 'empty_deduct_uuid', null, '92846f20-87e3-49f4-8f90-fe04a72c0484', '0633ce849b8c1bdd3796159a50c6355e', '00bfd64b58361d989ac8bf13dccc3c9b', '2017-04-05 13:26:46', '2017-04-05 13:26:46', 0, 0, 0, 0, 0, 0, 0, '08b5ae5f-7b16-48a1-a858-b8fd7bf6d53f', 'cuuid111', null),
(0, 0, 500.00, 500.00, 0.00, 500.00, '2017-04-17', null, 0.00, 0, 1, 0, null, '1347cda1-23d3-4d59-9e60-4e5ff7cc594d', '2017-04-05 13:26:46', '2017-04-05 13:26:46', null, 'ZC1503713803154374656', 123456, null, 3, 0, null, 1, 2, 0, 'empty_deduct_uuid', null, '92846f20-87e3-49f4-8f90-fe04a72c0484', '29c49f7f8064045e34724430bf78e5ff', '00bfd64b58361d989ac8bf13dccc3c9b', '2017-04-05 13:26:46', '2017-04-05 13:26:46', 0, 0, 0, 0, 0, 0, 0, '08b5ae5f-7b16-48a1-a858-b8fd7bf6d53f', 'cuuid111', null),
(0, 0, 1500.00, 1500.00, 0.00, 1500.00, '2017-04-05', null, 0.00, 0, 1, 1, '2017-04-05 13:28:53', '30a851d8-f40e-4f69-9879-f23faf9ea2da', '2017-04-05 13:28:52', '2017-04-05 13:28:53', null, 'ZC1503730767872528384', 123456, null, 1, 0, null, -835952957, 0, 0, 'empty_deduct_uuid', null, '92846f20-87e3-49f4-8f90-fe04a72c0484', null, null, '2017-04-05 13:28:52', '2017-04-05 13:28:52', 1, 0, 1, 1, 0, 1, 0, '08b5ae5f-7b16-48a1-a858-b8fd7bf6d53f', 'cuuid111', null);

INSERT INTO `contract` (`id`, `uuid`, `unique_id`, `begin_date`, `contract_no`, `end_date`, `asset_type`, `month_fee`, `app_id`, `customer_id`, `house_id`, `actual_end_date`, `create_time`, `interest_rate`, `payment_day_in_month`, `payment_frequency`, `periods`, `repayment_way`, `total_amount`, `penalty_interest`, `active_version_no`, `repayment_plan_operate_logs`, `state`, `financial_contract_uuid`) VALUES
 ('123456', 'cuuid111', 'cuid111', '2016-08-01', 'G00003(zht765714537113774060)', '2018-01-01', NULL, '0.00', '1', '23', '1', NULL, '2016-08-27 16:06:51', '0.1200000000', '0', '0', '2', '2', '0.02', '11.0000000000', '1', NULL, '2', '92846f20-87e3-49f4-8f90-fe04a72c0484');

INSERT INTO `customer` (`id`, `account`, `mobile`, `name`, `source`, `app_id`, `customer_uuid`, `customer_type`) VALUES
('23', NULL, NULL, 'ceshi24', 'C75688', '1', '08b5ae5f-7b16-48a1-a858-b8fd7bf6d53f', '0');

INSERT INTO `company` (`id`, `address`, `full_name`, `short_name`, `uuid`) VALUES
('2', 'NanJin', 'ceshishanwugongsi', 'ceshifenqi', 'a02c078d-6f98-11e6-bf08-00163e002839');

INSERT INTO `app` (`id`, `app_id`, `app_secret`, `is_disabled`, `host`, `name`, `company_id`, `addressee`) VALUES
('1', 'nongfenqi', '', '', '', 'ceshifenqi', '2', NULL),
('2', 'qyb', '', '', '', 'ceshifenqi', '2', NULL);

INSERT INTO `house` (`id`, `address`, `app_id`) VALUES
('1', 'cesd', '1');

INSERT INTO `financial_contract` (`id`, `financial_contract_uuid`, `asset_package_format`, `adva_matuterm`, `adva_start_date`, `contract_no`, `contract_name`, `app_id`, `company_id`, `adva_repo_term`, `thru_date`, `capital_account_id`, `financial_contract_type`, `loan_overdue_start_day`, `loan_overdue_end_day`, `payment_channel_id`, `ledger_book_no`, `sys_normal_deduct_flag`, `sys_overdue_deduct_flag`, `sys_create_penalty_flag`, `sys_create_guarantee_flag`, `unusual_modify_flag`, `sys_create_statement_flag`, `transaction_limit_per_transcation`, `transaction_limit_per_day`, `remittance_strategy_mode`, `app_account_uuids`, `allow_online_repayment`, `allow_offline_repayment`, `allow_advance_deduct_flag`, `adva_repayment_term`, `penalty`, `overdue_default_fee`, `overdue_service_fee`, `overdue_other_fee`, `create_time`, `last_modified_time`,`repurchase_approach`, `repurchase_rule`, `repurchase_algorithm`, `day_of_month`,`repurchase_principal_algorithm`,`repurchase_interest_algorithm`,`repurchase_penalty_algorithm`,`repurchase_other_charges_algorithm`)VALUES
	(15,'92846f20-87e3-49f4-8f90-fe04a72c0484', 0, 3, '2016-06-14 00:00:00', 'ceshi003', 'test006', 1, 2, 10, '2016-06-25 00:00:00', 16, 0, 1, 90, 1, 'yunxin_ledger_book', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL,1, 0, 'outstandingPrincipal+outstandingInterest', NULL,'outstandingPrincipal', 'outstandingInterest','outstandingPenaltyInterest',NULL);

INSERT INTO `ledger_book` (`id`, `ledger_book_no`, `ledger_book_orgnization_id`, `book_master_id`, `party_concerned_ids`) VALUES
(1, 'yunxin_ledger_book', '1', '1', '1');

SET FOREIGN_KEY_CHECKS=1;
