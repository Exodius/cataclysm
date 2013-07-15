/* 
* World\2013_06_02_On to Kharanos.sql 
*/ 
UPDATE `quest_template` SET `PrevQuestId` = 26364 WHERE `Id` = 26373; 
 
/* 
* World\2013_06_02_Paint it Black.sql 
*/ 
UPDATE `creature_template` SET `KillCredit1` = 42796 WHERE `entry` = 42291;
UPDATE `quest_template` SET `RequiredSpellCast1` = 79781 WHERE `Id` = 26342; 
 
/* 
* World\2013_06_02_quest_9759.sql 
*/ 
UPDATE `quest_template` SET `SpecialFlags` = 0 WHERE `Id` = 9759; 
 
/* 
* World\2013_06_02_quest_Beds, Bandages, and Beyond.sql 
*/ 
DELETE FROM `creature_involvedrelation` WHERE `quest` = 9603;
REPLACE INTO `creature_involvedrelation` (`id`, `quest`) VALUES (17554, 9603);
REPLACE INTO `creature_involvedrelation` (`id`, `quest`) VALUES (43991, 9603);

 
 
/* 
* World\2013_06_02_quest_Felendren the Banished.sql 
*/ 
UPDATE `creature_template` SET `npcflag` = 0 WHERE `entry` = 15298; 
 
/* 
* World\2013_06_02_quest_Johaan's Experiment.sql 
*/ 
-- Captured Scarlet Zealot
SET @ENTRY := 193100;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Scarlet Zealot - Action 0 - Say 0"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,3000,3000,0,0,11,43258,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Scarlet Zealot - Action 1 - Cast spell"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,0,0,0,0,11,3287,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"change model"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,2251.79,1026.03,36.55,0.0,"Scarlet Zealot - Action 2 - Move"),
(@ENTRY,@SOURCETYPE,4,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Scarlet Zealot - Action 4 - Say 1"),
(@ENTRY,@SOURCETYPE,5,0,0,0,100,0,3000,3000,0,0,69,0,0,0,0,0,0,8,0,0,0,2247.08,1021.9,36.47,0.0,"Scarlet Zealot - Action 3 - Move"),
(@ENTRY,@SOURCETYPE,6,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,2251.77,1016.72,36.47,0.0,"Scarlet Zealot - Action 5 - Move"),
(@ENTRY,@SOURCETYPE,7,0,0,0,100,0,3000,3000,0,0,69,0,0,0,0,0,0,8,0,0,0,2252.45,1012.92,36.64,0.0,"Scarlet Zealot - Action 6 - Move"),
(@ENTRY,@SOURCETYPE,8,0,0,0,100,0,2000,2000,0,0,15,24977,0,0,0,0,0,18,100,0,0,0.0,0.0,0.0,0.0,"Scarlet Zealot - Action 7 -quest complete"),
(@ENTRY,@SOURCETYPE,9,0,0,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"die self");

UPDATE `quest_template` SET `SpecialFlags` = 2 WHERE `Id` = 24977; 
 
/* 
* World\2013_06_02_quest_King Genn Greymane.sql 
*/ 
REPLACE INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(36332, 654, 4714, 4786, 1, 65535, 0, 36332, -1819.36, 2291.85, 42.1639, 3.08976, 30, 0, 0, 186, 191, 0, 0, 0, 0); 
 
/* 
* World\2013_06_02_quest_Missing in Action.sql 
*/ 
DELETE FROM `creature_questrelation` WHERE `quest` = 26284;
REPLACE INTO `creature_questrelation` (`id`, `quest`) VALUES (42708, 26284);

-- Makeshift Cage
SET @ENTRY := 204019;
SET @SOURCETYPE := 1;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartGameObjectAI" WHERE entry=@ENTRY LIMIT 1;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,64,0,100,0,0,0,0,0,80,20401900,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On gossip Hello");

-- Makeshift Cage
SET @ENTRY := 20401900;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,0,0,45,0,1,0,0,0,0,11,42645,10,0,0.0,0.0,0.0,0.0,"Send data 1 to Princess"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,0,0,33,42645,0,0,0,0,0,18,100,0,0,0.0,0.0,0.0,0.0,"give credit to player");

UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 42645;

-- Captured Demolitionist
SET @ENTRY := 42645;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,80,4264500,0,0,0,0,0,1,20,0,0,0.0,0.0,0.0,0.0,"On data set do action");




-- Captured Demolitionist
SET @ENTRY := 4264500;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,18,10,0,0,0.0,0.0,0.0,0.0,"talk to player"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,0,0,46,20,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Move forward"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,10000,10000,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Die self"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,0,0,0,0,33,0,0,0,0,0,0,18,1000,0,0,0.0,0.0,0.0,0.0,"give credit to player");


REPLACE INTO `creature_text` (`entry`, `id`, `text`, `type`, `probability`) VALUES ('42645', '1', 'Finally, someone who\'s not a trogg!', '12', '100');
REPLACE INTO `creature_text` (`entry`, `id`, `text`, `type`, `probability`) VALUES ('42645', '2', 'I''m free! I''m really free!', '12', '100');
REPLACE INTO `creature_text` (`entry`, `id`, `text`, `type`, `probability`) VALUES ('42645', '3', 'Thank you for breaking me out of here!', '12', '100');
REPLACE INTO `creature_text` (`entry`, `id`, `text`, `type`, `probability`) VALUES ('42645', '4', 'Thanks. Now, let''s blow up that cave!', '12', '100');
REPLACE INTO `creature_text` (`entry`, `id`, `text`, `type`, `probability`) VALUES ('42645', '5', 'You have no idea how happy I am to see you!', '12', '100'); 
 
