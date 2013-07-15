-- Disable Battleground TP and BFG (enable only for Developer)
DELETE FROM `disables` WHERE `entry` IN (108, 120);
INSERT INTO `disables` VALUES ('3', '108', '0', '', '', 'Twin Peak');
INSERT INTO `disables` VALUES ('3', '120', '0', '', '', 'Battle for Gilneas');