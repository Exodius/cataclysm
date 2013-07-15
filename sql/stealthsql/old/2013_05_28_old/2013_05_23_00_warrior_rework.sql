-- Update Warrior spell_script_names
DELETE FROM `spell_script_names` WHERE `spell_id` IN (23885, 23881, 23880, 97463, 97462);
INSERT INTO `spell_script_names` VALUES 
(23881,'spell_warr_bloodthirst'),
(23880,'spell_warr_bloodthirst_heal'),
(97462,'spell_warr_rallying_cry');