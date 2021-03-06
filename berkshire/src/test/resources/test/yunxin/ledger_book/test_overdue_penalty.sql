SET FOREIGN_KEY_CHECKS=0;

delete from `asset_set`;
delete from `financial_contract`;
delete from `contract`;
delete from `asset_valuation_detail`;
delete from `ledger_book_shelf`;
delete from `payment_channel`;
delete from `customer`;
delete from `app`;
delete from `company`;
delete from `ledger_book`;
delete from `asset_package`;
delete from `loan_batch`;
delete from `ledger_book_shelf`;
delete from `account`;



INSERT INTO `app` (`id`, `app_id`, `app_secret`, `is_disabled`, `host`, `name`, `company_id`, `addressee` )
VALUES 
('1', 'anmeitu', '11111db75ebb24fa0993f4fa25775023', '\0', 'http://e.zufangbao.cn', '安美途', '1', NULL);

INSERT INTO `ledger_book` (`id`, `ledger_book_no`, `ledger_book_orgnization_id`, `book_master_id`, `party_concerned_ids`) VALUES 
('1', 'yunxin_ledger_book', '1', '1', '');


INSERT INTO `account` (`id`, `account_name`, `account_no`, `alias`, `attr`) VALUES 
(1, 'account_name_1', '955103657777777', NULL, NULL);

INSERT INTO `payment_channel` (`id`, `channel_name`, `user_name`, `user_password`, `merchant_id`, `cer_file_path`, `pfx_file_path`, `pfx_file_key`, `payment_channel_type`, `api_url`, `from_date`, `thru_date`)
VALUES
	(1, '广东银联', 'user1', '123456', '000191400205800', NULL, NULL, NULL, 0, NULL, NULL, NULL);



INSERT INTO `asset_package` (`id`, `contract_id`, `asset_package_no`, `financial_contract_id`, `loan_batch_id`) VALUES 
('1', '1', NULL, '1', '3'),
('2', '7', NULL, '1', '4');
INSERT INTO `loan_batch` (`id`, `is_available`, `code`, `create_time`, `financial_contract_id`, `last_modified_time`, `loan_date`) VALUES 
('3', 1, 'DCF-NFQ-LR903A 20160516 16:52:905', '2016-05-16 16:52:57', '1', NULL, NULL),
('4', 1, 'DCF-NFQ-LR903A 20160516 16:52:905', '2016-05-16 16:52:57', '1', NULL, NULL);




INSERT INTO `company` (`id`, `address`, `full_name`, `short_name`,`uuid`) 
VALUES 
('1', '上海', '云南国际信托有限公司', '云南信托','2333ssss');


INSERT INTO `customer` (`id`, `account`, `mobile`, `name`, `source`, `app_id`,`customer_uuid`) VALUES 
(1, NULL, NULL, NULL, NULL, 1,'customerUuid1');

INSERT INTO `financial_contract` (`id`, `adva_matuterm`, `contract_no`, `contract_name`, `app_id`, `company_id`,   `adva_repo_term`,`loan_overdue_end_day`,`loan_overdue_start_day`,`payment_channel_id`,`ledger_book_no`,`asset_package_format`,`financial_contract_type`,`financial_contract_uuid`,`capital_account_id`,`sys_normal_deduct_flag`,`sys_overdue_deduct_flag`,`sys_create_penalty_flag`,`sys_create_guarantee_flag`) VALUES 
('1', 3, 'DCF-NFQ-LR903A', '云南信托', 1, 1, 30,90,1,1,'yunxin_ledger_book',1,0,'xx123ww',1,1,1,1,1);


