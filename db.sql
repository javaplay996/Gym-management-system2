/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - jsf-ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jsf-ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jsf-ssm`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssm1z8hn/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/ssm1z8hn/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssm1z8hn/upload/picture3.jpg'),(4,'homepage',NULL);

/*Table structure for table `huiyuankaleixing` */

DROP TABLE IF EXISTS `huiyuankaleixing`;

CREATE TABLE `huiyuankaleixing` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hykname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '会员卡名称',
  `cost` decimal(6,2) DEFAULT NULL COMMENT '费用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `huiyuankaleixing` */

insert  into `huiyuankaleixing`(`id`,`hykname`,`cost`) values (1,'月卡','100.00'),(2,'年卡','1000.00'),(3,'终身卡','9999.00'),(4,'无会员','0.00');

/*Table structure for table `huiyuankaxinxi` */

DROP TABLE IF EXISTS `huiyuankaxinxi`;

CREATE TABLE `huiyuankaxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hyid_types` tinyint(11) DEFAULT NULL COMMENT '用户id',
  `hu_types` tinyint(255) DEFAULT NULL COMMENT '会员卡类型',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '购买时间',
  `expire_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '到期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `huiyuankaxinxi` */

insert  into `huiyuankaxinxi`(`id`,`hyid_types`,`hu_types`,`create_time`,`expire_time`) values (1,1,1,'2021-01-29 08:58:02','2021-01-28 18:04:51');

/*Table structure for table `huiyuanxinxi` */

DROP TABLE IF EXISTS `huiyuanxinxi`;

CREATE TABLE `huiyuanxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `hyname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '会员名称',
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `sex_types` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别（1、男，2、女）',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `role` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份',
  `hyk_types` tinyint(11) DEFAULT NULL COMMENT '会员卡信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `huiyuanxinxi` */

insert  into `huiyuanxinxi`(`id`,`hyname`,`account`,`password`,`img_photo`,`sex_types`,`balance`,`role`,`hyk_types`) values (1,'小札','11111111111','111','http://localhost:8080/jsf-ssm/upload/1611825665203.JPG','女','9999999.00','会员',3),(2,'小站','12222222222','222','http://localhost:8080/jsf-ssm/upload/1611825655680.JPG','女','40000.00','会员',2),(3,'汪汪','13333333333','333','http://localhost:8080/jsf-ssm/upload/1611825644235.JPG','男','10000.00','会员',3);

/*Table structure for table `jianshenfangxinxi` */

DROP TABLE IF EXISTS `jianshenfangxinxi`;

