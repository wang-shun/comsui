SET FOREIGN_KEY_CHECKS=0;
delete from t_deduct_application;
delete from financial_contract;
delete from t_deduct_plan;



INSERT INTO `t_deduct_application` (`id`, `deduct_application_uuid`, `deduct_id`, `request_no`, `financial_contract_uuid`, `financial_product_code`, `contract_unique_id`, `repayment_plan_code_list`, `contract_no`, `planned_deduct_total_amount`, `actual_deduct_total_amount`, `notify_url`, `transcation_type`, `repayment_type`, `execution_status`, `execution_remark`, `create_time`, `creator_name`, `ip`, `last_modified_time`, `record_status`, `is_available`, `api_called_time`, `transaction_recipient`, `customer_name`, `mobile`, `gateway`, `third_part_voucher_status`)
VALUES
	(350, 'bb5e3010-0649-4234-8cfc-de7f913d0bbd', 'b16afa35-b8e2-4de0-ac55-55bdab9bc5d5', 'e50a1d0f-0f5c-4ddb-87f9-d6a7519e0ec1', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 'G31700', '1c7f58c3-d724-43f3-aba6-ae18d243e443', '[\"ZC27561A5DCB1B70BF\",\"ZC27561A5DCB207334\"]', 'yq-17-0b91787f-d258-451f-8eba-dc4b973e8b370', 60.00, 60.00, '', 1, 2, 2, '交易成功', '2016-11-21 17:40:43', 't_test_zfb', '127.0.0.1', '2016-11-21 17:41:38', 0, 0, '2016-11-19 00:00:00', 1, '测试员', '13777847783', '', NULL),
	(349, 'd899ecdd-5978-455d-a014-502292b6bd63', 'e49014fc-dfe1-41ac-a91d-5f2b84b3631a', 'd606900c-bba0-4801-acff-62706ffb0fbf', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 'G31700', '3ee9b9e0-db2c-4ad8-8db1-8e08339b7d6f', '[\"ZC2755B882FCF3A7D2\"]', 'test-2016-11-08-01-a0a0e180-c8f3-4334-9290-36aa688e05570', 100.00, 100.00, '', 1, 0, 2, '交易成功', '2016-11-15 14:34:58', 't_test_zfb', '127.0.0.1', '2016-11-15 14:35:59', 2, 0, '2016-11-10 00:00:00', 1, '测试员', '13777847783', '', 0),
	(348, '5f470d1e-62aa-4789-9ec5-fe92f0b6b001', '2a16ebd5-0442-4ad4-94b8-032b6477bc09', '4bfb4ecd-5912-4009-8b28-791f766f1f66', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 'G31700', '3ee9b9e0-db2c-4ad8-8db1-8e08339b7d6f', '[\"ZC2755B882FCF3A7D2\"]', 'test-2016-11-08-01-a0a0e180-c8f3-4334-9290-36aa688e05570', 456.00, 456.00, '', 1, 0, 2, '交易成功', '2016-11-15 14:30:41', 't_test_zfb', '127.0.0.1', '2016-11-15 14:31:39', 2, 0, '2016-11-10 00:00:00', 1, '测试员', '13777847783', '', 0),
	(347, 'd22db962-5a02-4ad0-8354-e7e1568cf0bc', 'ab9c02f7-b403-4f2b-8ccf-a246b7deead9', '9a421e5b-5a30-4467-89d3-b4b30ea56794', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 'G31700', '70e45c1e-2117-4a64-9b12-f791439786ef', '[\"ZC2754F6E1BD3173F4\"]', 'test-2016-10-28-03-c5487bcc-72ce-4735-9c53-05722b0337c90', 20.00, 0.00, '', 1, 0, 3, '宝付:报文交易要素格式错误 银联广州:余额不足 ', '2016-11-03 11:58:33', 't_test_zfb', '127.0.0.1', '2016-11-03 11:59:34', 0, 0, '2016-10-12 00:00:00', 1, '测试员', '13777847783', '', 0),
	(346, '9a3adfe7-a246-4967-9fc2-5699c8336cfa', 'f20c939e-1da4-4d02-a225-4022ff8aaccb', 'f20c939e-1da4-4d02-a225-4022ff8aaccb', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 'G31700', '7278886b-6618-48b2-9554-5d76366bded5', '[\"ZC27503C8E5A1BFB24\"]', '2016-236-DK(12794164)号', 45.23, 45.23, '', 1, 2, 2, '交易成功', '2016-11-02 10:39:48', 't_merchant', '101.52.128.162', '2016-11-02 10:40:39', 2, 0, '2016-11-02 00:00:00', 1, '深圳一号', '15317312520', '', 0);


	INSERT INTO `financial_contract` (`adva_repayment_term`,`id`, `asset_package_format`, `adva_matuterm`, `adva_start_date`, `contract_no`, `contract_name`, `app_id`, `company_id`, `adva_repo_term`, `thru_date`, `capital_account_id`, `financial_contract_type`, `loan_overdue_start_day`, `loan_overdue_end_day`, `payment_channel_id`, `ledger_book_no`, `financial_contract_uuid`, `sys_normal_deduct_flag`, `sys_overdue_deduct_flag`, `sys_create_penalty_flag`, `sys_create_guarantee_flag`, `unusual_modify_flag`, `sys_create_statement_flag`)
