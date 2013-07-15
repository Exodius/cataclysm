-- Long Arm of the Law
DELETE FROM `spell_proc_event` WHERE `entry` IN (87168, 87172);
INSERT INTO `spell_proc_event` VALUES
(87168, 0, 10, 8388608, 0, 0, 272, 0, 0, 50, 0),
(87172, 0, 10, 8388608, 0, 0, 272, 0, 0, 100, 0);

-- Paladin: Long Arm of The law
DELETE FROM `spell_script_names` WHERE spell_id = 20271;
INSERT INTO `spell_script_names` (spell_id, ScriptName) VALUES
(20271, 'spell_pal_long_arm_of_the_law');