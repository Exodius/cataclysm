UPDATE `creature_template` SET `exp` = '2', `Health_mod` = '3', `Mana_mod_extra` = '1', `flags_extra` = '64', AIName` = '' WHERE `entry` =31897;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 31897;
