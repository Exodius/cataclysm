DELETE FROM `creature` WHERE `guid` = 237913;
INSERT INTO `creature` (`guid`, `id`, `map`, `zone`, `area`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(237913, 50061, 646, 0, 0, 1, 1, 0, 0, 965.375, 983.912, 445.214, 6.2026, 84000, 10, 0, 14700, 0, 2, 0, 0, 0);

UPDATE `creature_template` SET `speed_walk` = '2', `speed_run` = '2', `unit_flags` = '8388608', `InhabitType` = '5' WHERE `entry` =50061;

DELETE FROM `waypoint_data` WHERE `id` = 237913;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES
(237913, 1, 964.448, 983.988, 455.601, 0, 0, 0, 0, 100, 0),
(237913, 2, 1236.69, 953.583, 454.978, 0, 0, 0, 0, 100, 0),
(237913, 3, 1396.54, 837.315, 446.601, 0, 0, 0, 0, 100, 0),
(237913, 4, 1478.31, 682.843, 438.815, 0, 0, 0, 0, 100, 0),
(237913, 5, 1497.9, 523.197, 433.614, 0, 0, 0, 0, 100, 0),
(237913, 6, 1467.1, 346.31, 437.814, 0, 0, 0, 0, 100, 0),
(237913, 7, 1320.67, 157.331, 441.946, 0, 0, 0, 0, 100, 0),
(237913, 8, 1098.56, 72.7031, 435.192, 0, 0, 0, 0, 100, 0),
(237913, 9, 807.996, 126.992, 455.051, 0, 0, 0, 0, 100, 0),
(237913, 10, 746.953, 186.361, 452.935, 0, 0, 0, 0, 100, 0),
(237913, 11, 678.849, 264.853, 438.046, 0, 0, 0, 0, 100, 0),
(237913, 12, 632.377, 323.248, 435.512, 0, 0, 0, 0, 100, 0),
(237913, 13, 577.511, 458.32, 433.628, 0, 0, 0, 0, 100, 0),
(237913, 14, 573.945, 598.268, 432.284, 0, 0, 0, 0, 100, 0),
(237913, 15, 630.087, 762.763, 453.666, 0, 0, 0, 0, 100, 0),
(237913, 16, 705.077, 853.484, 437.007, 0, 0, 0, 0, 100, 0),
(237913, 17, 827.272, 945.035, 433.616, 0, 0, 0, 0, 100, 0),
(237913, 18, 964.526, 984.364, 427.692, 0, 0, 0, 0, 100, 0);

DELETE FROM `creature_addon` WHERE `guid` IN (237913,300695);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(237913, 237913, 0, 0, 0, 0, NULL),
(300695, 300695, 0, 0, 0, 0, NULL);

DELETE FROM `creature_equip_template` WHERE `entry` = 1196;

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` =49141;

DELETE FROM `creature_template` WHERE `entry` = 49141;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 49141;

UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` IN (35118,16111);

DELETE FROM `creature` WHERE `id` = 348510;

DELETE FROM `creature_template` WHERE `entry` = 348510;

UPDATE `creature` SET `spawndist` = '0' WHERE `guid` =237913;
