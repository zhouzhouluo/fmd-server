# Host: 203.88.171.28  (Version: 5.1.73)
# Date: 2015-11-20 17:39:01
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "capital_log"
#

DROP TABLE IF EXISTS `capital_log`;
CREATE TABLE `capital_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL COMMENT '编号',
  `member` varchar(100) DEFAULT NULL COMMENT '会员',
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `operation` int(3) DEFAULT NULL COMMENT '操作(1推荐，2管理，3见点)',
  `detail` varchar(255) DEFAULT NULL COMMENT '明细',
  `payout` varchar(50) DEFAULT NULL COMMENT '支出',
  `income` varchar(50) DEFAULT NULL COMMENT '入账',
  `remain` varchar(50) DEFAULT NULL COMMENT '余额',
  `touch_pay` int(11) DEFAULT NULL COMMENT '对碰奖',
  `recommend_pay` int(11) DEFAULT NULL COMMENT '推荐奖',
  `see_paypoint_pay` int(4) DEFAULT NULL COMMENT '见点奖',
  `state` int(2) DEFAULT NULL COMMENT '状态(0无效，1收入，2支出)',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人资金记录表';

#
# Data for table "capital_log"
#


#
# Structure for table "log"
#

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `type` int(3) DEFAULT NULL COMMENT '类型',
  `detail` varchar(255) DEFAULT NULL COMMENT '明细',
  `operation_time` datetime DEFAULT NULL COMMENT '操作时间',
  `state` int(3) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log';

#
# Data for table "log"
#


#
# Structure for table "member_user"
#

DROP TABLE IF EXISTS `member_user`;
CREATE TABLE `member_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `pwd1` varchar(50) DEFAULT NULL COMMENT '密码1',
  `pwd2` varchar(50) DEFAULT NULL COMMENT '密码2',
  `pwd3` varchar(50) DEFAULT NULL COMMENT '密码3',
  `referee` varchar(50) DEFAULT NULL COMMENT '推荐人',
  `referee_id` varchar(11) DEFAULT NULL COMMENT '推荐人id',
  `node` varchar(50) DEFAULT NULL COMMENT '接点人',
  `node_id` varchar(11) DEFAULT NULL COMMENT '接点人id',
  `area` int(2) DEFAULT NULL COMMENT '业务区域：1左区，2右区',
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
  `leftid` varchar(50) DEFAULT NULL COMMENT '左区人ID',
  `rightid` varchar(50) DEFAULT NULL COMMENT '右区人id',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='会员表';

#
# Data for table "member_user"
#

INSERT INTO `member_user` VALUES (1,'000001','111111','222222','333333','0','0','0','0',0,'吃大餐vdcd1111','111111','111111111','13800000000','luoyz@163.com','中国农业银行','zhou',NULL,'广州农商行','zhou','960',NULL,'2015-10-27 16:28:35',NULL,0,0,1,'000002',''),(12,'000002','111111','222222','333333','zhou','000001','zhou','000001',0,'吃大餐vdcd','111111','11111111111','11111111','luoyz@163.com','中国农业银行','啊啊啊','东城','中国农业银行北京东城分行','1111111111111111111','960','441283198602012019','2015-11-10 15:49:29',NULL,0,0,1,'000003',''),(13,'000003','111111','222222','333333','zhou','000001','zhou','000001',0,'罗亦洲','111111','111111111111 ','111111111111','1111111@163.com','中国农业银行','罗亦洲','东城','中国农业银行北京东城分行','1111111111111111111','960','111111111111111111','2015-11-11 10:29:42',NULL,0,0,1,'000004',''),(14,'000004',NULL,NULL,NULL,NULL,'000001',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-11-11 10:29:42',NULL,0,0,1,'000005',''),(15,'000005',NULL,NULL,NULL,NULL,'000001',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-11-11 10:29:42',NULL,0,0,0,'000006',''),(16,'000006',NULL,NULL,NULL,NULL,'000001',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-27 16:28:35',NULL,0,0,1,'000007','');

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
  `member_id` int(11) DEFAULT NULL COMMENT '会员id',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `operation` int(3) DEFAULT NULL COMMENT '操作',
  `detail` varchar(255) DEFAULT NULL COMMENT '明细',
  `capital` float DEFAULT NULL COMMENT '资金',
  `tax` float DEFAULT NULL COMMENT '扣税',
  `take` float DEFAULT NULL COMMENT '实取',
  `approve_time` datetime DEFAULT NULL COMMENT '审批时间',
  `approve` varchar(50) DEFAULT NULL COMMENT '审批人',
  `approve_id` int(11) DEFAULT NULL COMMENT '审批人id',
  `state` int(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人资金提现记录表';

#
# Data for table "withdraw_log"
#

