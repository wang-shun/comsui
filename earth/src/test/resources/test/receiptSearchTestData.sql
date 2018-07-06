SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM transaction_record;
DELETE FROM app;
DELETE FROM transaction_record_log;
DELETE FROM principal;
DELETE FROM company;

INSERT INTO `company` (`id`, `address`, `full_name`, `short_name`) VALUES
  ('2', '上海陆家嘴', '鼎程（上海）商业保理有限公司', '鼎程'),
  ('3', '杭州万塘路8号', '杭州随地付网络技术有限公司', '租房宝'),
  ('4', '上海', '上海优帕克投资管理有限公司', '优帕克'),
  ('5', '上海', '小寓科技', '小寓'),
  ('6', '上海', '杭州驻客网络技术有限公司', '驻客'),
  ('7', '上海', '上海元轼信息咨询有限公司', '老A'),
  ('8', '上海', '柯罗芭', '柯罗芭'),
  ('9', '杭州', '租房宝测试', '租房宝测试'),
  ('10', NULL, '小寓测试帐号', '小寓测试帐号'),
  ('11', NULL, '杭州蜗居', '杭州蜗居'),
  ('12', NULL, '美家公寓', '美家公寓');

INSERT INTO `transaction_record` (`id`, `card_no`, `channel`, `last_modified_time`, `merchant_payment_no`, `order_no`, `pay_money`, `request_no`, `trade_no`, `transaction_record_status`, `app_id`, `payment_institution_id`)
VALUES
  ('7', NULL, '2', '2015-04-03 12:00:00', NULL, 'KXHY1#1803-20150402-1', 16500.00, NULL, '0', '2', '2', '3'),
  ('8', NULL, '2', '2015-04-03 12:00:00', NULL, 'JAGJ1804-20150402-12', 13500.00, NULL, '0', '2', '2', '3'),
  ('9', NULL, '2', '2015-04-03 12:00:00', NULL, 'HNHY3#602-20150402-6', 12600.00, NULL, '0', '2', '2', '3'),
  ('10', NULL, '2', '2015-04-03 12:00:00', NULL, 'HQHY1#33B-20150402-11', 17000.00, NULL, '0', '2', '2', '3'),
  ('11', NULL, '2', '2015-04-03 12:00:00', NULL, 'JAHJ3#2203-20150402-10', 20800.00, NULL, '0', '2', '2', '3'),
  ('12', NULL, '2', '2015-04-03 12:00:00', NULL, 'JAFJ4#26A-20150402-12', 17800.00, NULL, '0', '2', '2', '3'),
  ('13', NULL, '2', '2015-04-03 12:00:00', NULL, 'KXHY9#2601-20150402-13', 19500.00, NULL, '0', '2', '2', '3'),
  ('14', NULL, '2', '2015-04-03 12:00:00', NULL, 'JAHJ4#1203-20150402-12', 16500.00, NULL, '0', '2', '2', '3'),
  ('15', NULL, '2', '2015-04-08 14:00:00', NULL, 'SM3#15B-20150407-14', 29000.00, NULL, '0', '2', '2', '3'),
  ('16', NULL, '2', '2015-04-10 16:45:00', NULL, 'SHIMAO1#35D-20150408-13', 28500.00, NULL, '0', '2', '2', '3'),
  ('17', NULL, '2', '2015-04-10 16:45:00', NULL, 'SHIMAO1#45H-20150408-2', 18900.00, NULL, '0', '2', '2', '3'),
  ('18', NULL, '2', '2015-04-10 16:45:00', NULL, 'ZSGY16#1502-20150408-1', 10400.00, NULL, '0', '2', '2', '3'),
  ('22', NULL, '1', '2015-04-13 19:27:02', 'xiaoyutest1', 'CC-60450-5', 0.01, '20150413072656xiaoyutest1', NULL, '0', '1', '2'),
  ('23', NULL, '1', '2015-04-13 23:31:14', '587589379743482880', 'CC-60446-2', 0.01, '20150413081554587589379743482880', '2015041300001000450050496693', '2', '1', '2'),
  ('24', NULL, '1', '2015-06-02 12:00:55', '587590022008865792', 'CC-60446-2', 0.01, '20150413081826587590022008865792', '2015041300001000330052443978', '2', '1', '2'),
  ('25', NULL, '1', '2015-06-02 12:03:17', '587591431290815488', 'CC-60446-2', 0.01, '20150413082402587591431290815488', '2015041300001000330052444444', '2', '1', '2'),
  ('26', NULL, '1', '2015-06-02 12:03:42', '587592712440972288', 'CC-60446-2', 0.01, '20150413082908587592712440972288', '2015041300001000450050497773', '2', '1', '2'),
  ('27', NULL, '1', '2015-06-02 12:14:02', '587592810998727680', 'CC-60446-2', 0.01, '20150413082931587592810998727680', '2015041300001000330052445086', '2', '1', '2'),
  ('28', NULL, '1', '2015-06-02 12:14:11', '587594235258536960', 'CC-60446-2', 0.01, '20150413083511587594235258536960', '2015041300001000450050498312', '2', '1', '2'),
  ('29', NULL, '1', '2015-06-02 12:14:39', '587598844224013312', 'CC-60446-2', 0.01, '20150413085329587598844224013312', '2015041300001000450050500061', '2', '1', '2'),
  ('30', NULL, '1', '2015-06-02 12:14:56', '587794292075332608', 'CC-60446-2', 0.01, '20150414095011587794292075332608', '2015041400001000450050530095', '2', '1', '2'),
  ('31', NULL, '1', '2015-06-02 12:16:25', '587805750397961216', 'CC-60446-2', 0.01, '20150414103542587805750397961216',
         '2015041400001000450050534731', '2', '1', '2'),
  ('32', NULL, '1', '2015-06-02 12:43:14', '587808990548132864', 'CC-60446-2', 0.01, '20150414104834587808990548132864',
         '2015041400001000450050536191', '2', '1', '2'),
  ('33', NULL, '1', '2015-06-02 12:43:30', '587819548181726208', 'CC-60446-2', 0.01, '20150414113031587819548181726208',
         '2015041400001000450050541231', '2', '1', '2');

