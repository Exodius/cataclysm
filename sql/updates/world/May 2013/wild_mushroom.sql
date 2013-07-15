DELETE FROM `spell_script_names` WHERE `spell_id` IN (88751,88747);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(88751,'spell_dru_wild_mushroom_detonate'),
(88747,'spell_dru_wild_mushroom');

-- Creature Template
-- Wild mushroom
UPDATE `creature_template` SET `unit_flags`=0x2|0x4|0x20000|0x2000000, `faction_a`=24, `faction_h`=24, `AIName`='SmartAI' WHERE `entry`=47649;
-- Fungal Growth I 
UPDATE `creature_template` SET `unit_flags`=0x2|0x4|0x20000|0x2000000, `dynamicflags`=0x8, `modelid1`=35760/*13069*/, `AIName`='SmartAI' WHERE `entry`=43497;
-- Fungal Growth II
UPDATE `creature_template` SET `unit_flags`=0x2|0x4|0x20000|0x2000000, `dynamicflags`=0x8, `modelid1`=35760/*13069*/, `AIName`='SmartAI' WHERE `entry`=43484;

-- Smart Script
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (43497,43484,47649);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_chance`,`event_flags`,`event_type`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`target_type`,`target_param1`,`comment`) VALUES
(43497,0,0,0,100,0x1,23,81289,0,0,0,11,81289,0x2|0x20,1,0,'Fungal Growth I'), -- SMART_EVENT_HAS_AURA & SMART_ACTION_CAST & SMART_TARGET_SELF
(43484,0,0,0,100,0x1,23,81282,0,1000,1000,11,81282,0x2|0x20,1,0,'Fungal Growth II'), -- SMART_EVENT_HAS_AURA & SMART_ACTION_CAST & SMART_TARGET_SELF
(47649,0,0,0,100,0,60,6000,6000,1000,1000,47,0,0,1,0,'Wild mushroom invisibility'); -- SMART_EVENT_UPDATE & SMART_ACTION_SET_VISIBILITY & SMART_TARGET_SELF