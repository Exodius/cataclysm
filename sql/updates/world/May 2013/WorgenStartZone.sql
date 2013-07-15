/*
* Copyright (C) 2012-2013 HTCore <http://cata.vfire-core.com/>
* Copyright (C) 2012-2013 WoW Source <http://wowsource.info/>
* by Shee Shen
*/

-- Console Fix
UPDATE `creature` SET `equipment_id` = 0 WHERE `id` = 49871;

-- Start Zone Worgen
UPDATE `gameobject` SET `phaseMask`='12' WHERE `map`='654' AND `phaseMask`='1';
UPDATE `creature` SET `phaseMask`='12' WHERE `map`='654' AND `phaseMask`='1';
UPDATE `gameobject` SET `phaseMask`='12' WHERE `map`='654' AND `phaseMask`='2';
UPDATE `creature` SET `phaseMask`='12' WHERE `map`='654' AND `phaseMask`='2';
UPDATE `gameobject` SET `phaseMask`='12' WHERE `map`='654' AND `phaseMask`='3';
UPDATE `creature` SET `phaseMask`='12' WHERE `map`='654' AND `phaseMask`='3';
UPDATE `gameobject` SET `phaseMask`='12' WHERE `map`='654' AND `phaseMask`='4';
UPDATE `creature` SET `phaseMask`='12' WHERE `map`='654' AND `phaseMask`='4';
-- Creature Optimial
UPDATE `creature_template` SET `name`='Bloodfang Ripper' WHERE `entry`='35505';
DELETE FROM `creature` WHERE `id`='35505';
DELETE FROM `creature_addon` WHERE `guid` IN (861187, 861176, 861183, 861181, 861206, 861202, 861204, 861179, 861177, 861208, 861209, 861188, 861210, 861165, 861155, 861197, 861200, 861203, 861205, 861178, 861189);
-- Evacuate the Merchant Square (14098)
UPDATE `quest_template` SET `Method`='0' WHERE `id`='14098';
UPDATE `gameobject_template` SET `ScriptName`='go_merchant_square_door' WHERE `entry`='195327';
-- By the Skin of His Teeth (14154)
UPDATE `quest_template` SET `Method`='0' WHERE `id`='14154';
-- Door
DELETE FROM `gameobject` WHERE `guid`='810122';
DELETE FROM `gameobject` WHERE `guid`='810205';
DELETE FROM `gameobject` WHERE `guid`='810159';
DELETE FROM `gameobject` WHERE `guid`='810163';
DELETE FROM `gameobject` WHERE `guid`='810206';
-- Creature
DELETE FROM `creature` WHERE `guid`='861589';
DELETE FROM `creature` WHERE `guid`='861590';
DELETE FROM `creature` WHERE `guid`='861358';
DELETE FROM `creature` WHERE `guid`='861346';
-- Q: Save Krennan Aranas
UPDATE `quest_template` SET `Method`='2' WHERE `id`='14293';
UPDATE `creature_template` SET `ScriptName`='npc_king_genn_greymane' WHERE `entry`='35550';
-- Q: Sacrifices
UPDATE `creature_template` SET `ScriptName`='npc_lord_darius_crowley_c2' WHERE `entry`='35552';
-- Q: By Blood and Ash
UPDATE `quest_template` SET `Method`='0' WHERE `id`='14218';
-- 
DELETE FROM `creature` WHERE `id`=36332;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(16001857, 36332, 654, 1, 12, 0, 0, -1819.05, 2289.91, 42.2886, 2.72949, 300, 0, 0, 198, 0, 0, 0, 0, 0);
-- UPDATE `creature` SET `phaseMask`='12' WHERE `guid`='861309';
-- Q: Two By Sea
UPDATE `quest_template` SET `Method`='0' WHERE `id`='14382';
-- Q: Save the Children!
UPDATE `quest_template` SET `Method`='0' WHERE `id`='14368';
-- Q: Gasping for Breath
UPDATE `quest_template` SET `Method`='0' WHERE `id`='14395';
-- Q: The Hungry Ettin
UPDATE `quest_template` SET `Method`='0' WHERE `id`='14416';
-- Q. Grandma's Cat
UPDATE `creature_template` SET unit_flags=32768, faction_A=2201, faction_H=2201 WHERE `entry`='36461';
UPDATE `creature` SET `phaseMask`='12' WHERE `guid`='861533';
-- Q: Exodus
UPDATE `creature_template` SET `ScriptName`='npc_king_genn_greymane_q24438' WHERE `entry`='36743';
-- Q: Stranded at the Marsh
UPDATE `quest_template` SET `Method`='0' WHERE `id`='24468';
-- Q: Pieces of the Past
DELETE FROM `gameobject` WHERE `id`=201607;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(8009988, 201607, 654, 1, 12, -2487.9, 1566.32, 16.8482, 2.95034, 0, 0, 0.995431, 0.095479, 300, 0, 1),
(8009989, 201607, 654, 1, 12, -2490.39, 1570.15, 16.8441, 2.54979, 0, 0, 0.95654, 0.291602, 300, 0, 1),
(8009990, 201607, 654, 1, 12, -2466.07, 1571.02, 16.8277, 0.719812, 0, 0, 0.352186, 0.93593, 300, 0, 1),
(8009991, 201607, 654, 1, 12, -2461.92, 1569.44, 16.8277, 1.14393, 0, 0, 0.541284, 0.84084, 300, 0, 1),
(8009992, 201607, 654, 1, 12, -2464.66, 1561.75, 16.8277, 0.374236, 0, 0, 0.186028, 0.982544, 300, 0, 1),
(8009993, 201607, 654, 1, 12, -2446.03, 1556.17, 16.8088, 4.9217, 0, 0, 0.629372, -0.777104, 300, 0, 1),
(8009994, 201607, 654, 1, 12, -2445.14, 1552.95, 16.7942, 5.26335, 0, 0, 0.488107, -0.872784, 300, 0, 1),
(8009995, 201607, 654, 1, 12, -2447.47, 1532.42, 16.7948, 3.28414, 0, 0, 0.997461, -0.0712141, 300, 0, 1);
-- Q: Losing your tail
DELETE FROM `creature` WHERE `id`=37953;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(16001868, 37953, 654, 1, 12, 0, 0, -2253.2, 1507.62, -17.0065, 3.63897, 300, 0, 0, 176, 0, 0, 0, 0, 0);
-- Q: Take Back What's Ours
DELETE FROM `creature` WHERE `id`='38022';
-- Q: Slaves to No One
UPDATE `creature` SET `phaseMask`='12' WHERE `id`='37802';
-- Q: Liberation Day
UPDATE `quest_template` SET `Method`='0' WHERE `id`='24575';
-- Q: The Battle for Gilneas City
DELETE FROM `creature` WHERE `id`='38192';
DELETE FROM `creature` WHERE `id`='38473';
DELETE FROM `creature` WHERE `id`='38469';
UPDATE `creature_template` SET `ScriptName`='npc_lorna_crowney_q24904' WHERE `entry`='37783';
-- Q: Slowing the Inevitable
UPDATE `quest_template` SET `Method`='0' WHERE `id`='24920';
-- Q: They Have Allies, But So Do We
UPDATE `quest_template` SET `Method`='0' WHERE `id`='24681';
-- Q: Endgame
UPDATE `quest_template` SET `Method`='2' WHERE `id`='26706';
UPDATE `creature_template` SET `ScriptName`='npc_lorna_crowley_q26706' WHERE `entry`='43727';
