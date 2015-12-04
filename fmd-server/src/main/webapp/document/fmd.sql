# Host: 127.0.0.1  (Version: 5.6.25)
# Date: 2015-12-04 17:52:27
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "capital_log"
#

DROP TABLE IF EXISTS `capital_log`;
CREATE TABLE `capital_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL COMMENT '编号',
  `member` varchar(100) DEFAULT NULL COMMENT '会员',
  `member_id` varchar(50) DEFAULT NULL COMMENT '会员id',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `operation` int(3) DEFAULT NULL COMMENT '操作(1推荐，2管理，3见点，4收入)',
  `detail` varchar(255) DEFAULT NULL COMMENT '明细',
  `payout` varchar(50) DEFAULT NULL COMMENT '支出',
  `income` varchar(50) DEFAULT NULL COMMENT '入账',
  `remain` varchar(50) DEFAULT NULL COMMENT '余额',
  `touch_pay` int(11) DEFAULT NULL COMMENT '对碰奖',
  `recommend_pay` int(11) DEFAULT NULL COMMENT '推荐奖',
  `see_paypoint_pay` int(4) DEFAULT NULL COMMENT '见点奖',
  `state` int(2) DEFAULT NULL COMMENT '状态(0无效，1收入，2支出)',
  `total` varchar(50) DEFAULT NULL COMMENT '总额',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='个人资金记录表';

#
# Data for table "capital_log"
#

INSERT INTO `capital_log` VALUES (19,1,'admin','000001','2015-12-04 10:41:43',1,'直接推荐奖收入200元',NULL,'200','864',0,200,0,1,NULL),(20,18,'呜呜呜','000002','2015-12-04 10:41:43',3,'见点奖收入2元',NULL,'2','2',0,0,2,1,NULL),(21,1,'admin','000001','2015-12-04 10:41:43',3,'见点奖收入2元',NULL,'2','866',0,0,2,1,NULL),(22,18,'呜呜呜','000002','2015-12-04 10:41:44',2,'管理奖收入150元',NULL,'150','152',150,0,0,1,NULL),(23,1,'admin','000001','2015-12-04 15:39:23',1,'直接推荐奖收入200元',NULL,'200','1066',0,200,0,1,'200'),(24,20,'呜呜呜','000004','2015-12-04 15:39:23',3,'见点奖收入2元',NULL,'2','2',0,0,2,1,'2'),(25,18,'呜呜呜','000002','2015-12-04 15:39:23',3,'见点奖收入2元',NULL,'2','154',0,0,2,1,'2'),(26,1,'admin','000001','2015-12-04 15:39:23',3,'见点奖收入2元',NULL,'2','1068',0,0,2,1,'202');

#
# Structure for table "log"
#

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `type` int(3) DEFAULT NULL COMMENT '类型',
  `detail` varchar(1000) DEFAULT NULL COMMENT '明细',
  `operation_time` datetime DEFAULT NULL COMMENT '操作时间',
  `state` int(3) DEFAULT NULL COMMENT '状态',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `tablename` varchar(50) DEFAULT NULL COMMENT '表名',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COMMENT='log';

#
# Data for table "log"
#

INSERT INTO `log` VALUES (57,'000001','admin',1,'{\"Id\":7,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"apply_time\":\"Dec 2, 2015 4:21:09 PM\",\"operation\":1,\"detail\":\"奖金提现1000\",\"capital\":1000.0,\"tax\":0.0,\"take\":1000.0,\"state\":0}','2015-12-02 16:21:09',1,'127.0.0.1','withdraw_log','000001奖金提现1000'),(58,'000001','admin',3,'{\"Id\":1,\"userid\":\"000001\",\"pwd1\":\"e8rTzbgoKTW0nqGqsAgs9w\\u003d\\u003d\",\"pwd2\":\"Pkh8MpJO+nviHk19C8MN+g\\u003d\\u003d\",\"pwd3\":\"D/Ae01wgDNDLYfOMVCdrSw\\u003d\\u003d\",\"referee\":\"0\",\"referee_id\":\"0\",\"node\":\"0\",\"node_id\":\"0\",\"area\":0,\"receiv_address\":\"test\",\"zip_code\":\"111111\",\"qq\":\"111111111\",\"phone_number\":\"13800000000\",\"email\":\"luoyz@163.com\",\"bank_name\":\"中国农业银行\",\"account_name\":\"admin\",\"account_node\":\"广州农商行\",\"account\":\"zhou\",\"capital\":\"664\",\"cjsj\":\"Oct 27, 2015 4:28:35 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000002\",\"rightid\":\"000003\",\"withdraw\":\"1000\"}','2015-12-02 16:21:09',1,'127.0.0.1','member_user','000001更新000001余额为664'),(59,'000001','admin',1,'{\"Id\":13,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"time\":\"Dec 2, 2015 4:21:09 PM\",\"operation\":4,\"detail\":\"奖金提现1000\",\"payout\":\"1000\",\"income\":\"0\",\"remain\":\"664\",\"touch_pay\":0,\"recommend_pay\":0,\"see_paypoint_pay\":0,\"state\":2}','2015-12-02 16:21:09',1,'127.0.0.1','capital_log','000001奖金支出记录-1000'),(60,'000001','admin',3,'{\"Id\":7,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"apply_time\":\"Dec 2, 2015 4:21:09 PM\",\"operation\":1,\"detail\":\"奖金提现1000\",\"capital\":1000.0,\"tax\":0.0,\"take\":1000.0,\"approve_time\":\"Dec 2, 2015 4:21:13 PM\",\"approve\":\"admin\",\"approve_id\":\"000001\",\"state\":2}','2015-12-02 16:21:13',1,'127.0.0.1','withdraw_log','000001提现取消'),(61,'000001','admin',3,'{\"Id\":1,\"userid\":\"000001\",\"pwd1\":\"e8rTzbgoKTW0nqGqsAgs9w\\u003d\\u003d\",\"pwd2\":\"Pkh8MpJO+nviHk19C8MN+g\\u003d\\u003d\",\"pwd3\":\"D/Ae01wgDNDLYfOMVCdrSw\\u003d\\u003d\",\"referee\":\"0\",\"referee_id\":\"0\",\"node\":\"0\",\"node_id\":\"0\",\"area\":0,\"receiv_address\":\"test\",\"zip_code\":\"111111\",\"qq\":\"111111111\",\"phone_number\":\"13800000000\",\"email\":\"luoyz@163.com\",\"bank_name\":\"中国农业银行\",\"account_name\":\"admin\",\"account_node\":\"广州农商行\",\"account\":\"zhou\",\"capital\":\"1664\",\"cjsj\":\"Oct 27, 2015 4:28:35 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000002\",\"rightid\":\"000003\",\"withdraw\":\"0\"}','2015-12-02 16:21:13',1,'127.0.0.1','member_user','000001更新000001余额为1664'),(62,'000001','admin',1,'{\"Id\":14,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"time\":\"Dec 2, 2015 4:21:13 PM\",\"operation\":0,\"detail\":\"奖金提现1000--取消\",\"income\":\"1000\",\"remain\":\"1664\",\"touch_pay\":0,\"recommend_pay\":0,\"see_paypoint_pay\":0,\"state\":1}','2015-12-02 16:21:13',1,'127.0.0.1','capital_log','000001提现取消，奖金收入记录+1000'),(63,'000001','admin',1,'{\"Id\":8,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"apply_time\":\"Dec 2, 2015 4:21:22 PM\",\"operation\":1,\"detail\":\"奖金提现1000\",\"capital\":1000.0,\"tax\":0.0,\"take\":1000.0,\"state\":0}','2015-12-02 16:21:22',1,'127.0.0.1','withdraw_log','000001奖金提现1000'),(64,'000001','admin',3,'{\"Id\":1,\"userid\":\"000001\",\"pwd1\":\"e8rTzbgoKTW0nqGqsAgs9w\\u003d\\u003d\",\"pwd2\":\"Pkh8MpJO+nviHk19C8MN+g\\u003d\\u003d\",\"pwd3\":\"D/Ae01wgDNDLYfOMVCdrSw\\u003d\\u003d\",\"referee\":\"0\",\"referee_id\":\"0\",\"node\":\"0\",\"node_id\":\"0\",\"area\":0,\"receiv_address\":\"test\",\"zip_code\":\"111111\",\"qq\":\"111111111\",\"phone_number\":\"13800000000\",\"email\":\"luoyz@163.com\",\"bank_name\":\"中国农业银行\",\"account_name\":\"admin\",\"account_node\":\"广州农商行\",\"account\":\"zhou\",\"capital\":\"664\",\"cjsj\":\"Oct 27, 2015 4:28:35 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000002\",\"rightid\":\"000003\",\"withdraw\":\"1000\"}','2015-12-02 16:21:22',1,'127.0.0.1','member_user','000001更新000001余额为664'),(65,'000001','admin',1,'{\"Id\":15,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"time\":\"Dec 2, 2015 4:21:23 PM\",\"operation\":4,\"detail\":\"奖金提现1000\",\"payout\":\"1000\",\"income\":\"0\",\"remain\":\"664\",\"touch_pay\":0,\"recommend_pay\":0,\"see_paypoint_pay\":0,\"state\":2}','2015-12-02 16:21:23',1,'127.0.0.1','capital_log','000001奖金支出记录-1000'),(66,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-02 16:28:53',1,'127.0.0.1','member_user','000001登录系统成功'),(67,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-02 16:28:54',1,'127.0.0.1','member_user','000001二次密码登录'),(68,'000001','admin',3,'{\"Id\":8,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"apply_time\":\"Dec 2, 2015 4:21:22 PM\",\"operation\":1,\"detail\":\"奖金提现1000\",\"capital\":1000.0,\"tax\":0.0,\"take\":1000.0,\"approve_time\":\"Dec 2, 2015 4:29:26 PM\",\"approve\":\"admin\",\"approve_id\":\"000001\",\"state\":2}','2015-12-02 16:29:26',1,'127.0.0.1','withdraw_log','000001提现取消'),(69,'000001','admin',3,'{\"Id\":1,\"userid\":\"000001\",\"pwd1\":\"e8rTzbgoKTW0nqGqsAgs9w\\u003d\\u003d\",\"pwd2\":\"Pkh8MpJO+nviHk19C8MN+g\\u003d\\u003d\",\"pwd3\":\"D/Ae01wgDNDLYfOMVCdrSw\\u003d\\u003d\",\"referee\":\"0\",\"referee_id\":\"0\",\"node\":\"0\",\"node_id\":\"0\",\"area\":0,\"receiv_address\":\"test\",\"zip_code\":\"111111\",\"qq\":\"111111111\",\"phone_number\":\"13800000000\",\"email\":\"luoyz@163.com\",\"bank_name\":\"中国农业银行\",\"account_name\":\"admin\",\"account_node\":\"广州农商行\",\"account\":\"zhou\",\"capital\":\"2664\",\"cjsj\":\"Oct 27, 2015 4:28:35 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000002\",\"rightid\":\"000003\",\"withdraw\":\"0\"}','2015-12-02 16:29:26',1,'127.0.0.1','member_user','000001更新000001余额为2664'),(70,'000001','admin',1,'{\"Id\":16,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"time\":\"Dec 2, 2015 4:29:26 PM\",\"operation\":0,\"detail\":\"奖金提现1000--取消\",\"income\":\"1000\",\"remain\":\"2664\",\"touch_pay\":0,\"recommend_pay\":0,\"see_paypoint_pay\":0,\"state\":1}','2015-12-02 16:29:26',1,'127.0.0.1','capital_log','000001提现取消，奖金收入记录+1000'),(71,'000001','admin',1,'{\"Id\":9,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"apply_time\":\"Dec 2, 2015 4:29:41 PM\",\"operation\":1,\"detail\":\"奖金提现1000\",\"capital\":1000.0,\"tax\":0.0,\"take\":1000.0,\"state\":0}','2015-12-02 16:29:41',1,'127.0.0.1','withdraw_log','000001奖金提现1000'),(72,'000001','admin',3,'{\"Id\":1,\"userid\":\"000001\",\"pwd1\":\"e8rTzbgoKTW0nqGqsAgs9w\\u003d\\u003d\",\"pwd2\":\"Pkh8MpJO+nviHk19C8MN+g\\u003d\\u003d\",\"pwd3\":\"D/Ae01wgDNDLYfOMVCdrSw\\u003d\\u003d\",\"referee\":\"0\",\"referee_id\":\"0\",\"node\":\"0\",\"node_id\":\"0\",\"area\":0,\"receiv_address\":\"test\",\"zip_code\":\"111111\",\"qq\":\"111111111\",\"phone_number\":\"13800000000\",\"email\":\"luoyz@163.com\",\"bank_name\":\"中国农业银行\",\"account_name\":\"admin\",\"account_node\":\"广州农商行\",\"account\":\"zhou\",\"capital\":\"1664\",\"cjsj\":\"Oct 27, 2015 4:28:35 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000002\",\"rightid\":\"000003\",\"withdraw\":\"1000\"}','2015-12-02 16:29:41',1,'127.0.0.1','member_user','000001更新000001余额为1664'),(73,'000001','admin',1,'{\"Id\":17,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"time\":\"Dec 2, 2015 4:29:42 PM\",\"operation\":4,\"detail\":\"奖金提现1000\",\"payout\":\"1000\",\"income\":\"0\",\"remain\":\"1664\",\"touch_pay\":0,\"recommend_pay\":0,\"see_paypoint_pay\":0,\"state\":2}','2015-12-02 16:29:42',1,'127.0.0.1','capital_log','000001奖金支出记录-1000'),(74,'000001','admin',1,'{\"Id\":10,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"apply_time\":\"Dec 2, 2015 4:29:48 PM\",\"operation\":1,\"detail\":\"奖金提现1000\",\"capital\":1000.0,\"tax\":0.0,\"take\":1000.0,\"state\":0}','2015-12-02 16:29:48',1,'127.0.0.1','withdraw_log','000001奖金提现1000'),(75,'000001','admin',3,'{\"Id\":1,\"userid\":\"000001\",\"pwd1\":\"e8rTzbgoKTW0nqGqsAgs9w\\u003d\\u003d\",\"pwd2\":\"Pkh8MpJO+nviHk19C8MN+g\\u003d\\u003d\",\"pwd3\":\"D/Ae01wgDNDLYfOMVCdrSw\\u003d\\u003d\",\"referee\":\"0\",\"referee_id\":\"0\",\"node\":\"0\",\"node_id\":\"0\",\"area\":0,\"receiv_address\":\"test\",\"zip_code\":\"111111\",\"qq\":\"111111111\",\"phone_number\":\"13800000000\",\"email\":\"luoyz@163.com\",\"bank_name\":\"中国农业银行\",\"account_name\":\"admin\",\"account_node\":\"广州农商行\",\"account\":\"zhou\",\"capital\":\"664\",\"cjsj\":\"Oct 27, 2015 4:28:35 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000002\",\"rightid\":\"000003\",\"withdraw\":\"2000\"}','2015-12-02 16:29:48',1,'127.0.0.1','member_user','000001更新000001余额为664'),(76,'000001','admin',1,'{\"Id\":18,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"time\":\"Dec 2, 2015 4:29:48 PM\",\"operation\":4,\"detail\":\"奖金提现1000\",\"payout\":\"1000\",\"income\":\"0\",\"remain\":\"664\",\"touch_pay\":0,\"recommend_pay\":0,\"see_paypoint_pay\":0,\"state\":2}','2015-12-02 16:29:48',1,'127.0.0.1','capital_log','000001奖金支出记录-1000'),(77,'000001','admin',3,'{\"Id\":10,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"apply_time\":\"Dec 2, 2015 4:29:48 PM\",\"operation\":1,\"detail\":\"奖金提现1000\",\"capital\":1000.0,\"tax\":0.0,\"take\":1000.0,\"approve_time\":\"Dec 2, 2015 4:30:10 PM\",\"approve\":\"admin\",\"approve_id\":\"000001\",\"state\":1}','2015-12-02 16:30:10',1,'127.0.0.1','withdraw_log','000001奖金审批1'),(78,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-02 16:37:43',1,'127.0.0.1','member_user','000001登录系统成功'),(79,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-02 16:54:04',1,'127.0.0.1','member_user','000001登录系统成功'),(80,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-02 17:04:37',1,'127.0.0.1','member_user','000001登录系统成功'),(81,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 10:25:40',1,'127.0.0.1','member_user','000001登录系统成功'),(82,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-04 10:25:42',1,'127.0.0.1','member_user','000001二次密码登录'),(83,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 10:33:28',1,'127.0.0.1','member_user','000001登录系统成功'),(84,'000001','admin',1,'{\"Id\":20,\"userid\":\"000004\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"呜呜呜\",\"node_id\":\"000002\",\"area\":0,\"receiv_address\":\"哈哈哈哈哈哈哈哈哈哈\",\"zip_code\":\"111111\",\"qq\":\"44444444444\",\"phone_number\":\"444444444444\",\"email\":\"444@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"呜呜呜\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"4444444444444444444\",\"capital\":\"0\",\"identity\":\"444444444444444444\",\"cjsj\":\"Dec 4, 2015 10:33:46 AM\",\"cjr\":0,\"xgr\":0,\"state\":0}','2015-12-04 10:33:46',1,'127.0.0.1','member_user','000001注册新用户000004'),(85,'000001','admin',3,'{\"Id\":18,\"userid\":\"000002\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"admin\",\"node_id\":\"000001\",\"area\":0,\"receiv_address\":\"哈哈哈哈哈哈哈哈哈哈\",\"zip_code\":\"111111\",\"qq\":\"222222222222222\",\"phone_number\":\"222222222222\",\"email\":\"22222@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"呜呜呜\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"2222222222222222222\",\"capital\":\"0\",\"identity\":\"222222222222222222\",\"cjsj\":\"Dec 2, 2015 3:41:38 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000004\"}','2015-12-04 10:33:46',1,'127.0.0.1','member_user','000001更新用户000002'),(86,'000001','admin',1,'{\"Id\":21,\"userid\":\"000005\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"呜呜呜\",\"node_id\":\"000002\",\"area\":1,\"receiv_address\":\"哈哈哈哈哈哈哈哈哈哈\",\"zip_code\":\"111111\",\"qq\":\"44444444444\",\"phone_number\":\"444444444444\",\"email\":\"444@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"呜呜呜\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"4444444444444444444\",\"capital\":\"0\",\"identity\":\"444444444444444444\",\"cjsj\":\"Dec 4, 2015 10:40:39 AM\",\"cjr\":0,\"xgr\":0,\"state\":0}','2015-12-04 10:40:39',1,'127.0.0.1','member_user','000001注册新用户000005'),(87,'000001','admin',3,'{\"Id\":18,\"userid\":\"000002\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"admin\",\"node_id\":\"000001\",\"area\":0,\"receiv_address\":\"哈哈哈哈哈哈哈哈哈哈\",\"zip_code\":\"111111\",\"qq\":\"222222222222222\",\"phone_number\":\"222222222222\",\"email\":\"22222@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"呜呜呜\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"2222222222222222222\",\"capital\":\"0\",\"identity\":\"222222222222222222\",\"cjsj\":\"Dec 2, 2015 3:41:38 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000004\",\"rightid\":\"000005\"}','2015-12-04 10:40:39',1,'127.0.0.1','member_user','000001更新用户000002'),(88,'000001','admin',3,'{\"Id\":20,\"userid\":\"000004\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"呜呜呜\",\"node_id\":\"000002\",\"area\":0,\"receiv_address\":\"哈哈哈哈哈哈哈哈哈哈\",\"zip_code\":\"111111\",\"qq\":\"44444444444\",\"phone_number\":\"444444444444\",\"email\":\"444@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"呜呜呜\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"4444444444444444444\",\"capital\":\"0\",\"identity\":\"444444444444444444\",\"cjsj\":\"Dec 4, 2015 10:33:46 AM\",\"cjr\":0,\"xgr\":0,\"state\":1}','2015-12-04 10:41:43',1,'127.0.0.1','member_user','000001审核用户000004'),(89,'000001','admin',1,'{\"Id\":19,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"time\":\"Dec 4, 2015 10:41:43 AM\",\"operation\":1,\"detail\":\"直接推荐奖收入200元\",\"income\":\"200\",\"remain\":\"864\",\"touch_pay\":0,\"recommend_pay\":200,\"see_paypoint_pay\":0,\"state\":1}','2015-12-04 10:41:43',1,'127.0.0.1','capital_log','000001直接推荐奖收入200元'),(90,'000001','admin',3,'{\"Id\":1,\"userid\":\"000001\",\"pwd1\":\"e8rTzbgoKTW0nqGqsAgs9w\\u003d\\u003d\",\"pwd2\":\"Pkh8MpJO+nviHk19C8MN+g\\u003d\\u003d\",\"pwd3\":\"D/Ae01wgDNDLYfOMVCdrSw\\u003d\\u003d\",\"referee\":\"0\",\"referee_id\":\"0\",\"node\":\"0\",\"node_id\":\"0\",\"area\":0,\"receiv_address\":\"test\",\"zip_code\":\"111111\",\"qq\":\"111111111\",\"phone_number\":\"13800000000\",\"email\":\"luoyz@163.com\",\"bank_name\":\"中国农业银行\",\"account_name\":\"admin\",\"account_node\":\"广州农商行\",\"account\":\"zhou\",\"capital\":\"864\",\"cjsj\":\"Oct 27, 2015 4:28:35 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000002\",\"rightid\":\"000003\",\"withdraw\":\"2000\"}','2015-12-04 10:41:43',1,'127.0.0.1','member_user','000001更新余额为864'),(91,'000001','admin',1,'{\"Id\":20,\"number\":18,\"member\":\"呜呜呜\",\"member_id\":\"000002\",\"time\":\"Dec 4, 2015 10:41:43 AM\",\"operation\":3,\"detail\":\"见点奖收入2元\",\"income\":\"2\",\"remain\":\"2\",\"touch_pay\":0,\"recommend_pay\":0,\"see_paypoint_pay\":2,\"state\":1}','2015-12-04 10:41:43',1,'127.0.0.1','capital_log','000002见点奖收入2元'),(92,'000001','admin',3,'{\"Id\":18,\"userid\":\"000002\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"admin\",\"node_id\":\"000001\",\"area\":0,\"receiv_address\":\"哈哈哈哈哈哈哈哈哈哈\",\"zip_code\":\"111111\",\"qq\":\"222222222222222\",\"phone_number\":\"222222222222\",\"email\":\"22222@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"呜呜呜\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"2222222222222222222\",\"capital\":\"2\",\"identity\":\"222222222222222222\",\"cjsj\":\"Dec 2, 2015 3:41:38 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000004\",\"rightid\":\"000005\"}','2015-12-04 10:41:43',1,'127.0.0.1','member_user','000002更新余额为2'),(93,'000001','admin',1,'{\"Id\":21,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"time\":\"Dec 4, 2015 10:41:43 AM\",\"operation\":3,\"detail\":\"见点奖收入2元\",\"income\":\"2\",\"remain\":\"866\",\"touch_pay\":0,\"recommend_pay\":0,\"see_paypoint_pay\":2,\"state\":1}','2015-12-04 10:41:43',1,'127.0.0.1','capital_log','000001见点奖收入2元'),(94,'000001','admin',3,'{\"Id\":1,\"userid\":\"000001\",\"pwd1\":\"e8rTzbgoKTW0nqGqsAgs9w\\u003d\\u003d\",\"pwd2\":\"Pkh8MpJO+nviHk19C8MN+g\\u003d\\u003d\",\"pwd3\":\"D/Ae01wgDNDLYfOMVCdrSw\\u003d\\u003d\",\"referee\":\"0\",\"referee_id\":\"0\",\"node\":\"0\",\"node_id\":\"0\",\"area\":0,\"receiv_address\":\"test\",\"zip_code\":\"111111\",\"qq\":\"111111111\",\"phone_number\":\"13800000000\",\"email\":\"luoyz@163.com\",\"bank_name\":\"中国农业银行\",\"account_name\":\"admin\",\"account_node\":\"广州农商行\",\"account\":\"zhou\",\"capital\":\"866\",\"cjsj\":\"Oct 27, 2015 4:28:35 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000002\",\"rightid\":\"000003\",\"withdraw\":\"2000\"}','2015-12-04 10:41:44',1,'127.0.0.1','member_user','000001更新余额为866'),(95,'000001','admin',1,'{\"Id\":22,\"number\":18,\"member\":\"呜呜呜\",\"member_id\":\"000002\",\"time\":\"Dec 4, 2015 10:41:44 AM\",\"operation\":2,\"detail\":\"管理奖收入150元\",\"income\":\"150\",\"remain\":\"152\",\"touch_pay\":150,\"recommend_pay\":0,\"see_paypoint_pay\":0,\"state\":1}','2015-12-04 10:41:44',1,'127.0.0.1','capital_log','000002管理奖收入150元'),(96,'000001','admin',3,'{\"Id\":18,\"userid\":\"000002\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"admin\",\"node_id\":\"000001\",\"area\":0,\"receiv_address\":\"哈哈哈哈哈哈哈哈哈哈\",\"zip_code\":\"111111\",\"qq\":\"222222222222222\",\"phone_number\":\"222222222222\",\"email\":\"22222@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"呜呜呜\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"2222222222222222222\",\"capital\":\"152\",\"identity\":\"222222222222222222\",\"cjsj\":\"Dec 2, 2015 3:41:38 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000004\",\"rightid\":\"000005\"}','2015-12-04 10:41:44',1,'127.0.0.1','member_user','000002更新余额为152'),(97,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 12:53:54',1,'127.0.0.1','member_user','000001登录系统成功'),(98,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-04 12:53:56',1,'127.0.0.1','member_user','000001二次密码登录'),(99,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 13:48:10',1,'127.0.0.1','member_user','000001登录系统成功'),(100,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-04 13:48:11',1,'127.0.0.1','member_user','000001二次密码登录'),(101,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 14:01:11',1,'127.0.0.1','member_user','000001登录系统成功'),(102,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-04 14:01:12',1,'127.0.0.1','member_user','000001二次密码登录'),(103,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 14:04:21',1,'127.0.0.1','member_user','000001登录系统成功'),(104,'000001','admin',5,'userid:000001//pwd:111111//登录','2015-12-04 14:06:05',1,'127.0.0.1','member_user','000001登录系统失败'),(105,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 14:06:13',1,'127.0.0.1','member_user','000001登录系统成功'),(106,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-04 14:06:18',1,'127.0.0.1','member_user','000001二次密码登录'),(107,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 14:08:07',1,'127.0.0.1','member_user','000001登录系统成功'),(108,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 14:25:36',1,'127.0.0.1','member_user','000001登录系统成功'),(109,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 14:27:59',1,'127.0.0.1','member_user','000001登录系统成功'),(110,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 14:36:13',1,'127.0.0.1','member_user','000001登录系统成功'),(111,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-04 14:36:20',1,'127.0.0.1','member_user','000001二次密码登录'),(112,'000001','admin',5,'userid:000001//pwd:1111111//登录','2015-12-04 15:01:04',1,'127.0.0.1','member_user','000001登录系统失败'),(113,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 15:01:11',1,'127.0.0.1','member_user','000001登录系统成功'),(114,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 15:02:35',1,'127.0.0.1','member_user','000001登录系统成功'),(115,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-04 15:02:36',1,'127.0.0.1','member_user','000001二次密码登录'),(116,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 15:33:23',1,'127.0.0.1','member_user','000001登录系统成功'),(117,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-04 15:33:25',1,'127.0.0.1','member_user','000001二次密码登录'),(118,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 15:35:02',1,'127.0.0.1','member_user','000001登录系统成功'),(119,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-04 15:35:06',1,'127.0.0.1','member_user','000001二次密码登录'),(120,'000001','admin',1,'{\"Id\":22,\"userid\":\"000006\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"呜呜呜\",\"node_id\":\"000004\",\"area\":0,\"receiv_address\":\"啊啊啊\",\"zip_code\":\"111111\",\"qq\":\"11111111\",\"phone_number\":\"111111111111\",\"email\":\"123@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"啦啦啦啦\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"\",\"capital\":\"0\",\"identity\":\"\",\"cjsj\":\"Dec 4, 2015 3:35:47 PM\",\"cjr\":0,\"xgr\":0,\"state\":0,\"total\":\"0\",\"issend\":0}','2015-12-04 15:35:48',1,'127.0.0.1','member_user','000001注册新用户000006'),(121,'000001','admin',3,'{\"Id\":20,\"userid\":\"000004\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"呜呜呜\",\"node_id\":\"000002\",\"area\":0,\"receiv_address\":\"哈哈哈哈哈哈哈哈哈哈\",\"zip_code\":\"111111\",\"qq\":\"44444444444\",\"phone_number\":\"444444444444\",\"email\":\"444@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"呜呜呜\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"4444444444444444444\",\"capital\":\"0\",\"identity\":\"444444444444444444\",\"cjsj\":\"Dec 4, 2015 10:33:46 AM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000006\",\"issend\":0}','2015-12-04 15:35:48',1,'127.0.0.1','member_user','000001更新用户000004'),(122,'000001','admin',3,'{\"Id\":21,\"userid\":\"000005\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"呜呜呜\",\"node_id\":\"000002\",\"area\":1,\"receiv_address\":\"哈哈哈哈哈哈哈哈哈哈\",\"zip_code\":\"111111\",\"qq\":\"44444444444\",\"phone_number\":\"444444444444\",\"email\":\"444@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"呜呜呜\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"4444444444444444444\",\"capital\":\"0\",\"identity\":\"444444444444444444\",\"cjsj\":\"Dec 4, 2015 10:40:39 AM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"issend\":0}','2015-12-04 15:36:07',1,'127.0.0.1','member_user','000001审核用户000005'),(123,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 15:39:09',1,'127.0.0.1','member_user','000001登录系统成功'),(124,'000001','admin',3,'{\"Id\":22,\"userid\":\"000006\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"呜呜呜\",\"node_id\":\"000004\",\"area\":0,\"receiv_address\":\"啊啊啊\",\"zip_code\":\"111111\",\"qq\":\"11111111\",\"phone_number\":\"111111111111\",\"email\":\"123@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"啦啦啦啦\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"\",\"capital\":\"0\",\"identity\":\"\",\"cjsj\":\"Dec 4, 2015 3:35:47 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"total\":\"0\",\"issend\":0}','2015-12-04 15:39:23',1,'127.0.0.1','member_user','000001审核用户000006'),(125,'000001','admin',1,'{\"Id\":23,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"time\":\"Dec 4, 2015 3:39:23 PM\",\"operation\":1,\"detail\":\"直接推荐奖收入200元\",\"income\":\"200\",\"remain\":\"1066\",\"touch_pay\":0,\"recommend_pay\":200,\"see_paypoint_pay\":0,\"state\":1,\"total\":\"200\"}','2015-12-04 15:39:23',1,'127.0.0.1','capital_log','000001直接推荐奖收入200元'),(126,'000001','admin',3,'{\"Id\":1,\"userid\":\"000001\",\"pwd1\":\"e8rTzbgoKTW0nqGqsAgs9w\\u003d\\u003d\",\"pwd2\":\"Pkh8MpJO+nviHk19C8MN+g\\u003d\\u003d\",\"pwd3\":\"D/Ae01wgDNDLYfOMVCdrSw\\u003d\\u003d\",\"referee\":\"0\",\"referee_id\":\"0\",\"node\":\"0\",\"node_id\":\"0\",\"area\":0,\"receiv_address\":\"test\",\"zip_code\":\"111111\",\"qq\":\"111111111\",\"phone_number\":\"13800000000\",\"email\":\"luoyz@163.com\",\"bank_name\":\"中国农业银行\",\"account_name\":\"admin\",\"account_node\":\"广州农商行\",\"account\":\"zhou\",\"capital\":\"1066\",\"cjsj\":\"Oct 27, 2015 4:28:35 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000002\",\"rightid\":\"000003\",\"withdraw\":\"2000\",\"total\":\"200\",\"issend\":0}','2015-12-04 15:39:23',1,'127.0.0.1','member_user','000001更新余额为1066'),(127,'000001','admin',1,'{\"Id\":24,\"number\":20,\"member\":\"呜呜呜\",\"member_id\":\"000004\",\"time\":\"Dec 4, 2015 3:39:23 PM\",\"operation\":3,\"detail\":\"见点奖收入2元\",\"income\":\"2\",\"remain\":\"2\",\"touch_pay\":0,\"recommend_pay\":0,\"see_paypoint_pay\":2,\"state\":1,\"total\":\"2\"}','2015-12-04 15:39:23',1,'127.0.0.1','capital_log','000004见点奖收入2元'),(128,'000001','admin',3,'{\"Id\":20,\"userid\":\"000004\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"呜呜呜\",\"node_id\":\"000002\",\"area\":0,\"receiv_address\":\"哈哈哈哈哈哈哈哈哈哈\",\"zip_code\":\"111111\",\"qq\":\"44444444444\",\"phone_number\":\"444444444444\",\"email\":\"444@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"呜呜呜\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"4444444444444444444\",\"capital\":\"2\",\"identity\":\"444444444444444444\",\"cjsj\":\"Dec 4, 2015 10:33:46 AM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000006\",\"total\":\"2\",\"issend\":0}','2015-12-04 15:39:23',1,'127.0.0.1','member_user','000004更新余额为2'),(129,'000001','admin',1,'{\"Id\":25,\"number\":18,\"member\":\"呜呜呜\",\"member_id\":\"000002\",\"time\":\"Dec 4, 2015 3:39:23 PM\",\"operation\":3,\"detail\":\"见点奖收入2元\",\"income\":\"2\",\"remain\":\"154\",\"touch_pay\":0,\"recommend_pay\":0,\"see_paypoint_pay\":2,\"state\":1,\"total\":\"2\"}','2015-12-04 15:39:23',1,'127.0.0.1','capital_log','000002见点奖收入2元'),(130,'000001','admin',3,'{\"Id\":18,\"userid\":\"000002\",\"pwd1\":\"gWx5FbeUyb0\\u003d\",\"pwd2\":\"VM//Be6JOO0\\u003d\",\"pwd3\":\"1OVkhGDD/SA\\u003d\",\"referee\":\"admin\",\"referee_id\":\"000001\",\"node\":\"admin\",\"node_id\":\"000001\",\"area\":0,\"receiv_address\":\"哈哈哈哈哈哈哈哈哈哈\",\"zip_code\":\"111111\",\"qq\":\"222222222222222\",\"phone_number\":\"222222222222\",\"email\":\"22222@163.com\",\"bank_name\":\"中国工商银行\",\"account_name\":\"呜呜呜\",\"account_address\":\"东城\",\"account_node\":\"中国工商银行北京东城分行\",\"account\":\"2222222222222222222\",\"capital\":\"154\",\"identity\":\"222222222222222222\",\"cjsj\":\"Dec 2, 2015 3:41:38 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000004\",\"rightid\":\"000005\",\"total\":\"2\",\"issend\":0}','2015-12-04 15:39:23',1,'127.0.0.1','member_user','000002更新余额为154'),(131,'000001','admin',1,'{\"Id\":26,\"number\":1,\"member\":\"admin\",\"member_id\":\"000001\",\"time\":\"Dec 4, 2015 3:39:23 PM\",\"operation\":3,\"detail\":\"见点奖收入2元\",\"income\":\"2\",\"remain\":\"1068\",\"touch_pay\":0,\"recommend_pay\":0,\"see_paypoint_pay\":2,\"state\":1,\"total\":\"202\"}','2015-12-04 15:39:23',1,'127.0.0.1','capital_log','000001见点奖收入2元'),(132,'000001','admin',3,'{\"Id\":1,\"userid\":\"000001\",\"pwd1\":\"e8rTzbgoKTW0nqGqsAgs9w\\u003d\\u003d\",\"pwd2\":\"Pkh8MpJO+nviHk19C8MN+g\\u003d\\u003d\",\"pwd3\":\"D/Ae01wgDNDLYfOMVCdrSw\\u003d\\u003d\",\"referee\":\"0\",\"referee_id\":\"0\",\"node\":\"0\",\"node_id\":\"0\",\"area\":0,\"receiv_address\":\"test\",\"zip_code\":\"111111\",\"qq\":\"111111111\",\"phone_number\":\"13800000000\",\"email\":\"luoyz@163.com\",\"bank_name\":\"中国农业银行\",\"account_name\":\"admin\",\"account_node\":\"广州农商行\",\"account\":\"zhou\",\"capital\":\"1068\",\"cjsj\":\"Oct 27, 2015 4:28:35 PM\",\"cjr\":0,\"xgr\":0,\"state\":1,\"leftid\":\"000002\",\"rightid\":\"000003\",\"withdraw\":\"2000\",\"total\":\"202\",\"issend\":0}','2015-12-04 15:39:23',1,'127.0.0.1','member_user','000001更新余额为1068'),(133,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 17:11:16',1,'127.0.0.1','member_user','000001登录系统成功'),(134,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-04 17:11:21',1,'127.0.0.1','member_user','000001二次密码登录'),(135,'000001','admin',5,'userid:000001//pwd:fmd111111//登录','2015-12-04 17:28:55',1,'127.0.0.1','member_user','000001登录系统成功'),(136,'000001','admin',7,'password：fmd222222//二次密码登录:','2015-12-04 17:29:01',1,'127.0.0.1','member_user','000001二次密码登录');

#
# Structure for table "member_user"
#

DROP TABLE IF EXISTS `member_user`;
CREATE TABLE `member_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `pwd1` varchar(100) DEFAULT NULL COMMENT '密码1',
  `pwd2` varchar(100) DEFAULT NULL COMMENT '密码2',
  `pwd3` varchar(100) DEFAULT NULL COMMENT '密码3',
  `referee` varchar(50) DEFAULT NULL COMMENT '推荐人',
  `referee_id` varchar(11) DEFAULT NULL COMMENT '推荐人id',
  `node` varchar(50) DEFAULT NULL COMMENT '接点人',
  `node_id` varchar(11) DEFAULT NULL COMMENT '接点人id',
  `area` int(2) DEFAULT NULL COMMENT '业务区域：0左区，1右区',
  `receiv_address` varchar(500) DEFAULT NULL COMMENT '收件地址',
  `zip_code` varchar(50) DEFAULT NULL COMMENT '邮编',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '手机电话',
  `email` varchar(50) DEFAULT NULL COMMENT 'EMAIL',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户银行',
  `account_name` varchar(50) DEFAULT NULL COMMENT '银行户口姓名',
  `account_address` varchar(500) DEFAULT NULL COMMENT '开户地址',
  `account_node` varchar(50) DEFAULT NULL COMMENT '银行点',
  `account` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `capital` varchar(50) DEFAULT NULL COMMENT '资金',
  `identity` varchar(255) DEFAULT NULL COMMENT '身份证',
  `cjsj` datetime DEFAULT NULL COMMENT '创建时间',
  `xgsj` datetime DEFAULT NULL COMMENT '修改时间',
  `cjr` int(11) DEFAULT NULL COMMENT '创建人',
  `xgr` int(11) DEFAULT NULL COMMENT '修改人',
  `state` int(2) DEFAULT NULL COMMENT '状态',
  `leftid` varchar(11) DEFAULT NULL COMMENT '左区人ID',
  `rightid` varchar(11) DEFAULT NULL COMMENT '右区人id',
  `withdraw` varchar(50) DEFAULT NULL COMMENT '支出',
  `total` varchar(50) DEFAULT NULL COMMENT '总额',
  `issend` int(2) DEFAULT '0' COMMENT '是否发货（0未发货，1已发货）',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='会员表';

