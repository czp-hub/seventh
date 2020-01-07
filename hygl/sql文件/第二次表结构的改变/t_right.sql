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

 Date: 07/01/2020 19:48:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_right
-- ----------------------------
DROP TABLE IF EXISTS `t_right`;
CREATE TABLE `t_right`  (
  `id` int(11) NOT NULL,
  `rightName` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pId` int(11) NULL DEFAULT NULL,
  `rightUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_right
-- ----------------------------
INSERT INTO `t_right` VALUES (1, '系统管理', 0, NULL);
INSERT INTO `t_right` VALUES (2, '组织人员管理', 1, 'dept/dept');
INSERT INTO `t_right` VALUES (3, '分配角色权限', 1, NULL);
INSERT INTO `t_right` VALUES (4, '基础权限管理', 1, NULL);
INSERT INTO `t_right` VALUES (5, '基础配置管理', 1, NULL);
INSERT INTO `t_right` VALUES (6, '会议管理', 0, NULL);
INSERT INTO `t_right` VALUES (7, '例会登记', 6, NULL);
INSERT INTO `t_right` VALUES (8, '非例会登记', 6, NULL);
INSERT INTO `t_right` VALUES (9, '废弃会议', 6, NULL);
INSERT INTO `t_right` VALUES (10, '会议材料', 6, NULL);
INSERT INTO `t_right` VALUES (11, '全部会议', 6, NULL);

SET FOREIGN_KEY_CHECKS = 1;
