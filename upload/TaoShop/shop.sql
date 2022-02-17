/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-07-27 16:02:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `m_time` date DEFAULT NULL,
  `m_type` varchar(255) DEFAULT NULL COMMENT '充值/消费/提现',
  `m_amoney` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`m_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', '2019-03-05', '消费', '-100');
INSERT INTO `account` VALUES ('2', '1', '2019-03-06', '提现', '-100');
INSERT INTO `account` VALUES ('3', '1', '2019-03-07', '充值', '+100');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_username` varchar(255) DEFAULT NULL,
  `ad_password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE,
  KEY `roleIdpre` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '客服', '123456', '3');
INSERT INTO `admin` VALUES ('2', 'admin', 'admin', '1');
INSERT INTO `admin` VALUES ('3', '库管小刘', '123456', '2');

-- ----------------------------
-- Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '个人信息');
INSERT INTO `admin_menu` VALUES ('2', '人员管理');
INSERT INTO `admin_menu` VALUES ('3', '图片管理');
INSERT INTO `admin_menu` VALUES ('4', '订单管理');
INSERT INTO `admin_menu` VALUES ('5', '图表统计');
INSERT INTO `admin_menu` VALUES ('6', '商品管理');

-- ----------------------------
-- Table structure for `admin_menu_child`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu_child`;
CREATE TABLE `admin_menu_child` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_menu_name` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `child_menu_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin_menu_child
-- ----------------------------
INSERT INTO `admin_menu_child` VALUES ('1', '用户管理', '2', '/admin/user/mainToUserinfo');
INSERT INTO `admin_menu_child` VALUES ('2', '员工管理', '2', '/admin/user/mainToAdmin');
INSERT INTO `admin_menu_child` VALUES ('3', '订单管理', '4', '/admin/order/mainToAdminOrder');
INSERT INTO `admin_menu_child` VALUES ('4', '上传图片', '3', '/admin/img/mainToAdminImg');
INSERT INTO `admin_menu_child` VALUES ('5', '商品管理', '6', '/admin/snackinfo/mainToAdminSnackinfo');
INSERT INTO `admin_menu_child` VALUES ('6', '饼图统计', '5', '/admin/map/mainToPieMap');
INSERT INTO `admin_menu_child` VALUES ('7', '个人信息', '1', '/user/mainToAdminuser');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_parentId` int(11) DEFAULT NULL COMMENT '追评',
  `s_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `e_pictureName` varchar(255) DEFAULT NULL COMMENT '上传的图片名字',
  `e_type` int(11) DEFAULT NULL COMMENT '1=好评，0，-1差评',
  `e_score` int(11) DEFAULT NULL COMMENT '评分',
  `info` varchar(255) DEFAULT NULL COMMENT '评语',
  `e_date` date DEFAULT NULL COMMENT '评价日期',
  PRIMARY KEY (`e_id`) USING BTREE,
  KEY `u_idpre` (`u_id`) USING BTREE,
  KEY `s_idpre` (`s_id`) USING BTREE,
  CONSTRAINT `s_idpre` FOREIGN KEY (`s_id`) REFERENCES `snackinfo` (`s_id`),
  CONSTRAINT `u_idpre` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `integral`
