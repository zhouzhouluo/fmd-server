# Host: 203.88.171.28  (Version: 5.1.73)
# Date: 2015-12-09 12:21:43
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
) ENGINE=InnoDB AUTO_INCREMENT=1292 DEFAULT CHARSET=utf8 COMMENT='个人资金记录表';

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
) ENGINE=InnoDB AUTO_INCREMENT=3295 DEFAULT CHARSET=utf8 COMMENT='log';

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
  `leftid` varchar(11) DEFAULT NULL COMMENT '左区人ID',
  `rightid` varchar(11) DEFAULT NULL COMMENT '右区人id',
  `withdraw` varchar(50) DEFAULT NULL COMMENT '支出',
  `total` varchar(50) DEFAULT '0' COMMENT '总额',
  `issend` int(2) DEFAULT '0' COMMENT '是否发货',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COMMENT='会员表';

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
  `account_node` varchar(255) DEFAULT NULL COMMENT '银行点',
  `account` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='个人资金提现记录表';

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
