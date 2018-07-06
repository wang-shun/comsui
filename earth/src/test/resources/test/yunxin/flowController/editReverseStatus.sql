INSERT INTO `t_remittance_plan_exec_log` (`remittance_application_uuid`, `remittance_plan_uuid`, `financial_contract_uuid`, `financial_contract_id`, `payment_gateway`, `payment_channel_uuid`, `payment_channel_name`, `pg_account_name`, `pg_account_no`, `pg_clearing_account`, `planned_amount`, `actual_total_amount`, `cp_bank_code`, `cp_bank_card_no`, `cp_bank_account_holder`, `cp_id_type`, `cp_id_number`, `cp_bank_province`, `cp_bank_city`, `cp_bank_name`, `transaction_type`, `transaction_remark`, `exec_req_no`, `exec_rsp_no`, `execution_status`, `execution_remark`, `transaction_serial_no`, `complete_payment_date`, `create_time`, `last_modified_time`, `plan_credit_cash_flow_check_number`, `actual_credit_cash_flow_check_number`, `reverse_status`, `credit_cash_flow_uuid`, `debit_cash_flow_uuid`, `transaction_recipient`, `opposite_receive_date`)
VALUES
	('dab7321-0115-48fd-8620-4ada62033ea3', 'hc9eeb-1f15-4dca-80e4-d23fc835bc8a', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 1, 2, 'f8bb9956-1952-4893-98c8-66683d25d7ce', 'paymentChannelName', NULL, NULL, 'pgClearingAccount_1', 1.00, NULL, 'cpBankCode', 'cpBankCardNo', '65db4411-ff4e-456f-a905-ce8f376440d6', 0, 'cpIdNumber', 'cpBankProvince', 'cpBankCity', 'cpBankName', 0, 'transactionRemark', 'b89948cb9-4796-44e7-8d96-0104fa5ed098', 'f76ec93b574b43629db7', 3, '', NULL, NULL, '2017-01-18 18:44:49', '2017-01-18 18:44:49', 0, 0, 2, '', '', 0, NULL);
	
	INSERT INTO `t_remittance_plan_exec_log` (`remittance_application_uuid`, `remittance_plan_uuid`, `financial_contract_uuid`, `financial_contract_id`, `payment_gateway`, `payment_channel_uuid`, `payment_channel_name`, `pg_account_name`, `pg_account_no`, `pg_clearing_account`, `planned_amount`, `actual_total_amount`, `cp_bank_code`, `cp_bank_card_no`, `cp_bank_account_holder`, `cp_id_type`, `cp_id_number`, `cp_bank_province`, `cp_bank_city`, `cp_bank_name`, `transaction_type`, `transaction_remark`, `exec_req_no`, `exec_rsp_no`, `execution_status`, `execution_remark`, `transaction_serial_no`, `complete_payment_date`, `create_time`, `last_modified_time`, `plan_credit_cash_flow_check_number`, `actual_credit_cash_flow_check_number`, `reverse_status`, `credit_cash_flow_uuid`, `debit_cash_flow_uuid`, `transaction_recipient`, `opposite_receive_date`)
