delete from asset_set;
delete from contract;
delete from app;
delete from customer;
delete from house;
delete from asset_package;
delete from financial_contract;
delete from ledger_book;
delete from `company`;

INSERT INTO `financial_contract` (`id`, `asset_package_format`, `adva_matuterm`, `adva_start_date`, `contract_no`, `contract_name`,
		`app_id`, `company_id`, `adva_repo_term`, `thru_date`, `capital_account_id`, `financial_contract_type`,
		`loan_overdue_start_day`, `loan_overdue_end_day`, `payment_channel_id`, `ledger_book_no`, `financial_contract_uuid`,`adva_repayment_term`) 
VALUES 
		('14', '0', '3', '1900-01-01 00:00:00', 'G00001', '放款测试用信托合同', 
		'1', '1', '1', '2900-01-01 00:00:00', '1', '0', '1', 
		'90', '1', 'a5e84b90-e55c-4bba-9b9e-3463d36a01e0', '984149f1-cb43-410c-a789-d8f4bba123b6','0');

INSERT INTO `asset_package` (`id`, `is_available`, `create_time`, `contract_id`, `asset_package_no`, `financial_contract_id`, `loan_batch_id`) 
VALUES ('47', NULL, NULL, '24', NULL, '14', '14');


INSERT INTO `contract` (`id`, `uuid`, `unique_id`, `begin_date`, `contract_no`, `end_date`, 
		`asset_type`, `month_fee`, `app_id`, `customer_id`, `house_id`, `actual_end_date`,
		`create_time`, `interest_rate`, `payment_day_in_month`, `payment_frequency`, `periods`, `repayment_way`, 
		`total_amount`, `penalty_interest`, `active_version_no`, `repayment_plan_operate_logs`, `state`,`financial_contract_uuid`)
VALUES 
		('24', NULL, '123456', '2016-04-17', '629测试(ZQ2016002000001)', NULL, 
		'1', '0.00', '2', '116', '116', NULL, 
		'2016-06-29 18:14:01', '0.1560000000', '0', '0', '1', '2', 
		'100.00', '0.0005000000', '1', NULL, '2','984149f1-cb43-410c-a789-d8f4bba123b6');


INSERT INTO  `asset_set` (`id`, `guarantee_status`, `settlement_status`, `asset_fair_value`, `asset_principal_value`, `asset_interest_value`, 
		`asset_initial_value`, `asset_recycle_date`, `confirm_recycle_date`, `refund_amount`, `asset_status`, `on_account_status`, 
		`repayment_plan_type`, `last_valuation_time`, `asset_uuid`, `create_time`, `last_modified_time`, `comment`, 
		`single_loan_contract_no`, `contract_id`, `actual_recycle_date`, `current_period`, `overdue_status`, `overdue_date`, 
		`version_no`, `active_status`,`financial_contract_uuid`) 
VALUES 
		('24', '1', '0', '200.20', '0.00', '200.00', 
		'200.00', DATE_ADD(DATE(Now()), INTERVAL 1 DAY), NULL, '0.00', '0', '1', 
		'0', '2016-06-30 14:03:03', '88450378-e6fd-4857-9562-22971b05b932', '2016-06-29 18:14:01', '2016-06-30 14:03:03', NULL,
		'ZC2730FAE4092E0A6E', '24', NULL, '1', '1', NULL, 
		'1', '0','984149f1-cb43-410c-a789-d8f4bba123b6');

INSERT INTO `app` (`id`, `app_id`, `app_secret`, `is_disabled`, `host`, `name`,
		`company_id`, `addressee`) 
VALUES
		('2', 'nongfenqi', '11111db75ebb24fa0993f4fa25775022', '\0', 'http://e.zufangbao.cn', '农分期', 
		'4', NULL);

INSERT INTO `customer` (`id`, `account`, `mobile`, `name`, `source`, `app_id`, `customer_uuid`)
VALUES 
		('116', NULL, NULL, '测试用户00101', 'C74211', '2', '4faef2f9-1155-4ca8-bd22-bf6230bbc72c');


INSERT INTO  `house` (`id`, `address`, `app_id`) VALUES ('116', NULL, '2');

insert into `ledger_book` ( `ledger_book_no`, `ledger_book_orgnization_id`, `book_master_id`, `party_concerned_ids`) values('a5e84b90-e55c-4bba-9b9e-3463d36a01e0','1',NULL,NULL);

INSERT INTO `company` (`id`, `address`, `full_name`, `short_name`, `uuid`)
VALUES 
	('1', '南京', '测试商务公司', '测试分期', '984149f1-cb43-410c-a789-d8f4bba123b6');


set FOREIGN_KEY_CHECKS = 1;