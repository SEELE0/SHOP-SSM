/*
 Navicat Premium Data Transfer

 Source Server         : ASUKA
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : shoptest

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 29/07/2022 09:28:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_shiro
-- ----------------------------
DROP TABLE IF EXISTS `admin_shiro`;
CREATE TABLE `admin_shiro`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `shiro_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名字',
  `shiro_cont` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admin_shiro
-- ----------------------------
INSERT INTO `admin_shiro` VALUES (1, '超级管理员', '增改删');
INSERT INTO `admin_shiro` VALUES (2, '普通管理员', '增改');

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员昵称',
  `admin_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员账户',
  `admin_pwd` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `admin_shiro` int NULL DEFAULT NULL COMMENT '管理员权限',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_shiro`(`admin_shiro`) USING BTREE,
  CONSTRAINT `admin_users_ibfk_1` FOREIGN KEY (`admin_shiro`) REFERENCES `admin_shiro` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, '张三', 'admin', 'a', 1);
INSERT INTO `admin_users` VALUES (2, 'ask', '1', '1', 1);
INSERT INTO `admin_users` VALUES (3, 'aaa', 'aaa', '123', 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_userid` int NULL DEFAULT NULL COMMENT '用户id',
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '收货地址',
  `pay_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `goods_name` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_num` int NULL DEFAULT NULL COMMENT '数量',
  `goods_price` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单价',
  `order_date` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单时间',
  `order_succ` int NULL DEFAULT NULL COMMENT '是否成功付款',
  `order_counts` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总价',
  `order_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `order_state` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货状态',
  `goods_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `users_id`(`order_userid`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `shop_goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `users_id` FOREIGN KEY (`order_userid`) REFERENCES `shop_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (156, 23, 'undefined  （undefined 收）undefined', '货到付款', '口袋妖怪', 1, '305', '2022-07-28 13:33:37', 1, '305.00', '95851951', '未发货', 8);
INSERT INTO `orders` VALUES (157, 23, 'undefined  （undefined 收）undefined', '货到付款', '星空', 1, '256', '2022-07-28 13:33:37', 1, '256.00', '98012612', '未发货', 12);
INSERT INTO `orders` VALUES (158, 23, 'undefined  （undefined 收）undefined', '货到付款', '口袋妖怪', 1, '305', '2022-07-28 13:33:47', 1, '305.00', '79027829', '未发货', 8);
INSERT INTO `orders` VALUES (159, 23, 'undefined  （undefined 收）undefined', '货到付款', '星空', 1, '256', '2022-07-28 13:33:47', 1, '256.00', '82936308', '未发货', 12);
INSERT INTO `orders` VALUES (160, 23, 'undefined  （undefined 收）undefined', '货到付款', '口袋妖怪', 1, '305', '2022-07-28 13:39:55', 1, '305.00', '62852315', '未发货', 8);
INSERT INTO `orders` VALUES (161, 23, 'undefined  （undefined 收）undefined', '货到付款', '神秘海域', 1, '280', '2022-07-28 14:20:13', 1, '280.00', '77081964', '未发货', 4);
INSERT INTO `orders` VALUES (162, 23, 'undefined  （undefined 收）undefined', '货到付款', '口袋妖怪', 1, '305', '2022-07-28 14:20:42', 1, '305.00', '33440249', '未发货', 8);
INSERT INTO `orders` VALUES (163, 23, 'undefined  （undefined 收）undefined', '货到付款', '太鼓之達人', 3, '160', '2022-07-28 14:44:14', 1, '480.00', '76399246', '未发货', 26);
INSERT INTO `orders` VALUES (165, 23, 'undefined  （undefined 收）undefined', '货到付款', '口袋妖怪', 1, '305', '2022-07-29 07:47:23', 1, '305.00', '82472268', '未发货', 8);
INSERT INTO `orders` VALUES (166, 23, 'undefined  （undefined 收）undefined', '货到付款', '口袋妖怪', 1, '305', '2022-07-29 08:04:01', 1, '305.00', '64956464', '未发货', 8);
INSERT INTO `orders` VALUES (167, 23, 'undefined  （undefined 收）undefined', '货到付款', '口袋妖怪', 1, '305', '2022-07-29 09:08:14', 1, '305.00', '74772501', '未发货', 8);
INSERT INTO `orders` VALUES (168, 23, 'undefined  （undefined 收）undefined', '货到付款', '微软模拟飞行', 1, '200', '2022-07-29 09:08:14', 1, '200.00', '67593577', '未发货', 11);
INSERT INTO `orders` VALUES (169, 23, '1  （1 收）1', '货到付款', 'F1 22', 1, '125', '2022-07-29 09:09:33', 1, '125.00', '75562158', '未发货', 17);
INSERT INTO `orders` VALUES (170, 23, '1  （1 收）1', '货到付款', '光环', 4, '180', '2022-07-29 09:10:02', 1, '720.00', '25237247', '未发货', 10);

-- ----------------------------
-- Table structure for rece_address
-- ----------------------------
DROP TABLE IF EXISTS `rece_address`;
CREATE TABLE `rece_address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `recename` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `address` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `zipcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `iphone` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货手机号',
  `user_id` int NULL DEFAULT NULL COMMENT '该地址的所有者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `address_id`(`user_id`) USING BTREE,
  CONSTRAINT `address_id` FOREIGN KEY (`user_id`) REFERENCES `shop_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of rece_address
-- ----------------------------
INSERT INTO `rece_address` VALUES (1, '1', '1', '1', '1', 1);
INSERT INTO `rece_address` VALUES (11, NULL, NULL, NULL, NULL, 22);
INSERT INTO `rece_address` VALUES (12, '1', '1', '1', '1', 23);

-- ----------------------------
-- Table structure for shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_unit` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `goods_price` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单价',
  `goods_num` int NULL DEFAULT NULL COMMENT '商品数量',
  `users_id` int NULL DEFAULT NULL COMMENT '购物车用户id',
  `goods_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_id` int NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `usersid`(`users_id`) USING BTREE,
  INDEX `goodsid`(`goods_id`) USING BTREE,
  CONSTRAINT `goodsid` FOREIGN KEY (`goods_id`) REFERENCES `shop_goods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `usersid` FOREIGN KEY (`users_id`) REFERENCES `shop_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of shop_cart
-- ----------------------------
INSERT INTO `shop_cart` VALUES (98, ' GT赛车7 ', 'PlayStation Studios', '300', 1, 22, NULL, NULL);
INSERT INTO `shop_cart` VALUES (104, '星之卡比', '任天堂', '348', 1, 1, NULL, NULL);
INSERT INTO `shop_cart` VALUES (105, '星空', 'Microsoft', '256', 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名字',
  `goods_unit` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `goods_stock` int NULL DEFAULT NULL COMMENT '库存',
  `goods_price` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单价',
  `goods_present` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品简介',
  `goods_type` int NULL DEFAULT NULL COMMENT '种类',
  `goods_img` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`goods_type`) USING BTREE,
  CONSTRAINT `type_id` FOREIGN KEY (`goods_type`) REFERENCES `shop_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of shop_goods
-- ----------------------------
INSERT INTO `shop_goods` VALUES (1, '生化危機8', 'Capcom', 255, '399', '《惡靈古堡 8：村莊》延續《惡靈古堡 7：生化危機》的故事，敘述自那次惡夢般的事件之後已有數年\r\n\r\n伊森·溫特斯已經重拾日常平靜的生活，不過這樣的日常卻突然被昔日那位身經百戰的傳奇英雄－克里斯‧雷德菲爾所打破\r\n\r\n遊戲將以打造美麗又可怕的村莊為目標，完整交代主角伊森·溫特斯的人生與經歷。', 1, 'goods.jpg');
INSERT INTO `shop_goods` VALUES (2, ' GT赛车7 ', 'PlayStation Studios', 299, '300', '最新一集的「State of Play」将帶您深入了解《跑車浪漫旅7》\r\n\r\n超過400部車款以及超過60個來自世界各地的汽車品牌。\r\n\r\n不論是量産車型還是稀有傳奇車款，有衆多車款任您選擇。這是該系列一直以來的特色，《跑車浪漫旅7》當然也不例外。最新章節中包含超過400部車款以及超過60家車廠，将于未來的更新内容持續增加。\r\n\r\n位于34個不同地點的賽道搭配97種配置。\r\n\r\n清單中所有賽道的最大特色爲将現實中的路線與原創路線結合，讓玩家能在34個地點體驗97種獨特的賽道配置。經典系列賽道如山嶽考驗賽道、深邃森林賽道、高速環狀賽道将會回歸并更新。新的車輛與賽道預計于未來更新時加入遊戲。\r\n\r\n一同進入汽車聖地\r\n\r\n玩家最愛的世界地圖将于《跑車浪漫旅7》回歸。世界地圖将以度假勝地的形式回歸，玩家可以享受駕馭車輛的美好生活，同時世界地圖也是玩家可以選取各項功能的選單介面。首先玩家要做的是使用初始的貨币購入一部小型跑車。接着，玩家會參與各項賽事與活動并獲得獎勵，如此便可取得更好的車輛；玩家也能随遊戲進度的推進來調整或升級原有車款的性能。玩家可使用「車庫」來存放車輛并對車輛進行調校，并進入車輛聖地探索汽車的世界。', 1, 'goods02.jpg');
INSERT INTO `shop_goods` VALUES (3, '\r\n最終幻想7', 'Square Enix', 300, '300', '對比PS4原版《最終幻想7：重制版》，新的PS5《最終幻想7：重制INTERGRADE 》強化了遊戲畫面，具體表現在更細膩的紋理、更逼真的燈光照明和霧氣效果。遊戲中提供了可以達到4K分辨率的“畫質模式”，以及可以達到60FPS的“性能模式”。', 1, 'goods03.jpg');
INSERT INTO `shop_goods` VALUES (4, '神秘海域', 'PlayStation Studios', 279, '280', '原本由顶尖游戏制作室Naughty Dog操刀创作的革命性壮大冒险游戏，今天由Bluepoint Games透过PS4™主机的高性能重制登场。在这个游戏史上其中一个最受推崇的杰作系列中扮演奈森·德瑞克，从微不足道的事端开始，到难以想像的发现，踏上横越地球的惊险旅程。德瑞克亦会与令人难忘的各式人物相遇，以性命和友情作为赌注，与阴险残酷的敌人竞争追踪传说中的宝藏。UNCHARTED: The Nathan Drake Collection™收录UNCHARTED: Drake’s Fortune™丶UNCHARTED 2: Among Thieves™和UNCHARTED 3: Drake’s Deception™三款游戏的单人故事模式。\r\n', 1, 'goods04.jpg');
INSERT INTO `shop_goods` VALUES (5, '星之卡比', '任天堂', 123, '348', '《星之卡比》的首款3D動作遊戲\r\n\r\n\r\n《星之卡比》系列最新作的舞台，是融合了文明和大自然的未知“新世界”。吸入，吐出，飛翔，複制，在有立體縱深的3D關卡中，使用卡比的熟悉動作自由地來回探索冒險。\r\n\r\n◆爲了救出瓦豆魯迪前進\r\n爲了救出被神秘敵人“野獸軍團”俘虜的瓦豆魯迪們，卡比開始了冒險。在各個關卡中，一邊與野獸軍團戰鬥、解開難題，一邊爲救出受困的瓦豆魯迪們，向終點前進！\r\n\r\n◆新的複制能力“鑽擊”和“探巡隊”\r\n除了熟悉的複制能力會以3D動作重生，還有全新的複制能力：可以潛入地底的“鑽擊”，以及射出星之子彈的“探巡隊”，也會登場！\r\n\r\n◆使用卡比和頭巾瓦豆魯迪來2人協力遊玩\r\n隻要分享Joy-Con，便可以使用卡比和頭巾瓦豆魯迪2人來探索新世界！', 2, 'goods05.jpg');
INSERT INTO `shop_goods` VALUES (6, '塞尔达传说', '任天堂', 110, '123', 'test', 2, 'goods06.jpg');
INSERT INTO `shop_goods` VALUES (7, '马里奥', '任天堂', 110, '155', 'test', 2, 'goods07.jpg');
INSERT INTO `shop_goods` VALUES (8, '口袋妖怪', '任天堂', 100, '305', 'test', 2, 'goods08.jpg');
INSERT INTO `shop_goods` VALUES (9, '极限竞速', 'Microsoft', 110, '125', 'test', 3, 'goods09.jpg');
INSERT INTO `shop_goods` VALUES (10, '光环', 'Microsoft', 106, '180', 'test', 3, 'goods10.jpg');
INSERT INTO `shop_goods` VALUES (11, '微软模拟飞行', 'Microsoft', 109, '200', 'test', 3, 'goods11.jpg');
INSERT INTO `shop_goods` VALUES (12, '星空', 'Microsoft', 110, '256', 'test', 3, 'goods.jpg');
INSERT INTO `shop_goods` VALUES (13, '刺客信条英灵殿 ', 'ubisoft', 123, '186', 'test', 4, 'goods13.jpg');
INSERT INTO `shop_goods` VALUES (14, '幽灵行动荒野 ', 'ubisoft', 123, '186', 'test', 4, 'goods14.jpg');
INSERT INTO `shop_goods` VALUES (15, '极限国度', 'ubisoft', 123, '186', 'test', 4, 'goods15.jpg');
INSERT INTO `shop_goods` VALUES (16, '刺客信条奥德赛 ', 'ubisoft', 123, '186', 'test', 4, 'goods16.jpg');
INSERT INTO `shop_goods` VALUES (17, 'F1 22', 'EA', 151, '125', 'test', 5, 'goods17.jpg');
INSERT INTO `shop_goods` VALUES (18, 'Battlefield2042', 'EA', 152, '125', 'test', 5, 'goods18.jpg');
INSERT INTO `shop_goods` VALUES (19, 'Star Wars 絕地殞落', 'EA', 152, '125', 'test', 5, 'goods19.jpg');
INSERT INTO `shop_goods` VALUES (20, 'Battlefield1', 'EA', 152, '125', 'test', 5, 'goods20.jpg');
INSERT INTO `shop_goods` VALUES (21, '艾爾登法環 ', 'Bandai Namco', 152, '155', 'test', 6, 'goods21.jpg');
INSERT INTO `shop_goods` VALUES (22, '黑相集：灰冥界 ', 'Bandai Namco', 152, '155', 'test', 6, 'goods22.jpg');
INSERT INTO `shop_goods` VALUES (23, '小小夢魘2 ', 'Bandai Namco', 152, '155', 'test', 6, 'goods23.jpg');
INSERT INTO `shop_goods` VALUES (24, 'Project CARS 3 ', 'Bandai Namco', 152, '155', 'test', 6, 'goods24.jpg');
INSERT INTO `shop_goods` VALUES (25, '皇牌空战7', 'Bandai Namco', 152, '155', 'test', 6, 'goods25.jpg');
INSERT INTO `shop_goods` VALUES (26, '太鼓之達人', 'Bandai Namco', 0, '160', 'test', 6, 'goods26.jpg');
INSERT INTO `shop_goods` VALUES (70, '1', '1', 1, '41', '1', 22, '索引.jpg');
INSERT INTO `shop_goods` VALUES (71, '1', '1', 1, '1', '1', 6, '索引.jpg');

-- ----------------------------
-- Table structure for shop_type
-- ----------------------------
DROP TABLE IF EXISTS `shop_type`;
CREATE TABLE `shop_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品种类',
  `date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of shop_type
-- ----------------------------
INSERT INTO `shop_type` VALUES (1, '索尼PS', '2022-06-24');
INSERT INTO `shop_type` VALUES (2, '任天堂', '2022-06-24');
INSERT INTO `shop_type` VALUES (3, 'Xbox', '2022-06-24');
INSERT INTO `shop_type` VALUES (4, 'ubisoft', '2022-06-24');
INSERT INTO `shop_type` VALUES (5, 'EA', '2022-06-24');
INSERT INTO `shop_type` VALUES (6, 'Bandai Namco', '2022-06-24');
INSERT INTO `shop_type` VALUES (22, '11', '2022-07-29 09:11:23');

-- ----------------------------
-- Table structure for shop_user
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `users` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `iphone` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `is_pay_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of shop_user
-- ----------------------------
INSERT INTO `shop_user` VALUES (1, '1', '1', '1', '1', '1', NULL);
INSERT INTO `shop_user` VALUES (22, 'aaa', '123', '1111', '无', '无', NULL);
INSERT INTO `shop_user` VALUES (23, '12345', '827ccb0eea8a706c4c34a16891f84e7b', '3', '3', '3', NULL);

SET FOREIGN_KEY_CHECKS = 1;
