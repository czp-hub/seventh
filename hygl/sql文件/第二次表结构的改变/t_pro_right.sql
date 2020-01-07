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

 Date: 07/01/2020 19:48:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_pro_right
-- ----------------------------
DROP TABLE IF EXISTS `t_pro_right`;
CREATE TABLE `t_pro_right`  (
  `id` int(11) NOT NULL,
  `proId` int(11) NULL DEFAULT NULL,
  `rightId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
