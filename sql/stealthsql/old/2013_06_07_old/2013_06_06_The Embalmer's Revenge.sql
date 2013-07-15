DELETE FROM `smart_scripts` WHERE (`entryorguid`=263 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(263, 0, 0, 0, 1, 0, 100, 0, 20000, 30000, 120000, 120000, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Lord Ello Ebonlocke - Out Of Combat - Say Line 0"),
(263, 0, 1, 0, 19, 0, 100, 0, 26727, 0, 0, 0, 12, 43862, 1, 300000, 0, 0, 0, 8, 0, 0, 0, -10555.42, -1159.47, 27.99, 0, "on quest accept summon stiched");

UPDATE `creature_template` SET `KillCredit1` = '', `Health_mod` = 10 WHERE `entry` = 43862;
UPDATE `creature_template` SET `KillCredit1` = '', `unit_flags` = 0 WHERE `entry` = 43862;

UPDATE `creature_template` SET `unit_flags` = 512 WHERE `entry` = 4322;
UPDATE `creature_template` SET `unit_flags` = 512 WHERE `entry` = 10038;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=43862 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(43862, 0, 0, 0, 11, 0, 100, 1, 0, 0, 0, 0, 11, 3106, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Cast Aura of Rot on Spawn"),
(43862, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 33, 43862, 0, 0, 0, 0, 0, 18, 100, 0, 0, 0, 0, 0, 0, "give credit to player");