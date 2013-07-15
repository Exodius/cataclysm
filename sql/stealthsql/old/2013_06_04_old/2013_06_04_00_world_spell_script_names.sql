-- 23881 Bloodthirst (damage spell)
-- 23885 Bloodthirst (buff)
-- 23880 Bloodthirst (triggered heal)

DELETE FROM `spell_script_names` WHERE spell_id = -23881;
DELETE FROM `spell_script_names` WHERE spell_id IN (23880, 23881, 23885);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES (23881,"spell_warr_bloodthirst");