VALUES
	('0',38, 0, 1, '2016-09-01 00:00:00', 'G31700', '拍拍贷测试', 3, 1, 60, '2017-08-31 00:00:00', 102, 0, 1, 2, 1, '7dd4ee73-8dcf-4dbc-94ee-932ff9f48b58', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 0, 0, 0, 0, 1, 0);

	
	
	INSERT INTO `t_deduct_plan` (`id`, `deduct_plan_uuid`, `deduct_application_uuid`, `deduct_application_detail_uuid`, `financial_contract_uuid`, `contract_unique_id`, `contract_no`, `payment_gateway`, `payment_channel_uuid`, `pg_account`, `pg_clearing_account`, `transaction_type`, `transaction_remark`, `cp_bank_code`, `cp_bank_card_no`, `cp_bank_account_holder`, `cp_id_type`, `cp_id_number`, `cp_bank_province`, `cp_bank_city`, `cp_bank_name`, `planned_payment_date`, `complete_payment_date`, `planned_total_amount`, `actual_total_amount`, `execution_precond`, `execution_status`, `execution_remark`, `create_time`, `creator_name`, `last_modified_time`, `transaction_serial_no`, `mobile`, `transaction_recipient`, `trade_uuid`, `repayment_type`)
VALUES
	(420, '25989d18-d7dd-44d6-a526-aebd1009400e', 'bb5e3010-0649-4234-8cfc-de7f913d0bbd', NULL, 'd2812bc5-5057-4a91-b3fd-9019506f0499', '1c7f58c3-d724-43f3-aba6-ae18d243e443', 'yq-17-0b91787f-d258-451f-8eba-dc4b973e8b370', 0, 'f1ccca57-7c80-4429-b226-8ad31a729609', NULL, NULL, 1, '', 'C10102', '00000016090', '测试员', 0, '330683199403062411', '330000', '110100', '中国工商银行 ', NULL, '2016-11-21 17:39:24', 60.00, 60.00, NULL, 2, '交易?成功', '2016-11-21 17:40:58', 't_test_zfb', '2016-11-21 17:41:38', NULL, '13777847783', 1, 'lvl9Qyu13NrQVvUJ1p4', 2),
	(419, 'dae796d0-fa17-4584-ad43-7c1cbb39c136', 'bb5e3010-0649-4234-8cfc-de7f913d0bbd', NULL, 'd2812bc5-5057-4a91-b3fd-9019506f0499', '1c7f58c3-d724-43f3-aba6-ae18d243e443', 'yq-17-0b91787f-d258-451f-8eba-dc4b973e8b370', 3, '342c1ff6-0684-4422-a58e-e135aefe468e', NULL, NULL, 1, NULL, 'C10102', '00000016090', '测试员', 0, '330683199403062411', '330000', '110100', '中国工商银行 ', NULL, NULL, 60.00, 0.00, NULL, 3, '报文交易要素格式错误', '2016-11-21 17:40:43', 't_test_zfb', '2016-11-21 17:40:58', NULL, '13777847783', 1, '8TN3TEeruEZMWl5MXmg', 2),
	(418, '261f5d8d-ffb9-4566-8558-1428a41bfe91', 'd899ecdd-5978-455d-a014-502292b6bd63', NULL, 'd2812bc5-5057-4a91-b3fd-9019506f0499', '3ee9b9e0-db2c-4ad8-8db1-8e08339b7d6f', 'test-2016-11-08-01-a0a0e180-c8f3-4334-9290-36aa688e05570', 0, 'f1ccca57-7c80-4429-b226-8ad31a729609', NULL, NULL, 1, '', 'C10103', '6217001210075327590', '测试员', 0, '330683199403062411', '330000', '110100', '中国农业银行 ', NULL, '2016-11-15 14:34:21', 100.00, 100.00, NULL, 2, '交易?成功', '2016-11-15 14:35:39', 't_test_zfb', '2016-11-15 14:35:59', NULL, '13777847783', 1, 'tw0EwGm9rNDgv6oHEoy', 0),
	(417, 'def8fb5f-03a8-4931-9bcc-1f9916c40958', 'd899ecdd-5978-455d-a014-502292b6bd63', NULL, 'd2812bc5-5057-4a91-b3fd-9019506f0499', '3ee9b9e0-db2c-4ad8-8db1-8e08339b7d6f', 'test-2016-11-08-01-a0a0e180-c8f3-4334-9290-36aa688e05570', 3, '342c1ff6-0684-4422-a58e-e135aefe468e', NULL, NULL, 1, NULL, 'C10103', '6217001210075327590', '测试员', 0, '330683199403062411', '330000', '110100', '中国农业银行 ', NULL, NULL, 100.00, 0.00, NULL, 3, '报文交易要素格式错误', '2016-11-15 14:34:58', 't_test_zfb', '2016-11-15 14:35:39', NULL, '13777847783', 1, 'YmnNe3ZUPAeyjjTiva1', 0),
	(416, '25136fae-ede7-4bf1-a3c1-ca682784e74f', '5f470d1e-62aa-4789-9ec5-fe92f0b6b001', NULL, 'd2812bc5-5057-4a91-b3fd-9019506f0499', '3ee9b9e0-db2c-4ad8-8db1-8e08339b7d6f', 'test-2016-11-08-01-a0a0e180-c8f3-4334-9290-36aa688e05570', 0, 'f1ccca57-7c80-4429-b226-8ad31a729609', NULL, NULL, 1, '', 'C10103', '6217001210075327590', '测试员', 0, '330683199403062411', '330000', '110100', '中国农业银行 ', NULL, '2016-11-15 14:29:32', 456.00, 456.00, NULL, 2, '交易?成功', '2016-11-15 14:30:49', 't_test_zfb', '2016-11-15 14:31:39', NULL, '13777847783', 1, 'ZIc0yLS5QXxXLa9BdYF', 0),
	(415, '82927afa-913f-48a1-8ea3-4875db4a8eeb', '5f470d1e-62aa-4789-9ec5-fe92f0b6b001', NULL, 'd2812bc5-5057-4a91-b3fd-9019506f0499', '3ee9b9e0-db2c-4ad8-8db1-8e08339b7d6f', 'test-2016-11-08-01-a0a0e180-c8f3-4334-9290-36aa688e05570', 3, '342c1ff6-0684-4422-a58e-e135aefe468e', NULL, NULL, 1, NULL, 'C10103', '6217001210075327590', '测试员', 0, '330683199403062411', '330000', '110100', '中国农业银行 ', NULL, NULL, 456.00, 0.00, NULL, 3, '报文交易要素格式错误', '2016-11-15 14:30:41', 't_test_zfb', '2016-11-15 14:30:49', NULL, '13777847783', 1, 'Z6MxhvIAWxcljA5oiTs', 0),
	(414, '0b3dd2ac-525d-4fd2-9c1f-0346aa67f076', 'd22db962-5a02-4ad0-8354-e7e1568cf0bc', NULL, 'd2812bc5-5057-4a91-b3fd-9019506f0499', '70e45c1e-2117-4a64-9b12-f791439786ef', 'test-2016-10-28-03-c5487bcc-72ce-4735-9c53-05722b0337c90', 0, 'f1ccca57-7c80-4429-b226-8ad31a729609', NULL, NULL, 1, '', 'C10102', '0000009332', '测试员', 0, '330683199403062411', '330000', '110100', '中国工商银行 ', NULL, NULL, 20.00, 0.00, NULL, 3, '余额不足', '2016-11-03 11:58:45', 't_test_zfb', '2016-11-03 11:59:34', NULL, '13777847783', 1, 'D9yY83lOHuuDzPMyjYu', 0),
	(413, 'f7e57316-f6f8-4603-8445-d942823c41b5', 'd22db962-5a02-4ad0-8354-e7e1568cf0bc', NULL, 'd2812bc5-5057-4a91-b3fd-9019506f0499', '70e45c1e-2117-4a64-9b12-f791439786ef', 'test-2016-10-28-03-c5487bcc-72ce-4735-9c53-05722b0337c90', 3, '342c1ff6-0684-4422-a58e-e135aefe468e', NULL, NULL, 1, NULL, 'C10102', '0000009332', '测试员', 0, '330683199403062411', '330000', '110100', '中国工商银行 ', NULL, NULL, 20.00, 0.00, NULL, 3, '报文交易要素格式错误', '2016-11-03 11:58:33', 't_test_zfb', '2016-11-03 11:58:45', NULL, '13777847783', 1, '8aVV4fw1cGumWucPyPv', 0),
	(412, '13d3ea28-38c2-4b70-9a57-efcac475ebb7', '9a3adfe7-a246-4967-9fc2-5699c8336cfa', NULL, 'd2812bc5-5057-4a91-b3fd-9019506f0499', '7278886b-6618-48b2-9554-5d76366bded5', '2016-236-DK(12794164)号', 0, 'f1ccca57-7c80-4429-b226-8ad31a729609', NULL, NULL, 1, '', 'C10104', '6222024000000000', '深圳一号', 0, '410402198801115658', '320000', '321000', '中国银行', NULL, '2016-11-02 10:39:09', 45.23, 45.23, NULL, 2, '交易?成功', '2016-11-02 10:39:59', 't_merchant', '2016-11-02 10:40:39', NULL, '15317312520', 1, 'Ulx15CdtNBMAlXqnNqe', 2),
	(411, 'abeb2003-ad5e-44a2-bfe9-3f8a556998d5', '9a3adfe7-a246-4967-9fc2-5699c8336cfa', NULL, 'd2812bc5-5057-4a91-b3fd-9019506f0499', '7278886b-6618-48b2-9554-5d76366bded5', '2016-236-DK(12794164)号', 3, '342c1ff6-0684-4422-a58e-e135aefe468e', NULL, NULL, 1, NULL, 'C10104', '6222024000000000', '深圳一号', 0, '410402198801115658', '320000', '321000', '中国银行', NULL, NULL, 45.23, 0.00, NULL, 3, '卡号校验失败', '2016-11-02 10:39:48', 't_merchant', '2016-11-02 10:39:59', NULL, '15317312520', 1, 'UyMBZOHwysuVwTVezge', 2);

	
	


SET FOREIGN_KEY_CHECKS=1;