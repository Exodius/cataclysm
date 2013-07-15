-- creature text and sound for http://www.wowhead.com/npc=36494
UPDATE `creature_text` SET `sound`=16912 WHERE `entry`=36494 AND `groupid`=0 AND `id`=0;
UPDATE `creature_text` SET `sound`=16916 WHERE `entry`=36494 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `sound`=16917 WHERE `entry`=36494 AND `groupid`=2 AND `id`=0;
UPDATE `creature_text` SET `sound`=16915 WHERE `entry`=36494 AND `groupid`=3 AND `id`=0;
UPDATE `creature_text` SET `type`=14, `sound`=16913 WHERE `entry`=36494 AND `groupid`=4 AND `id`=0;
UPDATE `creature_text` SET `type`=14, `sound`=16914 WHERE `entry`=36494 AND `groupid`=4 AND `id`=1;
UPDATE `creature_text` SET `type`=42 WHERE `entry`=36494 AND `groupid`=5 AND `id`=0;
-- Aura for http://www.wowhead.com/npc=36494
DELETE FROM `creature_template_addon` WHERE `entry`=36494;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(36494, 0, 0x0, 0x1, '68792');

-- Quest-Nagrand-Fix Standards and Practices
-- http://old.wowhead.com/quest=9910 [Standards and Practices]
-- http://old.wowhead.com/item=25458 [Mag'har Battle Standard]
-- http://old.wowhead.com/spell=32205 [Place Mag'har Battle Standard]
-- http://old.wowhead.com/maps?data=3518:720689740700750683 [location of the 3 points]

-- Place Mag'har Battle Standard http://www.wowhead.com/npc=32205
-- First trigger NPC http://www.wowhead.com/npc=18305
-- Second trigger NPC http://www.wowhead.com/npc=18306
-- Third trigger NPC http://www.wowhead.com/npc=18307
-- Not used http://www.wowhead.com/npc=18308

-- Conditions for NPC's
DELETE FROM `conditions` WHERE `SourceEntry` = 32205;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 2, 32205, 0, 2, 31, 0, 3, 18307, 0, 0, 0, 0, '', NULL),
(13, 2, 32205, 0, 1, 31, 0, 3, 18306, 0, 0, 0, 0, '', NULL),
(13, 2, 32205, 0, 0, 31, 0, 3, 18305, 0, 0, 0, 0, '', NULL);

-- First Burning Blade Pyre
-- Second Burning Blade Pyre
-- Third Burning Blade Pyre
-- Not used
-- Correct gameobjects, delete wrong ones
DELETE FROM `gameobject_template` WHERE `entry` IN (182261, 182262, 182263, 182264);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
(182261, 8, 4611, 'First Burning Blade Pyre', '', '', '', 0, 0, 1.09, 0, 0, 0, 0, 0, 0, 1393, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340),
(182262, 8, 4611, 'Third Burning Blade Pyre', '', '', '', 0, 0, 1.09, 0, 0, 0, 0, 0, 0, 1393, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340),
(182263, 8, 4611, 'First Burning Blade Pyre', '', '', '', 0, 0, 1.09, 0, 0, 0, 0, 0, 0, 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340),
(182264, 8, 4611, 'Second Burning Blade Pyre', '', '', '', 0, 0, 1.09, 0, 0, 0, 0, 0, 0, 1393, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);

-- Spawnpoints of Burning Blades, delete wrong ones
DELETE FROM `gameobject` WHERE `id` IN (182261, 182262, 182263, 182264);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(22718, 182261, 530, 1, 1, -2532.98, 6307.27, 14.0203, 2.95833, 0, 0, 0.995805, 0.091502, 181, 100, 1),
(331799, 182264, 530, 1, 1, -2533.19, 6168.61, 59.9391, 2.81871, 0, 0, 0.986996, 0.160743, 181, 100, 1),
(331771, 182262, 530, 1, 1, -2475.29, 6106.4, 91.9832, 1.98095, 0, 0, 0.836286, 0.548293, 181, 100, 1);

-- Add invisible modelid
DELETE FROM `creature_template` WHERE `entry` IN (18305, 18306, 18307, 18308);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
(18305, 0, 0, 0, 0, 0, 17188, 0, 0, 0, 'Burning Blade Pyre (01)', NULL, NULL, 0, 27, 27, 0, 35, 35, 0, 1, 1.14286, 1, 0, 38, 51, 0, 92, 1, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 26, 39, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, '', 12340),
(18306, 0, 0, 0, 0, 0, 17188, 0, 0, 0, 'Burning Blade Pyre (02)', NULL, NULL, 0, 70, 70, 1, 35, 35, 0, 1.125, 1.14286, 1, 0, 252, 357, 0, 304, 1, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 215, 320, 44, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, '', 12340),
(18307, 0, 0, 0, 0, 0, 17188, 0, 0, 0, 'Burning Blade Pyre (03)', NULL, NULL, 0, 70, 70, 1, 35, 35, 0, 1.125, 1.14286, 1, 0, 252, 357, 0, 304, 1, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 215, 320, 44, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, '', 12340),
(18308, 0, 0, 0, 0, 0, 17188, 0, 0, 0, 'Burning Blade Pyre (04)', NULL, NULL, 0, 11, 11, 0, 35, 35, 0, 1.125, 1.14286, 1, 0, 15, 20, 0, 44, 1, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 9, 14, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, '', 12340);

-- Trigger NPC's for quest complete
DELETE FROM `creature` WHERE `id` IN (18305, 18306, 18307);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(18305, 530, 1, 1, 0, 0, -2532.98, 6307.27, 14.0203, 2.95833, 300, 0, 0, 800, 0, 0, 0, 0, 0),
(18306, 530, 1, 1, 0, 0, -2533.19, 6168.61, 59.9391, 2.81871, 300, 0, 0, 800, 0, 0, 0, 0, 0),
(18307, 530, 1, 1, 0, 0, -2475.29, 6106.4, 91.9832, 1.98095, 300, 0, 0, 800, 0, 0, 0, 0, 0);

-- Ignore LOS for trigger spell
DELETE FROM `disables` WHERE `sourceType` = 0 AND `entry` = 32205;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(0, 32205, 64, '', '', 'Ignore LOS for Place Mag''har Battle Standard');

-- thanks to Niki  for the deletions required
DELETE FROM `npc_vendor` WHERE `item` =  395;
DELETE FROM `npc_vendor` WHERE `item` =  392;

-- Fix for http://www.wowhead.com/npc=931
DELETE FROM creature_template WHERE entry=931;
INSERT INTO `creature_template` VALUES ('931', '0', '0', '0', '0', '0', '3364', '0', '0', '0', 'Ariena Stormfeather', 'Gryphon Master', null, '6944', '90', '90', '3', '0', '11', '11', '8192', '1', '1.14286', '1', '1', '291', '310', '0', '827', '4.6', '2000', '2000', '1', '512', '2048', '2048', '0', '0', '0', '0', '0', '399', '559', '169', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'EventAI', '0', '3', '0', '1.88', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '2', '', '12340');