INSERT INTO `contract` (`id`, `begin_date`, `contract_no`,`end_date`,`app_id`, `customer_id`, `house_id`,`actual_end_date`, `create_time`, `interest_rate`, `payment_day_in_month`, `payment_frequency`, `periods`, `repayment_way`, `total_amount`, `penalty_interest`,`financial_contract_uuid`) VALUES 
(1, '2015-10-19', 'DKHD-001', '2016-10-19', 1, 1, 1, NULL, '2015-10-19 13:34:35', 0.001, 1, 1, 12, 0, 1000, 0.0001,'xx123ww'),
(7, '2015-10-19', 'DKHD-001', '2016-10-19', 1, 1, 1, NULL, '2015-10-19 13:34:35', 0.001, 1, 1, 12, 0, 1000, 0.0001,'xx123ww');


INSERT INTO `asset_valuation_detail` (`id`, `amount`, `asset_value_date`, `created_date`, `subject`, `asset_set_id`) VALUES 
('1', '1000.00', '2016-03-14 19:46:38', '2016-03-14', '0', '1'),
('2', '5.00', '2016-03-15 19:47:16', '2016-03-15', '1', '1'),
('3', '15.00', '2016-03-16 19:47:16', '2016-03-16', '1', '1');



INSERT INTO `ledger_book_shelf` (`id`, `ledger_uuid`, `debit_balance`, `credit_balance`, `first_account_name`, `first_account_uuid`, `account_side`, `second_account_name`, `second_account_uuid`, `third_account_name`, `third_account_uuid`, `first_party_id`, `second_party_id`, `third_party_id`, `forward_ledger_uuid`, `backward_ledger_uuid`, `batch_serial_uuid`, `amortized_date`, `book_in_date`, `business_voucher_uuid`, `carried_over_date`, `contract_id`, `contract_uuid`, `default_date`, `journal_voucher_uuid`, `ledger_book_no`, `ledger_book_owner_id`, `life_cycle`, `related_lv_1_asset_outer_idenity`, `related_lv_1_asset_uuid`, `related_lv_2_asset_outer_idenity`, `related_lv_2_asset_uuid`, `related_lv_3_asset_outer_idenity`, `related_lv_3_asset_uuid`, `source_document_uuid`) VALUES 
('1', 'ledger_uuid_1', '0.00', '900.00', 'FST_LONGTERM_LIABILITY', '40000', '0', 'SND_LONGTERM_LIABILITY_ABSORB_SAVING', '40000.01', NULL, NULL, '1', NULL, NULL, NULL, NULL, '871562dd-5a0f-4a8d-990f-07d75bfc0304', '2016-05-01', '2016-05-16 14:26:50', '', NULL, '7', NULL, '2016-05-27 00:00:00', '', 'yunxin_ledger_book', '1', '1', 'ZC27304880AB312E3A', 'd2c21631-f2fb-4e8f-beef-0a2e72447434', NULL, NULL, NULL, NULL, ''),
('2', 'ledger_uuid_2', '0.00', '100.00', 'FST_DEFERRED_INCOME', '100000', '0', 'SND_DEFERRED_INCOME_INTEREST_ESTIMATE', '100000.01', NULL, NULL, '1', NULL, NULL, NULL, NULL, '871562dd-5a0f-4a8d-990f-07d75bfc0304', '2016-05-01', '2016-05-16 14:26:50', '', NULL, '7', NULL, '2016-05-27 00:00:00', '', 'yunxin_ledger_book', '1', '1', 'ZC27304880AB312E3A', 'd2c21631-f2fb-4e8f-beef-0a2e72447434', NULL, NULL, NULL, NULL, ''),
('3', 'ledger_uuid_3', '1000.00', '1000.00', 'FST_UNEARNED_LOAN_ASSET', '10000', '1', NULL, NULL, NULL, NULL, '1', NULL, NULL, 'd7aa2f46-0003-4746-8e61-af1a0f06ef30', NULL, '871562dd-5a0f-4a8d-990f-07d75bfc0304', '2016-05-01', '2016-05-16 14:26:50', '', '2016-05-16 17:24:47', '7', NULL, '2016-05-27 00:00:00', '', 'yunxin_ledger_book', '1', '0', 'ZC27304880AB312E3A', 'd2c21631-f2fb-4e8f-beef-0a2e72447434', NULL, NULL, NULL, NULL, ''),
('4', 'ledger_uuid_4', '0.00', '800.00', 'FST_LONGTERM_LIABILITY', '40000', '0', 'SND_LONGTERM_LIABILITY_ABSORB_SAVING', '40000.01', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'd8c56f97-996b-43ac-814d-2909ce668f80', '2016-05-05', '2016-05-16 14:26:50', '', NULL, '7', NULL, '2016-08-27 00:00:00', '', 'yunxin_ledger_book', '1', '1', 'ZC27304880AB4AEA99', '6100d113-068e-42d4-b4e2-06fd53e96a75', NULL, NULL, NULL, NULL, ''),
('5', 'ledger_uuid_5', '0.00', '200.00', 'FST_DEFERRED_INCOME', '100000', '0', 'SND_DEFERRED_INCOME_INTEREST_ESTIMATE', '100000.01', NULL, NULL, '1', NULL, NULL, NULL, NULL, 'd8c56f97-996b-43ac-814d-2909ce668f80', '2016-05-05', '2016-05-16 14:26:50', '', NULL, '7', NULL, '2016-08-27 00:00:00', '', 'yunxin_ledger_book', '1', '1', 'ZC27304880AB4AEA99', '6100d113-068e-42d4-b4e2-06fd53e96a75', NULL, NULL, NULL, NULL, ''),
('6', 'ledger_uuid_6', '1000.00', '0.00', 'FST_UNEARNED_LOAN_ASSET', '10000', '1', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, 'd8c56f97-996b-43ac-814d-2909ce668f80', '2016-05-05', '2016-05-16 14:26:50', '', NULL, '7', NULL, '2016-08-27 00:00:00', '', 'yunxin_ledger_book', '1', '1', 'ZC27304880AB4AEA99', '6100d113-068e-42d4-b4e2-06fd53e96a75', NULL, NULL, NULL, NULL, ''),
('7', 'ledger_uuid_7', '1000.00', '0.00', 'FST_RECIEVABLE_ASSET', '20000', '1', 'SND_RECIEVABLE_LOAN_ASSET', '20000.01', NULL, NULL, '1', NULL, NULL, NULL, 'ledger_uuid_3', NULL, '2016-05-01', '2016-05-16 17:24:47', '', NULL, '7', NULL, '2016-05-01 00:00:00', '', 'yunxin_ledger_book', '1', '1', 'ZC27304880AB312E3A', 'd2c21631-f2fb-4e8f-beef-0a2e72447434', NULL, NULL, NULL, NULL, '');

INSERT INTO `asset_set` (`id`, `actual_recycle_date`, `asset_fair_value`, `asset_initial_value`, `asset_interest_value`, `asset_principal_value`, `asset_recycle_date`, `asset_status`, `asset_uuid`, `create_time`, `current_period`, `guarantee_status`, `last_modified_time`, `last_valuation_time`, `on_account_status`, `settlement_status`, `single_loan_contract_no`, `contract_id`,`version_no`,`active_status`) VALUES 
('1', NULL, '1000.00', '1000.00', '100.00', '900.00', '2016-05-01', '0', 'd2c21631-f2fb-4e8f-beef-0a2e72447434', '2016-05-16 14:26:50', '1', '0', NULL, NULL, '1', '0', 'ZC27304880AB312E3A', '7',1,0),
('2', NULL, '1000.00', '1000.00', '200.00', '800.00', '2016-05-05', '0', '6100d113-068e-42d4-b4e2-06fd53e96a75', '2016-05-16 14:26:50', '2', '0', NULL, NULL, '1', '0', 'ZC27304880AB4AEA99', '7',1,0);

SET FOREIGN_KEY_CHECKS=1;