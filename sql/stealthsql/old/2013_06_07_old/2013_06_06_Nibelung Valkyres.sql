SET @Valkyr = 38391; -- Val'kyr Guardian
SET @ValkyrH = 38392; -- Val'kyr Protector
UPDATE `creature_template` SET `unit_class` = '8', `unit_flags`=`unit_flags`|0x8000,`AIName`='SmartAI' WHERE `entry` IN (@Valkyr, @ValkyrH); -- unk_15
UPDATE `creature_model_info` SET `bounding_radius`=0.124,`combat_reach`=1.6,`gender`=1 WHERE `modelid`=31181;
DELETE FROM `creature_template_addon` WHERE `entry` IN (@Valkyr, @ValkyrH);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Valkyr,0,50331648,1,0, NULL),
(@ValkyrH,0,50331648,1,0, NULL);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@Valkyr, @ValkyrH);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Valkyr,0,0,0,25,0,100,0,0,0,0,0,58,1,71841,1500,2000,45,0,2,2,0,0,0,0,0,0, 'Val''kyr Guardian - On reset install AI template caster - Cast Smite every 1.5/2.5 seconds'),
(@ValkyrH,0,0,0,25,0,100,0,0,0,0,0,58,1,71842,1500,2000,45,0,2,2,0,0,0,0,0,0, 'Val''kyr Guardian - On reset install AI template caster - Cast Smite every 1.5/2.5 seconds');
