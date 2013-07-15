-- http://www.wowhead.com/npc=3297
UPDATE `creature_template` SET `spell1` = 95826 WHERE `entry` = 3297;
--  http://www.wowhead.com/npc=3297
DELETE FROM `pickpocketing_loot_template` WHERE `entry` = 3297;
INSERT INTO `pickpocketing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(3297, 16882, 66.6667, 1, 0, 1, 1), -- 6Battered Junkbox
(3297, 5373, 23.8095, 1, 0, 1, 1), -- 6Lucky Charm
(3297, 4542, 9.5238, 1, 0, 1, 1), -- 6Moist Cornbread
(3297, 929, 9.5238, 1, 0, 1, 1), -- 6Healing Potion
(3297, 1206, 4.7619, 1, 0, 1, 1), -- 5Moss Agate
(3297, 1705, 4.7619, 1, 0, 1, 1); -- 5Lesser Moonstone
UPDATE `creature_template` SET `pickpocketloot` = 3297 WHERE `entry` = 3297;
-- http://old.wowhead.com/npc=10578#abilities
UPDATE `creature_template` SET `spell1` = 17009 WHERE `entry` = 10578;
-- http://old.wowhead.com/npc=6928#abilities
UPDATE `creature_template` SET `spell1` = 24751 WHERE `entry` = 6928;
-- rong flight master in rong place
DELETE FROM `creature` WHERE `guid` = 127415;
-- add right master in right place http://www.wowwiki.com/Handler_Marnlek
DELETE FROM creature WHERE `guid` = 306745;
INSERT INTO `creature` VALUES ('306745', '41142', '1', '0', '0', '1', '1', '0', '1', '-775.729', '-4890.61', '19.8169', '2.88789', '300', '0', '0', '340910', '0', '0', '0', '0', '0');
-- http://www.wowhead.com/npc=40222
DELETE FROM creature WHERE `guid` = 306721;
INSERT INTO `creature` VALUES ('306721', '40222', '1', '0', '0', '1', '1', '0', '0', '-772.65', '-4882.09', '20.6282', '3.52841', '300', '0', '0', '12600', '0', '0', '0', '0', '0');
-- http://www.wowhead.com/npc=10676
DELETE FROM creature WHERE `guid` = 306723;
INSERT INTO `creature` VALUES ('306723', '10676', '1', '0', '0', '1', '1', '0', '1', '-820.654', '-4880.8', '19.2008', '1.6359', '300', '0', '0', '2440', '0', '0', '0', '134217728', '0');
UPDATE `creature_template` SET `spell1` = 6533 WHERE `entry` = 10676;
DELETE FROM creature WHERE `guid` = 306719;
DELETE FROM creature WHERE `guid` = 306724;
INSERT INTO `creature` VALUES ('306724', '49997', '1', '0', '0', '1', '1', '0', '1', '-845.784', '-4933.39', '20.9848', '5.37135', '300', '0', '0', '610', '0', '0', '0', '0', '0');
-- rong place spawn 
DELETE FROM creature WHERE `guid` = 127418;
DELETE FROM creature WHERE `guid` = 306734;
INSERT INTO `creature` VALUES ('306734', '3140', '1', '0', '0', '1', '1', '0', '1', '-807.642', '-4872.54', '18.817', '4.54346', '300', '0', '0', '137', '0', '0', '0', '0', '0');
-- missing spawn 
DELETE FROM creature WHERE `guid` = 306726;
DELETE FROM creature WHERE `guid` = 306727;
DELETE FROM creature WHERE `guid` = 306728;
DELETE FROM creature WHERE `guid` = 306729;
DELETE FROM creature WHERE `guid` = 306730;
DELETE FROM creature WHERE `guid` = 306731;
DELETE FROM creature WHERE `guid` = 306732;
INSERT INTO `creature` VALUES ('306726', '3184', '1', '0', '0', '1', '1', '0', '1', '-797.476', '-4891.74', '22.8997', '3.89567', '300', '0', '0', '713', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306727', '3187', '1', '0', '0', '1', '1', '0', '1', '-793.389', '-4945.16', '22.247', '0.136446', '300', '0', '0', '247', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306728', '5942', '1', '0', '0', '1', '1', '0', '1', '-781.405', '-4938.29', '22.2465', '5.87269', '300', '0', '0', '300', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306729', '50006', '1', '0', '0', '1', '1', '0', '1', '-771.892', '-4947.51', '22.8803', '5.94294', '300', '0', '0', '699', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306730', '49998', '1', '0', '0', '1', '1', '0', '1', '-784.581', '-4938.57', '38.2817', '4.57722', '300', '0', '0', '562', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306731', '50001', '1', '0', '0', '1', '1', '0', '1', '-783.644', '-4944.3', '38.2817', '2.73066', '300', '0', '0', '562', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306732', '3933', '1', '0', '0', '1', '1', '0', '1', '-787.033', '-4904.91', '19.6267', '4.09639', '300', '0', '0', '300', '0', '0', '0', '0', '0');
-- add missing wp for http://old.wowhead.com/npc=3140
DELETE FROM waypoint_data WHERE `id` = 306734;
INSERT INTO `waypoint_data` VALUES ('306734', '1', '-807.88', '-4874.05', '18.8096', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '2', '-810.42', '-4879.77', '18.9421', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '3', '-812.262', '-4884.55', '19.0932', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '4', '-815.025', '-4887.65', '19.2079', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '5', '-818.459', '-4889.82', '19.2979', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '6', '-822.777', '-4893.5', '19.4536', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '7', '-825.022', '-4896.05', '19.5917', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '8', '-827.718', '-4900.27', '19.768', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '9', '-829.202', '-4903.43', '19.8168', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '10', '-830.845', '-4908.04', '19.6594', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '11', '-831.946', '-4913.53', '19.7814', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '12', '-831.983', '-4917.35', '19.8504', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '13', '-831.706', '-4920.51', '20.0135', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '14', '-829.703', '-4923.91', '20.0684', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '15', '-826.508', '-4924.9', '19.8844', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '16', '-822.228', '-4924.83', '19.6762', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '17', '-818.056', '-4923.12', '19.4973', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '18', '-814.911', '-4920.67', '19.3566', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '19', '-811.773', '-4916.77', '19.3742', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '20', '-811.039', '-4915.56', '19.3742', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '21', '-807.594', '-4909.47', '19.2297', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '22', '-805.043', '-4906.19', '19.3592', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '23', '-801.355', '-4903.53', '19.4665', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '24', '-798.492', '-4902.2', '19.4918', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '25', '-795.266', '-4900.84', '19.505', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '26', '-790.239', '-4898.71', '19.5125', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '27', '-788.425', '-4897.92', '19.5207', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '28', '-783.601', '-4894.64', '19.5654', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '29', '-782.547', '-4891.54', '19.5579', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '30', '-782.524', '-4889.1', '19.5241', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '31', '-782.765', '-4886.23', '19.4793', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '32', '-783.589', '-4877.98', '19.3989', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '33', '-783.494', '-4874.03', '19.4658', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '34', '-782.502', '-4870.07', '19.6629', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '35', '-781.675', '-4867.04', '19.8628', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '36', '-779.855', '-4860.88', '20.1274', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '37', '-779.232', '-4857.57', '19.9627', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '38', '-778.381', '-4852.27', '19.1188', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '39', '-779.252', '-4847.27', '18.3776', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '40', '-782.72', '-4846.64', '18.6086', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '41', '-785.418', '-4848.46', '18.7944', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '42', '-786.534', '-4849.49', '18.8449', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '43', '-788.76', '-4851.67', '19.015', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '44', '-793.562', '-4856.76', '19.2387', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '45', '-795.962', '-4859.31', '19.2994', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '46', '-798.009', '-4861.42', '19.3438', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '47', '-801.147', '-4864.21', '19.3606', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '48', '-803.466', '-4866.5', '19.2611', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '49', '-807.236', '-4871.81', '18.8226', '0', '0', '0', '0', '100', '0');
INSERT INTO `waypoint_data` VALUES ('306734', '50', '-807.673', '-4872.77', '18.8169', '0', '0', '0', '0', '100', '0');
-- http://old.wowhead.com/npc=8017   missing  guards
DELETE FROM creature WHERE `guid` = 306736;
DELETE FROM creature WHERE `guid` = 306737;
DELETE FROM creature WHERE `guid` = 306738;
DELETE FROM creature WHERE `guid` = 306739;
DELETE FROM creature WHERE `guid` = 306740;
DELETE FROM creature WHERE `guid` = 306741;
DELETE FROM creature WHERE `guid` = 306742;
DELETE FROM creature WHERE `guid` = 306743;
INSERT INTO `creature` VALUES ('306736', '8017', '1', '0', '0', '1', '1', '0', '1', '-861.69', '-4929.89', '18.7039', '3.68665', '300', '0', '0', '11828', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306737', '8017', '1', '0', '0', '1', '1', '0', '1', '-828.739', '-4960.51', '12.9393', '4.48951', '300', '0', '0', '11828', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306738', '8017', '1', '0', '0', '1', '1', '0', '1', '-818.735', '-4964.34', '12.3814', '4.42404', '300', '0', '0', '11828', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306739', '8017', '1', '0', '0', '1', '1', '0', '1', '-768.854', '-4971.56', '20.5731', '5.8491', '300', '0', '0', '11828', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306740', '8017', '1', '0', '0', '1', '1', '0', '1', '-761.935', '-4928.67', '20.4739', '6.22426', '300', '0', '0', '11828', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306741', '8017', '1', '0', '0', '1', '1', '0', '1', '-758.203', '-4885.58', '20.7669', '2.21871', '300', '0', '0', '11828', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306742', '8017', '1', '0', '0', '1', '1', '0', '1', '-836.454', '-4864.54', '20.9381', '3.34318', '300', '0', '0', '11828', '0', '0', '0', '0', '0');
INSERT INTO `creature` VALUES ('306743', '8017', '1', '0', '0', '1', '1', '0', '1', '-802.167', '-4856.31', '19.9984', '0.382993', '300', '0', '0', '11828', '0', '0', '0', '0', '0');
