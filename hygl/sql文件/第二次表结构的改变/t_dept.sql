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

 Date: 07/01/2020 19:48:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PID` int(255) NULL DEFAULT NULL,
  `classId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES (1, '市政府办公厅', 0, 1);
INSERT INTO `t_dept` VALUES (2, '直属机构', 1, 1);
INSERT INTO `t_dept` VALUES (3, '市地税局', 2, 2);
INSERT INTO `t_dept` VALUES (4, '市工商局', 2, 2);
INSERT INTO `t_dept` VALUES (5, '区县委', 1, 1);
INSERT INTO `t_dept` VALUES (6, '东城区委', 5, 2);
INSERT INTO `t_dept` VALUES (7, '西城区委', 5, 2);

SET FOREIGN_KEY_CHECKS = 1;
