-- Update Paladin and Warrior spell_script_names
DELETE FROM `spell_script_names` WHERE `spell_id` IN (75806, 85043, 85416, 23885, 23881, 97463);
INSERT INTO `spell_script_names` VALUES 
(75806,'spell_pal_grand_crusader'),
(85043,'spell_pal_grand_crusader'),
(85416,'spell_pal_grand_crusader'),
(23885,'spell_warr_bloodthirst'),
(23881,'spell_warr_bloodthirst_heal'),
(97463,'spell_warr_rallying_cry');