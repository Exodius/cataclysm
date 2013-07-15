-- Mage Spell
DELETE FROM `spell_script_names` WHERE `spell_id` IN (30451, 11129);
INSERT INTO `spell_script_names` VALUES 
(30451,'spell_mage_arcane_blast'),	-- Arcane Blast
(11129,'spell_mage_combustion');	-- Combustion