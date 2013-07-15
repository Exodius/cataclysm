-- Start Zone Kezan
-- NPC: Defiant Troll
UPDATE `creature_template` SET `ScriptName`='npc_defiant_troll' WHERE `entry`='34830';
-- NPC: Fourth and Goal Target
-- UPDATE `creature_template` SET `ScriptName`='npc_fourth_and_goal_target' WHERE `entry`='';
-- Q: Good Help is Hard to Find
UPDATE `quest_template` SET `Method`='0' WHERE `id`='14069';
-- Q: Rolling with my Homies
UPDATE `quest_template` SET `Method`='0' WHERE `id`='14071';
-- Q: Necessary Roughness
UPDATE `quest_template` SET `Method`='0' WHERE `id`='24502';
-- Q: Fourth and Goal 1
UPDATE `quest_template` SET `Method`='0' WHERE `id`='24503';
-- Q: Fourth and Goal 2
UPDATE `quest_template` SET `Method`='0' WHERE `id`='28414';
-- Q: Life of the Party 1
UPDATE `quest_template` SET `Method`='2' WHERE `id`='14113';
-- Q: Life of the Party 1
UPDATE `quest_template` SET `Method`='2' WHERE `id`='14153';
UPDATE `creature_template` SET `ScriptName`='npc_chip_endale_q14153' WHERE `entry`='35054';
-- Q: The Great Bank Heist
UPDATE `quest_template` SET Method=2, Flags=0 WHERE `id`='14122';
-- Q: Liberate the Kaja'mite
DELETE FROM `gameobject` WHERE `id`=195492;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(7009879, 195492, 648, 1, 2048, -8491.28, 1251.21, 53.8794, 2.1294, 0, 0, 0.874644, 0.484765, 300, 0, 1),
(7009880, 195492, 648, 1, 2048, -8492.44, 1252.12, 53.9881, 1.00628, 0, 0, 0.48218, 0.876072, 300, 0, 1),
(7009881, 195492, 648, 1, 2048, -8491.04, 1252.21, 54.0497, 0.558606, 0, 0, 0.275686, 0.961248, 300, 0, 1),
(7009882, 195492, 648, 1, 2048, -8484.39, 1256.57, 58.9454, 0.515409, 0, 0, 0.254862, 0.966978, 300, 0, 1),
(7009883, 195492, 648, 1, 2048, -8483.35, 1254.92, 58.9454, 0.460431, 0, 0, 0.228187, 0.973617, 300, 0, 1),
(7009884, 195492, 648, 1, 2048, -8483.09, 1256.28, 58.9454, 1.32044, 0, 0, 0.613292, 0.789857, 300, 0, 1),
(7009885, 195492, 648, 1, 2048, -8521.9, 1221.77, 53.1325, 4.09683, 0, 0, 0.888093, -0.459664, 300, 0, 1),
(7009886, 195492, 648, 1, 2048, -8523.56, 1221.64, 53.0214, 3.7002, 0, 0, 0.961248, -0.275685, 300, 0, 1),
(7009887, 195492, 648, 1, 2048, -8522.87, 1223.09, 52.9491, 4.01043, 0, 0, 0.907115, -0.420883, 300, 0, 1),
(7009888, 195492, 648, 1, 65535, -8465.26, 1192.08, 41.9338, 4.82691, 0, 0, 0.66548, -0.746416, 300, 0, 1),
(7009889, 195492, 648, 1, 65535, -8463.73, 1191.07, 41.9321, 3.35037, 0, 0, 0.994557, -0.104197, 300, 0, 1),
(7009890, 195492, 648, 1, 65535, -8463.8, 1176.47, 41.8433, 2.91636, 0, 0, 0.993665, 0.11238, 300, 0, 1),
(7009891, 195492, 648, 1, 65535, -8470.06, 1175.93, 41.8837, 0.536888, 0, 0, 0.265231, 0.964185, 300, 0, 1),
(7009892, 195492, 648, 1, 65535, -8471.45, 1182.28, 41.9332, 0.450494, 0, 0, 0.223347, 0.974739, 300, 0, 1),
(7009893, 195492, 648, 1, 65535, -8472.38, 1185.75, 41.9332, 5.83047, 0, 0, 0.224428, -0.974491, 300, 0, 1),
(7009894, 195492, 648, 1, 65535, -8469.95, 1191.5, 41.9345, 5.01759, 0, 0, 0.591402, -0.806377, 300, 0, 1),
(7009895, 195492, 648, 1, 65535, -8468.55, 1188.33, 41.933, 4.3932, 0, 0, 0.810494, -0.585747, 300, 0, 1),
(7009896, 195492, 648, 1, 65535, -8493.81, 1173.91, 41.9339, 3.4036, 0, 0, 0.991432, -0.130627, 300, 0, 1),
(7009897, 195492, 648, 1, 65535, -8497.95, 1179.24, 41.9339, 4.34607, 0, 0, 0.824069, -0.566489, 300, 0, 1);
-- Q: 447
UPDATE `quest_template` SET Method=2, Flags=0 WHERE `id`='14125';
UPDATE `creature_template` SET `ScriptName`='npc_sassy_hardwrench_p6144' WHERE `entry`='34668';
UPDATE `creature` SET `phaseMask`='6144' WHERE `id`='37602';
-- UPDATE `creature` SET `phaseMask`='4096' WHERE `id`='37602'; -- OLD
-- Q: Life savings
UPDATE `creature_template` SET `ScriptName`='npc_trade_prince_gallywix_out' WHERE `entry`='35222';
-- Lost Isles
-- Q: Miner Troubles
UPDATE `quest_template` SET `Method`='0' WHERE `id`='14021';
-- Q: Precious Cargo
UPDATE `creature_template` SET `ScriptName`='npc_gorochoppa_q14242' WHERE `entry`='36127';
-- Q: Warchief's Revenge
UPDATE `creature_template` SET `ScriptName`='npc_thrall_q14243' WHERE `entry`='36161';
