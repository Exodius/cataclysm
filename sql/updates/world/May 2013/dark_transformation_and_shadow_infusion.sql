DELETE FROM `spell_script_names` WHERE `spell_id` IN (63560,91342);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (63560, 'spell_dk_dark_transformation');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (91342, 'spell_dk_shadow_infusion');

-- shadow infusion
DELETE FROM `spell_proc_event` WHERE `entry` IN (48965,49571,49572);
INSERT INTO `spell_proc_event` VALUES 
(48965, 0, 15, 8192, 0, 0, 86016, 0, 0, 33, 0),
(49571, 0, 15, 8192, 0, 0, 86016, 0, 0, 66, 0),
(49572, 0, 15, 8192, 0, 0, 86016, 0, 0, 100, 0);

-- Dark transformation - Remover Dot Tranformado
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 63560;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES 
(63560, -91342, 2,'Dark transformation - Remover DOT');