#
# Data for table "member_user"
#

INSERT INTO `member_user` VALUES (1,'000001','e8rTzbgoKTW0nqGqsAgs9w==','Pkh8MpJO+nviHk19C8MN+g==','D/Ae01wgDNDLYfOMVCdrSw==','0','0','0','0',0,'test','111111','111111111','13800000000','luoyz@163.com','中国农业银行','admin',NULL,'广州农商行','zhou','1068',NULL,'2015-10-27 16:28:35',NULL,0,0,1,'000002','000003','2000','202',0),(18,'000002','gWx5FbeUyb0=','VM//Be6JOO0=','1OVkhGDD/SA=','admin','000001','admin','000001',0,'哈哈哈哈哈哈哈哈哈哈','111111','222222222222222','222222222222','22222@163.com','中国工商银行','呜呜呜','东城','中国工商银行北京东城分行','2222222222222222222','154','222222222222222222','2015-12-02 15:41:38',NULL,0,0,1,'000004','000005',NULL,'2',0),(19,'000003','gWx5FbeUyb0=','VM//Be6JOO0=','1OVkhGDD/SA=','admin','000001','admin','000001',1,'柔柔弱弱','111111','33333333','333333333333','333@163.com','中国工商银行','任溶溶','东城','中国工商银行北京东城分行','3333333333333333333','0','333333333333333333','2015-12-02 15:42:29',NULL,0,0,1,NULL,NULL,NULL,NULL,0),(20,'000004','gWx5FbeUyb0=','VM//Be6JOO0=','1OVkhGDD/SA=','admin','000001','呜呜呜','000002',0,'哈哈哈哈哈哈哈哈哈哈','111111','44444444444','444444444444','444@163.com','中国工商银行','呜呜呜','东城','中国工商银行北京东城分行','4444444444444444444','2','444444444444444444','2015-12-04 10:33:46',NULL,0,0,1,'000006',NULL,NULL,'2',0),(21,'000005','gWx5FbeUyb0=','VM//Be6JOO0=','1OVkhGDD/SA=','admin','000001','呜呜呜','000002',1,'哈哈哈哈哈哈哈哈哈哈','111111','44444444444','444444444444','444@163.com','中国工商银行','呜呜呜','东城','中国工商银行北京东城分行','4444444444444444444','0','444444444444444444','2015-12-04 10:40:39',NULL,0,0,1,NULL,NULL,NULL,NULL,0),(22,'000006','gWx5FbeUyb0=','VM//Be6JOO0=','1OVkhGDD/SA=','admin','000001','呜呜呜','000004',0,'啊啊啊','111111','11111111','111111111111','123@163.com','中国工商银行','啦啦啦啦','东城','中国工商银行北京东城分行','','0','','2015-12-04 15:35:47',NULL,0,0,1,NULL,NULL,NULL,'0',0);