VALUES
	('dab7321-0115-48fd-8620-4ada62033ea3', 'hc9eeb-1f15-4dca-80e4-d23fc835bc8a', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 1, 2, 'f8bb9956-1952-4893-98c8-66683d25d7ce', 'paymentChannelName', NULL, NULL, 'pgClearingAccount_1', 1.00, NULL, 'cpBankCode', 'cpBankCardNo', '65db4411-ff4e-456f-a905-ce8f376440d6', 0, 'cpIdNumber', 'cpBankProvince', 'cpBankCity', 'cpBankName', 0, 'transactionRemark', 'cc9948cb9-4796-44e7-8d96-0104fa5ed098', 'f76ec93b574b43629db7', 3, '测试未找到贷记流水', NULL, NULL, '2017-01-18 18:44:49', '2017-01-18 18:44:49', 0, 0, 1, '', '', 0, NULL);

	INSERT INTO `t_remittance_plan_exec_log` (`remittance_application_uuid`, `remittance_plan_uuid`, `financial_contract_uuid`, `financial_contract_id`, `payment_gateway`, `payment_channel_uuid`, `payment_channel_name`, `pg_account_name`, `pg_account_no`, `pg_clearing_account`, `planned_amount`, `actual_total_amount`, `cp_bank_code`, `cp_bank_card_no`, `cp_bank_account_holder`, `cp_id_type`, `cp_id_number`, `cp_bank_province`, `cp_bank_city`, `cp_bank_name`, `transaction_type`, `transaction_remark`, `exec_req_no`, `exec_rsp_no`, `execution_status`, `execution_remark`, `transaction_serial_no`, `complete_payment_date`, `create_time`, `last_modified_time`, `plan_credit_cash_flow_check_number`, `actual_credit_cash_flow_check_number`, `reverse_status`, `credit_cash_flow_uuid`, `debit_cash_flow_uuid`, `transaction_recipient`, `opposite_receive_date`)
VALUES
	('db4b24e3-e86b-45b0-b5fa-c4908acc86aa', '7e5640d9-d3f2-4ce7-b6ca-08e475738b79', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 38, 2, 'f8bb9956-1952-4893-98c8-66683d25d7ce', 'G31700平安银企直联', '', '', NULL, 1500.00, 1500.00, 'C10102', '6214855712106520', '测试用户1', 0, 'idNumber1', 'bankProvince1', 'bankCity1', 'bankName1', 0, NULL, '67ee8c06-76a9-4419-b8b7-0e26323b5326', 'aKYMAWme7Rw9ZuYOAyI', 2, '测试未发生改为已退票', NULL, NULL, '2017-03-23 15:42:25', '2017-03-23 15:42:57', 3, 0, 0, '190dd95-dcc5-11e6-aac2-00163e002839', NULL, 1, '2017-03-23 15:43:32');
INSERT INTO `t_remittance_plan` (`remittance_plan_uuid`, `remittance_application_uuid`, `remittance_application_detail_uuid`, `business_record_no`, `financial_contract_uuid`, `financial_contract_id`, `contract_unique_id`, `contract_no`, `payment_gateway`, `payment_channel_uuid`, `payment_channel_name`, `pg_account_name`, `pg_account_no`, `pg_clearing_account`, `transaction_type`, `transaction_remark`, `priority_level`, `cp_bank_code`, `cp_bank_card_no`, `cp_bank_account_holder`, `cp_id_type`, `cp_id_number`, `cp_bank_province`, `cp_bank_city`, `cp_bank_name`, `planned_payment_date`, `complete_payment_date`, `planned_total_amount`, `actual_total_amount`, `execution_precond`, `execution_status`, `execution_remark`, `transaction_serial_no`, `create_time`, `creator_name`, `last_modified_time`)
VALUES
	('7e5640d9-d3f2-4ce7-b6ca-08e475738b79', 'db4b24e3-e86b-45b0-b5fa-c4908acc86aa', '0e0a4681-c901-4d93-8f6b-f3e154642622', 'detailNo1', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 38, 'FANT208', 'FANT208', 2, 'f8bb9956-1952-4893-98c8-66683d25d7ce', 'G31700平安银企直联', '', '', NULL, 0, NULL, 1, 'C10102', '6214855712106520', '测试用户1', 0, 'idNumber1', 'bankProvince1', 'bankCity1', 'bankName1', '2016-08-20 00:00:00', NULL, 1500.00, 1500.00, NULL, 2, '测试置成功', NULL, '2017-03-23 15:42:25', 't_test_zfb', '2017-03-23 15:42:57');