/* 
* World\2013_06_02_quest_Oh, the Insanitys.sql 
*/ 
 
 
/* 
* World\2013_06_02_quest_Razormaw.sql 
*/ 
DELETE FROM `creature` WHERE `id`=17592;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=17592 AND `source_type`=0);
REPLACE INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(17592, 0, 0, 0, 0, 0, 100, 0, 6000, 6000, 7000, 9000, 11, 31279, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Razormaw - Combat - Cast Swipe"),
(17592, 0, 1, 0, 0, 0, 100, 0, 26000, 30000, 26000, 30000, 11, 8873, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Razormaw - Combat - Cast Flame Breath"),
(17592, 0, 2, 0, 0, 0, 50, 0, 12000, 12000, 12000, 12000, 11, 14100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Razormaw - Combat - Cast Terrifying Roar"),
(17592, 0, 3, 0, 11, 0, 100, 0, 0, 0, 0, 0, 53, 1, 17592, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Razormaw - On spawn - Load Path"),
(17592, 0, 4, 0, 40, 0, 100, 0, 10, 17592, 0, 0, 19, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Razormaw - On Reach waypoint - Remove unitflag");

REPLACE INTO waypoints(entry, pointid, position_x, position_y, position_z, point_comment) VALUES 
(17592, 1, -1045.96, -12583.8, 111.743, 'Razormaw'),
(17592, 2, -1045.11, -12583.3, 111.743, 'Razormaw'),
(17592, 3, -1213.01, -12663.2, 200.428, 'Razormaw'),
(17592, 4, -1204.48, -12626.7, 200.428, 'Razormaw'),
(17592, 5, -1204.91, -12599.7, 188.789, 'Razormaw'),
(17592, 6, -1206.84, -12579.8, 173.289, 'Razormaw'),
(17592, 7, -1203.17, -12555.5, 160.956, 'Razormaw'),
(17592, 8, -1201.28, -12529.2, 134.317, 'Razormaw'),
(17592, 9, -1204.18, -12483.8, 115.039, 'Razormaw'),
(17592, 10, -1204.35, -12465.6, 104.776, 'Razormaw'),
(17592, 11, -1205.65, -12460.5, 97.5391, 'Razormaw');


UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 17592;
DELETE FROM `creature_template_addon` WHERE (`entry`=17592);
REPLACE INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (17592, 0, 0, 33554432 , 4097, 0, '');
 
 
/* 
* World\2013_06_02_quest_Red Snapper - Very Tasty.sql 
*/ 
 
 
/* 
* World\2013_06_02_quest_Saving Princess Stillpine.sql 
*/ 
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI', `ScriptName` = '' WHERE `entry` = 181928;
UPDATE `quest_template` SET `RequiredSpellCast1` = 0 WHERE `Id` = 9667;


-- Princess Stillpine's Cage
SET @ENTRY := 181928;
SET @SOURCETYPE := 1;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartGameObjectAI" WHERE entry=@ENTRY LIMIT 1;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,64,0,100,0,0,0,0,0,80,18192800,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On gossip Hello");

-- Princess Stillpine
SET @ENTRY := 18192800;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,0,0,45,0,1,0,0,0,0,11,17682,10,0,0.0,0.0,0.0,0.0,"Send data 1 to Princess"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,0,0,33,17682,0,0,0,0,0,18,100,0,0,0.0,0.0,0.0,0.0,"give credit to player");

UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 17682;

-- Princess Stillpine
SET @ENTRY := 17682;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,80,1768200,0,0,0,0,0,1,20,0,0,0.0,0.0,0.0,0.0,"On data set do action");


UPDATE `creature_text` SET `text`='Thank you for saving me, $n! My father will be delighted!' WHERE (`entry`='17682') AND (`groupid`='0') AND (`id`='0');


-- Princess Stillpine
SET @ENTRY := 1768200;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,18,10,0,0,0.0,0.0,0.0,0.0,"talk to player"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-2543.97,-12346.9,11.64,0.0,"Move forward"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,10000,10000,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Die self"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,0,0,0,0,33,0,0,0,0,0,0,18,1000,0,0,0.0,0.0,0.0,0.0,"give credit to player"); 
 
/* 
* World\2013_06_06_Akasha.sql 
*/ 
DELETE FROM `creature` WHERE `id`=39964;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(39964, 0, 4815, 5071, 1, 1, 0, 0, -4677.99, 3455.24, -58.5016, 2.22577, 120, 0, 0, 1, 0, 0, 0, 0, 0);
 
 
/* 
* World\2013_06_06_Arcane missiles.sql 
*/ 
UPDATE `quest_template` SET `RequiredSpellCast1` = 0 WHERE `Id` = 14281; 
 
/* 
* World\2013_06_06_Attumen the Huntsman.sql 
*/ 
DELETE FROM `creature_loot_template` WHERE (`entry`=15550);
INSERT INTO `creature_loot_template` VALUES 
(15550, 23809, 5, 1, 0, 1, 1),
(15550, 29434, 100, 1, 0, 1, 1),
(15550, 30480, 0.5, 1, 0, 1, 1),
(15550, 34016, 100, 1, 1, -34016, 2); 
 
/* 
* World\2013_06_06_Auctioneer Fitch.sql 
*/ 
UPDATE `gossip_menu_option` SET `option_id`='13', `npc_option_npcflag`='2097152' WHERE (`menu_id`='12941') AND (`id`='0'); 
 
/* 
* World\2013_06_06_Colossal-guardians.sql 
*/ 
UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 46041;

-- Colossus of the Sun
SET @ENTRY := 46041;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,0,8,15000,17000,11,85840,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Thunderclap on Close"),
(@ENTRY,@SOURCETYPE,1,0,64,0,100,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"set faction to 14");

UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 46042;

-- Colossus of the Moon
SET @ENTRY := 46042;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,0,8,15000,17000,11,85840,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Thunderclap on Close"),
(@ENTRY,@SOURCETYPE,1,0,64,0,100,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"set faction 14"); 
 
/* 
* World\2013_06_06_Crushcog Battle Suit 1.sql 
*/ 
DELETE FROM `creature` WHERE `id`=43261;

 
 
/* 
* World\2013_06_06_D'lom the Collector.sql 
*/ 
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

UPDATE `gossip_menu_option` SET `option_id`='3', `npc_option_npcflag`='128' WHERE (`menu_id`='12015') AND (`id`='0');
UPDATE `gossip_menu_option` SET `option_id`='1', `npc_option_npcflag`='1' WHERE (`menu_id`='12015') AND (`id`='1');

 
 
/* 
* World\2013_06_06_Deathwing.sql 
*/ 
DELETE FROM `creature` WHERE `id`=39867;
 
 
/* 
* World\2013_06_06_Disassembly.sql 
*/ 
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES ('13', '1', '77231', '31', '3', '41031');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES ('13', '2', '77231', '31', '3', '41031');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES ('13', '3', '77231', '31', '3', '41031');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES ('13', '4', '77231', '31', '3', '41031');

-- Twilight Juggernaut
SET @ENTRY := 41031;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,500,1000,60000,60000,11,77224,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Armor Plating on Spawn"),
(@ENTRY,@SOURCETYPE,1,0,8,0,100,0,77231,0,0,0,28,77224,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"on spellhit 77231 remove aura"),
(@ENTRY,@SOURCETYPE,2,0,23,0,100,0,77224,0,0,0,28,77085,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"when 77224 aura = 0 remove aura 77085"),
(@ENTRY,@SOURCETYPE,3,0,23,0,100,0,77224,1,0,0,75,77085,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"when aura 77225 add aura 77085");

DELETE FROM `creature_template_addon` WHERE (`entry`=41031);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (41031, 0, 0, 0, 1, 0, 77224);
 
 
/* 
* World\2013_06_06_Dualtalentcost.sql 
*/ 
UPDATE `gossip_menu_option` SET `box_money`='10000000' WHERE (`menu_id`='0') AND (`id`='16'); 
 
/* 
* World\2013_06_06_Egg Hunt.sql 
*/ 
DELETE FROM `creature` WHERE `id`=41224;

INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `comment`) VALUES ('77288', '77308', 'Summon Aviana Egg');

-- Aviana's Egg
SET @ENTRY := 41224;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,60,0,100,1,10000,10000,0,0,33,41218,0,0,0,0,0,18,30,0,0,0.0,0.0,0.0,0.0,"give credit to player"),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,41,11000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"force despawn");

UPDATE `creature_template` SET `unit_flags` = 768 WHERE `entry` = 41224; 
 
/* 
* World\2013_06_06_Evershade the Elder.sql 
*/ 
DELETE FROM `creature_questrelation` WHERE `quest` = 29740;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (55227, 29740);

 
 
