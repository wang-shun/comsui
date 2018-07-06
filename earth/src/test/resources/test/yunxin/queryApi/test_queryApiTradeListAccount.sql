SET FOREIGN_KEY_CHECKS=0;
-- 插入账户信息
-- account_no 591902896710203
 TRUNCATE table `account`;
 INSERT INTO `account` (`id`,`account_name`,`account_no`,`bank_name`,`alias`,`attr`,`scan_cash_flow_switch`,`usb_key_configured`,`uuid`,`bank_code`,`cash_flow_config`) VALUES (1,'流水查询接口','591902896710203','工商银行',NULL,'{\"bankBranchNo\":\"59\",\"usbUuid\":\"b173f24a-3c27-4243-85b7-e93ef6a128ac\"}',1,1,'uuid_5','PAB','{\"nextPageNo\":\"1\"}');

-- 插入信托合同信息
-- id 1
-- capital_account_id 1
-- contract_no AND001
-- financial_contract_uuid 2d380fe1-7157-490d-9474-12c5a9901e28
  TRUNCATE table `financial_contract`;
  INSERT INTO `financial_contract` (`id`,`asset_package_format`,`adva_matuterm`,`adva_start_date`,`contract_no`,`contract_name`,`app_id`,`company_id`,`adva_repo_term`,`thru_date`,`capital_account_id`,`financial_contract_type`,`loan_overdue_start_day`,`loan_overdue_end_day`,`payment_channel_id`,`ledger_book_no`,`financial_contract_uuid`,`sys_normal_deduct_flag`,`sys_overdue_deduct_flag`,`sys_create_penalty_flag`,`sys_create_guarantee_flag`,`unusual_modify_flag`,`sys_create_statement_flag`,`transaction_limit_per_transcation`,`transaction_limit_per_day`,`remittance_strategy_mode`,`app_account_uuids`,`allow_online_repayment`,`allow_offline_repayment`,`allow_advance_deduct_flag`,`adva_repayment_term`,`penalty`,`overdue_default_fee`,`overdue_service_fee`,`overdue_other_fee`,`create_time`,`last_modified_time`,`repurchase_approach`,`repurchase_rule`,`repurchase_algorithm`,`day_of_month`,`pay_for_go`,`repurchase_principal_algorithm`,`repurchase_interest_algorithm`,`repurchase_penalty_algorithm`,`repurchase_other_charges_algorithm`,`repayment_check_days`,`repurchase_cycle`,`days_of_cycle`,`temporary_repurchases`,`allow_freewheeling_repayment`)
    VALUES
  (1,1,3,'2016-04-01 00:00:00','AND001','测试合同11',1,1,91,'2016-07-01 00:00:00',1,0,1,90,2,'74a9ce4d-cafc-407d-b013-987077541bdc','2d380fe1-7157-490d-9474-12c5a9901e28',1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,0,0,5,'(principal+interest)*0.05/100*overdueDay',123.00,23.00,NULL,NULL,'2017-05-11 14:39:40',1,1,'outstandingPrincipal+outstandingOverdueCharges',30,0,'outstandingPrincipal','outstandingInterest','outstandingPenaltyInterest','',-1,0,'[]','[]',1);
SET FOREIGN_KEY_CHECKS=1;