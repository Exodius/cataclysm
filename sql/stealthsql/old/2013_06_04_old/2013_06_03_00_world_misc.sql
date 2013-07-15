DELETE FROM `npc_vendor` WHERE `entry` IN (45408,45290);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
(45408, 0, 62321, 0, 0, 0, 1),
(45408, 0, 62333, 0, 0, 0, 1),
(45408, 0, 62342, 0, 0, 0, 1),
(45408, 0, 62343, 0, 0, 0, 1),
(45408, 0, 62344, 0, 0, 0, 1),
(45408, 0, 62345, 0, 0, 0, 1),
(45408, 0, 62346, 0, 0, 0, 1),
(45408, 0, 62347, 0, 0, 0, 1),
(45408, 0, 62348, 0, 0, 0, 1),
(45408, 0, 62350, 0, 0, 0, 1),
(45408, 0, 62351, 0, 0, 0, 1),
(45408, 0, 62352, 0, 0, 0, 1),
(45408, 0, 65907, 0, 0, 0, 1),
(45290, 0, 159, 0, 0, 0, 1),
(45290, 0, 4470, 0, 0, 0, 1),
(45290, 0, 4565, 0, 0, 0, 1),
(45290, 0, 58274, 0, 0, 0, 1),
(45290, 0, 58275, 0, 0, 0, 1),
(45290, 0, 60335, 0, 0, 0, 1),
(45290, 0, 63388, 0, 0, 0, 1),
(45290, 0, 64670, 0, 0, 0, 1);

DELETE FROM `spell_target_position` WHERE `id` = 84699;
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(84699, 646, 2356.45, 177.029, 181.186, 6.2005);

UPDATE `creature_template` SET `npcflag` = '66433', `unit_flags` = '32768' WHERE `entry` =49406;

DELETE FROM `creature_template_addon` WHERE `entry` IN (48591,48538);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(48591, 0, 0, 0, 0, 0, '90449'),
(48538, 0, 0, 0, 0, 0, '90373');

UPDATE `creature_template` SET `exp` = '3' WHERE `entry` =40925;

UPDATE `creature_template` SET `Health_mod` = '3' WHERE `entry` =49102;

UPDATE `creature_template` SET `exp` = '3', `Health_mod` = '3' WHERE `entry` IN (40923,44658);
