/*
 Navicat Premium Data Transfer

 Source Server         : czp
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : hygl

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 07/01/2020 19:48:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_pro
-- ----------------------------
DROP TABLE IF EXISTS `t_pro`;
CREATE TABLE `t_pro`  (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PID` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pro
-- ----------------------------
INSERT INTO `t_pro` VALUES (1, '会议管理模块权限', 0);
INSERT INTO `t_pro` VALUES (2, '会议管理_会议登记权限', 1);
INSERT INTO `t_pro` VALUES (3, '会议管理_全部会议权限', 1);
INSERT INTO `t_pro` VALUES (4, '会议管理_会议统计权限', 1);
INSERT INTO `t_pro` VALUES (5, '会议室管理模块权限', 0);
INSERT INTO `t_pro` VALUES (6, '会议室管理_会议室预订情况权限', 5);
INSERT INTO `t_pro` VALUES (7, '会议室管理_会议室查询权限', 5);
INSERT INTO `t_pro` VALUES (8, '会议室管理_会议室统计权限', 5);
INSERT INTO `t_pro` VALUES (9, '会议室管理_会议室介绍权限', 5);
INSERT INTO `t_pro` VALUES (10, '会议室管理_会议室类型维护权限', 5);
INSERT INTO `t_pro` VALUES (11, '会议室管理_申请部门维护权限', 5);
INSERT INTO `t_pro` VALUES (12, '通知下发模块权限', 0);
INSERT INTO `t_pro` VALUES (13, '通知下发_起草通知权限', 12);
INSERT INTO `t_pro` VALUES (14, '通知下发_审核通知权限', 12);
INSERT INTO `t_pro` VALUES (15, '通知下发_代发通知权限', 12);
INSERT INTO `t_pro` VALUES (16, '通知下发_全部通知权限', 12);
INSERT INTO `t_pro` VALUES (17, '通知下发_会议材料权限', 12);
INSERT INTO `t_pro` VALUES (18, '系统管理_基础权限维护权限', 0);
INSERT INTO `t_pro` VALUES (19, '系统管理_分配角色权限', 18);
INSERT INTO `t_pro` VALUES (20, '系统管理_组织人员管理', 18);
INSERT INTO `t_pro` VALUES (22, '系统管理_基础权限管理', 18);
INSERT INTO `t_pro` VALUES (23, '系统管理_基础配置管理', 18);

SET FOREIGN_KEY_CHECKS = 1;
