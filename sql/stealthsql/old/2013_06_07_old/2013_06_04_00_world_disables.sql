DELETE FROM `disables` WHERE `sourceType` = 2 AND `entry` = 754;
DELETE FROM `disables` WHERE `entry` = 967;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(2, 967, 3, '', '', 'Dragoun Soul Raid'),
(2, 754, 3, '', '', 'Throne Of The Four Winds');