INSERT INTO `t_remittance_application` (`remittance_application_uuid`, `request_no`, `financial_contract_uuid`, `financial_contract_id`, `financial_product_code`, `contract_unique_id`, `contract_no`, `planned_total_amount`, `actual_total_amount`, `auditor_name`, `audit_time`, `notify_url`, `plan_notify_number`, `actual_notify_number`, `remittance_strategy`, `remark`, `transaction_recipient`, `execution_status`, `execution_remark`, `create_time`, `creator_name`, `ip`, `last_modified_time`, `opposite_receive_date`)
VALUES
	('db4b24e3-e86b-45b0-b5fa-c4908acc86aa', '5108fd9-4fd7-48d6-846e-178a687a41d6', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 38, 'G31700', 'FANT208', 'FANT208', 1500.00, 1500.00, 'auditorName1', '2016-08-20 00:00:00', 'http://hello369.tunnel.qydev.com/loan/paidnotic', 1, 0, 0, '交易备注', 1, 2, NULL, '2017-03-23 15:42:25', 't_test_zfb', '192.168.0.33', '2017-03-23 15:42:57', '2017-01-01 00:00:00');
	
	INSERT INTO `t_remittance_plan_exec_log` (`remittance_application_uuid`, `remittance_plan_uuid`, `financial_contract_uuid`, `financial_contract_id`, `payment_gateway`, `payment_channel_uuid`, `payment_channel_name`, `pg_account_name`, `pg_account_no`, `pg_clearing_account`, `planned_amount`, `actual_total_amount`, `cp_bank_code`, `cp_bank_card_no`, `cp_bank_account_holder`, `cp_id_type`, `cp_id_number`, `cp_bank_province`, `cp_bank_city`, `cp_bank_name`, `transaction_type`, `transaction_remark`, `exec_req_no`, `exec_rsp_no`, `execution_status`, `execution_remark`, `transaction_serial_no`, `complete_payment_date`, `create_time`, `last_modified_time`, `plan_credit_cash_flow_check_number`, `actual_credit_cash_flow_check_number`, `reverse_status`, `credit_cash_flow_uuid`, `debit_cash_flow_uuid`, `transaction_recipient`, `opposite_receive_date`)
VALUES
	('db4b24e3-e86b-45b0-b5fa-c4908acc86aa', '7e5640d9-d3f2-4ce7-b6ca-08e475738b79', 'd2812bc5-5057-4a91-b3fd-9019506f0499', 38, 2, 'f8bb9956-1952-4893-98c8-66683d25d7ce', 'G31700平安银企直联', '', '', NULL, 1500.00, 1500.00, 'C10102', '6214855712106520', '测试用户1', 0, 'idNumber1', 'bankProvince1', 'bankCity1', 'bankName1', 0, NULL, '8c06-76a9-4419-b8c7-0e26323brfr26', 'aKYMAWme7Rw9ZuYOAyI', 2, '测试未冲账改为已冲账', NULL, NULL, '2017-03-23 15:42:25', '2017-03-23 15:42:57', 3, 0, 1, '190dd95-dcc5-11e6-aac2-00163e002839', NULL, 1, '2017-03-23 15:43:32');
INSERT INTO `cash_flow` (`cash_flow_uuid`, `cash_flow_channel_type`, `company_uuid`, `host_account_uuid`, `host_account_no`, `host_account_name`, `counter_account_no`, `counter_account_name`, `counter_account_appendix`, `counter_bank_info`, `account_side`, `transaction_time`, `transaction_amount`, `balance`, `transaction_voucher_no`, `bank_sequence_no`, `remark`, `other_remark`, `strike_balance_status`, `trade_uuid`, `issued_amount`, `audit_status`, `date_field_one`, `date_field_two`, `date_field_three`, `long_field_one`, `long_field_two`, `long_field_three`, `string_field_one`, `string_field_two`, `string_field_three`, `decimal_field_one`, `decimal_field_two`, `decimal_field_three`, `cash_flow_type`)
VALUES
	('190dd95-dcc5-11e6-aac2-00163e002839', 0, NULL, 'd0503298-e890-425a-4444444', '591902896710201', '云南国际信托有限公司', '110234440', '公司', '', '', 0, '2017-01-11 18:12:10', 1500.00, NULL, NULL, '6a5b2be4-d7e6-11e6-aac2-dfdfddfsdfsf', '', NULL, NULL, '7N2WykytWrEiW5qLnbC', 1500.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);