DELETE FROM `smart_scripts` WHERE `entryorguid` = 40936;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(40936, 0, 0, 0, 0, 0, 100, 6, 4000, 12000, 16000, 28000, 11, 76590, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Faceless Watcher - Cast Ground Pound');

UPDATE `creature_template` SET `difficulty_entry_1` = '49082', `exp` = '3', `faction_A` = '35', `faction_H` = '35', `dmg_multiplier` = '13' WHERE `entry` =40788;

UPDATE `creature_template` SET `difficulty_entry_1` = '49072', `exp` = '3', `faction_A` = '26', `faction_H` = '26', `Health_mod` = '40', `mechanic_immune_mask` = '650854399' WHERE `entry` =40825;

UPDATE `creature_template` SET `VehicleId` = '789' WHERE `entry` =40825;

DELETE FROM `creature_template_addon` WHERE `entry` = 45469;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(45469, 0, 0, 0, 0, 0, '84935 0');

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `faction_A` = '16', `faction_H` = '16', `flags_extra` = '130' WHERE `entry` =45469;

UPDATE `creature_template` SET `difficulty_entry_1` = '49094', `exp` = '3', `faction_A` = '35', `faction_H` = '35' WHERE `entry` =40792;

DELETE FROM `creature` WHERE `guid` IN (237079,236978,236984,237048,237078,236679,236982,237050,237049,237077,237047,236980,236983,236977,237080,236981,237051,237053,237052);
