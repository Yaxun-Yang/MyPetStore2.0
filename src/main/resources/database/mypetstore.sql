/*
 Navicat Premium Data Transfer

 Source Server         : mySQL
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : mypetstore

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 07/04/2020 11:51:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `userid` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firstname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr1` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr2` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('a', 'a', 'a', 'a', NULL, 'a', 'a', 'aa', 'a', 'a', 'a', 'a');
INSERT INTO `account` VALUES ('ACID', 'acid@yourdomain.com', 'ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('j2ee', 'j2ee@yourdomain.com', 'John', 'Smith', 'CB', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'USA', '322-513-1654');
INSERT INTO `account` VALUES ('xyz', 'xyz@csu.edu.cn', 'a', 'a', NULL, 'a', 'a', 'aa', 'a', 'a', 'a', 'a');

-- ----------------------------
-- Table structure for bannerdata
-- ----------------------------
DROP TABLE IF EXISTS `bannerdata`;
CREATE TABLE `bannerdata`  (
  `favcategory` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bannername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`favcategory`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bannerdata
-- ----------------------------
INSERT INTO `bannerdata` VALUES ('BIRDS', '<image src=\"../images/banner_birds.gif\">');
INSERT INTO `bannerdata` VALUES ('CATS', '<image src=\"../images/banner_cats.gif\">');
INSERT INTO `bannerdata` VALUES ('DOGS', '<image src=\"../images/banner_dogs.gif\">');
INSERT INTO `bannerdata` VALUES ('FISH', '<image src=\"../images/banner_fish.gif\">');
INSERT INTO `bannerdata` VALUES ('REPTILES', '<image src=\"../images/banner_reptiles.gif\">');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cartid` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cartid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (999, 'j2ee');
INSERT INTO `cart` VALUES (1000, 'a');

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem`  (
  `cartid` int(10) NOT NULL,
  `itemid` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `quantity` int(10) NOT NULL,
  `categoryid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cartid`, `itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES (999, 'EST-11', 1, 'REPTILES');
INSERT INTO `cartitem` VALUES (999, 'EST-13', 4, 'REPTILES');
INSERT INTO `cartitem` VALUES (999, 'EST-15', 1, 'CATS');
INSERT INTO `cartitem` VALUES (999, 'EST-18', 2, 'BIRDS');
INSERT INTO `cartitem` VALUES (999, 'EST-24', 1, 'DOGS');
INSERT INTO `cartitem` VALUES (999, 'EST-25', 3, 'DOGS');
INSERT INTO `cartitem` VALUES (999, 'EST-26', 2, 'DOGS');
INSERT INTO `cartitem` VALUES (1000, 'EST-1', 7, 'FISH');
INSERT INTO `cartitem` VALUES (1000, 'EST-10', 3, 'DOGS');
INSERT INTO `cartitem` VALUES (1000, 'EST-13', 1, 'REPTILES');
INSERT INTO `cartitem` VALUES (1000, 'EST-19', 1, 'BIRDS');
INSERT INTO `cartitem` VALUES (1000, 'EST-2', 109, 'FISH');
INSERT INTO `cartitem` VALUES (1000, 'EST-20', 2, 'FISH');
INSERT INTO `cartitem` VALUES (1000, 'EST-3', 8, 'FISH');
INSERT INTO `cartitem` VALUES (1000, 'EST-6', 8, 'DOGS');
INSERT INTO `cartitem` VALUES (1000, 'EST-9', 1, 'DOGS');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `catid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`catid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('BIRDS', 'Birds', '<image src=\"images/birds_icon.gif\"><font size=\"5\" color=\"blue\"> Birds</font>');
INSERT INTO `category` VALUES ('CATS', 'Cats', '<image src=\"images/cats_icon.gif\"><font size=\"5\" color=\"blue\"> Cats</font>');
INSERT INTO `category` VALUES ('DOGS', 'Dogs', '<image src=\"images/dogs_icon.gif\"><font size=\"5\" color=\"blue\"> Dogs</font>');
INSERT INTO `category` VALUES ('FISH', 'Fish', '<image src=\"images/fish_icon.gif\"><font size=\"5\" color=\"blue\"> Fish</font>');
INSERT INTO `category` VALUES ('REPTILES', 'Reptiles', '<image src=\"images/reptiles_icon.gif\"><font size=\"5\" color=\"blue\"> Reptiles</font>');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `itemid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('EST-1', 0);
INSERT INTO `inventory` VALUES ('EST-10', 10000);
INSERT INTO `inventory` VALUES ('EST-11', 10000);
INSERT INTO `inventory` VALUES ('EST-12', 9990);
INSERT INTO `inventory` VALUES ('EST-13', 0);
INSERT INTO `inventory` VALUES ('EST-14', 9999);
INSERT INTO `inventory` VALUES ('EST-15', 9988);
INSERT INTO `inventory` VALUES ('EST-16', 10000);
INSERT INTO `inventory` VALUES ('EST-17', 9999);
INSERT INTO `inventory` VALUES ('EST-18', 9998);
INSERT INTO `inventory` VALUES ('EST-19', 9987);
INSERT INTO `inventory` VALUES ('EST-2', 9999);
INSERT INTO `inventory` VALUES ('EST-20', 9999);
INSERT INTO `inventory` VALUES ('EST-21', 9999);
INSERT INTO `inventory` VALUES ('EST-22', 10000);
INSERT INTO `inventory` VALUES ('EST-23', 9995);
INSERT INTO `inventory` VALUES ('EST-24', 10000);
INSERT INTO `inventory` VALUES ('EST-25', 10000);
INSERT INTO `inventory` VALUES ('EST-26', 9998);
INSERT INTO `inventory` VALUES ('EST-27', 9993);
INSERT INTO `inventory` VALUES ('EST-28', 10000);
INSERT INTO `inventory` VALUES ('EST-3', 9995);
INSERT INTO `inventory` VALUES ('EST-4', 10000);
INSERT INTO `inventory` VALUES ('EST-5', 10000);
INSERT INTO `inventory` VALUES ('EST-6', 10000);
INSERT INTO `inventory` VALUES ('EST-7', 10000);
INSERT INTO `inventory` VALUES ('EST-8', 10000);
INSERT INTO `inventory` VALUES ('EST-9', 10000);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `itemid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unitcost` decimal(10, 2) NULL DEFAULT NULL,
  `supplier` int(11) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attr1` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attr2` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attr3` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attr4` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attr5` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `fk_item_2`(`supplier`) USING BTREE,
  INDEX `itemProd`(`productid`) USING BTREE,
  CONSTRAINT `fk_item_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_item_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`suppid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('EST-1', 'FI-SW-01', 10.00, 1, 'P', 'Large', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-10', 'K9-DL-01', 12.00, 1, 'P', 'Spotted Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-11', 'RP-SN-01', 12.00, 1, 'P', 'Venomless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-12', 'RP-SN-01', 12.00, 1, 'P', 'Rattleless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-13', 'RP-LI-02', 12.00, 1, 'P', 'Green Adult', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-14', 'FL-DSH-01', 12.00, 1, 'P', 'Tailless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-15', 'FL-DSH-01', 12.00, 1, 'P', 'With tail', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-16', 'FL-DLH-02', 12.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-17', 'FL-DLH-02', 12.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-18', 'AV-CB-01', 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-19', 'AV-SB-02', 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-2', 'FI-SW-01', 10.00, 1, 'P', 'Small', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-20', 'FI-FW-02', 2.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-21', 'FI-FW-02', 1.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-22', 'K9-RT-02', 100.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-23', 'K9-RT-02', 100.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-24', 'K9-RT-02', 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-25', 'K9-RT-02', 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-26', 'K9-CW-01', 92.00, 1, 'P', 'Adult Male', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-27', 'K9-CW-01', 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-28', 'K9-RT-01', 90.00, 1, 'P', 'Adult Female', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-3', 'FI-SW-02', 12.00, 1, 'P', 'Toothless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-4', 'FI-FW-01', 12.00, 1, 'P', 'Spotted', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-5', 'FI-FW-01', 12.00, 1, 'P', 'Spotless', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-6', 'K9-BD-01', 12.00, 1, 'P', 'Male Adult', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-7', 'K9-BD-01', 12.00, 1, 'P', 'Female Puppy', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-8', 'K9-PO-02', 12.00, 1, 'P', 'Male Puppy', NULL, NULL, NULL, NULL);
INSERT INTO `item` VALUES ('EST-9', 'K9-DL-01', 12.00, 1, 'P', 'Spotless Male Puppy', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for lineitem
-- ----------------------------
DROP TABLE IF EXISTS `lineitem`;
CREATE TABLE `lineitem`  (
  `orderid` int(11) NOT NULL,
  `linenum` int(11) NOT NULL,
  `itemid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitprice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`orderid`, `linenum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lineitem
-- ----------------------------
INSERT INTO `lineitem` VALUES (999, 997, 'EST-11', 2, 18.50);
INSERT INTO `lineitem` VALUES (999, 998, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (999, 999, 'EST-9', 2, 18.50);
INSERT INTO `lineitem` VALUES (1000, 1000, 'EST-12', 1, 18.50);
INSERT INTO `lineitem` VALUES (1001, 1001, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1002, 1002, 'EST-25', 1, 325.29);
INSERT INTO `lineitem` VALUES (1003, 1003, 'EST-12', 1, 18.50);
INSERT INTO `lineitem` VALUES (1003, 1004, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1003, 1005, 'EST-20', 1, 5.50);
INSERT INTO `lineitem` VALUES (1004, 1006, 'EST-15', 1, 23.50);
INSERT INTO `lineitem` VALUES (1005, 1007, 'EST-15', 1, 23.50);
INSERT INTO `lineitem` VALUES (1006, 1008, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1007, 1009, 'EST-1', 1, 16.50);
INSERT INTO `lineitem` VALUES (1007, 1010, 'EST-3', 1, 18.50);
INSERT INTO `lineitem` VALUES (1007, 1011, 'EST-23', 1, 145.49);
INSERT INTO `lineitem` VALUES (1007, 1012, 'EST-12', 1, 18.50);
INSERT INTO `lineitem` VALUES (1007, 1013, 'EST-15', 2, 23.50);
INSERT INTO `lineitem` VALUES (1007, 1014, 'EST-19', 2, 15.50);
INSERT INTO `lineitem` VALUES (1008, 1015, 'EST-1', 1, 16.50);
INSERT INTO `lineitem` VALUES (1008, 1016, 'EST-3', 1, 18.50);
INSERT INTO `lineitem` VALUES (1008, 1017, 'EST-23', 1, 145.49);
INSERT INTO `lineitem` VALUES (1008, 1018, 'EST-12', 1, 18.50);
INSERT INTO `lineitem` VALUES (1008, 1019, 'EST-15', 2, 23.50);
INSERT INTO `lineitem` VALUES (1008, 1020, 'EST-19', 2, 15.50);
INSERT INTO `lineitem` VALUES (1009, 1021, 'EST-1', 1, 16.50);
INSERT INTO `lineitem` VALUES (1009, 1022, 'EST-3', 1, 18.50);
INSERT INTO `lineitem` VALUES (1009, 1023, 'EST-23', 1, 145.49);
INSERT INTO `lineitem` VALUES (1009, 1024, 'EST-12', 1, 18.50);
INSERT INTO `lineitem` VALUES (1009, 1025, 'EST-15', 2, 23.50);
INSERT INTO `lineitem` VALUES (1009, 1026, 'EST-19', 2, 15.50);
INSERT INTO `lineitem` VALUES (1010, 1027, 'EST-1', 1, 16.50);
INSERT INTO `lineitem` VALUES (1010, 1028, 'EST-3', 1, 18.50);
INSERT INTO `lineitem` VALUES (1010, 1029, 'EST-23', 1, 145.49);
INSERT INTO `lineitem` VALUES (1010, 1030, 'EST-12', 1, 18.50);
INSERT INTO `lineitem` VALUES (1010, 1031, 'EST-15', 2, 23.50);
INSERT INTO `lineitem` VALUES (1010, 1032, 'EST-19', 2, 15.50);
INSERT INTO `lineitem` VALUES (1011, 1033, 'EST-1', 1, 16.50);
INSERT INTO `lineitem` VALUES (1011, 1034, 'EST-3', 1, 18.50);
INSERT INTO `lineitem` VALUES (1011, 1035, 'EST-23', 1, 145.49);
INSERT INTO `lineitem` VALUES (1011, 1036, 'EST-12', 1, 18.50);
INSERT INTO `lineitem` VALUES (1011, 1037, 'EST-15', 2, 23.50);
INSERT INTO `lineitem` VALUES (1011, 1038, 'EST-19', 2, 15.50);
INSERT INTO `lineitem` VALUES (1012, 1039, 'EST-2', 1, 16.50);
INSERT INTO `lineitem` VALUES (1012, 1040, 'EST-26', 2, 125.50);
INSERT INTO `lineitem` VALUES (1012, 1041, 'EST-27', 3, 155.29);
INSERT INTO `lineitem` VALUES (1012, 1042, 'EST-12', 2, 18.50);
INSERT INTO `lineitem` VALUES (1012, 1043, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1013, 1044, 'EST-17', 1, 93.50);
INSERT INTO `lineitem` VALUES (1013, 1045, 'EST-18', 1, 193.50);
INSERT INTO `lineitem` VALUES (1013, 1046, 'EST-19', 1, 15.50);
INSERT INTO `lineitem` VALUES (1014, 1047, 'EST-12', 1, 18.50);
INSERT INTO `lineitem` VALUES (1015, 1048, 'EST-14', 1, 58.50);
INSERT INTO `lineitem` VALUES (1016, 1049, 'EST-27', 4, 155.29);
INSERT INTO `lineitem` VALUES (1020, 1050, 'EST-21', 1, 5.29);
INSERT INTO `lineitem` VALUES (1020, 1051, 'EST-12', 1, 18.50);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `logid` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logdate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `objectid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`logid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (13, 'j2ee', '2019-10-27 16:00:26', 'View Product', 'AV-SB-02');
INSERT INTO `log` VALUES (14, 'j2ee', '2019-10-27 16:00:29', 'Add Item', 'EST-19');
INSERT INTO `log` VALUES (15, 'j2ee', '2019-10-27 16:00:46', 'Pay Order', '1000');
INSERT INTO `log` VALUES (16, 'j2ee', '2019-10-27 16:14:42', 'View Item', 'EST-19');
INSERT INTO `log` VALUES (17, 'j2ee', '2019-10-27 16:14:52', 'Add Item', 'EST-19');
INSERT INTO `log` VALUES (18, 'j2ee', '2019-10-27 16:15:12', 'Pay Order', '1000');
INSERT INTO `log` VALUES (19, 'j2ee', '2019-10-27 16:24:09', 'View Product', 'K9-RT-01');
INSERT INTO `log` VALUES (20, 'j2ee', '2019-10-27 16:24:11', 'Add Item', 'EST-28');
INSERT INTO `log` VALUES (21, 'j2ee', '2019-10-27 16:24:24', 'Pay Order', '1000');
INSERT INTO `log` VALUES (22, 'j2ee', '2019-10-27 16:52:55', 'View Category', 'REPTILES');
INSERT INTO `log` VALUES (23, 'j2ee', '2019-10-27 16:52:57', 'View Product', 'RP-SN-01');
INSERT INTO `log` VALUES (24, 'j2ee', '2019-10-27 16:53:00', 'Add Item', 'EST-12');
INSERT INTO `log` VALUES (25, 'j2ee', '2019-10-27 16:53:21', 'Pay Order', '1000');
INSERT INTO `log` VALUES (26, 'j2ee', '2019-10-27 16:55:37', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (27, 'j2ee', '2019-10-27 16:55:39', 'View Product', 'AV-SB-02');
INSERT INTO `log` VALUES (28, 'j2ee', '2019-10-27 16:55:41', 'Add Item', 'EST-19');
INSERT INTO `log` VALUES (29, 'j2ee', '2019-10-27 17:11:31', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (30, 'j2ee', '2019-10-27 17:11:34', 'View Product', 'AV-SB-02');
INSERT INTO `log` VALUES (31, 'j2ee', '2019-10-27 17:11:36', 'Add Item', 'EST-19');
INSERT INTO `log` VALUES (32, 'j2ee', '2019-10-27 17:11:43', 'Pay Order', '1000');
INSERT INTO `log` VALUES (33, 'j2ee', '2019-10-27 17:13:51', 'View Category', 'DOGS');
INSERT INTO `log` VALUES (34, 'j2ee', '2019-10-27 17:13:54', 'View Product', 'K9-DL-01');
INSERT INTO `log` VALUES (35, 'j2ee', '2019-10-27 17:13:57', 'Add Item', 'EST-9');
INSERT INTO `log` VALUES (36, 'j2ee', '2019-10-27 17:16:42', 'Pay Order', '1000');
INSERT INTO `log` VALUES (37, 'j2ee', '2019-10-27 17:18:50', 'View Category', 'REPTILES');
INSERT INTO `log` VALUES (38, 'j2ee', '2019-10-27 17:18:52', 'View Product', 'RP-SN-01');
INSERT INTO `log` VALUES (39, 'j2ee', '2019-10-27 17:18:56', 'Add Item', 'EST-12');
INSERT INTO `log` VALUES (40, 'j2ee', '2019-10-27 17:19:57', 'Pay Order', '1000');
INSERT INTO `log` VALUES (41, 'j2ee', '2019-10-27 17:22:50', 'Pay Order', '1000');
INSERT INTO `log` VALUES (42, 'j2ee', '2019-10-27 17:35:49', 'Pay Order', '1000');
INSERT INTO `log` VALUES (43, 'j2ee', '2019-10-27 17:40:12', 'Pay Order', '1000');
INSERT INTO `log` VALUES (44, 'j2ee', '2019-10-27 17:57:45', 'View Category', 'REPTILES');
INSERT INTO `log` VALUES (45, 'j2ee', '2019-10-27 17:57:48', 'View Product', 'RP-SN-01');
INSERT INTO `log` VALUES (46, 'j2ee', '2019-10-27 17:58:01', 'View Item', 'EST-12');
INSERT INTO `log` VALUES (47, 'j2ee', '2019-10-27 17:58:03', 'Add Item', 'EST-12');
INSERT INTO `log` VALUES (48, 'j2ee', '2019-10-27 17:58:10', 'Create Order', '1000');
INSERT INTO `log` VALUES (49, 'j2ee', '2019-10-27 17:58:12', 'Pay Order', '1000');
INSERT INTO `log` VALUES (50, 'j2ee', '2019-10-27 18:07:20', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (51, 'j2ee', '2019-10-27 18:07:21', 'View Product', 'AV-SB-02');
INSERT INTO `log` VALUES (52, 'j2ee', '2019-10-27 18:07:23', 'View Item', 'EST-19');
INSERT INTO `log` VALUES (53, 'j2ee', '2019-10-27 18:07:25', 'Add Item', 'EST-19');
INSERT INTO `log` VALUES (54, 'j2ee', '2019-10-27 18:07:32', 'Create Order', '1001');
INSERT INTO `log` VALUES (55, 'j2ee', '2019-10-27 18:07:35', 'Pay Order', '1001');
INSERT INTO `log` VALUES (56, 'j2ee', '2019-10-27 18:22:41', 'View Category', 'DOGS');
INSERT INTO `log` VALUES (57, 'j2ee', '2019-10-27 18:22:43', 'View Product', 'K9-RT-02');
INSERT INTO `log` VALUES (58, 'j2ee', '2019-10-27 18:22:47', 'Add Item', 'EST-25');
INSERT INTO `log` VALUES (59, 'j2ee', '2019-10-27 18:22:52', 'Create Order', '1002');
INSERT INTO `log` VALUES (60, 'j2ee', '2019-10-27 18:22:55', 'Pay Order', '1002');
INSERT INTO `log` VALUES (61, 'j2ee', '2019-10-27 18:37:24', 'View Category', 'REPTILES');
INSERT INTO `log` VALUES (62, 'j2ee', '2019-10-27 18:37:26', 'View Product', 'RP-SN-01');
INSERT INTO `log` VALUES (63, 'j2ee', '2019-10-27 18:37:31', 'Add Item', 'EST-12');
INSERT INTO `log` VALUES (64, 'j2ee', '2019-10-27 18:37:35', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (65, 'j2ee', '2019-10-27 18:37:36', 'View Product', 'AV-SB-02');
INSERT INTO `log` VALUES (66, 'j2ee', '2019-10-27 18:37:38', 'Add Item', 'EST-19');
INSERT INTO `log` VALUES (67, 'j2ee', '2019-10-27 18:37:40', 'View Category', 'FISH');
INSERT INTO `log` VALUES (68, 'j2ee', '2019-10-27 18:37:41', 'View Product', 'FI-FW-02');
INSERT INTO `log` VALUES (69, 'j2ee', '2019-10-27 18:37:43', 'Add Item', 'EST-20');
INSERT INTO `log` VALUES (70, 'j2ee', '2019-10-27 18:37:51', 'Create Order', '1003');
INSERT INTO `log` VALUES (71, 'j2ee', '2019-10-27 18:37:54', 'Pay Order', '1003');
INSERT INTO `log` VALUES (72, 'j2ee', '2019-10-27 19:21:11', 'View Category', 'CATS');
INSERT INTO `log` VALUES (73, 'j2ee', '2019-10-27 19:21:13', 'View Product', 'FL-DSH-01');
INSERT INTO `log` VALUES (74, 'j2ee', '2019-10-27 19:21:15', 'Add Item', 'EST-15');
INSERT INTO `log` VALUES (75, 'j2ee', '2019-10-27 19:21:22', 'Create Order', '1004');
INSERT INTO `log` VALUES (76, 'j2ee', '2019-10-27 19:21:40', 'Create Order', '1005');
INSERT INTO `log` VALUES (77, 'j2ee', '2019-10-27 19:22:09', 'Pay Order', '1005');
INSERT INTO `log` VALUES (78, 'j2ee', '2019-10-27 20:43:49', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (79, 'j2ee', '2019-10-27 20:43:51', 'View Product', 'AV-SB-02');
INSERT INTO `log` VALUES (80, 'j2ee', '2019-10-27 20:43:53', 'Add Item', 'EST-19');
INSERT INTO `log` VALUES (81, 'j2ee', '2019-10-27 20:45:26', 'Create Order', '1006');
INSERT INTO `log` VALUES (82, 'j2ee', '2019-10-28 15:04:54', 'View Category', 'FISH');
INSERT INTO `log` VALUES (83, 'j2ee', '2019-10-28 15:04:57', 'View Product', 'FI-SW-01');
INSERT INTO `log` VALUES (84, 'j2ee', '2019-10-28 15:05:00', 'Add Item', 'EST-1');
INSERT INTO `log` VALUES (85, 'j2ee', '2019-10-28 15:07:52', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (86, 'j2ee', '2019-10-28 15:08:08', 'View Category', 'FISH');
INSERT INTO `log` VALUES (87, 'j2ee', '2019-10-28 15:08:10', 'View Product', 'FI-SW-02');
INSERT INTO `log` VALUES (88, 'j2ee', '2019-10-28 15:08:12', 'Add Item', 'EST-3');
INSERT INTO `log` VALUES (89, 'j2ee', '2019-10-28 15:33:47', 'View Category', 'REPTILES');
INSERT INTO `log` VALUES (90, 'j2ee', '2019-10-28 15:33:51', 'View Product', 'RP-SN-01');
INSERT INTO `log` VALUES (91, 'j2ee', '2019-10-28 15:33:53', 'Add Item', 'EST-12');
INSERT INTO `log` VALUES (92, 'j2ee', '2019-10-28 23:51:46', 'View Category', 'DOGS');
INSERT INTO `log` VALUES (93, 'j2ee', '2019-10-28 23:51:49', 'View Product', 'K9-RT-02');
INSERT INTO `log` VALUES (94, 'j2ee', '2019-10-28 23:51:52', 'Add Item', 'EST-23');
INSERT INTO `log` VALUES (95, 'j2ee', '2019-10-28 23:53:31', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (96, 'j2ee', '2019-10-28 23:53:33', 'View Product', 'AV-SB-02');
INSERT INTO `log` VALUES (97, 'j2ee', '2019-10-28 23:53:35', 'Add Item', 'EST-19');
INSERT INTO `log` VALUES (98, 'j2ee', '2019-10-28 23:54:50', 'View Category', 'CATS');
INSERT INTO `log` VALUES (99, 'j2ee', '2019-10-28 23:54:52', 'View Product', 'FL-DSH-01');
INSERT INTO `log` VALUES (100, 'j2ee', '2019-10-28 23:54:55', 'Add Item', 'EST-15');
INSERT INTO `log` VALUES (101, 'j2ee', '2019-10-28 23:57:46', 'View Category', 'CATS');
INSERT INTO `log` VALUES (102, 'j2ee', '2019-10-28 23:57:48', 'View Product', 'FL-DSH-01');
INSERT INTO `log` VALUES (103, 'j2ee', '2019-10-28 23:57:51', 'Add Item', 'EST-15');
INSERT INTO `log` VALUES (104, 'j2ee', '2019-10-29 00:03:05', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (105, 'j2ee', '2019-10-29 00:12:23', 'View Category', 'DOGS');
INSERT INTO `log` VALUES (106, 'j2ee', '2019-10-29 00:39:57', 'Create Order', '1007');
INSERT INTO `log` VALUES (107, 'j2ee', '2019-10-29 03:29:11', 'Create Order', '1008');
INSERT INTO `log` VALUES (108, 'j2ee', '2019-10-29 08:36:00', 'Create Order', '1009');
INSERT INTO `log` VALUES (109, 'j2ee', '2019-10-29 08:41:09', 'View Category', 'DOGS');
INSERT INTO `log` VALUES (110, 'j2ee', '2019-10-29 08:41:36', 'Create Order', '1010');
INSERT INTO `log` VALUES (111, 'j2ee', '2019-10-29 08:45:50', 'Create Order', '1011');
INSERT INTO `log` VALUES (112, 'j2ee', '2019-10-29 08:45:54', 'Pay Order', '1011');
INSERT INTO `log` VALUES (113, 'j2ee', '2019-10-29 10:43:52', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (114, 'j2ee', '2019-10-29 10:43:55', 'View Product', 'AV-SB-02');
INSERT INTO `log` VALUES (115, 'j2ee', '2019-10-29 10:43:57', 'Add Item', 'EST-19');
INSERT INTO `log` VALUES (116, 'j2ee', '2019-10-29 10:44:00', 'View Item', 'EST-19');
INSERT INTO `log` VALUES (117, 'j2ee', '2019-10-29 10:44:02', 'Add Item', 'EST-19');
INSERT INTO `log` VALUES (118, 'j2ee', '2019-10-29 10:44:04', 'View Item', 'EST-19');
INSERT INTO `log` VALUES (119, 'j2ee', '2019-10-29 10:44:08', 'View Product', 'AV-SB-02');
INSERT INTO `log` VALUES (120, 'j2ee', '2019-10-29 10:44:11', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (121, 'j2ee', '2019-10-29 10:44:13', 'View Product', 'AV-CB-01');
INSERT INTO `log` VALUES (122, 'j2ee', '2019-10-29 10:44:16', 'Add Item', 'EST-18');
INSERT INTO `log` VALUES (123, 'j2ee', '2019-10-29 10:44:19', 'View Category', 'REPTILES');
INSERT INTO `log` VALUES (124, 'j2ee', '2019-10-29 10:44:20', 'View Product', 'RP-SN-01');
INSERT INTO `log` VALUES (125, 'j2ee', '2019-10-29 10:44:22', 'Add Item', 'EST-12');
INSERT INTO `log` VALUES (126, 'j2ee', '2019-10-29 10:44:25', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (127, 'j2ee', '2019-10-29 10:44:27', 'View Product', 'AV-CB-01');
INSERT INTO `log` VALUES (128, 'j2ee', '2019-10-29 10:44:29', 'Add Item', 'EST-18');
INSERT INTO `log` VALUES (129, 'j2ee', '2019-10-29 10:44:50', 'Remove Item', 'EST-18');
INSERT INTO `log` VALUES (130, 'j2ee', '2019-10-29 10:44:51', 'Remove Item', 'EST-19');
INSERT INTO `log` VALUES (131, 'j2ee', '2019-10-29 10:54:21', 'View Product', 'FI-SW-01');
INSERT INTO `log` VALUES (132, 'j2ee', '2019-10-29 10:54:24', 'Add Item', 'EST-2');
INSERT INTO `log` VALUES (133, 'j2ee', '2019-10-29 10:58:26', 'View Product', 'FI-SW-01');
INSERT INTO `log` VALUES (134, 'j2ee', '2019-10-29 10:58:32', 'Add Item', 'EST-1');
INSERT INTO `log` VALUES (135, 'j2ee', '2019-10-29 11:02:29', 'View Category', 'CATS');
INSERT INTO `log` VALUES (136, 'j2ee', '2019-10-29 11:08:34', 'View Product', 'K9-CW-01');
INSERT INTO `log` VALUES (137, 'j2ee', '2019-10-29 11:08:38', 'Add Item', 'EST-26');
INSERT INTO `log` VALUES (138, 'j2ee', '2019-10-29 11:09:56', 'Add Item', 'EST-26');
INSERT INTO `log` VALUES (139, 'j2ee', '2019-10-29 11:14:56', 'View Product', 'K9-CW-01');
INSERT INTO `log` VALUES (140, 'j2ee', '2019-10-29 11:14:58', 'View Item', 'EST-27');
INSERT INTO `log` VALUES (141, 'j2ee', '2019-10-29 11:15:00', 'Add Item', 'EST-27');
INSERT INTO `log` VALUES (142, 'j2ee', '2019-10-29 11:18:50', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (143, 'j2ee', '2019-10-29 11:18:52', 'View Product', 'AV-CB-01');
INSERT INTO `log` VALUES (144, 'j2ee', '2019-10-29 11:18:54', 'View Item', 'EST-18');
INSERT INTO `log` VALUES (145, 'j2ee', '2019-10-29 11:18:57', 'Add Item', 'EST-18');
INSERT INTO `log` VALUES (146, 'j2ee', '2019-10-29 11:22:38', 'View Product', 'K9-CW-01');
INSERT INTO `log` VALUES (147, 'j2ee', '2019-10-29 11:22:41', 'Add Item', 'EST-27');
INSERT INTO `log` VALUES (148, 'j2ee', '2019-10-29 11:39:38', 'View Product', 'K9-CW-01');
INSERT INTO `log` VALUES (149, 'j2ee', '2019-10-29 11:39:41', 'View Item', 'EST-26');
INSERT INTO `log` VALUES (150, 'j2ee', '2019-10-30 23:44:59', 'Create Order', '1012');
INSERT INTO `log` VALUES (151, 'j2ee', '2019-10-30 23:45:06', 'Pay Order', '1012');
INSERT INTO `log` VALUES (152, 'j2ee', '2019-10-31 00:14:31', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (153, 'j2ee', '2019-10-31 00:14:33', 'View Product', 'AV-SB-02');
INSERT INTO `log` VALUES (154, 'j2ee', '2019-10-31 00:14:34', 'Add Item', 'EST-19');
INSERT INTO `log` VALUES (155, 'j2ee', '2019-10-31 00:14:37', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (156, 'j2ee', '2019-10-31 00:14:38', 'View Product', 'AV-CB-01');
INSERT INTO `log` VALUES (157, 'j2ee', '2019-10-31 00:14:41', 'Add Item', 'EST-18');
INSERT INTO `log` VALUES (158, 'j2ee', '2019-10-31 00:14:43', 'View Category', 'CATS');
INSERT INTO `log` VALUES (159, 'j2ee', '2019-10-31 00:14:44', 'View Product', 'FL-DLH-02');
INSERT INTO `log` VALUES (160, 'j2ee', '2019-10-31 00:14:46', 'View Item', 'EST-17');
INSERT INTO `log` VALUES (161, 'j2ee', '2019-10-31 00:14:48', 'Add Item', 'EST-17');
INSERT INTO `log` VALUES (162, 'j2ee', '2019-10-31 01:08:17', 'Create Order', '1013');
INSERT INTO `log` VALUES (163, 'j2ee', '2019-10-31 01:08:31', 'Pay Order', '1013');
INSERT INTO `log` VALUES (164, 'j2ee', '2019-10-31 01:54:58', 'View Category', 'REPTILES');
INSERT INTO `log` VALUES (165, 'j2ee', '2019-10-31 01:55:00', 'View Product', 'RP-LI-02');
INSERT INTO `log` VALUES (166, 'j2ee', '2019-10-31 01:55:03', 'Add Item', 'EST-13');
INSERT INTO `log` VALUES (167, 'j2ee', '2019-10-31 01:55:19', 'Remove Item', 'EST-13');
INSERT INTO `log` VALUES (168, 'j2ee', '2019-10-31 01:55:23', 'View Category', 'CATS');
INSERT INTO `log` VALUES (169, 'j2ee', '2019-10-31 01:55:24', 'View Product', 'FL-DSH-01');
INSERT INTO `log` VALUES (170, 'j2ee', '2019-10-31 01:55:26', 'Add Item', 'EST-15');
INSERT INTO `log` VALUES (171, 'j2ee', '2019-10-31 02:25:47', 'View Category', 'REPTILES');
INSERT INTO `log` VALUES (172, 'j2ee', '2019-10-31 02:25:48', 'View Product', 'RP-SN-01');
INSERT INTO `log` VALUES (173, 'j2ee', '2019-10-31 02:25:51', 'Add Item', 'EST-12');
INSERT INTO `log` VALUES (174, 'j2ee', '2019-10-31 02:25:58', 'Create Order', '1014');
INSERT INTO `log` VALUES (175, 'j2ee', '2019-10-31 02:26:01', 'Pay Order', '1014');
INSERT INTO `log` VALUES (176, 'j2ee', '2019-10-31 08:39:43', 'View Category', 'CATS');
INSERT INTO `log` VALUES (177, 'j2ee', '2019-10-31 08:39:45', 'View Product', 'FL-DSH-01');
INSERT INTO `log` VALUES (178, 'j2ee', '2019-10-31 08:39:48', 'Add Item', 'EST-14');
INSERT INTO `log` VALUES (179, 'j2ee', '2019-10-31 08:39:52', 'View Category', 'DOGS');
INSERT INTO `log` VALUES (180, 'j2ee', '2019-10-31 08:39:54', 'View Product', 'K9-CW-01');
INSERT INTO `log` VALUES (181, 'j2ee', '2019-10-31 08:39:56', 'Add Item', 'EST-27');
INSERT INTO `log` VALUES (182, 'j2ee', '2019-10-31 08:40:06', 'Create Order', '1015');
INSERT INTO `log` VALUES (183, 'j2ee', '2019-10-31 08:40:10', 'Pay Order', '1015');
INSERT INTO `log` VALUES (184, 'j2ee', '2019-11-01 22:41:50', 'Create Order', '1016');
INSERT INTO `log` VALUES (185, 'j2ee', '2019-11-01 22:41:53', 'Pay Order', '1016');
INSERT INTO `log` VALUES (186, 'j2ee', '2019-11-30 03:02:35', 'View Category', 'REPTILES');
INSERT INTO `log` VALUES (187, 'j2ee', '2019-11-30 03:02:38', 'View Product', 'RP-SN-01');
INSERT INTO `log` VALUES (188, 'j2ee', '2019-11-30 03:02:40', 'Add Item', 'EST-12');
INSERT INTO `log` VALUES (189, 'j2ee', '2019-11-30 03:21:06', 'Create Order', '1017');
INSERT INTO `log` VALUES (190, 'j2ee', '2019-11-30 03:21:45', 'Create Order', '1018');
INSERT INTO `log` VALUES (191, 'j2ee', '2020-03-29 17:57:55', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (192, 'j2ee', '2020-03-29 17:57:57', 'View Product', 'AV-CB-01');
INSERT INTO `log` VALUES (193, 'j2ee', '2020-03-29 17:58:00', 'Add Item', 'EST-18');
INSERT INTO `log` VALUES (194, 'j2ee', '2020-03-29 17:58:12', 'Create Order', '1019');
INSERT INTO `log` VALUES (195, 'j2ee', '2020-03-29 17:58:16', 'Pay Order', '1019');
INSERT INTO `log` VALUES (196, 'j2ee', '2020-03-29 17:58:38', 'View Category', 'FISH');
INSERT INTO `log` VALUES (197, 'j2ee', '2020-03-29 17:58:40', 'View Product', 'FI-FW-02');
INSERT INTO `log` VALUES (198, 'j2ee', '2020-03-29 17:58:42', 'Add Item', 'EST-21');
INSERT INTO `log` VALUES (199, 'j2ee', '2020-03-29 17:58:52', 'Create Order', '1020');
INSERT INTO `log` VALUES (200, 'j2ee', '2020-03-29 17:58:54', 'Pay Order', '1020');
INSERT INTO `log` VALUES (201, 'j2ee', '2020-03-29 22:51:55', 'View Category', 'FISH');
INSERT INTO `log` VALUES (202, 'j2ee', '2020-03-29 22:52:46', 'View Category', 'FISH');
INSERT INTO `log` VALUES (203, 'j2ee', '2020-03-29 22:52:52', 'View Product', 'K9-RT-02');
INSERT INTO `log` VALUES (204, 'j2ee', '2020-03-29 22:53:17', 'View Category', 'FISH');
INSERT INTO `log` VALUES (205, 'j2ee', '2020-03-29 22:53:19', 'View Category', 'BIRDS');
INSERT INTO `log` VALUES (206, 'j2ee', '2020-03-29 22:53:22', 'View Category', 'DOGS');
INSERT INTO `log` VALUES (207, 'j2ee', '2020-03-29 22:53:30', 'View Product', 'K9-RT-02');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderdate` date NOT NULL,
  `shipaddr1` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shipaddr2` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shipcity` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shipstate` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shipzip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shipcountry` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `billaddr1` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `billaddr2` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billcity` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `billstate` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `billzip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `billcountry` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courier` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `totalprice` decimal(10, 2) NOT NULL,
  `billtofirstname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `billtolastname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shiptofirstname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shiptolastname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creditcard` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exprdate` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cardtype` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `locale` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1017 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (999, 'j2ee', '2019-10-21', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 19.20, 'a', 'a', 'a', 'a', '9999', 'a', 'visa', 'a');
INSERT INTO `orders` VALUES (1000, 'j2ee', '2019-10-27', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'USA', 'xixi', 'haha', 'lala', 'caca', '123', 'English', 'UPS', 39.50, 'John', 'Smith', 'John', 'Smith', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1001, 'j2ee', '2019-10-27', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'USA', 'xixi', 'haha', 'lala', 'caca', '123', 'English', 'UPS', 23.50, 'John', 'Smith', 'John', 'Smith', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1002, 'j2ee', '2019-10-27', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'USA', 'xixi', 'haha', 'lala', 'caca', '123', 'English', 'UPS', 23.50, 'John', 'Smith', 'John', 'Smith', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1003, 'j2ee', '2019-10-27', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'USA', 'xixi', 'haha', 'lala', 'caca', '123', 'English', 'UPS', 15.50, 'John', 'Smith', 'John', 'Smith', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1004, 'j2ee', '2019-10-28', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'USA', 'xixi', 'haha', 'lala', 'caca', '123', 'English', 'UPS', 276.99, 'John', 'Smith', 'John', 'Smith', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1005, 'j2ee', '2019-10-28', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'USA', 'xixi', 'haha', 'lala', 'caca', '123', 'English', 'UPS', 276.99, 'John', 'Smith', 'John', 'Smith', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1006, 'j2ee', '2019-10-29', '', '', '', '', '', '', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 276.99, 'John', 'Smith', '', '', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1007, 'j2ee', '2019-10-29', '', '', '', '', '', '', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 276.99, 'John', 'Smith', '', '', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1008, 'j2ee', '2019-10-29', '', '', '', '', '', '', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 276.99, 'John', 'Smith', '', '', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1009, 'j2ee', '2019-10-30', '', '', '', '', '', '', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 963.87, 'John', 'Smith', '', '', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1010, 'j2ee', '2019-10-30', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'USA', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 302.50, 'John', 'Smith', 'John', 'Smith', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1011, 'j2ee', '2019-10-30', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'USA', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 18.50, 'John', 'Smith', 'John', 'Smith', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1012, 'j2ee', '2019-10-31', '', '', '', '', '', '', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 58.50, 'John', 'Smith', '', '', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1013, 'j2ee', '2019-11-01', '', '', '', '', '', '', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 621.16, 'John', 'Smith', '', '', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1014, 'j2ee', '2019-11-29', '', '', '', '', '', '', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 0.00, 'John', 'Smith', '', '', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1015, 'j2ee', '2019-11-29', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'USA', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 0.00, 'John', 'Smith', 'John', 'Smith', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1016, 'j2ee', '2020-03-29', '', '', '', '', '', '', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 0.00, 'John', 'Smith', '', '', '12345', ' 12/2019', 'visa', 'CA');
INSERT INTO `orders` VALUES (1017, 'j2ee', '2020-03-29', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'USA', '902 San Antonio Road', 'MS UCUP03-306', 'John', 'CB', '94415', 'English', 'UPS', 23.79, 'John', 'Smith', 'John', 'Smith', '12345', ' 12/2019', 'visa', 'CA');

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus`  (
  `orderid` int(11) NOT NULL,
  `timestamp` date NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------
INSERT INTO `orderstatus` VALUES (999, '2019-10-21', 'Paid');
INSERT INTO `orderstatus` VALUES (1000, '2019-10-27', 'Paid');
INSERT INTO `orderstatus` VALUES (1001, '2019-10-27', 'Paid');
INSERT INTO `orderstatus` VALUES (1002, '2019-10-27', 'Paid');
INSERT INTO `orderstatus` VALUES (1003, '2019-10-27', 'Paid');
INSERT INTO `orderstatus` VALUES (1004, '2019-10-27', 'Not Paid');
INSERT INTO `orderstatus` VALUES (1005, '2019-10-27', 'Paid');
INSERT INTO `orderstatus` VALUES (1006, '2019-10-27', 'Not Paid');
INSERT INTO `orderstatus` VALUES (1007, '2019-10-28', 'Not Paid');
INSERT INTO `orderstatus` VALUES (1008, '2019-10-28', 'Not Paid');
INSERT INTO `orderstatus` VALUES (1009, '2019-10-29', 'Not Paid');
INSERT INTO `orderstatus` VALUES (1010, '2019-10-29', 'Not Paid');
INSERT INTO `orderstatus` VALUES (1011, '2019-10-29', 'Paid');
INSERT INTO `orderstatus` VALUES (1012, '2019-10-30', 'Paid');
INSERT INTO `orderstatus` VALUES (1013, '2019-10-30', 'Paid');
INSERT INTO `orderstatus` VALUES (1014, '2019-10-30', 'Paid');
INSERT INTO `orderstatus` VALUES (1015, '2019-10-31', 'Paid');
INSERT INTO `orderstatus` VALUES (1016, '2019-11-01', 'Paid');
INSERT INTO `orderstatus` VALUES (1017, '2019-11-29', 'Not Paid');
INSERT INTO `orderstatus` VALUES (1018, '2019-11-29', 'Not Paid');
INSERT INTO `orderstatus` VALUES (1019, '2020-03-29', 'Paid');
INSERT INTO `orderstatus` VALUES (1020, '2020-03-29', 'Paid');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productid` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productid`) USING BTREE,
  INDEX `productCat`(`category`) USING BTREE,
  INDEX `productName`(`name`) USING BTREE,
  CONSTRAINT `fk_product_1` FOREIGN KEY (`category`) REFERENCES `category` (`catid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('AV-CB-01', 'BIRDS', 'Amazon Parrot', '../images/bird2.gif', 'Great companion for up to 75 years');
INSERT INTO `product` VALUES ('AV-SB-02', 'BIRDS', 'Finch', '../images/bird1.gif', 'Great stress reliever');
INSERT INTO `product` VALUES ('FI-FW-01', 'FISH', 'Koi', '../images/fish3.gif', 'Fresh Water fish from Japan');
INSERT INTO `product` VALUES ('FI-FW-02', 'FISH', 'Goldfish', '../images/fish2.gif', 'Fresh Water fish from China');
INSERT INTO `product` VALUES ('FI-SW-01', 'FISH', 'Angelfish', '../images/fish1.gif', 'Salt Water fish from Australia');
INSERT INTO `product` VALUES ('FI-SW-02', 'FISH', 'Tiger Shark', '../images/fish4.gif', 'Salt Water fish from Australia');
INSERT INTO `product` VALUES ('FL-DLH-02', 'CATS', 'Persian', '../images/cat1.gif', 'Friendly house cat, doubles as a princess');
INSERT INTO `product` VALUES ('FL-DSH-01', 'CATS', 'Manx', '../images/cat2.gif', 'Great for reducing mouse populations');
INSERT INTO `product` VALUES ('K9-BD-01', 'DOGS', 'Bulldog', '../images/dog2.gif', 'Friendly dog from England');
INSERT INTO `product` VALUES ('K9-CW-01', 'DOGS', 'Chihuahua', '../images/dog4.gif', 'Great companion dog');
INSERT INTO `product` VALUES ('K9-DL-01', 'DOGS', 'Dalmation', '../images/dog5.gif', 'Great dog for a Fire Station');
INSERT INTO `product` VALUES ('K9-PO-02', 'DOGS', 'Poodle', '../images/dog6.gif', 'Cute dog from France');
INSERT INTO `product` VALUES ('K9-RT-01', 'DOGS', 'Golden Retriever', '../images/dog1.gif', 'Great family dog');
INSERT INTO `product` VALUES ('K9-RT-02', 'DOGS', 'Labrador Retriever', '../images/dog5.gif', 'Great hunting dog');
INSERT INTO `product` VALUES ('RP-LI-02', 'REPTILES', 'Iguana', '../images/lizard1.gif', 'Friendly green friend');
INSERT INTO `product` VALUES ('RP-SN-01', 'REPTILES', 'Rattlesnake', '../images/lizard1.gif', 'Doubles as a watch dog');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `userid` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `langpref` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `favcategory` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mylistopt` tinyint(1) NULL DEFAULT NULL,
  `banneropt` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('a', 'japanese', 'DOGS', NULL, NULL);
INSERT INTO `profile` VALUES ('ACID', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('j2ee', 'English', 'DOGS', 1, 1);
INSERT INTO `profile` VALUES ('xyz', 'japanese', 'DOGS', NULL, NULL);

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence`  (
  `typename` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nextid` int(11) NOT NULL,
  PRIMARY KEY (`typename`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('cartnum', 1000);
INSERT INTO `sequence` VALUES ('linenum', 1052);
INSERT INTO `sequence` VALUES ('ordernum', 1021);

-- ----------------------------
-- Table structure for signon
-- ----------------------------
DROP TABLE IF EXISTS `signon`;
CREATE TABLE `signon`  (
  `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of signon
-- ----------------------------
INSERT INTO `signon` VALUES ('a', 'a');
INSERT INTO `signon` VALUES ('ACID', 'ACID');
INSERT INTO `signon` VALUES ('admin', '1234');
INSERT INTO `signon` VALUES ('j2ee', 'j2ee');
INSERT INTO `signon` VALUES ('xyz', 'xyz');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `suppid` int(11) NOT NULL,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr1` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr2` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`suppid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, 'XYZ Pets', 'AC', '600 Avon Way', '', 'Los Angeles', 'CA', '94024', '212-947-0797');
INSERT INTO `supplier` VALUES (2, 'ABC Pets', 'AC', '700 Abalone Way', '', 'San Francisco ', 'CA', '94024', '415-947-0797');

SET FOREIGN_KEY_CHECKS = 1;
