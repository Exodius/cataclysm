
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES('74136', 'spell_isiset_supernova');
DELETE FROM instance_template WHERE map=670;
INSERT INTO `instance_template` VALUES ('670', '0', 'instance_grim_batol', '0');
UPDATE `creature_template` SET `difficulty_entry_1` = 0, `dmg_multiplier` = 13, `ScriptName` = '' WHERE `entry` = 49624; 
UPDATE `quest_template` SET `RequiredSpellCast1` = 0 WHERE `Id` = 14007; 
UPDATE `quest_template` SET `RequiredSpellCast1` = 0 WHERE `Id` = 14013; 
DELETE FROM `creature_questrelation` WHERE `quest` = 28814; 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (42428, 28814); 
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (50048, 28814); 
DELETE FROM gameobject_loot_template where entry in (195492,202751);