#
# Structure for table "teams"
#

DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "teams"
#

/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'吼吼','1');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `pwd` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='user';

#
# Data for table "user"
#

INSERT INTO `user` VALUES (2,'周舟咯','aaaaaaaaaaaaaaaaa');

#
# Structure for table "withdraw_log"
#

DROP TABLE IF EXISTS `withdraw_log`;
CREATE TABLE `withdraw_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL COMMENT '编号',
  `member` varchar(50) DEFAULT NULL COMMENT '会员',
  `member_id` varchar(11) DEFAULT NULL COMMENT '会员id',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `operation` int(3) DEFAULT NULL COMMENT '操作',
  `detail` varchar(255) DEFAULT NULL COMMENT '明细',
  `capital` float DEFAULT NULL COMMENT '资金',
  `tax` float DEFAULT NULL COMMENT '扣税',
  `take` float DEFAULT NULL COMMENT '实取',
  `approve_time` datetime DEFAULT NULL COMMENT '审批时间',
  `approve` varchar(50) DEFAULT NULL COMMENT '审批人',
  `approve_id` varchar(11) DEFAULT NULL COMMENT '审批人id',
  `state` int(2) DEFAULT NULL COMMENT '状态',
  `account_node` varchar(50) DEFAULT NULL COMMENT '银行点',
  `account` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='个人资金提现记录表';

#
# Data for table "withdraw_log"
#


#
# Function "getChildList"
#

DROP FUNCTION IF EXISTS `getChildList`;
CREATE FUNCTION `getChildList`(rootId VARCHAR(1000)) RETURNS varchar(1000) CHARSET utf8
BEGIN 
       DECLARE pTemp VARCHAR(1000);  
       DECLARE cTemp VARCHAR(1000); 
      
       SET pTemp = '$';  
       SET cTemp =rootId;
      
       WHILE cTemp is not null DO  
         SET pTemp = concat(pTemp,',',cTemp); 
         SELECT group_concat(userid) INTO cTemp FROM member_user   
         WHERE FIND_IN_SET(node_id,cTemp)>0 and state = 1; 
                
       END WHILE;  
       RETURN pTemp;  
     END;
