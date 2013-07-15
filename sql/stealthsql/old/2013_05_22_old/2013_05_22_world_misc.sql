DELETE FROM `gameobject` WHERE `guid` = 100159;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(100159, 209849, 757, 3, 1, 388.003, 1337.24, 170.192, 4.71103, 0, 0, 0.707588, -0.706626, 300, 0, 1);

UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35', `AIName` = '' WHERE `entry` =55869;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (55869,52363);

UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35' WHERE `entry` =55869;

UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35', `AIName` = '' WHERE `entry` =52363;

UPDATE `gameobject` SET `state` = '1' WHERE `guid` =59257;
