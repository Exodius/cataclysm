DELETE FROM `creature` WHERE `guid` IN (300595,300596,300597,300598,300599,300600,300601,300602);
INSERT INTO `creature` (`guid`, `id`, `map`, `zone`, `area`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(300595, 47066, 754, 0, 0, 15, 1, 0, 0, -240.162, 769.122, 195.846, 5.49923, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(300596, 47066, 754, 0, 0, 15, 1, 0, 0, -101.552, 626.445, 195.848, 2.35436, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(300597, 47066, 754, 0, 0, 15, 1, 0, 0, -3.43208, 626.723, 195.846, 0.816079, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(300598, 47066, 754, 0, 0, 15, 1, 0, 0, 138.67, 764.981, 195.846, 3.92453, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(300599, 47066, 754, 0, 0, 15, 1, 0, 0, 138.693, 862.983, 195.847, 2.36697, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(300600, 47066, 754, 0, 0, 15, 1, 0, 0, 0.51813, 1004.95, 195.846, 5.50298, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(300601, 47066, 754, 0, 0, 15, 1, 0, 0, -97.3398, 1005.53, 195.846, 3.93802, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(300602, 47066, 754, 0, 0, 15, 1, 0, 0, -239.742, 867.066, 195.846, 0.784143, 300, 0, 0, 42, 0, 0, 0, 0, 0);

DELETE FROM `creature_equip_template` WHERE `entry` = 46753;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(46753, 1, 68058, 0, 0);

UPDATE `creature_template` SET `difficulty_entry_1` = '50203', `difficulty_entry_2` = '50217', `difficulty_entry_3` = '50231', `faction_A` = '14', `faction_H` = '14', `speed_walk` = '1', `speed_run` = '1.14286', `AIName` = '', `Health_mod` = '280' WHERE `entry` =46753;

UPDATE `creature_template` SET `modelid1` = '35402', `type` = '4', `type_flags` = '8', `VehicleId` = '0', `flags_extra` = '0' WHERE `entry` =47066;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 47066;

DELETE FROM `creature_template_addon` WHERE `entry` = 45812;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(45812, 0, 0, 0, 1, 0, '85428');
