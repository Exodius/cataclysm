-- Carvo Blastbolt
SET @ENTRY := 47250;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,19,0,100,0,0,0,0,0,12,47836,3,80000,0,0,0,8,0,0,0,-4986.58,781.9,288.48,0.0,"Summon creature on q accept");


DELETE FROM `creature_template_addon` WHERE (`entry`=47836);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (47836, 4783600, 0, 0, 0, 0, '');
UPDATE `creature_template` SET `MovementType` = 2 WHERE `entry` = 47836;

UPDATE `quest_template` SET `Flags` = 0 WHERE `Id` = 28169;

INSERT INTO waypoint_data(id, point, position_x, position_y, position_z, orientation, delay, move_flag, action, action_chance, wpguid) VALUES 
(4783600, 1, -4996.5, 770.129, 288.485, 0, 0, 0, 0, 100, 0),
(4783600, 2, -5008.77, 770.319, 286.598, 0, 0, 0, 0, 100, 0),
(4783600, 3, -5027.55, 771.996, 283.579, 0, 0, 0, 0, 100, 0),
(4783600, 4, -5049.6, 773.777, 283.232, 0, 0, 0, 0, 100, 0),
(4783600, 5, -5071.89, 775.478, 283.29, 0, 0, 0, 0, 100, 0),
(4783600, 6, -5092.22, 777.152, 283.314, 0, 0, 0, 0, 100, 0),
(4783600, 7, -5108.16, 773.712, 285.236, 0, 0, 0, 0, 100, 0),
(4783600, 8, -5122.66, 768.547, 287.353, 0, 0, 0, 0, 100, 0),
(4783600, 9, -5142.31, 763.151, 287.395, 0, 0, 0, 0, 100, 0),
(4783600, 10, -5155.15, 762.659, 287.395, 0, 0, 0, 0, 100, 0),
(4783600, 11, -5170.09, 765.921, 285.474, 0, 0, 0, 0, 100, 0);
