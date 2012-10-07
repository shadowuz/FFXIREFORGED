/*
MySQL Data Transfer
Source Host: localhost
Source Database: dspdb
Target Host: localhost
Target Database: dspdb
Date: 31/08/2012 18:09:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bcnm_loot
-- ----------------------------
DROP TABLE IF EXISTS `bcnm_loot`;
CREATE TABLE `bcnm_loot` (
  `LootDropId` smallint(5) unsigned NOT NULL default '0',
  `itemId` smallint(5) unsigned NOT NULL default '0',
  `rolls` smallint(5) unsigned NOT NULL default '0',
  `lootGroupId` tinyint(3) unsigned NOT NULL default '0',
  KEY `LootDropId` (`LootDropId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=9;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bcnm_loot` VALUES ('76', '18047', '188', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17939', '27', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17937', '170', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '1441', '295', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '18351', '27', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17464', '71', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '17575', '196', '0');
INSERT INTO `bcnm_loot` VALUES ('76', '18211', '45', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17576', '259', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17245', '241', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17838', '143', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '1442', '161', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17996', '143', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '17578', '36', '1');
INSERT INTO `bcnm_loot` VALUES ('76', '683', '446', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '908', '420', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '1312', '71', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '14080', '26', '2');
INSERT INTO `bcnm_loot` VALUES ('76', '887', '116', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '645', '89', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '902', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '702', '152', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '737', '107', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '823', '89', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '1465', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4173', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '700', '107', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '703', '223', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '738', '116', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '830', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '895', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '1132', '71', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4172', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '866', '54', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4174', '63', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '4175', '45', '3');
INSERT INTO `bcnm_loot` VALUES ('76', '683', '268', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '1525', '143', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4205', '80', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4201', '143', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4199', '214', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '4203', '196', '4');
INSERT INTO `bcnm_loot` VALUES ('76', '646', '107', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4211', '89', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '645', '179', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4213', '134', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4207', '152', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4209', '80', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '739', '80', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '738', '107', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '17698', '152', '5');
INSERT INTO `bcnm_loot` VALUES ('76', '4135', '295', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '4119', '250', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '4173', '196', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '4175', '214', '6');
INSERT INTO `bcnm_loot` VALUES ('76', '887', '139', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '645', '59', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '902', '50', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '702', '109', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '737', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '1465', '99', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '4173', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '700', '129', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '644', '119', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '844', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '703', '168', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '738', '129', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '895', '109', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '1132', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '4174', '69', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '866', '79', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '4172', '50', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '823', '89', '7');
INSERT INTO `bcnm_loot` VALUES ('76', '1110', '109', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '836', '89', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '658', '78', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '837', '99', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '942', '188', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '844', '238', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '1132', '109', '8');
INSERT INTO `bcnm_loot` VALUES ('76', '722', '79', '9');
INSERT INTO `bcnm_loot` VALUES ('76', '1446', '257', '9');
INSERT INTO `bcnm_loot` VALUES ('76', '703', '337', '9');
INSERT INTO `bcnm_loot` VALUES ('76', '831', '149', '9');
INSERT INTO `bcnm_loot` VALUES ('105', '1603', '100', '0');
INSERT INTO `bcnm_loot` VALUES ('105', '915', '250', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '4112', '300', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '4113', '180', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '4898', '130', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '825', '280', '1');
INSERT INTO `bcnm_loot` VALUES ('105', '749', '250', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '17786', '190', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '827', '270', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '18171', '145', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '824', '295', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '826', '260', '2');
INSERT INTO `bcnm_loot` VALUES ('105', '18209', '100', '3');  -- Should be zero to one group
INSERT INTO `bcnm_loot` VALUES ('105', '924', '100', '4');
INSERT INTO `bcnm_loot` VALUES ('105', '924', '100', '5');
INSERT INTO `bcnm_loot` VALUES ('105', '18170', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17271', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17692', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17571', '235', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '17820', '255', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '1601', '260', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '4853', '250', '6');
INSERT INTO `bcnm_loot` VALUES ('105', '930', '190', '6');
INSERT INTO `bcnm_loot` VALUES ('81', '1473', '813', '0');
INSERT INTO `bcnm_loot` VALUES ('81', '13552', '55', '0');
INSERT INTO `bcnm_loot` VALUES ('81', '901', '123', '0');
INSERT INTO `bcnm_loot` VALUES ('81', '17207', '216', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '18005', '295', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '18217', '239', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '17793', '231', '1');
INSERT INTO `bcnm_loot` VALUES ('81', '17624', '504', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '655', '4', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '19027', '86', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '747', '22', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '19025', '146', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '19024', '22', '2');
INSERT INTO `bcnm_loot` VALUES ('81', '15295', '287', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '12407', '216', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '14871', '198', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '15294', '287', '3');
INSERT INTO `bcnm_loot` VALUES ('81', '887', '52', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '645', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '902', '41', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '702', '63', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '737', '52', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '823', '26', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '1465', '11', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4173', '37', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '700', '101', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '653', '0', '4');-- this is "zero" on ffxiclopedia???
INSERT INTO `bcnm_loot` VALUES ('81', '644', '52', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '703', '116', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '844', '15', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '942', '56', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '738', '45', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '830', '22', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '895', '67', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '1132', '119', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4172', '45', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4174', '19', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '4175', '41', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '866', '34', '4');
INSERT INTO `bcnm_loot` VALUES ('81', '1110', '78', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '836', '56', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '658', '93', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '837', '56', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '942', '157', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '844', '276', '5');
INSERT INTO `bcnm_loot` VALUES ('81', '1132', '209', '5');
