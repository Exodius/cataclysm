DELETE FROM `areatrigger_scripts` WHERE `entry` = 5806;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(5806, 'at_tott_first_tunnel');

DELETE FROM `creature` WHERE `guid` IN (237014,237016,237017,237015,300117,300118,300119,300121);
INSERT INTO `creature` (`guid`, `id`, `map`, `zone`, `area`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(300117, 39616, 643, 0, 0, 3, 1, 0, 0, -388.077, 788.874, 261.037, 1.69056, 3600, 0, 0, 63000, 0, 0, 0, 0, 0),
(300118, 39616, 643, 0, 0, 3, 1, 0, 0, -384.447, 790.235, 259.055, 1.79965, 3600, 0, 0, 63000, 0, 0, 0, 0, 0),
(300119, 41096, 643, 0, 0, 3, 1, 0, 0, -397.356, 827.154, 264.938, 4.8274, 3600, 0, 0, 17096, 0, 0, 0, 0, 0),
(300121, 41096, 643, 0, 0, 3, 1, 0, 0, -393.052, 827.508, 264.763, 4.83447, 3600, 0, 0, 17096, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `difficulty_entry_1` = '50277', `exp` = '3', `AIName` = 'SmartAI', `InhabitType` = '7' WHERE `entry` =41096;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 41096;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(41096, 0, 0, 0, 0, 0, 100, 6, 2000, 4000, 3000, 6000, 11, 76815, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Nazjar Spiritmender - Cast Wrath'),
(41096, 0, 1, 0, 0, 0, 100, 6, 4000, 8000, 5000, 15000, 11, 76820, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Nazjar Spiritmender - Cast Hex'),
(41096, 0, 2, 0, 14, 0, 100, 6, 25000, 40, 10000, 20000, 11, 76813, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Nazjar Spiritmender - Cast Healing Wave');

DELETE FROM `gameobject_template` WHERE `entry` IN (402356,204927,204944);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `data24`, `data25`, `data26`, `data27`, `data28`, `data29`, `data30`, `data31`, `unkInt32`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
(402356, 3, 10403, 'WG_INVISIBLE_DOOR', '', '', '', 114, 0, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', 13623),
(204927, 0, 9810, 'Ozumat Tentacle (Down Angle)', '', '', '', 114, 0, 1.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', 1),
(204944, 0, 9812, 'Ozumat Tentacle (Up Angle)', '', '', '', 114, 0, 1.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', 1);

DELETE FROM `gameobject` WHERE `guid` IN (100116,100117,100118,100119);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(100116, 204927, 643, 3, 1, -305.368, 660.687, 289.425, 1.61539, 0, 0, 0.722694, 0.691168, 300, 0, 1),
(100117, 204944, 643, 3, 1, -305.954, 960.1, 236.419, 4.66116, 0, 0, 0.724986, -0.688763, 300, 0, 1),
(100118, 402356, 643, 3, 1, -310.434, 834.659, 259.585, 1.61539, 0, 0, 0.722697, 0.691165, 300, 0, 1),
(100119, 402356, 643, 3, 1, -310.668, 782.402, 260.914, 4.76091, 0, 0, 0.689746, -0.724052, 300, 0, 1);

DELETE FROM `creature` WHERE `guid` IN (236997,237019,300122,300123,300124,300125,300126,300127,300128,237071,237068,237067,237029,237028,237069,237072,237073,237012,237013,237074,237070,237030,237011,237010,237031,237075,300129,300130,300131,300132,300133,300134,300135,300136,300137,300138,300139,300140,300141,300142,300143,300144,300145,300146,300147,300148,300149,300150,300151,300152,300153,300154,237034,237037,237036,237007,237008,237035,237009,237006);
INSERT INTO `creature` (`guid`, `id`, `map`, `zone`, `area`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(300122, 40577, 643, 0, 0, 3, 1, 0, 0, -285.569, 808.115, 260.017, 3.16846, 604800, 0, 0, 65165, 0, 0, 0, 0, 0),
(300123, 40584, 643, 0, 0, 3, 1, 0, 0, -134.194, 828.88, 814.322, 4.68376, 3600, 0, 0, 21368, 0, 0, 0, 0, 0),
(300124, 40584, 643, 0, 0, 3, 1, 0, 0, -134.022, 775.971, 812.695, 1.57987, 3600, 0, 0, 21368, 0, 0, 0, 0, 0),
(300125, 41139, 643, 0, 0, 3, 1, 0, 0, -103.209, 825.446, 812.587, 4.72534, 3600, 0, 0, 63000, 0, 0, 0, 0, 0),
(300126, 40584, 643, 0, 0, 3, 1, 0, 0, -102.674, 776.962, 812.414, 1.55119, 3600, 0, 0, 21368, 0, 0, 0, 0, 0),
(300127, 41139, 643, 0, 0, 3, 1, 0, 0, -71.6522, 828.84, 813.42, 4.78703, 3600, 0, 0, 63000, 0, 0, 0, 0, 0),
(300128, 40584, 643, 0, 0, 3, 1, 0, 0, -71.5567, 777.201, 814.602, 1.55119, 3600, 0, 0, 21368, 0, 0, 0, 0, 0),
(300129, 39960, 643, 0, 0, 3, 1, 0, 0, -28.7312, 793.697, 803.932, 3.17711, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300130, 39960, 643, 0, 0, 3, 1, 0, 0, -28.9677, 797.666, 803.899, 3.2046, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300131, 39960, 643, 0, 0, 3, 1, 0, 0, -24.791, 806.909, 805.634, 3.1614, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300132, 39960, 643, 0, 0, 3, 1, 0, 0, -26.8836, 806.867, 804.544, 3.1614, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300133, 39960, 643, 0, 0, 3, 1, 0, 0, -29.2106, 801.515, 803.365, 3.2046, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300134, 39960, 643, 0, 0, 3, 1, 0, 0, -26.8422, 804.775, 804.676, 3.1614, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300135, 39960, 643, 0, 0, 3, 1, 0, 0, -22.4535, 806.955, 806.79, 3.1614, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300136, 39960, 643, 0, 0, 3, 1, 0, 0, -28.798, 805.362, 803.519, 3.1326, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300137, 39960, 643, 0, 0, 3, 1, 0, 0, -28.1989, 808.992, 803.784, 3.1614, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300138, 39960, 643, 0, 0, 3, 1, 0, 0, -25.6524, 809.043, 805.151, 3.1614, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300139, 39960, 643, 0, 0, 3, 1, 0, 0, -22.8764, 809.098, 806.548, 3.1614, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300140, 39960, 643, 0, 0, 3, 1, 0, 0, -23.8458, 804.834, 806.243, 3.1614, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300141, 39960, 643, 0, 0, 3, 1, 0, 0, -22.947, 802.958, 806.788, 3.12606, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300142, 39960, 643, 0, 0, 3, 1, 0, 0, -25.5512, 801.749, 805.606, 3.18231, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300143, 39960, 643, 0, 0, 3, 1, 0, 0, -27.4633, 802.671, 804.452, 3.17443, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300144, 39960, 643, 0, 0, 3, 1, 0, 0, -26.2816, 799.576, 805.39, 3.18524, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300145, 39960, 643, 0, 0, 3, 1, 0, 0, -23.2875, 799.706, 806.812, 3.18524, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300146, 39960, 643, 0, 0, 3, 1, 0, 0, -24.086, 797.09, 806.519, 3.23924, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300147, 39960, 643, 0, 0, 3, 1, 0, 0, -26.9841, 796.806, 805.127, 3.23924, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300148, 39960, 643, 0, 0, 3, 1, 0, 0, -25.8218, 794.465, 805.352, 3.23924, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300149, 39960, 643, 0, 0, 3, 1, 0, 0, -23.7348, 794.67, 806.41, 3.23924, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300150, 39960, 643, 0, 0, 3, 1, 0, 0, -30.5989, 808.895, 802.598, 3.09766, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300151, 39960, 643, 0, 0, 3, 1, 0, 0, -31.3603, 805.177, 802.145, 3.09766, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300152, 39960, 643, 0, 0, 3, 1, 0, 0, -31.5007, 802.037, 802.073, 3.09373, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300153, 39960, 643, 0, 0, 3, 1, 0, 0, -31.2025, 798.868, 802.253, 3.08981, 3600, 0, 0, 630000, 0, 0, 0, 0, 0),
(300154, 39960, 643, 0, 0, 3, 1, 0, 0, -31.1189, 795.488, 802.562, 3.07802, 3600, 0, 0, 630000, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `InhabitType` = '7' WHERE `entry` IN (41139,40584);

UPDATE `gameobject_template` SET `faction` = '114', `flags` = '8', `size` = '1.1' WHERE `entry` =207209;

UPDATE `creature` SET `spawnMask` = '3', `position_x` = '-15.3291', `position_y` = '802.332', `position_z` = '807.919', `orientation` = '3.16716', `spawntimesecs` = '3600' WHERE `guid` =237033;

DELETE FROM `gameobject` WHERE `guid` IN (100120,100121,100122);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(100120, 204339, 643, 3, 1, -7.25257, 802.527, 808.278, 3.15467, 0, 0, 0.999979, -0.00653934, 300, 0, 1),
(100121, 204338, 643, 3, 1, 110.404, 802.401, 808.387, 3.14213, 0, 0, 1, -0.000269814, 300, 0, 1),
(100122, 203199, 643, 3, 1, 117.071, 796.374, 808.82, 4.07739, 0, 0, 0.892519, -0.45101, 300, 0, 1);

UPDATE `gameobject_template` SET `flags` = '0' WHERE `entry` =203199;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `faction_A` = '14', `faction_H` = '14', `AIName` = 'SmartAI', `flags_extra` = '130' WHERE `entry` =40597;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 40597;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(40597, 0, 0, 0, 1, 0, 100, 0, 6000, 6000, 10000, 10000, 11, 75700, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Geyser Kick');

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `faction_A` = '14', `faction_H` = '14', `VehicleId` = '502', `flags_extra` = '130' WHERE `entry` =48571;

UPDATE `creature_template` SET `difficulty_entry_1` = '49065', `minlevel` = '80', `maxlevel` = '80', `faction_A` = '14', `faction_H` = '14', `flags_extra` = '130' WHERE `entry` =40784;

DELETE FROM `creature_template_addon` WHERE `entry` IN (40784,40597);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(40784, 0, 0, 0, 0, 0, '76066 0'),
(40597, 0, 0, 0, 0, 0, '75699 0');