-- ----------------------------
DROP TABLE IF EXISTS `integral`;
CREATE TABLE `integral` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `i_number` int(11) DEFAULT NULL COMMENT '获得积分',
  `i_time` date DEFAULT NULL COMMENT '操作时间',
  `i_dese` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`i_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of integral
-- ----------------------------
INSERT INTO `integral` VALUES ('1', '1', '6', '2019-03-01', '每天登录送积分');
INSERT INTO `integral` VALUES ('2', '1', '5', '2019-02-28', '每天登录送积分');
INSERT INTO `integral` VALUES ('3', '1', '4', '2019-02-27', '每天登录送积分');
INSERT INTO `integral` VALUES ('4', '1', '3', '2019-03-02', '每天登录送积分');
INSERT INTO `integral` VALUES ('5', '1', '2', '2019-03-03', '每天登录送积分');
INSERT INTO `integral` VALUES ('6', '1', '1', '2019-03-04', '每天登录送积分');
INSERT INTO `integral` VALUES ('7', '1', '7', '2019-03-25', '每天登录送积分');
INSERT INTO `integral` VALUES ('8', '1', '8', '2019-03-24', '每天登录送积分');
INSERT INTO `integral` VALUES ('9', '1', '9', '2019-03-23', '每天登录送积分');
INSERT INTO `integral` VALUES ('10', '1', '10', '2019-03-22', '每天登录送积分');
INSERT INTO `integral` VALUES ('11', '1', '11', '2019-03-21', '每天登录送积分');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `u_id` int(11) DEFAULT NULL,
  `e_id` int(11) DEFAULT NULL COMMENT '操作员ID',
  `o_time` date DEFAULT NULL,
  `o_type` int(11) DEFAULT NULL COMMENT '-1:未发货；1:完成，0：已发货',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('84', '201903272559', '12', '2', '2019-03-27', '1');
INSERT INTO `order` VALUES ('125', '201911024234', '17', '1', '2019-11-02', '0');
INSERT INTO `order` VALUES ('126', '201911045281', '18', '2', '2019-11-04', '1');
INSERT INTO `order` VALUES ('127', '201912053444', '19', '2', '2019-12-05', '1');
INSERT INTO `order` VALUES ('128', '201912074630', '20', '2', '2019-12-07', '0');
INSERT INTO `order` VALUES ('129', '201912075605', '20', null, '2019-12-07', '-2');
INSERT INTO `order` VALUES ('131', '201912077894', '20', null, '2019-12-07', '-1');
INSERT INTO `order` VALUES ('132', '201912078303', '20', '2', '2019-12-07', '1');
INSERT INTO `order` VALUES ('133', '201907198495', '21', '2', '2019-07-19', '0');
INSERT INTO `order` VALUES ('134', '201907203681', '20', null, '2019-07-20', '-2');
INSERT INTO `order` VALUES ('135', '201907225838', '18', null, '2019-07-22', '-2');
INSERT INTO `order` VALUES ('136', '201907236456', '18', null, '2019-07-23', '-1');
INSERT INTO `order` VALUES ('137', '201907239057', '18', null, '2019-07-23', '-1');
INSERT INTO `order` VALUES ('138', '201907233843', '18', null, '2019-07-23', '-1');
INSERT INTO `order` VALUES ('139', '201907238458', '18', null, '2019-07-23', '-1');
INSERT INTO `order` VALUES ('140', '201907232238', '18', null, '2019-07-23', '-2');
INSERT INTO `order` VALUES ('141', '201907234621', '18', null, '2019-07-23', '-1');
INSERT INTO `order` VALUES ('142', '201907235288', '18', null, '2019-07-23', '-1');
INSERT INTO `order` VALUES ('143', '201907231238', '18', null, '2019-07-23', '-1');
INSERT INTO `order` VALUES ('152', '201907243479', '18', null, '2019-07-24', '-2');
INSERT INTO `order` VALUES ('153', '201907248726', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('154', '201907241936', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('156', '201907248496', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('157', '201907243858', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('159', '201907245909', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('167', '201907244353', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('168', '201907241417', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('170', '201907242391', '18', null, '2019-07-24', '-2');
INSERT INTO `order` VALUES ('171', '201907246594', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('172', '201907247843', '18', null, '2019-07-24', '-2');
INSERT INTO `order` VALUES ('174', '201907246769', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('175', '201907249013', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('177', '201907246369', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('178', '201907245195', '18', null, '2019-07-24', '-2');
INSERT INTO `order` VALUES ('179', '201907247880', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('180', '201907242582', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('181', '201907246325', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('182', '201907242116', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('183', '201907246179', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('184', '201907248783', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('185', '201907242923', '18', null, '2019-07-24', '-2');
INSERT INTO `order` VALUES ('186', '201907243739', '18', null, '2019-07-24', '-1');
INSERT INTO `order` VALUES ('190', '201907251250', '18', null, '2019-07-25', '-1');
INSERT INTO `order` VALUES ('191', '201907253886', '18', null, '2019-07-25', '-1');
INSERT INTO `order` VALUES ('192', '201907252833', '18', null, '2019-07-25', '-1');
INSERT INTO `order` VALUES ('196', '201907252811', '18', null, '2019-07-25', '-1');
INSERT INTO `order` VALUES ('197', '201907254920', '18', null, '2019-07-25', '-1');
INSERT INTO `order` VALUES ('198', '201907259315', '18', null, '2019-07-25', '-1');
INSERT INTO `order` VALUES ('199', '201907258833', '18', null, '2019-07-25', '-1');
INSERT INTO `order` VALUES ('201', '201907259262', '18', null, '2019-07-25', '-2');
INSERT INTO `order` VALUES ('202', '201907253314', '21', null, '2019-07-25', '-2');
INSERT INTO `order` VALUES ('203', '201907269199', '18', null, '2019-07-26', '-2');
INSERT INTO `order` VALUES ('204', '201907268982', '18', null, '2019-07-26', '-2');

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `o_num` int(11) DEFAULT NULL,
  `o_money` double DEFAULT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('94', '201903272559', '20', '2', '10');
INSERT INTO `orderdetail` VALUES ('154', '201911024234', '26', '1', '16');
INSERT INTO `orderdetail` VALUES ('155', '201911024234', '25', '1', '1');
INSERT INTO `orderdetail` VALUES ('156', '201911045281', '82', '2', '10');
INSERT INTO `orderdetail` VALUES ('157', '201912053444', '39', '2', '20');
INSERT INTO `orderdetail` VALUES ('158', '201912053444', '32', '3', '10');
INSERT INTO `orderdetail` VALUES ('159', '201912074630', '67', '3', '16');
INSERT INTO `orderdetail` VALUES ('160', '201912074630', '55', '2', '9');
INSERT INTO `orderdetail` VALUES ('161', '201912074630', '39', '1', '20');
INSERT INTO `orderdetail` VALUES ('162', '201912075605', '49', '1', '14');
INSERT INTO `orderdetail` VALUES ('163', '201912075605', '45', '1', '27');
INSERT INTO `orderdetail` VALUES ('164', '201912075605', '30', '1', '8');
INSERT INTO `orderdetail` VALUES ('166', '201912077894', '72', '2', '14');
INSERT INTO `orderdetail` VALUES ('167', '201912077894', '32', '1', '10');
INSERT INTO `orderdetail` VALUES ('168', '201912078303', '66', '1', '16');
INSERT INTO `orderdetail` VALUES ('169', '201912078303', '34', '1', '12');
INSERT INTO `orderdetail` VALUES ('170', '201907198495', '41', '1', '16');
INSERT INTO `orderdetail` VALUES ('171', '201907198495', '26', '1', '16');
INSERT INTO `orderdetail` VALUES ('172', '201907198495', '68', '1', '5');
INSERT INTO `orderdetail` VALUES ('173', '201907203681', '55', '1', '18');
INSERT INTO `orderdetail` VALUES ('174', '201907225838', '81', '1', '2.5');
INSERT INTO `orderdetail` VALUES ('175', '201907236456', '55', '1', '18');
INSERT INTO `orderdetail` VALUES ('176', '201907239057', '42', '1', '15');
INSERT INTO `orderdetail` VALUES ('177', '201907233843', '42', '1', '15');
INSERT INTO `orderdetail` VALUES ('178', '201907238458', '56', '1', '12');
INSERT INTO `orderdetail` VALUES ('179', '201907232238', '43', '1', '10');
INSERT INTO `orderdetail` VALUES ('180', '201907234621', '81', '1', '2.5');
INSERT INTO `orderdetail` VALUES ('181', '201907235288', '81', '2', '2.5');
INSERT INTO `orderdetail` VALUES ('182', '201907231238', '53', '1', '18');
INSERT INTO `orderdetail` VALUES ('191', '201907243479', '81', '1', '2.5');
INSERT INTO `orderdetail` VALUES ('192', '201907248726', '84', '1', '24');
INSERT INTO `orderdetail` VALUES ('193', '201907241936', '83', '1', '10');
INSERT INTO `orderdetail` VALUES ('195', '201907248496', '81', '1', '2.5');
INSERT INTO `orderdetail` VALUES ('196', '201907243858', '30', '1', '800');
INSERT INTO `orderdetail` VALUES ('198', '201907245909', '55', '1', '18');
INSERT INTO `orderdetail` VALUES ('208', '201907244353', '47', '1', '22.5');
INSERT INTO `orderdetail` VALUES ('209', '201907241417', '27', '1', '700');
INSERT INTO `orderdetail` VALUES ('211', '201907242391', '40', '1', '15');
INSERT INTO `orderdetail` VALUES ('212', '201907246594', '40', '1', '15');
INSERT INTO `orderdetail` VALUES ('213', '201907247843', '27', '1', '700');
INSERT INTO `orderdetail` VALUES ('215', '201907246769', '30', '1', '800');
INSERT INTO `orderdetail` VALUES ('216', '201907249013', '85', '1', '24');
INSERT INTO `orderdetail` VALUES ('218', '201907246369', '26', '1', '800');
INSERT INTO `orderdetail` VALUES ('219', '201907245195', '30', '1', '800');
INSERT INTO `orderdetail` VALUES ('220', '201907247880', '26', '1', '800');
INSERT INTO `orderdetail` VALUES ('221', '201907242582', '40', '1', '15');
INSERT INTO `orderdetail` VALUES ('222', '201907246325', '54', '1', '24');
INSERT INTO `orderdetail` VALUES ('223', '201907242116', '30', '1', '800');
INSERT INTO `orderdetail` VALUES ('224', '201907246179', '40', '1', '15');
INSERT INTO `orderdetail` VALUES ('225', '201907248783', '40', '1', '15');
INSERT INTO `orderdetail` VALUES ('226', '201907242923', '81', '1', '2.5');
INSERT INTO `orderdetail` VALUES ('227', '201907243739', '53', '1', '18');
INSERT INTO `orderdetail` VALUES ('231', '201907251250', '26', '1', '800');
INSERT INTO `orderdetail` VALUES ('232', '201907253886', '54', '1', '24');
INSERT INTO `orderdetail` VALUES ('233', '201907252833', '81', '1', '2.5');
INSERT INTO `orderdetail` VALUES ('240', '201907252811', '30', '1', '800');
INSERT INTO `orderdetail` VALUES ('241', '201907254920', '85', '1', '24');
INSERT INTO `orderdetail` VALUES ('242', '201907254920', '81', '1', '2.5');
INSERT INTO `orderdetail` VALUES ('243', '201907259315', '30', '1', '800');
INSERT INTO `orderdetail` VALUES ('244', '201907258833', '84', '1', '24');
INSERT INTO `orderdetail` VALUES ('246', '201907259262', '30', '1', '800');
INSERT INTO `orderdetail` VALUES ('247', '201907253314', '30', '1', '800');
INSERT INTO `orderdetail` VALUES ('248', '201907269199', '81', '2', '2.5');
INSERT INTO `orderdetail` VALUES ('249', '201907268982', '85', '1', '24');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `perid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `isparent` int(11) DEFAULT NULL,
  `ismenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`perid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '员工管理', '0', '/snack/admin/user/mainToAdmin', '1', '1');
