DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` = 720;

DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` = 967;

DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` = 940;

DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` = 859;

DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` = 568;

DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` = 816;

DELETE FROM `disables` WHERE `entry` = 938;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(2, 720, 3, '', '', 'Disable Firelands Raid'),
(2, 938, 3, '', '', 'Disable EndTime Instance'),
(2, 967, 3, '', '', 'Disable DragonSoul Raid'),
(2, 940, 3, '', '', 'Disable Hour of Twilight Instance'),
(2, 859, 3, '', '', 'Disable Zul`Gurub Instance'),
(2, 568, 3, '', '', 'Disable Zul`Aman Instance'),
(2, 816, 3, '', '', 'Disable Well Of Eternity Instance');

