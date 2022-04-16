/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : ceshiyaexam

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 14/04/2022 12:23:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_del` int(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES (1, '2020030905', 0);

-- ----------------------------
-- Table structure for crouse
-- ----------------------------
DROP TABLE IF EXISTS `crouse`;
CREATE TABLE `crouse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crouse_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名',
  `class_id` int(11) NOT NULL COMMENT '班级id',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  CONSTRAINT `crouse_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crouse
-- ----------------------------
INSERT INTO `crouse` VALUES (1, 'C#程序开发', 1, NULL);

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '试卷名字',
  `unique` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '试卷唯一编号',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_del` int(255) NOT NULL DEFAULT 0,
  `start_time` datetime NOT NULL COMMENT '开考时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `is_start` int(255) NOT NULL DEFAULT 0 COMMENT '是否开始',
  `class_id` int(11) NOT NULL,
  `crouse_id` int(11) NOT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`unique`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  INDEX `crouse_id`(`crouse_id`) USING BTREE,
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `paper_ibfk_2` FOREIGN KEY (`crouse_id`) REFERENCES `crouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (1, 'C#面向对象低级', 'asdghfxdggbftgd151', '2022-04-13 00:00:00', '2022-04-13 00:00:00', 0, '2022-04-13 00:00:00', '2022-04-13 00:00:00', 0, 1, 1);

-- ----------------------------
-- Table structure for paper_detail
-- ----------------------------
DROP TABLE IF EXISTS `paper_detail`;
CREATE TABLE `paper_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `answer_list` json NOT NULL COMMENT '答案列表',
  `is_del` int(255) NOT NULL DEFAULT 0,
  `question_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问题列表',
  `type` int(255) NOT NULL COMMENT '单选：0，多选 1\r\n',
  `paper_detail_unique` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目唯一编号',
  `paper_unique` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '试卷id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `paper_detail_unique`(`paper_detail_unique`) USING BTREE,
  INDEX `paper_unique`(`paper_unique`) USING BTREE,
  CONSTRAINT `paper_detail_ibfk_1` FOREIGN KEY (`paper_unique`) REFERENCES `paper` (`unique`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper_detail
-- ----------------------------
INSERT INTO `paper_detail` VALUES (1, '面向对象的三大特征', '[0, 1, 2]', 0, '[{\"content\": \"继承\"}, {\"content\": \"封装\"}, {\"content\": \"多态\"}, {\"content\": \"密封\"}]', 1, '6asdasdasfsdghfg', 'asdghfxdggbftgd151');

-- ----------------------------
-- Table structure for paper_result
-- ----------------------------
DROP TABLE IF EXISTS `paper_result`;
CREATE TABLE `paper_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `is_del` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `is_back` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否回退',
  `score` decimal(5, 2) NOT NULL COMMENT '分数',
  `paper_unique` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `paper_unique`(`paper_unique`) USING BTREE,
  CONSTRAINT `paper_result_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `paper_result_ibfk_2` FOREIGN KEY (`paper_unique`) REFERENCES `paper` (`unique`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper_result
-- ----------------------------

-- ----------------------------
-- Table structure for paper_user_check_detail
-- ----------------------------
DROP TABLE IF EXISTS `paper_user_check_detail`;
CREATE TABLE `paper_user_check_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_unique` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '试卷唯一键',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `answer_check_list` json NULL,
  `is_del` int(255) NOT NULL DEFAULT 0,
  `paper_detail_unique` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `paper_unique`(`paper_unique`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `paper_detail_unique`(`paper_detail_unique`) USING BTREE,
  CONSTRAINT `paper_user_check_detail_ibfk_1` FOREIGN KEY (`paper_unique`) REFERENCES `paper` (`unique`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `paper_user_check_detail_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `paper_user_check_detail_ibfk_3` FOREIGN KEY (`paper_detail_unique`) REFERENCES `paper_detail` (`paper_detail_unique`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper_user_check_detail
-- ----------------------------
INSERT INTO `paper_user_check_detail` VALUES (1, 'asdghfxdggbftgd151', 1, '[0, 1, 2]', 0, '6asdasdasfsdghfg');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', '管理员');
INSERT INTO `role` VALUES (2, '学生', '学生');
INSERT INTO `role` VALUES (3, '教师', '教师');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `roleID` int(11) NOT NULL COMMENT '角色id',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `is_del` int(255) NOT NULL DEFAULT 0,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '登录时间',
  `class_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `roleID`(`roleID`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '20203090525', 'asd', 2, NULL, 0, '大谬', '2020-04-13 00:00:00', '2020-04-13 00:00:00', 1);

SET FOREIGN_KEY_CHECKS = 1;