/* 
* World\2013_06_06_Farseer Umbrua.sql 
*/ 
UPDATE `gossip_menu_option` SET `option_id`='16', `npc_option_npcflag`='16' WHERE (`menu_id`='8110') AND (`id`='1'); 
 
/* 
* World\2013_06_06_Fungal Monstrosity.sql 
*/ 
DELETE FROM `creature_loot_template` WHERE (`entry`=44035);
 
 
/* 
* World\2013_06_06_Gamon.sql 
*/ 
UPDATE `creature_template` SET `Health_mod` = 25 WHERE `entry` = 6466; 
 
/* 
* World\2013_06_06_Gnoll Escape.sql 
*/ 
DELETE FROM `creature` WHERE `id`=41410;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(41410, 0, 11, 11, 1, 1, 0, 0, -3033.42, -2250.34, 9.19548, 0, 500, 0, 0, 573, 0, 0, 0, 0, 0),
(41410, 0, 11, 11, 1, 1, 0, 0, -3021.5, -2230.51, 10.2774, 0, 500, 0, 0, 573, 0, 0, 0, 0, 0),
(41410, 0, 11, 11, 1, 1, 0, 0, -3042.25, -2154.6, 9.90689, 0, 500, 0, 0, 573, 0, 0, 0, 0, 0),
(41410, 0, 11, 11, 1, 1, 0, 0, -3091.94, -2281.11, 9.31829, 0, 500, 0, 0, 573, 0, 0, 0, 0, 0),
(41410, 0, 11, 11, 1, 1, 0, 0, -3020.52, -2257.39, 8.79876, 0, 500, 0, 0, 573, 0, 0, 0, 0, 0),
(41410, 0, 11, 11, 1, 1, 0, 0, -3108.63, -2202.35, 8.53629, 0, 500, 0, 0, 573, 0, 0, 0, 0, 0),
(41410, 0, 11, 11, 1, 1, 0, 0, -3096.02, -2191.63, 8.81507, 0, 500, 0, 0, 573, 0, 0, 0, 0, 0),
(41410, 0, 11, 11, 1, 1, 0, 0, -3045.67, -2168.97, 8.85725, 0, 500, 0, 0, 573, 0, 0, 0, 0, 0),
(41410, 0, 11, 11, 1, 1, 0, 0, -3097.89, -2263.9, 10.1073, 0, 500, 0, 0, 573, 0, 0, 0, 0, 0),
(41410, 0, 11, 11, 1, 1, 0, 0, -3111.33, -2268.17, 10.1493, 0, 500, 0, 0, 573, 0, 0, 0, 0, 0);
UPDATE gameobject SET position_z = 9.69548 WHERE guid = 31778;
UPDATE gameobject SET position_z = 10.7774 WHERE guid = 31779;
UPDATE gameobject SET position_z = 10.40689 WHERE guid = 31780;
UPDATE gameobject SET position_z = 9.31829 WHERE guid = 31781;
UPDATE gameobject SET position_z = 9.29876 WHERE guid = 31782;
UPDATE gameobject SET position_z = 9.03629 WHERE guid = 31783;
UPDATE gameobject SET position_z = 9.31507 WHERE guid = 31784;
UPDATE gameobject SET position_z = 9.35725 WHERE guid = 31785;
UPDATE gameobject SET position_z = 10.6073 WHERE guid = 31786;
UPDATE gameobject SET position_z = 10.6493 WHERE guid = 31787;



-- Gnoll Cage
SET @ENTRY := 203282;
SET @SOURCETYPE := 1;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartGameObjectAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,64,0,100,1,0,0,0,0,80,20328200,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On gossip Hello");


SET @ENTRY := 20328200;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,0,0,45,0,1,0,0,0,0,11,41410,10,0,0.0,0.0,0.0,0.0,"Send data 1 to Princess"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,0,0,33,41438,0,0,0,0,0,18,100,0,0,0.0,0.0,0.0,0.0,"give credit to player");

UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 41410;


-- Captured Mosshide
SET @ENTRY := 41410;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,80,4141000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On data set do action");





-- Captured Mosshide
SET @ENTRY := 4141000;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,18,10,0,0,0.0,0.0,0.0,0.0,"talk to player"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,0,0,46,20,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Move forward"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,10000,10000,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Die self"); 
 
/* 
* World\2013_06_06_I Think She's Hungry.sql 
*/ 
UPDATE `quest_template` SET `Flags` = 65544 WHERE `Id` = 26739;
UPDATE `quest_template` SET `Flags` = 65544 WHERE `Id` = 26321;

 
 
/* 
* World\2013_06_06_Ibdil the Mende.sql 
*/ 
UPDATE `creature_template` SET `npcflag` = 4224 WHERE `entry` = 45407;
UPDATE `creature_template` SET `gossip_menu_id` = 12018 WHERE `entry` = 45407; 
 
/* 
* World\2013_06_06_In the Rear With the Gear.sql 
*/ 
DELETE FROM `creature_template` WHERE (`entry`=1449500);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (1449500, 0, 0, 0, 0, 0, 16480, 0, 0, 0, 'Invisible Trigger One', '', '', 0, 1, 1, 0, 73, 73, 0, 0.91, 1.14286, 1, 0, 1007, 1354.7, 0, 1571, 1, 2000, 2200, 1, 0, 2048, 8, 0, 0, 0, 0, 0, 758.1, 1062.1, 220, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 1.52381, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 128, '', 12340);


-- Invisible Trigger One
SET @ENTRY := 1449500;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,60,0,100,0,0,0,30000,30000,80,1449510,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"on update 30 sec summon group");

-- Invisible Trigger One
SET @ENTRY := 1449510;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,0,0,0,0,12,39436,1,200000,0,0,0,8,0,0,0,5280.44,-2341.15,1432.88,0.0,"update summon"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,0,0,12,39438,1,200000,0,0,0,8,0,0,0,5276.46,-2343.77,1432.72,0.0,"Type a script description here."),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,0,0,0,0,12,39438,1,200000,0,0,0,8,0,0,0,5278.92,-2346.39,1432.84,0.0,"Type a script description here."),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,0,0,0,0,12,39431,1,200000,0,0,0,8,0,0,0,5277.33,-2349.85,1432.61,0.0,"summon slave 39431"),
(@ENTRY,@SOURCETYPE,4,0,0,0,100,0,0,0,0,0,12,39431,1,200000,0,0,0,8,0,0,0,5271.6,-2345.27,1432.8,0.0,"Type a script description here."),
(@ENTRY,@SOURCETYPE,5,0,0,0,100,0,0,0,0,0,12,39431,1,200000,0,0,0,8,0,0,0,5273.76,-2348.9,1432.58,0.0,"Type a script description here.");