INSERT INTO `transaction_record_log` (`id`, `modified_time`, `operator_id`, `transaction_record_operate_status`, `transaction_record_id`)
VALUES
  ('5', '2015-04-13 19:27:02', '130', '1', '22'),
  ('6', '2015-04-13 20:16:04', '126', '1', '23'),
  ('7', '2015-04-13 20:17:11', '6', '1', '23'),
  ('8', '2015-04-13 20:19:06', '126', '1', '24'),
  ('9', '2015-04-13 20:19:45', '8', '1', '24'),
  ('10', '2015-04-13 20:24:07', '126', '1', '25'),
  ('11', '2015-04-13 20:24:44', '10', '1', '25'),
  ('12', '2015-04-13 20:29:12', '126', '1', '26'),
  ('13', '2015-04-13 20:29:31', '12', '1', '26'),
  ('14', '2015-04-13 20:32:29', '126', '1', '27'),
  ('15', '2015-04-13 20:33:02', '14', '1', '27'),
  ('16', '2015-04-13 20:35:15', '126', '1', '28'),
  ('17', '2015-04-13 20:36:11', '16', '1', '28'),
  ('18', '2015-04-13 20:53:34', '126', '1', '29'),
  ('19', '2015-04-13 20:53:52', '18', '1', '29'),
  ('20', '2015-04-13 23:31:14', '1', '1', '23'),
  ('21', '2015-04-14 09:50:15', '126', '1', '30'),
  ('22', '2015-04-14 09:50:57', '21', '1', '30'),
  ('23', '2015-04-14 10:36:01', '126', '1', '31'),
  ('24', '2015-04-14 10:36:45', '23', '1', '31'),
  ('25', '2015-04-14 10:48:39', '126', '1', '32'),
  ('26', '2015-04-14 10:50:23', '25', '1', '32'),
  ('27', '2015-04-14 11:30:36', '126', '1', '33'),
  ('28', '2015-04-14 11:31:17', '27', '1', '33'),
  ('29', '2015-04-14 14:39:57', '126', '1', '34'),
  ('30', '2015-04-14 14:41:47', '29', '1', '34'),
  ('31', '2015-04-14 14:43:26', '126', '1', '35'),
  ('32', '2015-04-14 14:45:29', '126', '1', '36'),
  ('33', '2015-04-14 14:46:33', '126', '1', '37');

INSERT INTO `app` (`id`, `app_id`, `app_secret`, `is_disabled`, `host`, `name`, `company_id`) VALUES
  ('1', 'xiaoyu', '70991db75ebb24fa0993f4fa25775022', b'0', 'http://beta.demo2do.com/jupiter/', '寓见', '5'),
  ('2', 'youpark', '123456', b'0', '', '优帕克', '4'),
  ('3', 'test4Zufangbao', '2e85ae999845f25faf8ea7b514ee0aca', b'0', 'http://e.zufangbao.cn', '租房宝测试账号', '9'),
  ('4', 'zhuke', 'cb742d55634a532060ac7387caa8d242', b'0', 'http://zkroom.com/', '杭州驻客网络技术有限公司', '6'),
  ('5', 'laoA', '744a38b1672b728dc35a68f7a10df082', b'0', 'http://www.13980.com', '上海元轼信息咨询有限公司', '7'),
  ('6', 'keluoba', '30f4d225438a7fd1541fe1a055420dfd', b'0', 'http://keluoba.com', '柯罗芭', '8'),
  ('7', 'testForXiaoyu', '2138ed4b66cebbded5753f3c59a064ae', b'0', 'http://xxx.com', '小寓测试帐号', '10'),
  ('8', 'woju', '495d49ae55fd794036576aa8f71dbb43', b'0', 'http://www.woju.com', '杭州蜗居', '11'),
  ('9', 'meijia', '1bf40057e15fd462773c13e0a85e9676', b'0', 'http://99196.hotel.cthy.com/', '美家公寓', '12');

INSERT INTO `principal` (`id`, `authority`, `key_id`, `name`, `password`) VALUES
  ('1', 'ROLE_SUPER_USER', NULL, 'root', 'a82a92061f9ad7a549a843658107141b'),
  ('2', 'ROLE_INSTITUTION', '2', 'dingcheng', 'df5b59f050d316b72b17f73714473f8b'),
  ('3', 'ROLE_APP', '1', 'xiaoyu', 'e10adc3949ba59abbe56e057f20f883e'),
  ('4', 'ROLE_BANK_APP', '2', 'yopark', '086246bffb2de7288946151fc900db59'),
  ('5', 'ROLE_INSTITUTION', '2', 'DCF001', '3cf5eaa7d33e0d023e811c90cd6f2f73'),
  ('6', 'ROLE_INSTITUTION', '2', 'DCF002', 'adb29c63523254a343864e97c84e6360'),
  ('7', 'ROLE_APP', '5', 'laoA', 'e10adc3949ba59abbe56e057f20f883e');

SET FOREIGN_KEY_CHECKS = 1;