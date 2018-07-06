SET FOREIGN_KEY_CHECKS=0;

delete from `rent_order`;
delete from `asset_set`;
delete from `financial_contract`;
delete from `account`;
delete from `contract`;
delete from `asset_valuation_detail`;
delete from `contract_account`;
delete from `asset_package`;
delete from `transfer_application`;
delete from `batch_pay_record`;
delete from `ledger_book`;
delete from `customer`;

INSERT INTO `customer` (`id`, `account`, `mobile`, `name`, `source`, `app_id`, `customer_uuid`, `customer_type`)
VALUES
	(1, NULL, NULL, 'aa', NULL, 1, 'customerUuid1', 1);


INSERT INTO `financial_contract` (`adva_repayment_term`,`id`, `adva_matuterm`, `contract_no`, `app_id`, `company_id`,`adva_repo_term`,`ledger_book_no`) VALUES 
('0','1', 3, 'YX_AMT_001', 1, 1, 30,'ledger_book_no_1');

INSERT INTO `asset_package` (`id`, `is_available`, `create_time`, `contract_id`, `asset_package_no`, `financial_contract_id`) VALUES 
(1, 1, now(), 1, 'no', 1);

INSERT INTO `account` (`id`, `account_name`, `account_no`, `alias`, `attr`) VALUES 
(1, 'account_name_1', 'account_no_1', NULL, NULL);

INSERT INTO `asset_set` (`id`, `asset_fair_value`, `asset_recycle_date`, `asset_status`, `asset_uuid`, `create_time`, `last_modified_time`, `single_loan_contract_no`, `contract_id`, `actual_recycle_date`,`on_account_status`, `version_no`) VALUES 
('1', 1010, Date(NOW()), 0, 'asset_uuid_1', Date(NOW()), '2015-10-19 13:34:35', 'DKHD-001-01', 1, '2015-10-19 13:34:35',1,1);

INSERT INTO `contract` (`id`, `begin_date`, `contract_no`,`end_date`,`app_id`, `customer_id`, `house_id`,`actual_end_date`, `create_time`, `interest_rate`, `payment_day_in_month`, `payment_frequency`, `periods`, `repayment_way`, `total_amount`, `penalty_interest`) VALUES 
(1, '2015-10-19', 'DKHD-001', '2016-10-19', 1, 1, 1, NULL, '2015-10-19 13:34:35', 0.001, 1, 1, 12, 0, 1000, 0.0001);


INSERT INTO `rent_order` (`id`, `due_date`, `order_no`, `payout_time`, `total_rent`, `customer_id`, `user_upload_param`, `modify_time`, `asset_set_id`,`asset_set_uuid`, `create_time`,`clearing_status`,`executing_settling_status`,`financial_contract_id`) VALUES
('2', Date(NOW()), 'DKHD-001-01-20160308', '2016-10-19 13:34:35',1000, '1','', '2016-10-19', 1, 'asset_uuid_1','2015-10-19',0,1,1);

INSERT INTO `asset_valuation_detail` (`id`, `amount`, `asset_value_date`, `created_date`, `subject`, `asset_set_id`) VALUES 
('1', '1000.00', '2016-03-14 19:46:38', '2016-03-14', '0', '1'),
('2', '10.00', '2016-03-15 19:47:16', '2016-03-15', '1', '1'),
('3', '1000.00', '2016-03-14 19:46:38', '2016-03-14', '0', '2');

INSERT INTO `contract_account` (`id`, `pay_ac_no`, `bankcard_type`, `contract_id`, `payer_name`, `bind_id`) VALUES 
(1, 'pay_ac_no_1', 0, 1, 'payer_name_1', 'bind_id');

INSERT INTO `transfer_application` (`id`, `amount`,`creator_id`, `batch_pay_record_id`, `comment`, `create_time` , `deduct_status`, `executing_deduct_status`, `deduct_time`, `last_modified_time`,  `contract_account_id`,`order_id`,`financial_contract_id`) VALUES 
(1, '1000', 1, 1, NULL, NOW(), 0, 1, NULL, NULL, 1, 2,'1');

INSERT INTO `batch_pay_record` (`id`, `amount`, `modify_time`, `request_no`, `serial_no`, `request_data`, `response_data`, `query_response_data`, `trans_date_time`) VALUES 
('1', '10.00', NULL, 'test', NULL, NULL, '', '', '20160323111100');


INSERT INTO `ledger_book` (`id`, `ledger_book_no`, `ledger_book_orgnization_id`, `book_master_id`, `party_concerned_ids`) VALUES 
('1', 'ledger_book_no_1', '1', NULL, NULL);


SET FOREIGN_KEY_CHECKS=1;