INSERT INTO `permission` VALUES ('2', '员工添加', '1', '/snack/admin/user/addNewAdmin', '0', '1');
INSERT INTO `permission` VALUES ('3', '员工删除', '1', '/snack/admin/user/delAdminById', '0', '1');
INSERT INTO `permission` VALUES ('4', '员工修改', '1', '/snack/admin/user/updateGoAdminById', '0', '1');
INSERT INTO `permission` VALUES ('6', '用户管理', '0', '/snack/admin/user/mainToUserinfo', '1', '1');
INSERT INTO `permission` VALUES ('9', '用户删除', '6', '/snack/admin/user/delUserinfoById', '0', '1');
INSERT INTO `permission` VALUES ('10', '用户修改', '6', '/snack/admin/user/updateGoUserinfoById', '0', '1');
INSERT INTO `permission` VALUES ('13', '订单管理', '0', '/snack/admin/order/mainToAdminOrder', '1', '1');
INSERT INTO `permission` VALUES ('14', '订单修改', '13', '/snack/admin/order/updateSelectAdminOrder', '0', '1');
INSERT INTO `permission` VALUES ('15', '订单删除', '13', '/snack/admin/order/deleteAdminOrder', '0', '1');
INSERT INTO `permission` VALUES ('16', '详情修改', '13', '/snack/admin/order/updateSelectAdminOrderDetial', '0', '1');
INSERT INTO `permission` VALUES ('17', '详情删除', '13', '/snack/admin/order/deleteOrderdetail', '0', '1');
INSERT INTO `permission` VALUES ('19', '图片管理', '0', '/snack/admin/img/mainToAdminImg', '1', '1');
INSERT INTO `permission` VALUES ('20', '上传图片', '19', '/snack/admin/img/upload', '0', '1');
INSERT INTO `permission` VALUES ('21', '商品管理', '0', '/snack/admin/snackinfo/mainToAdminSnackinfo', '0', '1');
INSERT INTO `permission` VALUES ('22', '商品上架', '21', '/snack/admin/snackinfo/addAdminSnack', '0', '1');
INSERT INTO `permission` VALUES ('23', '商品删除', '21', '/snack/admin/snackinfo/delAdminUserinfo', '0', '1');
INSERT INTO `permission` VALUES ('24', '商品修改', '21', '/snack/admin/snackinfo/selectAdminUserinfoBysId', '0', '1');
INSERT INTO `permission` VALUES ('25', '个人信息', '0', '/admin/user/mainToAdminuser', '1', '1');
INSERT INTO `permission` VALUES ('26', '确认发货', '13', '/snack/admin/order/userOrderConfirm', '0', '1');