CREATE TABLE `jianshenfangxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `jsfname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '健身区域名称',
  `jsfmessage` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '健身房信息',
  `jsf_photo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '健身房图片 ',
  `jlid_types` tinyint(11) DEFAULT NULL COMMENT '负责教练',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `jianshenfangxinxi` */

insert  into `jianshenfangxinxi`(`id`,`jsfname`,`jsfmessage`,`jsf_photo`,`jlid_types`) values (1,'健身器材1区域','最好的健身器材1','http://localhost:8080/jsf-ssm/upload/1611825747706.jpg',1),(2,'健身器材2区域','最好的健身器材2','http://localhost:8080/jsf-ssm/upload/1611825817035.jpg',2),(3,'健身器材3区域','最好的健身器材3','http://localhost:8080/jsf-ssm/upload/1611825825480.jpg',3);

/*Table structure for table `jianshenqicaixinxi` */

DROP TABLE IF EXISTS `jianshenqicaixinxi`;

CREATE TABLE `jianshenqicaixinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `qcname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '健身器材名称',
  `message` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '健身器材信息',
  `number` int(255) DEFAULT NULL COMMENT '器材个数',
  `qc_types` varchar(222) CHARACTER SET utf8 DEFAULT NULL COMMENT '器材类型（1、健身器材1，2、健身器材2,3、健身器材3）',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `jianshenqicaixinxi` */

insert  into `jianshenqicaixinxi`(`id`,`qcname`,`message`,`number`,`qc_types`,`create_time`) values (1,'健身器材1','我是描述1',11,'健身器材3','2021-01-28'),(3,'健身器材2','健身器材信息2',22,'健身器材2','2021-01-28');

/*Table structure for table `jiaolianxinxi` */

DROP TABLE IF EXISTS `jiaolianxinxi`;

CREATE TABLE `jiaolianxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `jlname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '教练名称',
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `jiaolianxinxi` */

insert  into `jiaolianxinxi`(`id`,`jlname`,`account`,`password`,`img_photo`,`role`,`create_time`) values (1,'教练1','111','111','http://localhost:8080/jsf-ssm/upload/1611825703104.JPG','教练','2021-01-28 18:04:51'),(2,'教练2','222','222','http://localhost:8080/jsf-ssm/upload/1611825694349.JPG','教练','2021-01-28 18:04:51'),(3,'教练3','333','333','http://localhost:8080/jsf-ssm/upload/1611825684806.JPG','教练','2021-01-28 18:04:51'),(4,'教练4','444','444','http://localhost:8080/jsf-ssm/upload/1611825715891.JPG','教练','2021-01-28 18:04:51');

/*Table structure for table `kechengxinxi` */

DROP TABLE IF EXISTS `kechengxinxi`;

CREATE TABLE `kechengxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `week_types` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '星期日期（星期1-星期天）',
  `times1` time DEFAULT NULL COMMENT '课程时间',
  `times2` time DEFAULT NULL,
  `kcname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '课程内容',
  `message` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '课程信息',
  `jlid_types` tinyint(11) DEFAULT NULL COMMENT '负责教练',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `kechengxinxi` */

insert  into `kechengxinxi`(`id`,`week_types`,`times1`,`times2`,`kcname`,`message`,`jlid_types`) values (1,'星期一','09:15:34','09:55:34','课程1','我是课程描述1',1),(2,'星期二','09:15:34','09:55:34','课程2','我是课程描述2',1),(3,'星期三','09:15:34','09:55:34','课程3','我是课程描述3',1),(4,'星期四','09:15:34','09:55:34','课程4','我是课程描述4',1),(5,'星期五','09:15:34','09:55:34','课程5','我是课程描述5',1),(6,'星期六','09:15:34','09:55:34','课程6','我是课程描述6',1),(7,'星期日','09:15:34','09:55:34','课程7','我是课程描述7',2);

/*Table structure for table `sijiaokechengxinxi` */

DROP TABLE IF EXISTS `sijiaokechengxinxi`;

CREATE TABLE `sijiaokechengxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sjname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '私教名称',
  `course_time` timestamp NULL DEFAULT NULL COMMENT '课程时间',
  `jieshu_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `message` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '教程介绍',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '费用',
  `jlid_types` tinyint(11) DEFAULT NULL COMMENT '负责教练',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `sijiaokechengxinxi` */

insert  into `sijiaokechengxinxi`(`id`,`sjname`,`course_time`,`jieshu_time`,`message`,`cost`,`jlid_types`) values (2,'私教课程2','2021-01-28 18:04:00','2021-04-28 18:04:00','私教课程描述2','1314.00',2),(4,'私教课程1','2021-01-28 18:04:00','2021-03-23 18:04:00','私教课程信息1','500.00',1),(5,'私教课程3','2021-01-28 18:04:00','2021-03-03 18:04:00','私教课程信息3','3333.00',3);

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','xtihmvy6i1tycr2u5jucxtlkjfm47s6z','2021-01-28 18:04:51','2021-03-22 17:30:38'),(2,1,'111','jiaolianxinxi','教练','gnks55pru4kxfbb2pafg34iqoilua5y6','2021-01-28 18:04:51','2021-01-28 18:04:51'),(6,1,'11111111111','users','会员','8wtjulf6n1qcq8mcc0bgx1eb53y3fv5s','2021-01-28 18:04:51','2021-01-28 18:04:51'),(7,2,'111','users','访客','mnf9qb1c5fwwmp5dftyosu4n3pmui35z','2021-01-28 18:04:51','2021-01-28 18:04:51'),(8,2,'222','jiaolianxinxi','教练','pllghgmt7m04kjy6ayidh731x2x478pk','2021-01-28 18:04:51','2021-01-28 18:04:51');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) NOT NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-01-28 18:04:51'),(2,'123','123','访客','2021-01-28 18:04:51');

/*Table structure for table `yuykechengxinxi` */

DROP TABLE IF EXISTS `yuykechengxinxi`;

CREATE TABLE `yuykechengxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sjidTypes` tinyint(11) DEFAULT NULL COMMENT '预约的私教课程',
  `hyidTypes` tinyint(11) DEFAULT NULL COMMENT '会员id',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '预约时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `yuykechengxinxi` */

insert  into `yuykechengxinxi`(`id`,`sjidTypes`,`hyidTypes`,`create_time`) values (1,2,2,'2021-01-28 18:04:51'),(2,4,3,'2021-01-28 18:04:51'),(3,4,1,'2021-01-28 18:04:51'),(6,5,1,'2021-01-28 18:04:51'),(7,2,1,'2021-01-28 18:04:51');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
