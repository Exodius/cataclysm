UPDATE `creature_template` SET `difficulty_entry_1` = '49262', `AIName` = '' WHERE `entry` =39425;

DELETE FROM `creature_equip_template` WHERE `entry` IN (49262,48815,39378);
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(49262, 1, 28914, 0, 0),
(48815, 1, 1728, 0, 0),
(39378, 1, 1728, 0, 0);

UPDATE `creature_template` SET `mingold` = '15000', `maxgold` = '20000', `equipment_id` = '49262', `mechanic_immune_mask` = '651116543' WHERE `entry` =49262;

UPDATE `creature_template` SET `Health_mod` = '40', `Mana_mod` = '7' WHERE `entry` =49262;

UPDATE `creature_template` SET `unit_flags` = '33554432', `flags_extra` = '128' WHERE `entry` =40283;

UPDATE `creature_template` SET `unit_flags` = '0', `InhabitType` = '5', `flags_extra` = '128' WHERE `entry` =40183;

DELETE FROM `gameobject` WHERE `guid` IN (100102,100103,100104,100105,100106,100107,100108,100109,100110,100111,100112,100113,100114,100115);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(100102, 207219, 644, 2, 65535, -677.42, 339.683, 54.2869, 0.0011549, 0, 0, 0.00057745, 1, 300, 0, 1),
(100103, 207218, 644, 2, 65535, -603.533, 339.75, 54.5983, 3.12832, 0, 0, 0.999978, 0.00663379, 300, 0, 1),
(100104, 206506, 644, 3, 1, -640.609, 304.629, 53.2235, 3.14159, 0, 0, -1, 0, 86400, 255, 1),
(100105, 202307, 644, 3, 1, -640.603, 235.515, 83.7969, 1.5708, 0, 0, 0.707107, 0.707107, 86400, 255, 1),
(100106, 204972, 644, 3, 1, -536.462, 193.262, 79.839, 3.08918, 0, 0, 0.999657, 0.0262017, 86400, 255, 1),
(100107, 207547, 644, 3, 1, -505.522, 193.411, 79.2668, 3.14159, 0, 0, -1, 0, 86400, 255, 1),
(100108, 202312, 644, 3, 1, -505.512, 297.225, 97.2938, 1.5708, 0, 0, 0.707107, 0.707107, 86400, 255, 0),
(100109, 202309, 644, 3, 1, -505.512, 258.937, 83.7969, 1.5708, 0, 0, 0.707107, 0.707107, 86400, 255, 0),
(100110, 202313, 644, 3, 1, -439.702, 366.762, 89.7368, 0, 0, 0, 0, 1, 86400, 255, 1),
(100111, 202314, 644, 3, 1, -120.96, 366.887, 89.557, 3.14159, 0, 0, -1, 0, 86400, 255, 1),
(100112, 207349, 644, 3, 1, -30.1354, 365.958, 90.1721, 3.14159, 0, 0, -1, 0, 86400, 255, 1),
(100113, 204979, 644, 3, 1, -74.1892, 366.75, 89.4228, 3.08918, 0, 0, 0.999657, 0.0262017, 86400, 255, 1),
(100114, 202311, 644, 3, 1, -505.512, -65.1685, 83.7969, 1.5708, 0, 0, 0.707107, 0.707107, 86400, 255, 0),
(100115, 207669, 644, 3, 1, -489.542, 210.396, 330.57, 3.90954, 0, 0, -0.927183, 0.374608, 86400, 255, 1);

UPDATE `creature_template` SET `modelid2` = '11686' WHERE `entry` =40183;

UPDATE `creature_template` SET `InhabitType` = '7' WHERE `entry` =40183;

