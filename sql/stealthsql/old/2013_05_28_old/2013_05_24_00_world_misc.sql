DELETE FROM `pool_template` WHERE `entry` = 50062;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(50062, 1, 'Aeonaxx');

DELETE FROM `pool_creature` WHERE `pool_entry` = 50062;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(300590, 50062, 0, 'Aeonaxx - Spawn 1'),
(300591, 50062, 0, 'Aeonaxx - Spawn 3'),
(300592, 50062, 0, 'Aeonaxx - Spawn 4'),
(300593, 50062, 0, 'Aeonaxx - Spawn 5'),
(300594, 50062, 0, 'Aeonaxx - Spawn 2');

DELETE FROM `creature` WHERE `guid` IN (300590,300591,300592,300593,300594);
INSERT INTO `creature` (`guid`, `id`, `map`, `zone`, `area`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(300590, 50062, 646, 0, 0, 1, 1, 0, 0, 1047.95, 80.1082, -43.783, 2.72994, 54000, 0, 0, 774900, 0, 0, 0, 0, 0),
(300591, 50062, 646, 0, 0, 1, 1, 0, 0, 1464.19, 418.095, -35.3393, 3.83971, 54000, 0, 0, 774900, 0, 0, 0, 0, 0),
(300592, 50062, 646, 0, 0, 1, 1, 0, 0, 1205.13, 885.665, -28.3264, 0.0933743, 54000, 0, 0, 774900, 0, 0, 0, 0, 0),
(300593, 50062, 646, 0, 0, 1, 1, 0, 0, 662.576, 326.221, -24.6986, 2.28776, 54000, 0, 0, 774900, 0, 0, 0, 0, 0),
(300594, 50062, 646, 0, 0, 1, 1, 0, 0, 640.601, 876.547, -48.1104, 0.713838, 54000, 0, 0, 774900, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `faction_A` = '189', `faction_H` = '189', `mindmg` = '200', `maxdmg` = '500',  `InhabitType` = '4' WHERE `entry` =50062;
