DELETE FROM `spell_script_names` WHERE `spell_id` IN (75676,76686,93674,76336);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(75676, 'spell_corla_beam_target_check'),
(76686, 'spell_shadow_prison'),
(93674, 'spell_shadow_prison'),
(76336, 'spell_fire_strike_target_check');
