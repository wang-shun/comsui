delete from `house`;
delete from `company`;
delete from `app`;
delete from `customer`;
delete from `financial_contract`;
delete from `contract`;
delete from `asset_set`;
delete from `asset_set_extra_charge`;
delete from `t_prepayment_application`;
delete from `ledger_book`;
delete from `rent_order`;
DELETE from t_product_category;
DELETE from t_source_repository;

INSERT INTO `t_product_category` (`id`, `uuid`, `product_lv_1_code`, `product_lv_1_name`, `product_lv_2_code`, `product_lv_2_name`, `product_lv_3_code`, `product_lv_3_name`, `pre_process_interface_url`, `post_process_interface_url`, `pre_process_script`, `status`, `script_md_5_version`, `date_field_one`, `date_field_two`, `date_field_three`, `long_field_one`, `long_field_two`, `long_field_three`, `string_field_one`, `string_field_two`, `string_field_three`, `decimal_field_one`, `decimal_field_two`, `decimal_field_three`, `delay_task_config_uuid`) VALUES ('118', '2d376396-c38f-11e7-a1b1-502b73c136df', 'weifang', '潍坊', 'importAssetPackage', '导入资产包', '10003', '提前还款', 'importAssetPackage/weifang/10003', NULL, NULL, '1', '21f9ee54-c390-11e7-a1b1-502b73c136df', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_source_repository` (`id`, `business_type`, `source_code`, `signature`, `source_file_path`, `add_time`, `last_modify_time`, `author`, `compile_import`) VALUES ('14', 'importAssetPackage/weifang/10003', 'public boolean evaluate(SandboxDataSetHandler sandboxDataSetHandler, Map<String, String> preRequest, Map<String, String> postRequest, Log logger) {\r\n        logger.info(\"start to get param\");\r\n        logger.info(\"param : \" + preRequest);\r\n        String uniqueId = (String) preRequest.getOrDefault(\"uniqueId\", \"\");\r\n        String contractNo = (String) preRequest.getOrDefault(\"contractNo\", \"\");\r\n        logger.info(\"uniqueId,contractNo:\" + uniqueId + \",\" + contractNo);\r\n        if(StringUtils.isEmpty(uniqueId)&&StringUtils.isEmpty(contractNo)){\r\n            logger.error(\"uniqueId,contractNo 至少一个不能为空\");\r\n            return false;\r\n        }\r\n        SandboxDataSet sandboxDataSet = sandboxDataSetHandler.get_sandbox_by_contract_uniqueId_contractNo(uniqueId, contractNo);\r\n        if(sandboxDataSet == null){\r\n            logger.error(\"sandboxDataSet is null\");\r\n            return false;\r\n        }\r\n\r\n        ContractSnapshot contractSnapshot = sandboxDataSet.getContractSnapshot();\r\n        String jsonAssetRecycleDate = (String) preRequest.getOrDefault(\"assetRecycleDate\", \"\");\r\n        if(StringUtils.isEmpty(jsonAssetRecycleDate)){\r\n            logger.error(\"jsonAssetRecycleDate is empty\");\r\n            return false;\r\n        }\r\n        logger.info(\"jsonAssetRecycleDate : \" + jsonAssetRecycleDate);\r\n\r\n        List<String> assetRecycleDates = JsonUtils.parseArray(jsonAssetRecycleDate, String.class);\r\n        logger.info(\"BeginDate : \"+ contractSnapshot.getBeginDate());\r\n        if(contractSnapshot.getBeginDate() == null){\r\n            logger.error(\"BeginDate is empty\");\r\n            return false;\r\n        }\r\n\r\n        String jsonInterest = (String) preRequest.getOrDefault(\"interest\", \"\");\r\n        String jsonPrincipal = (String) preRequest.getOrDefault(\"principal\", \"\");\r\n\r\n        logger.info(\"jsonInterest : \" + jsonInterest);\r\n        logger.info(\"jsonPrincipal : \" + jsonPrincipal);\r\n\r\n        List<BigDecimal> interests = JsonUtils.parseArray(jsonInterest, BigDecimal.class);\r\n        List<BigDecimal> principals = JsonUtils.parseArray(jsonPrincipal, BigDecimal.class);\r\n        if(interests == null){\r\n            logger.info(\"interests is null\");\r\n            return false;\r\n        }\r\n        if(principals == null){\r\n            logger.info(\"principals is null\");\r\n            return false;\r\n        }\r\n\r\n        for(int i = 0;i < interests.size();i ++){\r\n            int days = DateUtils.compareTwoDatesOnDay(DateUtils.asDay((String)assetRecycleDates.get(i)), contractSnapshot.getBeginDate());\r\n            logger.info(\"应计利息天数 days[{\" + i + \"}] : \" + days);\r\n\r\n            logger.info(\"old interest[{\" + i + \"}] : \"+ ((BigDecimal) interests.get(i)));\r\n            logger.info(\"old principal[{\" + i + \"}] : \"+ ((BigDecimal) principals.get(i)));\r\n\r\n            BigDecimal interest = ((BigDecimal) interests.get(i)).setScale(2, BigDecimal.ROUND_HALF_UP);\r\n            BigDecimal principal = ((BigDecimal) principals.get(i)).multiply(new BigDecimal(0.24*days/360)).setScale(2, BigDecimal.ROUND_HALF_UP);\r\n\r\n            logger.info(\"after calculating, the interest[{\" + i + \"}] : \"+ interest);\r\n            logger.info(\"after calculating, the principal[{\" + i + \"}] : \"+ principal);\r\n            if(interest.compareTo(principal) == 0 ? false :true){\r\n                return false;\r\n            }\r\n        }\r\n        return true;\r\n    }', '3ebe33f813f7570191eea79fcc89e078', NULL, '2017-11-07 11:00:38', '2017-11-07 11:02:36', 'zhushiyun', 'com.suidifu.matryoshka.customize.CustomizeServices,java.math.*,java.util.*,com.suidifu.matryoshka.snapshot.ContractSnapshot,com.suidifu.matryoshka.snapshot.SandboxDataSet,com.zufangbao.sun.utils.*');


delete from dictionary;
INSERT INTO `dictionary` (`id`, `code`, `content`)
VALUES
	(11, 'PLATFORM_PRI_KEY', 'MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAOXUGOKdEkssOI1zqNw4pb6emH1o1JYxooyTQ7FN1IBNqTJLuvA3GsswXIkuQj0imce6ywG/XOCwc9R1l5FwcORtwx2FihGCl7eBkhUwnT0EwGOEARPh96ey+TfvsvRaHOn672v1TEhajAftgm4l7fJDtHdGBjHOs+5Mlir9Z65RAgMBAAECgYEArtAiUZR5yrYLGgTEhyWLZK+Le7CWKtv8MQL+tUlm/mST8s7JlVfEyJKzgCCwf4HnCJXbPiwJgFqW8B61uAmXw6cEoPftEnzvKBTyISt/iEf7DTWKGkDBnlYM9sFU6pU61jw17XEDQRtSBG6cfrlGSelqf25+c8onxu4YwTeLH/ECQQD/H69tPy0FYRvCJ5yXdXEVCKshNN01P+UdDzGtyysE/gmpalbewT+uznApa0qFntcYb8eSpUJzrUlItSCBGUpdAkEA5p4r3qF+4g5V7MBHm3+v1l9JKxYK76990AQJa122rfkY2EEVuvU+8KIAQpVflu/HpDe8QH4mQZTsZj24Skt8hQJAL5j2vrgRqzZB2ohPY8aKcXUrkEdvmdaw5SoHh7gm74iBvvTS/j4ppnBnZqLYxXMsCCgaoNZqPnCvAnygctWIFQJAHm2KLkKyohLwJV+tUwgC5E8IMWYkJUHLYNHXiFICE2xFaesUeel313oYfLCGvzx9493yubOrSoXitw63rR3OnQJBALwGSnGYodmJB5k7un0X6LlO4nSu/+SX9lweloZ1AUg15IuCIYxHAFKwOtOJmx/eMcITaLq8l1qzZ907UXY+Mfs=');

delete from t_merchant_config;
INSERT INTO `t_merchant_config` (`id`, `mer_id`, `secret`, `company_id`, `pub_key_path`, `pub_key`, `project_code`)
VALUES
	(2, 't_test_zfb', '123456', 3, NULL, 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDl1BjinRJLLDiNc6jcOKW+nph9aNSWMaKMk0OxTdSATakyS7rwNxrLMFyJLkI9IpnHussBv1zgsHPUdZeRcHDkbcMdhYoRgpe3gZIVMJ09BMBjhAET4fensvk377L0Whzp+u9r9UxIWowH7YJuJe3yQ7R3RgYxzrPuTJYq/WeuUQIDAQAB', 'spdbank');

delete from t_api_config;
INSERT INTO `t_api_config` (`id`, `api_url`, `fn_code`, `description`, `api_status`)
VALUES
	(37, '/api/v3/prepayment', NULL, '提前还款', 1);


INSERT INTO `house` (`id`, `address`, `app_id`)
VALUES
	('1', 'cesd', '1');

INSERT INTO `company` (`id`, `address`, `full_name`, `short_name`, `uuid`)
VALUES
	('1', 'newyork', 'test_company', 'tc', 'test_company_uuid');

INSERT INTO `app` (`id`, `app_id`, `app_secret`, `is_disabled`, `host`, `name`, `company_id`, `addressee`)
VALUES
	('1', 'zfb', NULL, b'1', NULL, 'zufangbao', '1', NULL);

INSERT INTO `customer` (`id`, `account`, `mobile`, `name`, `source`, `app_id`, `customer_uuid`, `customer_type`)
VALUES
	('1', 'test_account', '12345678900', 'test_customer', 'test', '1', 'test_customer_uuid', '0');

INSERT INTO `financial_contract` (`id`, `asset_package_format`, `adva_matuterm`, `adva_start_date`, `contract_no`, `contract_name`, `app_id`, `company_id`, `adva_repo_term`, `thru_date`, `capital_account_id`, `financial_contract_type`, `loan_overdue_start_day`, `loan_overdue_end_day`, `payment_channel_id`, `ledger_book_no`, `financial_contract_uuid`, `sys_normal_deduct_flag`, `sys_overdue_deduct_flag`, `sys_create_penalty_flag`, `sys_create_guarantee_flag`, `unusual_modify_flag`, `sys_create_statement_flag`, `transaction_limit_per_transcation`, `transaction_limit_per_day`, `remittance_strategy_mode`, `app_account_uuids`, `allow_online_repayment`, `allow_offline_repayment`, `allow_advance_deduct_flag`, `adva_repayment_term`, `penalty`, `overdue_default_fee`, `overdue_service_fee`, `overdue_other_fee`, `create_time`, `last_modified_time`)
VALUES
	('1', NULL, '0', '2016-09-01 15:31:58', 'test_financial_contract_no', 'test_financial_contract', '1', '1', '0', '2017-11-01 15:32:56', '1', '0', '0', '0', '0', 'test_ledger_book_no', 'test_financial_contract_uuid', '1', '0', '0', '0', '0', '1', NULL, NULL, NULL, NULL, '0', '0', '0', '0', NULL, NULL, NULL, NULL, '2016-12-20 15:35:21', '2016-12-20 15:35:27');

INSERT INTO `financial_contract` (`id`, `asset_package_format`, `adva_matuterm`, `adva_start_date`, `contract_no`, `contract_name`, `app_id`, `company_id`, `adva_repo_term`, `thru_date`, `capital_account_id`, `financial_contract_type`, `loan_overdue_start_day`, `loan_overdue_end_day`, `payment_channel_id`, `ledger_book_no`, `financial_contract_uuid`, `sys_normal_deduct_flag`, `sys_overdue_deduct_flag`, `sys_create_penalty_flag`, `sys_create_guarantee_flag`, `unusual_modify_flag`, `sys_create_statement_flag`, `transaction_limit_per_transcation`, `transaction_limit_per_day`, `remittance_strategy_mode`, `app_account_uuids`, `allow_online_repayment`, `allow_offline_repayment`, `allow_advance_deduct_flag`, `adva_repayment_term`, `penalty`, `overdue_default_fee`, `overdue_service_fee`, `overdue_other_fee`, `create_time`, `last_modified_time`, `repurchase_approach`, `repurchase_rule`, `repurchase_algorithm`, `day_of_month`, `pay_for_go`, `repurchase_principal_algorithm`, `repurchase_interest_algorithm`, `repurchase_penalty_algorithm`, `repurchase_other_charges_algorithm`, `temporary_repurchases`, `repurchase_cycle`, `allow_freewheeling_repayment`, `days_of_cycle`, `repayment_check_days`, `capital_party`, `other_party`, `contract_short_name`, `financial_type`, `remittance_object`, `asset_party`, `channel_party`, `supplier`)
VALUES
	(31, 0, 3, '1900-01-01 00:00:00', 'G00002', '放款扣款测试用信托合同', 1, 1, 91, '2900-01-01 00:00:00', 32, 0, 5, 90, 1, '3e46b853-c9cd-4f55-9ffc-a1e44f5eba2a',
																																																	'63b7e281-d5f7-4f6e-9369-2a1d5ff8a148', 0, 0, 0, 0, 0, 0, NULL,
																																																																											NULL, NULL,
																																																																											NULL, 0, 0, 0,
																																																																											4, NULL, NULL,
																																																																												 NULL, NULL,
																																																																												 NULL, NULL,
																																																																												 NULL, NULL,
																																																																												 NULL, NULL,
		0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, -1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);


INSERT INTO `contract` (`id`, `uuid`, `unique_id`, `begin_date`, `contract_no`, `end_date`, `asset_type`, `month_fee`, `app_id`, `customer_id`, `house_id`, `actual_end_date`, `create_time`, `interest_rate`, `payment_day_in_month`, `payment_frequency`, `periods`, `repayment_way`, `total_amount`, `penalty_interest`, `active_version_no`, `repayment_plan_operate_logs`, `state`, `financial_contract_uuid`, `interest_rate_cycle`, `customer_uuid`)
VALUES
	('1', 'test_contract_uuid', 'test_unique_id', '2016-11-01', 'test_contract_no', '2017-08-01', '0', NULL, '1', '1', '1', NULL, '2016-12-20 15:37:58', '0.0000000000', '3', '3', '3', NULL, '33000.00', NULL, '1', NULL, '2', 'test_financial_contract_uuid', '0', 'test_customer_uuid');

INSERT INTO `asset_set` (`id`, `guarantee_status`, `settlement_status`, `asset_fair_value`, `asset_principal_value`, `asset_interest_value`, `asset_initial_value`, `asset_recycle_date`, `confirm_recycle_date`, `refund_amount`, `asset_status`, `on_account_status`, `repayment_plan_type`, `last_valuation_time`, `asset_uuid`, `create_time`, `last_modified_time`, `comment`, `single_loan_contract_no`, `contract_id`, `actual_recycle_date`, `current_period`, `overdue_status`, `overdue_date`, `version_no`, `active_status`, `sync_status`, `active_deduct_application_uuid`, `repurchase_status`, `financial_contract_uuid`, `asset_finger_print`, `asset_extra_fee_finger_print`, `asset_finger_print_update_time`, `asset_extra_fee_finger_print_update_time`, `plan_type`, `write_off_reason`, `can_be_rollbacked`, `time_Interval`, `deduction_status`, `executing_status`, `executing_status_bak`,  `customer_uuid`, `contract_uuid`, `contract_funding_status`)
VALUES
	('1', '0', '0', '11000.00', '10000.00', '1000.00', '10000.00', DATE(now()), NULL, NULL, '0', '0', '0', NULL, 'test_processing_asset_uuid', '2016-12-20 15:49:24', '2016-12-20 15:49:27', NULL, 'test_asset_no_1', '1', NULL, '1', '0', NULL, NULL, '0', '0', 'empty_deduct_uuid', NULL, 'test_financial_contract_uuid', NULL, NULL, NULL, NULL, '0', NULL, '0', '0', '0', '1', NULL,  'test_customer_uuid', 'test_contract_uuid', NULL),
	('2', '0', '0', '11000.00', '10000.00', '1000.00', '10000.00', '2020-05-01', NULL, NULL, '0', '0', '0', NULL, 'test_asset_uuid_2', '2016-12-20 15:49:24', '2016-12-20 15:49:27', NULL, 'test_asset_no_2', '1', NULL, '2', '0', NULL, NULL, '0', '0', 'empty_deduct_uuid', NULL, 'test_financial_contract_uuid', NULL, NULL, NULL, NULL, '0', NULL, '0', '0', '0', '0', NULL,  'test_customer_uuid', 'test_contract_uuid', NULL),
	('3', '0', '0', '11000.00', '10000.00', '1000.00', '10000.00', '2020-06-01', NULL, NULL, '0', '0', '0', NULL, 'test_asset_uuid_3', '2016-12-20 15:49:24', '2016-12-20 15:49:27', NULL, 'test_asset_no_3', '1', NULL, '3', '0', NULL, NULL, '0', '0', 'empty_deduct_uuid', NULL, 'test_financial_contract_uuid', NULL, NULL, NULL, NULL, '0', NULL, '0', '0', '0', '0', NULL,  'test_customer_uuid', 'test_contract_uuid', NULL);

INSERT INTO `ledger_book` (`id`, `ledger_book_no`, `ledger_book_orgnization_id`, `book_master_id`, `party_concerned_ids`)
VALUES
	('1', 'test_ledger_book_no', '1', '1', NULL);

INSERT INTO `rent_order` (`id`, `order_type`, `due_date`, `order_no`, `payout_time`, `total_rent`, `customer_id`, `user_upload_param`, `modify_time`, `financial_contract_id`, `repayment_bill_id`, `asset_set_id`, `create_time`, `clearing_status`, `executing_settling_status`, `comment`, `charges_detail`, `order_source`)
VALUES
	('1', '0', '2017-02-04', 'test_order_1', NULL, NULL, '1', NULL, NULL, '1', NULL, '1', '2017-02-04 12:00:09', '0', '1', NULL, NULL, '0');

INSERT INTO `t_prepayment_application` (`id`, `contract_id`, `asset_set_id`, `unique_id`, `contract_no`, `request_no`, `asset_recycle_date`, `asset_initial_value`, `type`, `asset_set_uuid`, `create_time`, `ip`, `prepayment_status`, `completed_time`, `bepred_repayment_plan_uuid_list`, `pay_way`)
VALUES
	(1, 8050, 18183, 'f522e269-8281-4bf2-b922-7c691881ef6a', NULL, '123456', '2016-09-30', '50001.0', 0, 'ce51a10c-67b1-43cd-ac7d-983071531e5c', '2016-09-20 15:21:48',
	 '101.52.128.162', 2, '2016-09-30 13:00:15', NULL, NULL);
