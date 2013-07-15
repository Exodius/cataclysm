UPDATE `creature_template` SET `InhabitType` = '4' WHERE `entry` =40183;

UPDATE `creature` SET `spawntimesecs` = '60' WHERE `id` =39444;

UPDATE `creature_template` SET `modelid1` = '11686' WHERE `entry` =40283;

DELETE FROM `creature_template_addon` WHERE `entry` IN (40283,41168,47040,30);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(40283, 0, 0, 0, 0, 0, '75116'),
(41168, 0, 0, 0, 0, 0, '77026'),
(47040, 0, 0, 0, 0, 0, '87645');

UPDATE `creature_template` SET `modelid1` = '11686', `modelid2` = '11686', `minlevel` = '85', `maxlevel` = '85', `faction_A` = '14', `faction_H` = '14', `unit_flags` = '34111552', `flags_extra` = '128' WHERE `entry` =41168;

UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14' WHERE `entry` =39732;

DELETE FROM `gameobject` WHERE `guid` = 100160;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(100160, 207408, 657, 2, 65535, -533.027, -141.558, 623.665, 3.17763, 0, 0, 0.999838, -0.0180158, 300, 0, 1);

UPDATE `creature_template` SET `InhabitType` = '4' WHERE `entry` =45991;

UPDATE `smart_scripts` SET `event_flags` = '32' WHERE `entryorguid` = 53134;

UPDATE `creature_template` SET `InhabitType` = '5' WHERE `entry` IN (43214,49538);
