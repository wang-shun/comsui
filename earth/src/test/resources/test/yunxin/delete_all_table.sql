set foreign_key_checks=0;

delete from  account;
delete from  app;
delete from  app_account;
delete from  app_arrive_record;
delete from  asset_package;
delete from  asset_set;
delete from  asset_set_extra_charge;
delete from  asset_valuation_detail;
delete from  audit_job;
delete from  bank;
delete from  bank_transaction_limit_sheet;
delete from  batch_pay_record;
delete from  beneficiary_audit_result;
delete from  business_voucher;
delete from  cash_flow;
delete from  channel_worker_config;
delete from  city;
delete from  company;
delete from  contract;
delete from  contract_account;
delete from  customer;
delete from  data_sync_tmp;
delete from  deduct_plan_stat_cache;
delete from  district;
delete from  extra_charge_snap_shot;
delete from  file_storage;
delete from  finance_company;
delete from  financial_contract;
delete from  financial_contract_config;
delete from  financial_contract_configuration;
delete from  house;
delete from  input_history;
delete from  job;
delete from  journal_voucher;
delete from  ledger_book;
delete from  ledger_book_shelf;
delete from  link_role_menu;
delete from  link_role_principal;
delete from  loan_batch;
delete from  notice;
delete from  offline_bill;
delete from  payment_channel;
delete from  payment_channel_information;
delete from  principal;
delete from  province;
delete from  remittance_audit_job_stat_result;
delete from  remittance_audit_result;
delete from  rent_order;
delete from  repurchase_doc;
delete from  request_record;
delete from  schedule_job;
delete from  settlement_order;
delete from  sms_quene;
delete from  sms_template;
delete from  source_document;
delete from  source_document_detail;
delete from  source_document_resource;
delete from  system_log;
delete from  system_menu;
delete from  system_operate_log;
delete from  system_role;
delete from  t_api_config;
delete from  t_deduct_application;
delete from  t_deduct_application_detail;
delete from  t_deduct_plan;
delete from  t_dynamic_business_task;
delete from  t_external_trade_batch;
delete from  t_external_trade_batch_cash;
delete from  t_external_trade_batch_detail;
delete from  t_interface_active_voucher_log;
delete from  t_interface_batch_deduct_status_query_log;
delete from  t_interface_data_sync_log;
delete from  t_interface_deduct_application_log;
delete from  t_interface_import_asset_package;
delete from  t_interface_modfify_overdue_fee_log;
delete from  t_interface_query_voucher;
delete from  t_interface_repayment_information_log;
delete from  t_interface_voucher_log;
delete from  t_merchant_config;
delete from  t_prepayment_application;
delete from  t_remittance_application;
delete from  t_remittance_application_detail;
delete from  t_remittance_black_list;
delete from  t_remittance_plan;
delete from  t_remittance_plan_exec_log;
delete from  t_remittance_refund_bill;
delete from  t_report_job;
delete from  t_system_deduct_log;
delete from  t_user;
delete from  t_voucher;
delete from  third_party_audit_bill;
delete from  third_party_audit_bill_stat;
delete from  third_party_pay_audit_result;
delete from  third_party_pay_voucher_batch;
delete from  third_party_transaction_record;
delete from  third_party_voucher_command_log;
delete from  total_receivable_bills;
delete from  transfer_application;
delete from  unionpay_bank_config;
delete from  unionpay_manual_transaction;
delete from  update_asset_log;
delete from  usb_key;
delete from  usb_key_account_relation;
delete from  user_group;
delete from  virtual_account;
delete from  virtual_account_flow;
delete from  virtual_account_payment_black_list;
set foreign_key_checks=1;