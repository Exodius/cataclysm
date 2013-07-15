UPDATE `instance_template` SET `script` = 'instance_lost_city_of_the_tolvir' WHERE `map` =755;

UPDATE `instance_template` SET `script` = 'instance_blackrock_caverns' WHERE `map` =645;

UPDATE `instance_template` SET `script` = 'instance_the_stonecore' WHERE `map` =725;

UPDATE `instance_template` SET `script` = 'instance_grim_batol' WHERE `map` =670;

UPDATE `instance_template` SET `script` = 'instance_throne_of_the_tides' WHERE `map` =643;

UPDATE `instance_template` SET `script` = 'instance_bastion_of_twilight' WHERE `map` =671;

UPDATE `instance_template` SET `script` = 'instance_blackwing_descent' WHERE `map` =669;

UPDATE `instance_template` SET `script` = 'instance_the_vortex_pinnacle' WHERE `map` =657;

DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5806,6014,6016,6601);
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(5806, 'at_tott_first_tunnel'),
(6014, 'at_raz_jump_down'),
(6016, 'at_raz_jump_down'),
(6601, 'at_raz_jump_down');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (91303,93203,93204,93205,81701,93187,93188,93189,81713,
93175,93176,93177,81689,93184,93185,93186,81761,93172,93173,93174,82919,93108,93109,93110,82363,93169,93170,93171,93103,81628,
92393,92300,81638,75846,75854,93567);

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(91303, 'spell_chogall_conversion'),
(93203, 'spell_chogall_conversion'),
(93204, 'spell_chogall_conversion'),
(93205, 'spell_chogall_conversion'),
(81701, 'spell_chogall_corrupted_blood'),
(93187, 'spell_chogall_corrupted_blood'),
(93188, 'spell_chogall_corrupted_blood'),
(93189, 'spell_chogall_corrupted_blood'),
(81713, 'spell_chogall_corruption'),
(93175, 'spell_chogall_corruption'),
(93176, 'spell_chogall_corruption'),
(93177, 'spell_chogall_corruption'),
(81689, 'spell_chogall_corruption'),
(93184, 'spell_chogall_corruption'),
(93185, 'spell_chogall_corruption'),
(93186, 'spell_chogall_corruption'),
(81761, 'spell_chogall_corruption'),
(93172, 'spell_chogall_corruption'),
(93173, 'spell_chogall_corruption'),
(93174, 'spell_chogall_corruption'),
(82919, 'spell_chogall_corruption'),
(93108, 'spell_chogall_corruption'),
(93109, 'spell_chogall_corruption'),
(93110, 'spell_chogall_corruption'),
(82363, 'spell_chogall_corruption'),
(93169, 'spell_chogall_corruption'),
(93170, 'spell_chogall_corruption'),
(93171, 'spell_chogall_corruption'),
(93103, 'spell_chogall_corruption_bar'),
(81628, 'spell_chogall_summon_corrupting_adherent'),
(92393, 'spell_rupture_periodic'),
(92300, 'spell_crystal_storm'),
(81638, 'spell_crystal_barrage'),
(75846, 'spell_karsh_quicksilver_armor'),
(75854, 'spell_karsh_quicksilver_armor'),
(93567, 'spell_karsh_quicksilver_armor');

DELETE FROM `creature_template` WHERE `entry` = 80043;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
(80043, 0, 0, 0, 0, 0, 20432, 0, 0, 0, 'Slipstream', NULL, 'vehichleCursor', 0, 1, 1, 0, 0, 35, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1048584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_slipstream_two', 1);

UPDATE `creature_template` SET ScriptName = 'boss_ptah' WHERE entry = 39428;

UPDATE `creature_template` SET `ScriptName` = 'npc_lord_darius_crowley_c2' WHERE `entry` = '35552';

UPDATE `creature_template` SET ScriptName = 'npc_king_genn_greymane_last_stand' WHERE entry = 36332;

UPDATE `creature_template` SET `ScriptName` = 'npc_gilneas_city_guard_phase1' WHERE `creature_template`.`entry` =34864;

UPDATE `creature_template` SET `ScriptName` = 'boss_drahga_shadowburner' WHERE `entry` =40319;
