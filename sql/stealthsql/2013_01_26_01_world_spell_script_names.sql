-- tidal waves
DELETE FROM `spell_script_names` WHERE `spell_id` IN (51562,51563,51564);
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(51562, 'spell_sha_tidal_waves'),
(51563, 'spell_sha_tidal_waves'),
(51564, 'spell_sha_tidal_waves');

-- rolling thunder
DELETE FROM `spell_script_names` WHERE `spell_id` IN (88756,88764);
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(88756, 'spell_sha_rolling_thunder'),
(88764, 'spell_sha_rolling_thunder');