INSERT INTO waypoints(entry, pointid, position_x, position_y, position_z) VALUES
(3943600, 1, 5287.76, -2320.02, 1432.91),
(3943600, 2, 5309.43, -2307.33, 1434.97),
(3943600, 3, 5332.47, -2298.62, 1437.65),
(3943600, 4, 5356.72, -2290.23, 1439.86),
(3943600, 5, 5386.78, -2283.78, 1444.57),
(3943600, 6, 5414.15, -2278.07, 1449.84),
(3943600, 7, 5437.41, -2289.96, 1456.97),
(3943600, 8, 5463.37, -2313.16, 1460.11),
(3943600, 9, 5483.56, -2351.18, 1462.18),
(3943600, 10, 5496.64, -2386.92, 1464.66),
(3943600, 11, 5528.54, -2421.58, 1469.8),
(3943600, 12, 5547.08, -2455.69, 1473.55),
(3943600, 13, 5553.97, -2492.33, 1477.96),
(3943600, 14, 5547.16, -2542.95, 1479.17),
(3943600, 15, 5538.42, -2641.91, 1489.12),
(3943600, 16, 5568.77, -2687.06, 1490.71);

delete from gameobject where id=202652;
DELETE FROM `creature` WHERE `id`=39436;
DELETE FROM `creature` WHERE `id`=39438;
DELETE FROM `creature` WHERE `id`=39431;


DELETE FROM `creature` WHERE `id`=1449500;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(1449500, 1, 0, 0, 1, 65535, 0, 0, 5273.44, -2350.3, 1432.56, 0.858561, 300, 0, 0, 64, 0, 0, 0, 33554432, 0);


-- Twilight Proveditor
SET @ENTRY := 39436;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,5000,5000,12000,14000,11,80182,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Uppercut"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,53,0,3943600,0,0,0,1,1,0,0,0,0.0,0.0,0.0,0.0,"on summoned do wp");

-- Twilight Slavedriver
SET @ENTRY := 39438;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,29,5,0,0,0,0,0,11,39436,15,0,0.0,0.0,0.0,0.0,"on summoned follow ");


-- Twilight Slave
SET @ENTRY := 39431;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,29,10,0,0,0,0,0,11,39436,20,0,0.0,0.0,0.0,0.0,"on summoned follow 39436"),
(@ENTRY,@SOURCETYPE,1,0,10,0,100,1,0,5,0,0,80,3943100,0,0,0,0,0,1,15,0,0,0.0,0.0,0.0,0.0,"ooc lost 5 meter");

DELETE FROM `creature_template_addon` WHERE (`entry`=39431);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (39431, 0, 0, 0, 1, 0, 73918);


-- Twilight Slave
SET @ENTRY := 3943100;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,0,0,0,0,11,73959,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"cast 73959"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,0,0,25,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"flee"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,5000,5000,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"die");


UPDATE `creature_template` SET `unit_flags` = 32768 WHERE `entry` = 39431;

UPDATE `creature_template` SET `faction_A` = 2146, `faction_H` = 2146, `unit_flags` = 33536 WHERE `entry` = 39431; 
 
/* 
* World\2013_06_06_Injured Gnome.sql 
*/ 
delete from creature_addon where guid in (select guid from creature where id=46447);
DELETE FROM `creature_template_addon` WHERE (`entry`=46447);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (46447, '', 0, 0, 0, 0, 95205);






UPDATE `creature_template` SET `dynamicflags` = 0 WHERE `entry` = 46447;
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 46447;


DELETE FROM `creature` WHERE `id`=46447;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(46447, 0, 1, 5495, 1, 1, 35090, 0, -4993.42, 868.823, 274.392, 0.401426, 500, 0, 0, 11, 0, 0, 0, 0, 0),
(46447, 0, 1, 5495, 1, 1, 35090, 0, -4992.99, 863.118, 274.392, 0.471239, 500, 0, 0, 11, 0, 0, 0, 0, 0),
(46447, 0, 1, 5495, 1, 1, 35089, 0, -4989.72, 870.495, 274.947, 1.91986, 500, 0, 0, 11, 0, 0, 0, 0, 0),
(46447, 0, 1, 5495, 1, 1, 35089, 0, -4979.75, 864.957, 274.392, 4.43314, 500, 0, 0, 11, 0, 0, 0, 0, 0),
(46447, 0, 1, 5495, 1, 1, 35087, 0, -4972.77, 865.45, 274.392, 2.61799, 500, 0, 0, 11, 0, 0, 0, 0, 0),
(46447, 0, 1, 5495, 1, 1, 35088, 0, -4981.81, 881.387, 276.315, 5.25344, 500, 0, 0, 11, 0, 0, 0, 0, 0),
(46447, 0, 1, 5495, 1, 1, 35090, 0, -4976.79, 870.87, 274.392, 3.82227, 500, 0, 0, 11, 0, 0, 0, 0, 0),
(46447, 0, 1, 5495, 1, 1, 35090, 0, -4975.26, 877.03, 275.012, 5.98648, 500, 0, 0, 11, 0, 0, 0, 0, 0),
(46447, 0, 1, 5495, 1, 1, 35090, 0, -4972.16, 862.335, 274.392, 2.37365, 500, 0, 0, 11, 0, 0, 0, 0, 0);

UPDATE creature SET curhealth = 11,modelid=0 WHERE guid = 33941;
UPDATE creature SET curhealth = 11,modelid=0 WHERE guid = 34986;
UPDATE creature SET curhealth = 11,modelid=0 WHERE guid = 34388;
UPDATE creature SET curhealth = 11,modelid=0 WHERE guid = 34960;
UPDATE creature SET curhealth = 11,modelid=0 WHERE guid = 34076;
UPDATE creature SET curhealth = 11,modelid=0 WHERE guid = 34565;
UPDATE creature SET curhealth = 11,modelid=0 WHERE guid = 35042;
UPDATE creature SET curhealth = 11,modelid=0 WHERE guid = 35057;
UPDATE creature SET curhealth = 11,modelid=0 WHERE guid = 35566;

UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` = 46447;

UPDATE `creature_template` SET `unit_flags2` = 1 WHERE `entry` = 46447; 
 
/* 
* World\2013_06_06_Into de Maw.sql 
*/ 
 
 
/* 
* World\2013_06_06_KodoRounup.sql 
*/ 
UPDATE `creature_template` SET `KillCredit1` = 11627 WHERE `entry` = 4700;
UPDATE `creature_template` SET `KillCredit1` = 11627 WHERE `entry` = 4702;
UPDATE `creature_template` SET `KillCredit1` = 11627 WHERE `entry` = 4701;
UPDATE `quest_template` SET `RequiredSpellCast1` = 18153 WHERE `Id` = 5561; 
 
/* 
* World\2013_06_06_Leyara.sql 
*/ 
UPDATE `creature_template` SET `modelid2` = 0 WHERE `entry` = 54315; 
 
/* 
* World\2013_06_06_Libby Parker.sql 
*/ 
UPDATE `creature_template` SET `faction_A` = 12, `faction_H` = 2 WHERE `entry` = 43178; 
 
/* 
* World\2013_06_06_Longstrider Gazelle.sql 
*/ 
UPDATE `creature_template` SET `rank` = 0 WHERE `entry` = 51713; 
 
/* 
* World\2013_06_06_Make Yourself Useful.sql 
*/ 
DELETE FROM `creature` WHERE `id`=47292;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(47292, 1, 1, 1, 35375, 0, -10338.6, 885.014, 60.1188, 3.07178, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34893, 0, -10531.1, 928.894, 44.3456, 1.06465, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34893, 0, -10467.7, 970.101, 42.456, 3.31613, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35374, 0, -10473.8, 937.125, 41.8182, 2.61799, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35374, 0, -10574.9, 1123.05, 31.2949, 4.90438, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34893, 0, -10458.2, 1016.51, 43.6071, 2.87979, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34893, 0, -10358.9, 1087.05, 66.8214, 3.66519, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35375, 0, -10379.8, 1064, 66.0869, 0.558505, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34893, 0, -10595, 1162.07, 24.9589, 5.34071, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35374, 0, -10536.7, 1195.49, 36.9994, 4.64258, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35374, 0, -10546.6, 1206.74, 36.6968, 3.80482, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35374, 0, -10578.3, 1153.32, 22.7274, 1.74533, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34893, 0, -10490.6, 1157.75, 43.7246, 0.191986, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35375, 0, -10523.1, 943.073, 44.241, 3.80482, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34893, 0, -10515.4, 1032.32, 43.6322, 5.07891, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34895, 0, -10516.9, 987.859, 43.929, 1.50098, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34895, 0, -10476.1, 1142.17, 43.9434, 2.54818, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34893, 0, -10354.3, 1075.71, 66.6797, 2.77507, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35375, 0, -10566.3, 1134.34, 32.7455, 2.80998, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35374, 0, -10539.6, 1209.62, 37.16, 3.9619, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35375, 0, -10750.8, 853.922, 1.20066, 5.41052, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35375, 0, -10660.6, 845.981, 25.305, 0, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34895, 0, -10450.4, 1230.71, 68.4081, 3.52556, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 34893, 0, -10671.4, 875.599, 25.3699, 6.0912, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35375, 0, -10477.2, 1181.94, 48.2449, 4.20624, 300, 0, 0, 53681, 0, 0),
(47292, 1, 1, 1, 35374, 0, -10471.4, 1226.74, 61.943, 2.33874, 300, 0, 0, 53681, 0, 0);

INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `comment`) VALUES ('88236', '88235', 'Make Yourself Useful');

-- Commander Schnottz
SET @ENTRY := 47159;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,20,0,100,0,27969,0,0,0,28,88235,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"remove 88235 on player"); 
 
/* 
* World\2013_06_06_Portal to Hyjal .sql 
*/ 
DELETE FROM `gameobject` WHERE `id`=207692;

DELETE FROM `gameobject` WHERE `id`=207688;
INSERT INTO `gameobject` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(207688, 0, 0, 0, 1, 65535, -8212.42, 398.998, 117.308, 1.21901, 0, 0, 0.572463, 0.81993, 300, 0, 1),
(207688, 1, 1637, 5429, 1, 1, 2042.75, -4395.66, 97.9364, 1.59698, 0, 0, 0.716302, 0.697791, 120, 255, 1); 
 
/* 
* World\2013_06_06_Punting Season.sql 
*/ 
UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 52177;

-- Child of Tortolla
SET @ENTRY := 52177;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,64,0,100,0,0,0,0,0,33,52177,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"give credit on gossip"),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"die"); 
 
/* 
* World\2013_06_06_quest_Sea Legs.sql 
*/ 
UPDATE quest_template SET RewardSpellCast = 73701 WHERE id = 25929;
UPDATE quest_template SET RewardSpellCast = 73701 WHERE id = 24432;

REPLACE INTO `spell_area` (`spell`, `area`, `autocast`) VALUES 
('73701', '5047', '1'),
('73701', '4969', '1'),
('73701', '5144', '1'),
('73701', '5090', '1'),
('73701', '4967', '1'),
('73701', '4955', '1'),
('73701', '4968', '1'),
('73701', '5102', '1'),
('73701', '4966', '1'),
('73701', '4971', '1'),
('73701', '4961', '1'),
('73701', '5007', '1'),
('73701', '5507', '1'),
('73701', '5104', '1'),
('73701', '4977', '1'),
('73701', '5134', '1'),
('73701', '4974', '1'),
('73701', '5145', '1'),
('73701', '4975', '1'),
('73701', '4976', '1'),
('73701', '5124', '1'),
('73701', '5103', '1'),
('73701', '5059', '1'),
('73701', '5005', '1'),
('73701', '5058', '1'),
('73701', '4970', '1'),
('73701', '5055', '1'),
('73701', '4962', '1'),
('73701', '5052', '1'),
('73701', '5101', '1'),
('73701', '5107', '1'),
('73701', '4953', '1'),
('73701', '5100', '1'),
('73701', '5056', '1'),
('73701', '5012', '1'),
('73701', '5030', '1'),
('73701', '5054', '1'),
('73701', '5053', '1'),
('73701', '5089', '1'),
('73701', '5071', '1'),
('73701', '5057', '1'),
('73701', '5051', '1'),
('73701', '4963', '1'),
('73701', '5146', '1'),
('73701', '5008', '1'),
('73701', '5070', '1'),
('73701', '4815', '1'),
('73701', '5006', '1'),
('73701', '5173', '1'),
('73701', '5711', '1'),
('73701', '5382', '1'),
('73701', '5135', '1');
 
 
/* 
* World\2013_06_06_quest_Undersea Inflation.sql 
*/ 
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES ('13', '4', '75346', '31', '3', '40399');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES ('13', '3', '75346', '31', '3', '40399');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES ('13', '2', '75346', '31', '3', '40399');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES ('13', '1', '75346', '31', '3', '40399');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES ('13', '1', '86533', '31', '3', '40399');


-- Sambino's Air Balloon
SET @ENTRY := 40399;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,60,0,100,0,0,0,3000,3000,29,5,0,0,0,0,0,23,0,0,0,0.0,0.0,0.0,0.0,"follown owner"),
(@ENTRY,@SOURCETYPE,1,0,23,0,100,0,86533,10,0,0,33,40399,0,0,0,0,0,23,0,0,0,0.0,0.0,0.0,0.0,"give credit to player when 10 aura"),
(@ENTRY,@SOURCETYPE,2,0,8,0,100,0,75346,0,0,0,75,86533,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"add aura self"); 
 
/* 
* World\2013_06_06_quest_What's Keeping Jessup.sql 
*/ 
UPDATE `quest_template` SET `PrevQuestId` = 26265 WHERE `Id` = 26316; 
 
/* 
* World\2013_06_06_Razzashi Serpent.sql 
*/ 
update creature_template set unit_flags=131842 where entry in (52173,53569); 
 
/* 
* World\2013_06_06_Redridge.sql 
*/ 
UPDATE creature_loot_template SET ChanceOrQuestChance = 100 WHERE entry = 580 AND item = 58898;
UPDATE creature_loot_template SET ChanceOrQuestChance = 100 WHERE entry = 430 AND item = 58898;
UPDATE creature_loot_template SET ChanceOrQuestChance = 100 WHERE entry = 446 AND item = 58898;
UPDATE creature_loot_template SET ChanceOrQuestChance = 100 WHERE entry = 445 AND item = 58898;
delete from conditions where sourceentry=26514;
delete from conditions where conditionvalue1=26514;

delete from conditions where sourceentry=26544;
delete from conditions where conditionvalue1=26544;

UPDATE `quest_template` SET `Flags` = 524288 WHERE `Id` = 26544;
UPDATE `quest_template` SET `Flags` = 8 WHERE `Id` = 26571;

DELETE FROM `creature_template_addon` WHERE (`entry`=43270);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (43270, 0, 0, 65536, 1, 0, '');
 
 
/* 
* World\2013_06_06_Sanctuary of Malone.sql 
*/ 
DELETE FROM `creature` WHERE `id`=52557;
DELETE FROM `creature` WHERE `id`=52838;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52838, 1, 616, 5781, 1, 1, 31605, 0, 4653, -2078.98, 1231.42, 3.44762, 300, 0, 0, 17178400, 473500, 0, 0, 0, 0),
(52838, 1, 616, 5019, 1, 1, 31605, 0, 4417.22, -2080.25, 1210.4, 5.68977, 300, 0, 0, 17178400, 473500, 0, 0, 0, 0),
(52838, 1, 616, 4989, 1, 1, 31605, 0, 5125.25, -1758.53, 1334.55, 3.42085, 300, 0, 0, 17178400, 473500, 0, 0, 0, 0);


DELETE FROM `creature` WHERE `id`=52669;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52669, 1, 616, 5019, 1, 1, 31626, 0, 4424.42, -2082.76, 1210.75, 5.60251, 300, 0, 0, 77490, 8908, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=52845;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52845, 1, 616, 5781, 1, 1, 35095, 0, 4653.62, -2082.89, 1230.56, 3.49066, 120, 0, 0, 42946000, 4735000, 0, 0, 0, 0),
( 52845, 1, 616, 5019, 1, 1, 35095, 0, 4420.84, -2076.3, 1210.4, 5.55015, 120, 0, 0, 42946000, 4735000, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=52670;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(141230, 52670, 1, 616, 5019, 1, 1, 31213, 0, 4426.8, -2079.13, 1210.75, 5.3058, 300, 0, 0, 464940, 0, 0, 0, 0, 0),
(141231, 52670, 1, 616, 5019, 1, 1, 31213, 0, 4421.33, -2085.52, 1210.66, 5.84685, 300, 0, 0, 464940, 0, 0, 0, 0, 0),
(141268, 52670, 1, 616, 5019, 1, 1, 31212, 0, 4445.67, -2067.64, 1207.1, 0.680678, 300, 0, 0, 464940, 0, 0, 0, 0, 0),
(141639, 52670, 1, 616, 5019, 1, 1, 31213, 0, 4482.3, -1995.85, 1210.72, 3.10251, 300, 0, 0, 464940, 0, 2, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=52671;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52671, 1, 616, 5019, 1, 1, 25082, 0, 4439.89, -2079.85, 1206.1, 5.39307, 300, 0, 0, 77490, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=52900;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52900, 1, 616, 5019, 1, 1, 7618, 0, 4447.6, -2057.86, 1207.95, 4.6587, 300, 0, 0, 446790, 41690, 2, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=52898;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52898, 1, 616, 5019, 1, 1, 37942, 0, 4408.18, -2100.35, 1205.66, 5.74867, 300, 0, 0, 774900, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=54393;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(54393, 1, 616, 5019, 1, 1, 38781, 0, 4394.14, -2107.48, 1204.52, 6.23082, 300, 0, 0, 232470, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=52901;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52901, 1, 616, 5019, 1, 1, 32251, 0, 4454.75, -2120.96, 1197.54, 4.93928, 300, 0, 0, 387450, 17816, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=43551;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(43551, 1, 616, 5019, 1, 1, 0, 0, 4424.9, -2100.33, 1205.66, 0.18917, 500, 0, 0, 42, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=53493;
DELETE FROM `creature` WHERE `id`=52899;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52899, 1, 616, 5019, 1, 1, 31801, 0, 4456.59, -2070.21, 1206.95, 1.51844, 300, 0, 0, 774900, 44540, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=52897;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52897, 1, 616, 5019, 1, 1, 32253, 0, 4456.57, -2065.92, 1207.17, 4.90438, 300, 0, 0, 387450, 17816, 0, 0, 0, 0);
UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 54320;
DELETE FROM `creature` WHERE `id`=52844;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52844, 1, 616, 5019, 1, 1, 20628, 0, 4436.07, -2067, 1206.67, 6.26573, 300, 0, 0, 3874500, 0, 0, 0, 0, 0),
(52844, 1, 616, 5781, 1, 1, 20628, 0, 4654.8, -2074.81, 1230.96, 3.52556, 300, 0, 0, 3874500, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=52904;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52904, 1, 616, 4861, 1, 1, 29213, 0, 4600.87, -2697.97, 1140.14, 5.96903, 300, 0, 0, 154755, 15976, 0, 0, 0, 0),
(52904, 1, 616, 5019, 1, 1, 29213, 0, 4431.54, -2107.01, 1205.26, 3.40339, 300, 0, 0, 154755, 15976, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=52903;
INSERT INTO `creature` (`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(52903, 1, 616, 4861, 1, 1, 31777, 0, 4600.27, -2697.88, 1139.54, 2.82743, 120, 0, 0, 774900, 44540, 0, 0, 0, 0),
(52903, 1, 616, 5019, 1, 1, 31777, 0, 4428, -2107.91, 1205.31, 0.20944, 120, 0, 0, 774900, 44540, 0, 0, 0, 0);
 
 
/* 
* World\2013_06_06_Sesebi.sql 
*/ 
UPDATE `gossip_menu_option` SET `option_id`='5', `npc_option_npcflag`='16' WHERE (`menu_id`='11906') AND (`id`='0');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`) VALUES ('11906', '1', '3', 'I wish to unlearn my talent.', '16', '16'); 
 
/* 
* World\2013_06_06_Shalla Whiteleaf.sql 
*/ 
UPDATE `creature_template` SET `gossip_menu_id` = 11877 WHERE `entry` = 44726;
UPDATE `gossip_menu_option` SET `option_icon`='3', `option_id`='16', `npc_option_npcflag`='16' WHERE (`menu_id`='11877') AND (`id`='1'); 
 
/* 
* World\2013_06_06_Stone Trogg Fungalmancer.sql 
*/ 
DELETE FROM `creature_loot_template` WHERE (`entry`=47184);
 
 
/* 
* World\2013_06_06_Survivor.sql 
*/ 
delete from creature_addon where guid in (select guid from creature where id=46268); 
 
/* 
* World\2013_06_06_Tarecgosa.sql 
*/ 
DELETE FROM `creature` WHERE `id`=53396;
 
 
/* 
* World\2013_06_06_The Big Bad Wolf.sql 
*/ 
DELETE FROM `creature_loot_template` WHERE `entry` = 17521;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(17521, 28581, 30.6504, 1, 0, 1, 1), -- 3Wolfslayer Sniper Rifle
(17521, 28582, 29.3358, 1, 0, 1, 1), -- 3Red Riding Hood's Cloak
(17521, 28583, 27.4446, 1, 0, 1, 1), -- 3Big Bad Wolf's Head
(17521, 28584, 27.1102, 1, 0, 1, 1), -- 3Big Bad Wolf's Paw
(17521, 21877, 22.0595, 1, 0, 1, 1), -- 6Netherweave Cloth
(17521, 28590, 21.8173, 1, 0, 1, 1), -- 3Ribbon of Sacrifice
(17521, 28589, 21.1946, 1, 0, 1, 1), -- 3Beastmaw Pauldrons
(17521, 28591, 19.3496, 1, 0, 1, 1), -- 3Earthsoul Leggings
(17521, 28593, 18.7500, 1, 0, 1, 1), -- 3Eternium Greathelm
(17521, 28594, 18.4387, 1, 0, 1, 1), -- 3Trial-Fire Trousers
(17521, 97548, 2.8713, 1, 0, 1, 1), -- 4Spiky Collar
(17521, 43622, 0.3229, 1, 0, 1, 1), -- 5Froststeel Lockbox
(17521, 24685, 0.2191, 1, 0, 1, 1), -- 5Elementalist Belt
(17521, 24691, 0.2191, 1, 0, 1, 1), -- 5Elementalist Mantle
(17521, 25057, 0.2191, 1, 0, 1, 1), -- 5Amber Band
(17521, 25309, 0.2191, 1, 0, 1, 1), -- 5Warpdagger
(17521, 24801, 0.1960, 1, 0, 1, 1), -- 5Dragonhawk Gloves
(17521, 25023, 0.1960, 1, 0, 1, 1), -- 5Warlord's Sabatons
(17521, 24689, 0.1845, 1, 0, 1, 1), -- 5Elementalist Skullcap
(17521, 24798, 0.1845, 1, 0, 1, 1), -- 5Dragonhawk Belt
(17521, 24911, 0.1845, 1, 0, 1, 1), -- 5Netherstorm Greaves
(17521, 24914, 0.1845, 1, 0, 1, 1), -- 5Netherstorm Helm
(17521, 24686, 0.1730, 1, 0, 1, 1), -- 5Elementalist Boots
(17521, 24690, 0.1730, 1, 0, 1, 1), -- 5Elementalist Leggings
(17521, 24917, 0.1730, 1, 0, 1, 1), -- 5Netherstorm Bracer
(17521, 25323, 0.1730, 1, 0, 1, 1), -- 5Ascendant's Scepter
(17521, 25028, 0.1499, 1, 0, 1, 1), -- 5Warlord's Iron-Epaulets
(17521, 24688, 0.1268, 1, 0, 1, 1); -- 5Elementalist Gloves
UPDATE `creature_template` SET `lootid` = 17521 WHERE `entry` = 17521;

 
 
/* 
* World\2013_06_06_The Desert Fox.sql 
*/ 
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('18', '47201', '87963', '9', '27939'); 
 
/* 
* World\2013_06_06_The Fight Continues.sql 
*/ 
-- High Tinker Mekkatorque
SET @ENTRY := 42317;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,19,0,100,0,26208,0,0,0,80,4231700,0,2,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"The Fight Continues - Quest Accept - Script 0");

-- High Tinker Mekkatorque
SET @ENTRY := 4231700;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,1,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Say Text 0"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,1,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,-5132.33,491.42,395.54,2.0,"The Fight Continues - Script 0 - Move"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,1,12000,12000,0,0,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Say Text 1"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,1,4000,4000,0,0,12,42422,1,300000,0,0,0,8,0,0,0,-5133.26,496.48,396.45,4.8,"The Fight Continues - Script 0 - Summon"),
(@ENTRY,@SOURCETYPE,4,0,0,0,100,1,0,0,0,0,12,42420,1,300000,0,0,0,8,0,0,0,-5135.44,495.07,396.45,5.7,"The Fight Continues - Script 0 - Summon"),
(@ENTRY,@SOURCETYPE,5,0,0,0,100,1,0,0,0,0,12,42419,1,300000,0,0,0,8,0,0,0,-5134.84,495.97,396.45,5.5,"The Fight Continues - Script 0 - Summon"),
(@ENTRY,@SOURCETYPE,6,0,0,0,100,1,0,0,0,0,12,42452,1,300000,0,0,0,8,0,0,0,-5132.77,493.3,396.45,2.26,"The Fight Continues - Script 0 - Summon Irradiator 3000"),
(@ENTRY,@SOURCETYPE,7,0,0,0,100,1,0,0,0,0,3,0,31878,0,0,0,0,19,42452,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Irradiator 3000 Morph Model"),
(@ENTRY,@SOURCETYPE,8,0,0,0,100,1,5000,5000,0,0,1,0,0,0,0,0,0,19,42419,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Mekkatorque Say 0"),
(@ENTRY,@SOURCETYPE,9,0,0,0,100,1,3000,3000,0,0,12,42423,1,300000,0,0,0,8,0,0,0,-5133.51,494.39,396.45,2.2,"The Fight Continues - Script 0 - Summon"),
(@ENTRY,@SOURCETYPE,10,0,0,0,100,1,3000,3000,0,0,1,0,0,0,0,0,0,19,42423,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Thermaplugg's Brag-bot Say 0"),
(@ENTRY,@SOURCETYPE,11,0,0,0,100,1,6000,6000,0,0,1,1,0,0,0,0,0,19,42423,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Thermaplugg's Brag-bot Say 1"),
(@ENTRY,@SOURCETYPE,12,0,0,0,100,1,4000,4000,0,0,1,2,0,0,0,0,0,19,42423,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Thermaplugg's Brag-bot Say 2"),
(@ENTRY,@SOURCETYPE,13,0,0,0,100,1,2000,2000,0,0,1,1,0,0,0,0,0,19,42419,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Mekkatorque Say 1"),
(@ENTRY,@SOURCETYPE,14,0,0,0,100,1,3500,3500,0,0,1,0,0,0,0,0,0,19,42452,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Irradiator 3000 Image Say 0"),
(@ENTRY,@SOURCETYPE,15,0,0,0,100,1,10500,10500,0,0,1,2,0,0,0,0,0,19,42419,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Mekkatorque Say 2"),
(@ENTRY,@SOURCETYPE,16,0,0,0,100,1,4000,4000,0,0,1,3,0,0,0,0,0,19,42419,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Mekkatorque Say 3"),
(@ENTRY,@SOURCETYPE,17,0,0,0,100,1,2500,2500,0,0,43,0,0,0,0,0,0,19,42422,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Hinkles Fastblast"),
(@ENTRY,@SOURCETYPE,18,0,0,0,100,1,0,0,0,0,5,69,0,0,0,0,0,19,42422,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Hinkles Fastblast"),
(@ENTRY,@SOURCETYPE,19,0,0,0,100,1,3500,3500,0,0,43,0,0,0,0,0,0,19,42420,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Doc Cogspin"),
(@ENTRY,@SOURCETYPE,20,0,0,0,100,1,0,0,0,0,5,69,0,0,0,0,0,19,42420,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Doc Cogspin"),
(@ENTRY,@SOURCETYPE,21,0,0,0,100,1,5000,5000,0,0,1,3,0,0,0,0,0,19,42423,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Thermaplugg's Brag-bot Say 3"),
(@ENTRY,@SOURCETYPE,22,0,0,0,100,1,9000,9000,0,0,1,1,0,0,0,0,0,19,42452,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Irradiator 3000 Image Say 1"),
(@ENTRY,@SOURCETYPE,23,0,0,0,100,1,8000,8000,0,0,1,4,0,0,0,0,0,19,42419,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Mekkatorque Say 4"),
(@ENTRY,@SOURCETYPE,24,0,0,0,100,1,5000,5000,0,0,86,86264,2,19,42419,0,0,19,42419,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Mekkatorque Cast"),
(@ENTRY,@SOURCETYPE,25,0,0,0,100,1,0,0,0,0,86,86264,2,19,42422,0,0,19,42422,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Hinkles Fastblast Cast"),
(@ENTRY,@SOURCETYPE,26,0,0,0,100,1,0,0,0,0,86,86264,2,19,42420,0,0,19,42420,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Doc Cogspin Cast"),
(@ENTRY,@SOURCETYPE,27,0,0,0,100,1,5000,5000,0,0,86,75045,2,19,42423,0,0,19,42423,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Brag-bot Cast Dummy"),
(@ENTRY,@SOURCETYPE,28,0,0,0,100,1,0,0,0,0,86,75045,2,19,42452,0,0,19,42452,15,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Irradiator 3000 Cast Dummy"),
(@ENTRY,@SOURCETYPE,29,0,0,0,100,1,4000,4000,0,0,69,0,0,0,0,0,0,8,0,0,0,-5130.45,487.92,395.54,3.9,"The Fight Continues - Script 0 - Move"),
(@ENTRY,@SOURCETYPE,30,0,0,0,100,1,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,-5130.64,488.84,395.58,2.03,"The Fight Continues - Script 0 - Move"),
(@ENTRY,@SOURCETYPE,31,0,0,0,100,1,2000,2000,0,0,1,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Say Text 2"),
(@ENTRY,@SOURCETYPE,32,0,0,0,100,1,10000,10000,0,0,33,42463,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"The Fight Continues - Script 0 - Kill Credit"); 
 
/* 
* World\2013_06_06_The Prophecy of Akida.sql 
*/ 
DELETE FROM `gameobject` WHERE id between 181720 and 181733;
DELETE FROM `gameobject` WHERE `id`=181714;


UPDATE `gameobject_template` SET `ScriptName` = 'go_bristlelimb_cage' WHERE `entry` = 181720;

REPLACE INTO gameobject(id, map, zone, area, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES 
(181720, 530, 3524, 3571, 1, 1, -4482.37, -11613.6, 11.0825, 1.90241, 0, 0, 0.814116, 0.580703, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4503.42, -11593.8, 12.7989, 3.08921, 0, 0, 0.999657, 0.0262017, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4483.47, -11627.8, 11.1297, 1.23918, 0, 0, 0.580703, 0.814116, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4581.18, -11644.1, 19.6066, 0.855211, 0, 0, 0.414693, 0.909962, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4570.02, -11627.7, 17.9018, 1.65806, 0, 0, 0.737277, 0.675591, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4610.14, -11609.2, 18.7689, -2.79252, 0, 0, -0.984807, 0.173652, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4624.06, -11646.8, 22.1298, -1.20428, 0, 0, -0.566406, 0.824126, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4613.09, -11662.3, 21.3475, -0.890115, 0, 0, -0.43051, 0.902586, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4601.35, -11537.1, 17.7659, 1.43117, 0, 0, 0.656058, 0.75471, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4601.59, -11519.7, 19.2919, 1.78023, 0, 0, 0.777145, 0.629321, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4618.43, -11498.6, 19.5999, 2.68781, 0, 0, 0.97437, 0.224951, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4635.32, -11493.8, 19.7154, -3.12415, 0, 0, -0.999962, 0.00873456, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4649.81, -11536.1, 17.8171, -0.890115, 0, 0, -0.43051, 0.902586, 120, 255, 1),
(181720, 530, 3524, 3571, 1, 1, -4633.68, -11546.4, 16.8705, -0.209439, 0, 0, -0.104528, 0.994522, 120, 255, 1); 
 
/* 
* World\2013_06_06_The Return of Baron Geddon.sql 
*/ 
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES ('13', '1', '75192', '31', '3', '40147');


-- Baron Geddon
SET @ENTRY := 40147;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,0,8,15800,18300,11,74813,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Inferno on Close"),
(@ENTRY,@SOURCETYPE,1,0,23,0,100,0,75192,1,850,850,33,40334,0,0,0,0,0,18,10,0,0,0.0,0.0,0.0,0.0,"on spellhit give credit to invoker"); 
 
/* 
* World\2013_06_06_Thirst Unending.sql 
*/ 

-- Mana Wyrm
SET @ENTRY := 15274;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
REPLACE INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,1,28730,0,0,0,27,15468,28730,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Mana Wyrm - On Spellhit Arcane Torrent - Quest Credit"),
(@ENTRY,@SOURCETYPE,1,0,8,0,100,1,25046,0,0,0,27,15468,28730,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Mana Wyrm - On Spellhit Arcane Torrent - Quest Credit"),
(@ENTRY,@SOURCETYPE,2,0,8,0,100,1,50613,0,0,0,27,15468,28730,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Mana Wyrm - On Spellhit Arcane Torrent - Quest Credit"),
(@ENTRY,@SOURCETYPE,3,0,8,0,100,1,80483,0,0,0,27,15468,28730,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Mana Wyrm - On Spellhit Arcane Torrent - Quest Credit"),
(@ENTRY,@SOURCETYPE,4,0,8,0,100,1,69179,0,0,0,27,15468,28730,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Mana Wyrm - On Spellhit Arcane Torrent - Quest Credit");
 
 
/* 
* World\2013_06_06_Those Bears Up There.sql 
*/ 
-- Hyjal Bear Cub
SET @ENTRY := 40240;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,64,0,100,0,0,0,0,0,33,40284,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Type a script description here."),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Type a script description here.");

UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 40240;


-- Hyjal Bear Cub
SET @ENTRY := 52688;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,64,0,100,0,0,0,0,0,33,40284,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Type a script description here."),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Type a script description here.");

UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 52688; 
 
/* 
* World\2013_06_06_Through the Dream.sql 
*/ 
-- Captain Saynna Stormrunner
SET @ENTRY := 40139;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,19,0,100,0,25325,0,0,0,45,0,1,0,0,0,0,11,40140,25,0,0.0,0.0,0.0,0.0,"send data 1 ");

UPDATE `quest_template` SET `SpecialFlags` = 2 WHERE `Id` = 25325;


-- Arch Druid Fandral Staghelm
SET @ENTRY := 40140;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,29,5,180,0,0,0,0,18,20,0,0,0.0,0.0,0.0,0.0,"on data set follow closest player"),
(@ENTRY,@SOURCETYPE,1,2,38,0,100,0,0,2,0,0,15,25325,0,0,0,0,0,18,100,0,0,0.0,0.0,0.0,0.0,"give quest complete to player on data 2"),
(@ENTRY,@SOURCETYPE,2,0,61,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"die self");

-- Alysra
SET @ENTRY := 40178;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,60,0,100,0,5000,5000,5000,5000,45,0,2,0,0,0,0,11,40140,20,0,0.0,0.0,0.0,0.0,"send data 2 to 40140");


UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 0 WHERE `entry` = 40140; 
 
/* 
* World\2013_06_06_Unbound Flame Spirit.sql 
*/ 
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `rank` = 0 WHERE `entry` = 40065; 
 