DELETE FROM `creature` WHERE `guid` IN (300107,300108,300109,300110,300111,300112,300113,300114,300115,300116);
INSERT INTO `creature` (`guid`, `id`, `map`, `zone`, `area`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(300107, 40183, 644, 0, 0, 3, 1, 0, 0, -678, 334, 64, 3.8337, 300, 0, 0, 528129, 0, 0, 0, 33554432, 0),
(300108, 40183, 644, 0, 0, 3, 1, 0, 0, -603, 334, 65, 4.4738, 300, 0, 0, 528129, 0, 0, 0, 33554432, 0),
(300109, 40183, 644, 0, 0, 3, 1, 0, 0, -656, 350, 85, 4.77302, 300, 0, 0, 528129, 0, 0, 0, 0, 0),
(300110, 40183, 644, 0, 0, 3, 1, 0, 0, -625, 350, 85, 5.69978, 300, 0, 0, 528129, 0, 0, 0, 0, 0),
(300111, 41055, 644, 0, 0, 3, 1, 0, 0, -474.068, 30.0247, 343.921, 0.178305, 10, 0, 0, 1, 0, 0, 0, 0, 0),
(300112, 41055, 644, 0, 0, 3, 1, 0, 0, -534.652, -15.6444, 343.924, 3.19816, 10, 0, 0, 1, 0, 0, 0, 0, 0),
(300113, 41055, 644, 0, 0, 3, 1, 0, 0, -536.15, 26.4038, 343.923, 1.59202, 10, 0, 0, 1, 0, 0, 0, 0, 0),
(300114, 41055, 644, 0, 0, 3, 1, 0, 0, -505.53, -16.4163, 343.945, 1.66344, 10, 0, 0, 1, 0, 0, 0, 0, 0),
(300115, 41055, 644, 0, 0, 3, 1, 0, 0, -468.175, -9.38001, 343.914, 2.95076, 10, 0, 0, 1, 0, 0, 0, 0, 0),
(300116, 39842, 645, 0, 0, 3, 1, 0, 0, 573.712, 905.18, 178.154, 1.71, 300, 0, 0, 42, 0, 0, 0, 33554432, 0);

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` =39908;

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` =39788;

UPDATE `creature_template` SET `difficulty_entry_1` = '48902' WHERE `entry` =39788;

UPDATE `creature_template` SET `mindmg` = '1111.5', `maxdmg` = '1430.7', `attackpower` = '1613', `dmg_multiplier` = '13', `minrangedmg` = '989.9', `maxrangedmg` = '1174.2', `rangedattackpower` = '225', `lootid` = '48902', `mingold` = '2000', `maxgold` = '4400', `Health_mod` = '60', `mechanic_immune_mask` = '651116543' WHERE `entry` =48902;

UPDATE `creature_template` SET `modelid1` = '11686', `modelid2` = '11686', `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14' WHERE `entry` =41041;

UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14' WHERE `entry` =39443;

UPDATE `creature_template` SET `difficulty_entry_1` = '48714', `AIName` = '' WHERE `entry` =39428;

UPDATE `creature_template` SET `mindmg` = '1111.5', `maxdmg` = '1430.7', `attackpower` = '1613', `dmg_multiplier` = '13', `minrangedmg` = '989.9', `maxrangedmg` = '1174.2', `rangedattackpower` = '225', `lootid` = '48714', `mingold` = '6220', `maxgold` = '8046', `Health_mod` = '55', `mechanic_immune_mask` = '651116543' WHERE `entry` =48714;

UPDATE `gameobject_template` SET `flags` = '40' WHERE `entry` =207547;

UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` IN (39373,39366,41364,41371);

UPDATE `creature_template` SET `difficulty_entry_1` = '48815', `AIName` = '' WHERE `entry` =39378;

UPDATE `creature_template` SET `mindmg` = '1111.5', `maxdmg` = '1430.7', `attackpower` = '1613', `dmg_multiplier` = '13', `minrangedmg` = '989.9', `maxrangedmg` = '1174.2', `rangedattackpower` = '225', `lootid` = '48815', `mingold` = '1100', `maxgold` = '1400', `Health_mod` = '60', `equipment_id` = '48815', `mechanic_immune_mask` = '617299803' WHERE `entry` =48815;

UPDATE `creature_template` SET `equipment_id` = '39378' WHERE `entry` =39378;

UPDATE `creature_template` SET `modelid2` = '11686', `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `VehicleId` = '790', `flags_extra` = '128' WHERE `entry` =40927;

UPDATE `creature_template` SET `modelid2` = '11686', `minlevel` = '85', `maxlevel` = '85', `faction_A` = '14', `faction_H` = '14', `VehicleId` = '1233', `flags_extra` = '128' WHERE `entry` =47040;

UPDATE `creature_template` SET `modelid2` = '11686', `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `VehicleId` = '787', `flags_extra` = '128' WHERE `entry` =40835;

UPDATE `creature_template` SET `modelid2` = '11686', `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `flags_extra` = '128', `ScriptName` = '' WHERE `entry` =47922;

UPDATE `creature_template` SET `modelid2` = '11686', `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `flags_extra` = '128', `ScriptName` = '' WHERE `entry` =39634;

UPDATE `creature_template` SET `modelid2` = '11686', `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `flags_extra` = '128', `ScriptName` = '' WHERE `entry` =39635;

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` =39732;

UPDATE `creature_template` SET `difficulty_entry_1` = '48769' WHERE `entry` =41055;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `unit_flags` = '33587264', `flags_extra` = '128' WHERE `entry` =48769;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827', `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =41208;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (41208,39795,39720,39721,39978,39987,39994,40017,40021,40019,40023);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(41208, 0, 0, 0, 0, 0, 100, 6, 3000, 3000, 30000, 35000, 11, 77238, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Halls of Origination: Void Sentinel - Charged Fists'),
(39795, 0, 0, 0, 0, 0, 100, 6, 3000, 3000, 3000, 5000, 11, 74374, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Halls of Origination: Celestial Familiar - Arcane Barrage'),
(39720, 0, 0, 0, 0, 0, 100, 6, 3000, 3000, 12000, 15000, 11, 74134, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Halls of Origination: Astral Rain - Astral Rain'),
(39721, 0, 0, 0, 0, 0, 100, 6, 3000, 3000, 3000, 5000, 11, 74374, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Halls of Origination: Celestial Call - Arcane Barrage'),
(39978, 0, 0, 0, 0, 0, 100, 6, 1000, 10000, 9000, 11000, 11, 76478, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Red-Hot Poker cast'),
(39978, 0, 1, 0, 0, 0, 100, 6, 6000, 12000, 15000, 20000, 11, 76484, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Shackles cast'),
(39978, 0, 2, 0, 2, 0, 100, 7, 0, 30, 0, 0, 11, 76487, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cast Wild Beatdown'),
(39987, 0, 0, 0, 0, 0, 100, 6, 6000, 8000, 15000, 20000, 11, 76522, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Force Blast cast'),
(39987, 0, 1, 0, 0, 0, 100, 6, 15000, 20000, 15000, 20000, 11, 82362, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Shadow Strike cast'),
(39987, 0, 2, 0, 0, 0, 100, 6, 7000, 10000, 20000, 25000, 11, 76561, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Gravity Strike cast'),
(39987, 0, 3, 0, 0, 0, 100, 6, 2000, 7000, 10000, 20000, 11, 76524, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Grievous Whirl cast'),
(39994, 0, 0, 0, 0, 0, 100, 6, 4000, 8000, 8000, 12000, 11, 76618, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Immolate cast'),
(39994, 0, 1, 0, 0, 0, 100, 6, 7000, 10000, 10000, 12000, 11, 76617, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Type a script description here.'),
(40017, 0, 0, 0, 0, 0, 100, 6, 4000, 8000, 6000, 12000, 11, 76680, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Chain Lightning cast'),
(40017, 0, 1, 0, 0, 0, 100, 6, 1000, 3000, 4000, 18000, 11, 76677, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Fire Blast cast'),
(40017, 0, 2, 0, 0, 0, 100, 6, 2000, 2000, 4000, 4000, 11, 58025, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Frost Buffet cast'),
(40017, 0, 3, 0, 0, 0, 100, 6, 10000, 15000, 15000, 25000, 11, 76682, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Frost Bomb cast'),
(40021, 0, 0, 0, 0, 0, 100, 6, 2000, 4000, 4000, 6000, 11, 76719, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Fireball cast'),
(40021, 0, 1, 0, 6, 0, 100, 6, 4000, 8000, 6000, 12000, 11, 76718, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Finall Volley cast'),
(40019, 0, 0, 0, 0, 0, 100, 6, 2000, 10000, 8000, 15000, 11, 76688, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Raufen - Cast Bore'),
(40019, 0, 1, 0, 0, 0, 100, 6, 5000, 15000, 12000, 20000, 11, 76686, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Raufen - Cast Shadow Prison'),
(40023, 0, 0, 0, 0, 0, 100, 6, 4000, 8000, 16000, 25000, 11, 76716, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Bludgeoning Strike cast'),
(40023, 0, 1, 0, 0, 0, 100, 6, 7000, 12000, 20000, 25000, 11, 76717, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Meteor cast');

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827' WHERE `entry` =41212;

UPDATE `creature_template` SET `flags_extra` = '128' WHERE `entry` =41041;

UPDATE `creature_template` SET `AIName` = '', `ScriptName` = '' WHERE `entry` =40668;

UPDATE `creature_template` SET `AIName` = '', `ScriptName` = '' WHERE `entry` =40715;

UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827', `flags_extra` = '64', `ScriptName` = '' WHERE `entry` =51329;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827' WHERE `entry` =40669;

UPDATE `creature_template` SET `difficulty_entry_1` = '48716', `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827' WHERE `entry` =40620;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827' WHERE `entry` =48716;

UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` IN (40033,40170);

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` =39587;

UPDATE `creature_template` SET `subname` = '' WHERE `entry` =39665;

UPDATE `creature_template` SET `mindmg` = '8060', `maxdmg` = '9048', `minrangedmg` = '477.6', `maxrangedmg` = '682.8', `rangedattackpower` = '159', `lootid` = '48710', `mingold` = '1100', `maxgold` = '1400', `Health_mod` = '45', `Mana_mod_extra` = '90.4114', `mechanic_immune_mask` = '651116543' WHERE `entry` =48710;

UPDATE `creature_template` SET `modelid2` = '11686', `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `flags_extra` = '128' WHERE `entry` =39613;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `AIName` = 'SmartAI', `flags_extra` = '64' WHERE `entry` =39795;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (39720,39721);

DELETE FROM `creature_template_addon` WHERE `entry` IN (39795,39613,39635,40835,47922,50284,40817);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(39795, 0, 0, 0, 0, 0, '74356 0'),
(39613, 0, 0, 0, 0, 0, '74044 0'),
(39635, 0, 0, 0, 0, 0, '74109 0 74107 0'),
(40835, 0, 0, 0, 0, 0, '73658 0'),
(47922, 0, 0, 0, 0, 0, '89131 0'),
(50284, 0, 0, 0, 0, 0, '75608 0 75608 1'),
(40817, 0, 0, 0, 0, 0, '76167 0 76164 0 76190 0');

UPDATE `creature_template` SET `difficulty_entry_1` = '39709' WHERE `entry` =39708;

UPDATE `creature_template` SET `difficulty_entry_1` = '39983' WHERE `entry` =39982;

UPDATE `creature_template` SET `difficulty_entry_1` = '39981' WHERE `entry` =39980;

UPDATE `creature_template` SET `difficulty_entry_1` = '39986' WHERE `entry` =39985;

UPDATE `creature_template` SET `difficulty_entry_1` = '39979' WHERE `entry` =39978;

UPDATE `creature_template` SET `difficulty_entry_1` = '39666', `maxlevel` = '82', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `minrangedmg` = '689.7', `maxrangedmg` = '989.9', `rangedattackpower` = '157', `mingold` = '3220', `maxgold` = '6046', `AIName` = '', `Health_mod` = '20.03', `equipment_id` = '39665', `mechanic_immune_mask` = '650854399', `flags_extra` = '0' WHERE `entry` =39665;

UPDATE `creature` SET `spawnMask` = '3', `position_x` = '249.264', `position_y` = '949.161', `position_z` = '191.787', `orientation` = '3.07458' WHERE `guid` =237353;

UPDATE `creature_template` SET `exp` = '3', `mindmg` = '2500', `maxdmg` = '3500', `attackpower` = '7000', `dmg_multiplier` = '30.5', `baseattacktime` = '0', `rangeattacktime` = '0', `Health_mod` = '150', `mechanic_immune_mask` = '650854399' WHERE `entry` =39670;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `flags_extra` = '130' WHERE `entry` =40401;

UPDATE `creature_template` SET `difficulty_entry_1` = '50379', `modelid1` = '33553', `minlevel` = '81', `maxlevel` = '81', `faction_A` = '14', `faction_H` = '14' WHERE `entry` =40447;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '14', `faction_H` = '14', `Mana_mod` = '0.6' WHERE `entry` =50379;

UPDATE `creature_template` SET `minlevel` = '85', `faction_A` = '14', `faction_H` = '14' WHERE `entry` =50376;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (76336,76164,76686,93674,75676);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(76336, 'spell_fire_strike_target_check'),
(76164, 'spell_shadow_of_obsidius_absorb'),
(76686, 'spell_shadow_prison'),
(93674, 'spell_shadow_prison'),
(75676, 'spell_corla_beam_target_check');

DELETE FROM `waypoint_data` WHERE `id` IN (39670,39671,237353,2373530);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES
(39670, 1, 210.076, 949.887, 191.016, 0, 0, 0, 0, 100, 0),
(39670, 2, 212.033, 918.693, 190.94, 0, 0, 0, 0, 100, 0),
(39670, 3, 242.135, 908.798, 190.962, 0, 0, 0, 0, 100, 0),
(39670, 4, 269.328, 919.636, 190.961, 0, 0, 0, 0, 100, 0),
(39670, 5, 290.569, 950.103, 190.807, 0, 0, 0, 0, 100, 0),
(39670, 6, 404.446, 947.556, 193.714, 0, 0, 0, 0, 100, 0),
(39671, 0, 368.833, 815.968, 105.559, 0, 0, 0, 0, 100, 0),
(39671, 1, 348.334, 816.162, 104.441, 0, 0, 0, 0, 100, 0),
(39671, 2, 292.861, 815.546, 103.519, 0, 0, 0, 0, 100, 0);

DELETE FROM `conditions` WHERE SourceEntry IN(80196,80340,82393);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 80196, 0, 0, 18, 0, 1, 39987, 0, 0, 0, 0, '', 'Raufen - Raz faction override'),
(13, 0, 80196, 0, 0, 18, 0, 1, 39980, 0, 0, 0, 0, '', 'Raufen - Raz faction override'),
(13, 0, 80196, 0, 0, 18, 0, 1, 39978, 0, 0, 0, 0, '', 'Raufen - Raz faction override'),
(13, 0, 80196, 0, 0, 18, 0, 1, 39708, 0, 0, 0, 0, '', 'Raufen - Raz faction override'),
(13, 0, 80340, 0, 0, 18, 0, 1, 39708, 0, 0, 0, 0, '', 'Raufen - Raz dummy spell target filter'),
(13, 0, 80340, 0, 0, 18, 0, 1, 39978, 0, 0, 0, 0, '', 'Raufen - Raz dummy spell target filter'),
(13, 0, 80340, 0, 0, 18, 0, 1, 39980, 0, 0, 0, 0, '', 'Raufen - Raz dummy spell target filter'),
(13, 0, 80340, 0, 0, 18, 0, 1, 39987, 0, 0, 0, 0, '', 'Raufen - Raz dummy spell target filter'),
(13, 0, 80340, 0, 0, 18, 0, 1, 39982, 0, 0, 0, 0, '', 'Raufen - Raz dummy spell target filter'),
(13, 0, 80340, 0, 0, 18, 0, 1, 39985, 0, 0, 0, 0, '', 'Raufen - Raz dummy spell target filter'),
(13, 0, 80196, 0, 0, 18, 0, 1, 39982, 0, 0, 0, 0, '', 'Raufen - Raz faction override'),
(13, 0, 80196, 0, 0, 18, 0, 1, 39985, 0, 0, 0, 0, '', 'Raufen - Raz faction override'),
(13, 0, 82393, 0, 0, 18, 0, 1, 39670, 0, 0, 0, 0, '', 'Raufen - On Raz from Ascendant Lord');

UPDATE `creature_template` SET `difficulty_entry_1` = '39988', `AIName` = 'SmartAI' WHERE `entry` =39987;

UPDATE `creature_template` SET `difficulty_entry_1` = '50285' WHERE `entry` =50284;

UPDATE `creature_template` SET `exp` = '2', `faction_A` = '35', `faction_H` = '35', `unit_flags` = '0' WHERE `entry` =39842;

UPDATE `creature_template` SET `InhabitType` = '4' WHERE `entry` =39842;

UPDATE `creature_template` SET `flags_extra` = '194' WHERE `entry` =22925;

UPDATE `creature_template` SET `difficulty_entry_1` = '39995', `AIName` = 'SmartAI' WHERE `entry` =39994;

UPDATE `creature_template` SET `difficulty_entry_1` = '39699' WHERE `entry` =39698;

UPDATE `creature_template` SET `difficulty_entry_1` = '40018', `mingold` = '3220', `maxgold` = '6046', `AIName` = 'SmartAI' WHERE `entry` =40017;

UPDATE `creature_template` SET `difficulty_entry_1` = '40022', `AIName` = 'SmartAI' WHERE `entry` =40021;

UPDATE `creature_template` SET `difficulty_entry_1` = '40020', `AIName` = 'SmartAI' WHERE `entry` =40019;

UPDATE `creature_template` SET `difficulty_entry_1` = '40024', `AIName` = 'SmartAI' WHERE `entry` =40023;

UPDATE `creature_template` SET `difficulty_entry_1` = '39701', `maxlevel` = '82', `Health_mod` = '20', `mechanic_immune_mask` = '650854399' WHERE `entry` =39700;

UPDATE `creature_template` SET `difficulty_entry_1` = '40009', `Health_mod` = '8' WHERE `entry` =40008;

UPDATE `creature_template` SET `difficulty_entry_1` = '40014', `maxlevel` = '81', `Health_mod` = '8', `mechanic_immune_mask` = '650854399' WHERE `entry` =40013;

UPDATE `creature_template` SET `difficulty_entry_1` = '40016', `maxlevel` = '81', `Health_mod` = '6.4', `mechanic_immune_mask` = '650854399' WHERE `entry` =40015;

UPDATE `creature_template` SET `difficulty_entry_1` = '39706', `maxlevel` = '82' WHERE `entry` =39705;

UPDATE `creature_template` SET `difficulty_entry_1` = '40818', `maxlevel` = '82', `mechanic_immune_mask` = '650851327', `flags_extra` = '64' WHERE `entry` =40817;
