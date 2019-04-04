
/*
Navicat MySQL Data Transfer

Source Server         : 192.168.10.5
Source Server Version : 50643
Source Host           : 192.168.10.5:3306
Source Database       : dg_dqc

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2019-04-04 14:02:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for m07_checkerror_detail_his
-- ----------------------------
DROP TABLE IF EXISTS `m07_checkerror_detail_his`;
CREATE TABLE `m07_checkerror_detail_his` (
  `pk_val` varchar(255) NOT NULL,
  `field_val` varchar(255) DEFAULT NULL,
  `tx_date` varchar(16) NOT NULL,
  `dqid` varchar(32) NOT NULL,
  PRIMARY KEY (`dqid`,`pk_val`,`tx_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for m07_checkerror_sum
-- ----------------------------
DROP TABLE IF EXISTS `m07_checkerror_sum`;
CREATE TABLE `m07_checkerror_sum` (
  `dqid` varchar(32) NOT NULL,
  `tx_date` varchar(16) NOT NULL,
  `err_cnt` varchar(32) NOT NULL,
  PRIMARY KEY (`dqid`,`tx_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