-- ----------------------------
-- Table structure for `receiptinfo`
-- ----------------------------
DROP TABLE IF EXISTS `receiptinfo`;
CREATE TABLE `receiptinfo` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) DEFAULT NULL,
  `o_name` varchar(255) DEFAULT NULL,
  `o_phone` varchar(255) DEFAULT NULL,
  `o_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of receiptinfo
-- ----------------------------
INSERT INTO `receiptinfo` VALUES ('90', '201903272559', '哈哈', '110110110110', '浙江大学');
INSERT INTO `receiptinfo` VALUES ('131', '201911024234', '学猫叫', '15868526202', '浙江杭州');
INSERT INTO `receiptinfo` VALUES ('132', '201911045281', '你好', '13520109202', '厦门');
INSERT INTO `receiptinfo` VALUES ('133', '201912053444', 'wzn', '13565655656', '上海 浦东');
INSERT INTO `receiptinfo` VALUES ('134', '201912074630', 'odc', '13656565656', '上海 浦东');
INSERT INTO `receiptinfo` VALUES ('135', '201912075605', '张三', '13656565656', '上海');
INSERT INTO `receiptinfo` VALUES ('137', '201912077894', 'wzn', '13565656464', '上海');
INSERT INTO `receiptinfo` VALUES ('138', '201912078303', '张三', '13855544565', '上海');
INSERT INTO `receiptinfo` VALUES ('139', '201907198495', 'king', '13656565658', '厦门');
INSERT INTO `receiptinfo` VALUES ('140', '201907203681', 'yym', '18300676700', 'aaa');
INSERT INTO `receiptinfo` VALUES ('141', '201907225838', 'sd', '18300676700', 'sd');
INSERT INTO `receiptinfo` VALUES ('142', '201907236456', 'fff', '18300676700', '555');
INSERT INTO `receiptinfo` VALUES ('143', '201907239057', 'sss', '18300676700', 'dsd');
INSERT INTO `receiptinfo` VALUES ('144', '201907233843', 'dasd', '18300676700', 'fg');
INSERT INTO `receiptinfo` VALUES ('145', '201907238458', 'eas', '18300676700', '34');
INSERT INTO `receiptinfo` VALUES ('146', '201907232238', '1', '18300676700', '2');
INSERT INTO `receiptinfo` VALUES ('147', '201907234621', '123', '18300676700', '2');
INSERT INTO `receiptinfo` VALUES ('148', '201907235288', '11', '18300676700', '23');
INSERT INTO `receiptinfo` VALUES ('149', '201907231238', '23', '18300067670', '23');
INSERT INTO `receiptinfo` VALUES ('158', '201907243479', '12', '11111111111', '321');
INSERT INTO `receiptinfo` VALUES ('159', '201907248726', '21', '11111111111', '23');
INSERT INTO `receiptinfo` VALUES ('160', '201907241936', '123', '11111111111', '23');
INSERT INTO `receiptinfo` VALUES ('162', '201907248496', '21', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('163', '201907243858', '21', '11111111111', '213');
INSERT INTO `receiptinfo` VALUES ('165', '201907245909', '1', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('173', '201907244353', '3123', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('174', '201907241417', '12', '11111111111', '32');
INSERT INTO `receiptinfo` VALUES ('176', '201907242391', '12', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('177', '201907246594', '21', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('178', '201907247843', '12', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('180', '201907246769', '123', '11111111111', '32');
INSERT INTO `receiptinfo` VALUES ('181', '201907249013', '12', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('183', '201907246369', '123', '11111111111', '212');
INSERT INTO `receiptinfo` VALUES ('184', '201907245195', '123', '11111111111', '213');
INSERT INTO `receiptinfo` VALUES ('185', '201907247880', '123', '11111111111', '321');
INSERT INTO `receiptinfo` VALUES ('186', '201907242582', '123', '11111111111', '212');
INSERT INTO `receiptinfo` VALUES ('187', '201907246325', '123', '11111111111', '23');
INSERT INTO `receiptinfo` VALUES ('188', '201907242116', '31', '11111111111', '312');
INSERT INTO `receiptinfo` VALUES ('189', '201907246179', '132', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('190', '201907248783', '21', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('191', '201907242923', '`12', '11111111111', '231');
INSERT INTO `receiptinfo` VALUES ('192', '201907243739', '213', '11111111111', '23');
INSERT INTO `receiptinfo` VALUES ('196', '201907251250', '12', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('197', '201907253886', '12', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('198', '201907252833', '23', '11111111111', '212');
INSERT INTO `receiptinfo` VALUES ('202', '201907252811', '3123', '11111111111', '212');
INSERT INTO `receiptinfo` VALUES ('203', '201907254920', '312', '11111111111', '1212');
INSERT INTO `receiptinfo` VALUES ('204', '201907259315', '123', '11111111111', '123');
INSERT INTO `receiptinfo` VALUES ('205', '201907258833', 'wang', '12345678900', 'wang');
INSERT INTO `receiptinfo` VALUES ('207', '201907259262', 'wangce', '11111111111', '21');
INSERT INTO `receiptinfo` VALUES ('208', '201907253314', '123', '11111111111', '212');
INSERT INTO `receiptinfo` VALUES ('209', '201907269199', 'wang', '11111111111', '212');
INSERT INTO `receiptinfo` VALUES ('210', '201907268982', '123', '11112121111', 'www');

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `recordNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  KEY `s_idfk` (`s_id`) USING BTREE,
  CONSTRAINT `s_idfk` FOREIGN KEY (`s_id`) REFERENCES `snackinfo` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('13', '20', '2019-02-16', '2');
INSERT INTO `record` VALUES ('14', '23', '2019-03-27', '4');
INSERT INTO `record` VALUES ('15', '20', '2019-03-27', '6');
INSERT INTO `record` VALUES ('16', '20', '2019-03-27', '2');
INSERT INTO `record` VALUES ('17', '23', '2019-03-27', '1');
INSERT INTO `record` VALUES ('18', '21', '2019-03-27', '1');
INSERT INTO `record` VALUES ('19', '20', '2019-03-27', '2');
INSERT INTO `record` VALUES ('20', '21', '2019-03-27', '1');
INSERT INTO `record` VALUES ('21', '24', '2019-03-27', '3');
INSERT INTO `record` VALUES ('22', '23', '2019-03-28', '1');
INSERT INTO `record` VALUES ('23', '21', '2019-03-28', '10');
INSERT INTO `record` VALUES ('24', '21', '2019-03-28', '1');
INSERT INTO `record` VALUES ('25', '20', '2019-03-28', '1');
INSERT INTO `record` VALUES ('26', '24', '2019-03-28', '1');
INSERT INTO `record` VALUES ('27', '24', '2019-03-28', '1');
INSERT INTO `record` VALUES ('28', '23', '2019-03-31', '1');
INSERT INTO `record` VALUES ('29', '23', '2019-04-01', '1');
INSERT INTO `record` VALUES ('30', '20', '2019-04-01', '6');
INSERT INTO `record` VALUES ('31', '24', '2019-04-01', '3');
INSERT INTO `record` VALUES ('32', '20', '2019-04-01', '1');
INSERT INTO `record` VALUES ('33', '23', '2019-04-01', '1');
INSERT INTO `record` VALUES ('34', '62', '2019-04-01', '4');
INSERT INTO `record` VALUES ('35', '27', '2019-04-01', '5');
INSERT INTO `record` VALUES ('36', '45', '2019-04-01', '3');
INSERT INTO `record` VALUES ('37', '51', '2019-04-17', '4');
INSERT INTO `record` VALUES ('38', '34', '2019-04-17', '4');
INSERT INTO `record` VALUES ('39', '26', '2019-04-01', '8');
INSERT INTO `record` VALUES ('40', '30', '2019-04-01', '10');
INSERT INTO `record` VALUES ('41', '51', '2019-04-30', '3');
INSERT INTO `record` VALUES ('42', '33', '2019-04-30', '4');
INSERT INTO `record` VALUES ('43', '26', '2019-04-30', '3');
INSERT INTO `record` VALUES ('44', '56', '2019-04-30', '1');
INSERT INTO `record` VALUES ('45', '26', '2019-10-25', '1');
INSERT INTO `record` VALUES ('46', '26', '2019-10-25', '10');
INSERT INTO `record` VALUES ('47', '26', '2019-10-25', '22');
INSERT INTO `record` VALUES ('48', '34', '2019-10-25', '6');
INSERT INTO `record` VALUES ('49', '26', '2019-11-04', '1');
INSERT INTO `record` VALUES ('50', '25', '2019-11-04', '1');
INSERT INTO `record` VALUES ('51', '39', '2019-12-05', '2');
INSERT INTO `record` VALUES ('52', '32', '2019-12-05', '3');
INSERT INTO `record` VALUES ('53', '82', '2019-12-06', '2');
INSERT INTO `record` VALUES ('54', '67', '2019-12-07', '3');
INSERT INTO `record` VALUES ('55', '55', '2019-12-07', '2');
INSERT INTO `record` VALUES ('56', '39', '2019-12-07', '1');
INSERT INTO `record` VALUES ('57', '66', '2019-12-07', '1');
INSERT INTO `record` VALUES ('58', '34', '2019-12-07', '1');
INSERT INTO `record` VALUES ('59', '41', '2019-07-25', '1');
INSERT INTO `record` VALUES ('60', '26', '2019-07-25', '1');
INSERT INTO `record` VALUES ('61', '68', '2019-07-25', '1');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '系统最高权限者(不可添加编辑)');
INSERT INTO `role` VALUES ('2', '普通管理员', '管理发货');
INSERT INTO `role` VALUES ('3', '小角色', '查看基本报表');

-- ----------------------------
-- Table structure for `rolepermission`
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES ('1', '1', '1');
INSERT INTO `rolepermission` VALUES ('2', '1', '2');
INSERT INTO `rolepermission` VALUES ('3', '1', '3');
INSERT INTO `rolepermission` VALUES ('4', '1', '4');
INSERT INTO `rolepermission` VALUES ('5', '1', '6');
INSERT INTO `rolepermission` VALUES ('6', '1', '9');
INSERT INTO `rolepermission` VALUES ('7', '1', '10');
INSERT INTO `rolepermission` VALUES ('8', '1', '13');
INSERT INTO `rolepermission` VALUES ('9', '1', '14');
INSERT INTO `rolepermission` VALUES ('10', '1', '15');
INSERT INTO `rolepermission` VALUES ('11', '1', '16');
INSERT INTO `rolepermission` VALUES ('12', '1', '17');
INSERT INTO `rolepermission` VALUES ('13', '1', '19');
INSERT INTO `rolepermission` VALUES ('14', '1', '20');
INSERT INTO `rolepermission` VALUES ('15', '1', '21');
INSERT INTO `rolepermission` VALUES ('16', '1', '22');
INSERT INTO `rolepermission` VALUES ('17', '1', '23');
INSERT INTO `rolepermission` VALUES ('18', '1', '24');
INSERT INTO `rolepermission` VALUES ('19', '2', '1');
INSERT INTO `rolepermission` VALUES ('20', '2', '6');
INSERT INTO `rolepermission` VALUES ('21', '2', '13');
INSERT INTO `rolepermission` VALUES ('22', '2', '14');
INSERT INTO `rolepermission` VALUES ('23', '2', '15');
INSERT INTO `rolepermission` VALUES ('24', '2', '16');
INSERT INTO `rolepermission` VALUES ('25', '2', '17');
INSERT INTO `rolepermission` VALUES ('26', '2', '19');
INSERT INTO `rolepermission` VALUES ('27', '2', '21');
INSERT INTO `rolepermission` VALUES ('28', '2', '25');
INSERT INTO `rolepermission` VALUES ('29', '1', '25');
INSERT INTO `rolepermission` VALUES ('30', '3', '1');
INSERT INTO `rolepermission` VALUES ('31', '3', '6');
INSERT INTO `rolepermission` VALUES ('32', '3', '13');
INSERT INTO `rolepermission` VALUES ('33', '3', '19');
INSERT INTO `rolepermission` VALUES ('34', '3', '21');
INSERT INTO `rolepermission` VALUES ('35', '3', '25');
INSERT INTO `rolepermission` VALUES ('36', '1', '26');
INSERT INTO `rolepermission` VALUES ('37', '2', '26');

-- ----------------------------
-- Table structure for `snackinfo`
-- ----------------------------
DROP TABLE IF EXISTS `snackinfo`;
CREATE TABLE `snackinfo` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_batch` varchar(255) DEFAULT NULL COMMENT '批次好=生产日期+2位随机数',
  `s_name` varchar(255) DEFAULT NULL,
  `s_price` double DEFAULT NULL,
  `s_discount` varchar(255) DEFAULT NULL COMMENT '折扣',
  `s_pictureUrl` varchar(255) DEFAULT NULL,
  `s_brand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `s_place` varchar(255) DEFAULT NULL COMMENT '产地',
  `s_Imported` int(1) DEFAULT NULL COMMENT '是否进口',
  `s_score` int(11) DEFAULT NULL COMMENT '积分',
  `s_pDate` date DEFAULT NULL COMMENT '生产日期',
  `s_qDate` varchar(255) DEFAULT NULL COMMENT '保质期',
  `state` int(11) DEFAULT NULL COMMENT '1---上架，0---草稿，-1--下架',
  `s_createDate` date DEFAULT NULL COMMENT '上架时间',
  `s_dese` varchar(255) DEFAULT NULL COMMENT '详情',
  `s_type` varchar(255) DEFAULT NULL,
  `s_number` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of snackinfo
-- ----------------------------
INSERT INTO `snackinfo` VALUES ('20', '201903273550', '指甲刀', '30', '10', 'zhijiadao.jpg', '无印良品', '浙江', '1', null, '2019-03-15', '12', '1', '2019-03-27', '贼啦好使', '日用品', '9980');
INSERT INTO `snackinfo` VALUES ('21', '201903276547', '尺子', '20', '9', 'chizi.jpg', '无印良品', '浙江', '1', null, '2019-03-24', '12', '1', '2019-03-27', '笔直的尺子', '文具类', '989999');
INSERT INTO `snackinfo` VALUES ('23', '201903271694', '牛肉干', '25', '8', 'niurougan.jpg', '三只松鼠', '厦门', '1', null, '2019-03-14', '12', '1', '2019-03-27', '好吃的牛肉干', '零食类', '9991');
INSERT INTO `snackinfo` VALUES ('24', '201903272746', '磁扣手链', '1000', '5', 'cikoushoulian.jpg', '施华洛世奇', '上海', '0', null, '2019-03-14', '12', '1', '2019-03-27', '精美的磁扣手链', '饰品类', '9992');
INSERT INTO `snackinfo` VALUES ('25', '201904174136', '独角兽', '1000', '1', 'dujiaoshou.jpg', '施华洛世奇', '上海', '0', null, '2019-04-15', '12', '1', '2019-04-17', '精美的独角兽', '饰品类', '99999');
INSERT INTO `snackinfo` VALUES ('26', '201904172196', '多项链', '1000', '8', 'duoxianglian.jpg', '施华洛世奇', '上海', '0', null, '2019-04-17', '12', '1', '2019-04-17', '精美的多项链', '饰品类', '9954');
INSERT INTO `snackinfo` VALUES ('27', '201904171833', '黑天鹅项链', '1000', '7', 'heitianexianglian.jpg', '施华洛世奇', '上海', '0', null, '2019-04-17', '12', '1', '2019-04-17', '精美的黑天鹅项链', '饰品类', '9995');
INSERT INTO `snackinfo` VALUES ('28', '201904174852', '花项链', '1000', '10', 'huaxianglian.jpg', '施华洛世奇', '上海', '0', null, '2019-04-17', '18', '1', '2019-04-17', '精美的花项链', '饰品类', '100000');
INSERT INTO `snackinfo` VALUES ('29', '201904171022', '简约项链', '1000', '8', 'jianyuexianglian.jpg', '施华洛世奇', '上海', '1', null, '2019-04-17', '12', '1', '2019-04-17', '精美的简约项链', '饰品类', '200000');
INSERT INTO `snackinfo` VALUES ('30', '201904172485', '球项链', '1000', '8', 'qiuxianglian.jpg', '施华洛世奇', '上海', '1', null, '2019-04-17', '12', '1', '2019-04-17', '精美的球项链', '饰品类', '9000');
INSERT INTO `snackinfo` VALUES ('31', '201904172109', '森系项链', '1000', '8', 'senxixianglian.jpg', '施华洛世奇', '上海', '0', null, '2019-04-18', '12', '1', '2019-04-17', '精美的森系项链', '饰品类', '10000');
INSERT INTO `snackinfo` VALUES ('32', '201904174170', '时尚手链', '1000', '10', 'shishangshoulian.jpg', '施华洛世奇', '上海', '0', null, '2019-04-19', '12', '1', '2019-04-17', '精美的时尚手链', '饰品类', '9997');
INSERT INTO `snackinfo` VALUES ('33', '201904173272', '手表', '1000', '8', 'shoubiao.jpg', '施华洛世奇', '上海', '0', null, '2019-04-02', '12', '1', '2019-04-17', '精美的手表', '饰品类', '119996');
INSERT INTO `snackinfo` VALUES ('34', '201904175107', '手镯', '1000', '6', 'shouzhuo.jpg', '施华洛世奇', '上海', '1', null, '2019-04-05', '12', '1', '2019-04-17', '精美的手镯', '饰品类', '102291');
INSERT INTO `snackinfo` VALUES ('35', '201904175567', '天鹅项链', '1000', '7', 'tianexianglian.jpg', '施华洛世奇', '上海', '0', null, '2019-04-16', '12', '1', '2019-04-17', '精美的天鹅项链', '饰品类', '100000');
INSERT INTO `snackinfo` VALUES ('36', '201904174966', '心形项链', '1000', '8', 'xinxingxianglian.jpg', '施华洛世奇', '上海', '0', null, '2019-04-19', '12', '1', '2019-04-17', '精美的心形项链', '饰品类', '2000');
INSERT INTO `snackinfo` VALUES ('37', '201904178458', '缘相连', '1000', '6', 'yuanxianglian.jpg', '施华洛世奇', '上海', '1', null, '2019-04-14', '12', '1', '2019-04-17', '精美的缘项链', '饰品类', '10000');
INSERT INTO `snackinfo` VALUES ('38', '201904172586', '月亮项链', '1000', '4', 'yueliangxianglian.jpg', '施华洛世奇', '上海', '0', null, '2019-04-18', '12', '1', '2019-04-17', '精美的月亮项链', '饰品类', '20000');
INSERT INTO `snackinfo` VALUES ('39', '201904178495', '巴旦木', '25', '10', 'badanmu.jpg', '三只松鼠', '厦门', '0', null, '2019-04-19', '12', '1', '2019-04-17', '好吃的巴旦木', '零食类', '19997');
INSERT INTO `snackinfo` VALUES ('40', '201904171216', '板栗', '25', '6', 'banli.jpg', '三只松鼠', '厦门', '1', null, '2019-03-07', '12', '1', '2019-04-17', '好吃的板栗', '零食类', '10000');
INSERT INTO `snackinfo` VALUES ('41', '201904171172', '鸡翅根', '25', '8', 'jichigen.jpg', '三只松鼠', '厦门', '0', null, '2019-04-20', '12', '1', '2019-04-17', '好吃的鸡翅根', '零食类', '9999');
INSERT INTO `snackinfo` VALUES ('42', '201904177856', '开心果', '25', '6', 'kaixinguo.jpg', '三只松鼠', '厦门', '0', null, '2019-04-11', '12', '1', '2019-04-17', '好吃的开心果', '零食类', '10000');
INSERT INTO `snackinfo` VALUES ('43', '201904172550', '辣条', '25', '4', 'latiao.jpg', '三只松鼠', '厦门', '0', null, '2019-04-21', '12', '1', '2019-04-17', '好吃的辣条', '零食类', '10000');
INSERT INTO `snackinfo` VALUES ('44', '201904179981', '卤蛋', '25', '6', 'ludan.jpg', '三只松鼠', '厦门', '0', null, '2019-04-12', '12', '1', '2019-04-17', '好吃的卤蛋', '零食类', '10000');
INSERT INTO `snackinfo` VALUES ('45', '201904177197', '麻花', '25', '9', 'mahua.jpg', '三只松鼠', '厦门', '0', null, '2019-04-20', '12', '1', '2019-04-17', '好吃的麻花', '零食类', '9997');
INSERT INTO `snackinfo` VALUES ('46', '201904175915', '芒果干', '25', '8', 'mangguogan.jpg', '三只松鼠', '厦门', '1', null, '2019-04-14', '12', '1', '2019-04-17', '好吃的芒果干', '零食类', '10000');
INSERT INTO `snackinfo` VALUES ('47', '201904176852', '蔓越莓干', '25', '9', 'manyuemeigan.jpg', '三只松鼠', '厦门', '1', null, '2019-04-13', '12', '1', '2019-04-17', '好吃的蔓越莓干', '零食类', '10000');
INSERT INTO `snackinfo` VALUES ('48', '201904176635', '面包', '25', '8', 'mianbao.jpg', '三只松鼠', '厦门', '0', null, '2019-04-14', '12', '1', '2019-04-17', '好吃的面包', '零食类', '10000');
INSERT INTO `snackinfo` VALUES ('49', '201904174593', '曲奇', '25', '7', 'quqi.jpg', '三只松鼠', '厦门', '1', null, '2019-04-12', '12', '1', '2019-04-17', '好吃的曲奇', '零食类', '10000');
INSERT INTO `snackinfo` VALUES ('50', '201904177641', '小鱼', '25', '8', 'xiaoyu.jpg', '三只松鼠', '厦门', '0', null, '2019-04-14', '12', '1', '2019-04-17', '好吃的小鱼', '零食类', '10000');
INSERT INTO `snackinfo` VALUES ('51', '201904171818', '鸭脖', '25', '9', 'yabo.jpg', '三只松鼠', '厦门', '0', null, '2019-04-13', '12', '1', '2019-04-17', '好吃的鸭脖', '零食类', '9993');
INSERT INTO `snackinfo` VALUES ('52', '201904177621', '猪肉脯', '25', '8', 'zhuroupu.jpg', '三只松鼠', '厦门', '1', null, '2019-03-20', '12', '1', '2019-04-17', '好吃的猪肉脯', '零食类', '10000');
INSERT INTO `snackinfo` VALUES ('53', '201904176052', '拔毛夹', '20', '9', 'bamaojia.jpg', '无印良品', '浙江', '0', null, '2019-04-19', '12', '1', '2019-04-17', '好用的拔毛夹', '日用品', '10000');
INSERT INTO `snackinfo` VALUES ('54', '201904176090', '厨房纸', '30', '8', 'chufangzhi.jpg', '无印良品', '浙江', '0', null, '2019-03-07', '12', '1', '2019-04-17', '吸水的厨房纸', '日用品', '10000');
INSERT INTO `snackinfo` VALUES ('55', '201904177963', '肥皂盒', '20', '9', 'feizaohe.jpg', '无印良品', '浙江', '0', null, '2019-04-19', '12', '1', '2019-04-17', '好用的肥皂盒', '日用品', '9998');
INSERT INTO `snackinfo` VALUES ('56', '201904177044', '睫毛夹', '20', '6', 'jiemaojia.jpg', '无印良品', '浙江', '1', null, '2019-04-19', '12', '1', '2019-04-17', '好用的睫毛夹', '日用品', '9999');
INSERT INTO `snackinfo` VALUES ('57', '201904173371', '晾衣架', '30', '8', 'liangyijia.jpg', '无印良品', '浙江', '0', null, '2019-04-17', '12', '1', '2019-04-17', '好用的晾衣架', '日用品', '10000');
INSERT INTO `snackinfo` VALUES ('58', '201904171125', '脸盆', '80', '9', 'lianpen.jpg', '无印良品', '浙江', '0', null, '2019-04-19', '12', '1', '2019-04-17', '好用的脸盆', '日用品', '10000');
INSERT INTO `snackinfo` VALUES ('59', '201904179146', '棉棒', '20', '7', 'mianbang.jpg', '无印良品', '浙江', '1', null, '2019-04-19', '12', '1', '2019-04-17', '好多根棉棒', '日用品', '10000');
INSERT INTO `snackinfo` VALUES ('60', '201904177428', '抹布', '40', '5', 'mobu.jpg', '无印良品', '浙江', '0', null, '2019-03-07', '12', '1', '2019-04-17', '丝滑的抹布', '日用品', '10000');
INSERT INTO `snackinfo` VALUES ('61', '201904176104', '扫把', '50', '8', 'saoba.jpg', '无印良品', '浙江', '0', null, '2019-04-19', '12', '1', '2019-04-17', '好用的扫把', '日用品', '10000');
INSERT INTO `snackinfo` VALUES ('62', '201904171606', '拖把', '50', '8', 'tuoba.jpg', '无印良品', '浙江', '0', null, '2019-04-05', '12', '1', '2019-04-17', '好用的拖把', '日用品', '9996');
INSERT INTO `snackinfo` VALUES ('63', '201904172259', '拖鞋', '100', '10', 'tuoxie.jpg', '无印良品', '浙江', '0', null, '2019-04-17', '12', '1', '2019-04-17', '不臭脚的拖鞋', '日用品', '10000');
INSERT INTO `snackinfo` VALUES ('64', '201904176802', '牙刷', '40', '8', 'yashua.jpg', '无印良品', '浙江', '0', null, '2019-04-19', '12', '1', '2019-04-17', '好用的牙刷', '日用品', '10000');
INSERT INTO `snackinfo` VALUES ('65', '201904175746', '浴巾', '40', '7', 'yujin.jpg', '无印良品', '浙江', '1', null, '2019-04-19', '12', '1', '2019-04-17', '好用的浴巾', '日用品', '10000');
INSERT INTO `snackinfo` VALUES ('66', '201904177256', '浴球', '40', '8', 'yuqiu.jpg', '无印良品', '浙江', '0', null, '2019-04-19', '12', '1', '2019-04-17', '好用的浴球', '日用品', '9999');
INSERT INTO `snackinfo` VALUES ('67', '201904177149', '本子', '20', '8', 'benzi.jpg', '无印良品', '浙江', '0', null, '2019-04-17', '12', '1', '2019-04-17', '好用的本子', '文具类', '9997');
INSERT INTO `snackinfo` VALUES ('68', '201904172033', '胶水', '20', '5', 'jiaoshui.jpg', '无印良品', '浙江', '0', null, '2019-04-17', '12', '1', '2019-04-17', '好用的胶水', '文具类', '9999');
INSERT INTO `snackinfo` VALUES ('69', '201904176739', '自动铅笔', '20', '9', 'zidongqianbi.jpg', '无印良品', '浙江', '1', null, '2019-04-20', '43', '1', '2019-04-17', '好用的自动铅笔', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('70', '201904174121', '胶带座', '25', '8', 'jiaodaizuo.jpg', '无印良品', '浙江', '0', null, '2019-04-13', '12', '1', '2019-04-17', '好用的胶带座', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('71', '201904175818', '胶棒', '36', '8', 'jiaobang.jpg', '无印良品', '浙江', '0', null, '2019-04-17', '12', '1', '2019-04-17', '很黏的胶棒', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('72', '201904179160', '笔', '28', '7', 'bi.jpg', '无印良品', '浙江', '1', null, '2019-04-09', '12', '1', '2019-04-17', '顺滑的笔', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('73', '201904174125', '剪刀', '25', '8', 'jiandao.jpg', '无印良品', '浙江', '0', null, '2019-04-17', '18', '1', '2019-04-17', '好用的剪刀', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('74', '201904172373', '笔盒', '30', '8', 'bihe.jpg', '无印良品', '浙江', '1', null, '2019-04-19', '12', '1', '2019-04-17', '好用的笔盒', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('75', '201904175309', '小刀', '30', '7', 'xiaodao.jpg', '无印良品', '浙江', '0', null, '2019-04-19', '12', '1', '2019-04-17', '锋利的小刀', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('76', '201904178276', '透明胶', '10', '9', 'toumingjiao.jpg', '无印良品', '浙江', '1', null, '2019-04-19', '12', '1', '2019-04-17', '看不见的透明胶', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('77', '201904177722', '订书机', '60', '5', 'dingshuji.jpg', '无印良品', '浙江', '0', null, '2019-04-20', '12', '1', '2019-04-17', '好用的订书机', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('78', '201904171055', '打孔机', '60', '8', 'dakongji.jpg', '无印良品', '浙江', '0', null, '2019-04-07', '12', '1', '2019-04-17', '打到孔都不剩', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('79', '201904172661', '笔夹', '40', '8', 'bijia.jpg', '无印良品', '浙江', '1', null, '2019-03-20', '18', '1', '2019-04-17', '夹得稳稳的', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('80', '201904173962', '碎纸机', '35', '7', 'suizhiji.jpg', '无印良品', '浙江', '0', null, '2019-04-04', '12', '1', '2019-04-17', '碎的妥妥的', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('81', '201907029034', '橡皮', '25', '1', 'xiangpi.jpg', '无印良品', '浙江', '0', null, '2019-04-17', '12', '1', '2019-07-02', '贼啦好使的橡皮', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('82', '201911042918', '修正笔', '50', '7', 'xiuzhengbi.jpg', '无印良品', '浙江', '0', null, '2019-11-11', '9', '1', '2019-11-04', '贼啦好用的修正笔', '文具类', '999');
INSERT INTO `snackinfo` VALUES ('83', '201907109028', '便签', '20', '5', 'bianqian.jpg', '无印良品', '浙江', '0', null, '2019-09-20', '12', '1', '2019-06-20', '方便的便签', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('84', '201904118722', '笔筒', '30', '8', 'bitong.jpg', '无印良品', '浙江', '1', null, '2019-10-23', '12', '1', '2019-06-19', '好用的笔筒', '文具类', '10000');
INSERT INTO `snackinfo` VALUES ('85', '201904173622', '书立', '30', '8', 'shuli.jpg', '无印良品', '浙江', '0', null, '2019-05-21', '12', '1', '2019-08-17', '好用的书立', '文具类', '10000');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `u_username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `u_password` varchar(255) DEFAULT NULL COMMENT '密码',
  `u_money` varchar(255) DEFAULT NULL COMMENT '钱包金额',
  `u_phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `u_email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `u_sex` char(255) DEFAULT NULL COMMENT '性别',
  `u_resgistDate` date DEFAULT NULL COMMENT '出生日期',
  `u_address` varchar(255) DEFAULT NULL COMMENT '地址',
  `u_score` int(11) DEFAULT NULL COMMENT '积分总数',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('17', '哈哈', '测试', '123456', '9983.0', '15810100256', '761695@qq.com', '女', '2018-11-01', '浙江', null);
INSERT INTO `userinfo` VALUES ('18', 'wzn', 'wzn', '123', '8729.5', '13520109202', '1193284480@qq.com', '男', '2018-11-04', '北京', '1');
INSERT INTO `userinfo` VALUES ('19', 'odc', 'odc', '123', '9930.0', '13656565656', '123456@qq.com', '女', '2018-12-05', '上海', null);
INSERT INTO `userinfo` VALUES ('20', 'yym', 'yym', '123', '9819.0', '13565659898', 'artusan@qq.com', '男', '2018-12-07', '上海市 浦东新区', null);
INSERT INTO `userinfo` VALUES ('21', 'king', 'king', '123', '9163.0', '13656565658', '123@123.com', '男', '2019-07-19', '厦门', null);

-- ----------------------------
-- Procedure structure for `haha`
-- ----------------------------
DROP PROCEDURE IF EXISTS `haha`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `haha`(in a int,in b int)
BEGIN
set @x=0;
set @x =a+b;
SELECT @x as num;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `jk`
-- ----------------------------
DROP PROCEDURE IF EXISTS `jk`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `jk`()
BEGIN
 SELECT * from admin;
end
;;
DELIMITER ;
