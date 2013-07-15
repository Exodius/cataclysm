-- add missing object to gobblins cannon that helps players to jump to the  ship
-- rong spel for object fixed http://www.wowhead.com/spell=92633/last-chance-yacht-boarding-mortar
UPDATE gameobject_template SET data0=92633 WHERE entry=207355;
INSERT INTO `gameobject` VALUES ('6756482', '207355', '648', '1', '1', '-7882.24', '1828.33', '4.20335', '6.16741', '0', '0', '0.0578561', '-0.998325', '1', '0', '1');
UPDATE creature_template SET hoverheight=1 WHERE entry=30702;
UPDATE creature_template SET hoverheight=1 WHERE entry=45322;

-- kaja'mite spawns
DELETE FROM gameobject WHERE id = 195492;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES

(188252, 195492, 648, 1, 3, -8498.36, 1208.49, 43.076, 2.16687, 0, 0, 0.88357, 0.468298, 3600, 0, 1),
(188253, 195492, 648, 1, 3, -8498.2, 1208.06, 43.0213, 4.31414, 0, 0, 0.833007, -0.553263, 3600, 0, 1),
(6600822, 195492, 648, 1, 3, -8484.28, 1138.13, 40.8464, 2.56429, 0, 0, 0.958628, 0.28466, 300, 0, 1),
(6600823, 195492, 648, 1, 3, -8491.45, 1159.26, 41.1383, 1.49615, 0, 0, 0.680228, 0.733001, 300, 0, 1),
(6600824, 195492, 648, 1, 3, -8493.19, 1170.24, 41.9328, 3.00018, 0, 0, 0.997501, 0.070645, 300, 0, 1),
(6600825, 195492, 648, 1, 3, -8470.46, 1175.14, 41.8602, 0.145261, 0, 0, 0.0725665, 0.997364, 300, 0, 1),
(6600826, 195492, 648, 1, 3, -8463.28, 1175.9, 41.8008, 1.68464, 0, 0, 0.74619, 0.665733, 300, 0, 1),
(6600827, 195492, 648, 1, 3, -8432.84, 1216.12, 45.2686, 0.15704, 0, 0, 0.0784395, 0.996919, 300, 0, 1),
(6600828, 195492, 648, 1, 3, -8466.93, 1228.77, 47.7149, 2.67031, 0, 0, 0.972365, 0.233465, 300, 0, 1),
(6600829, 195492, 648, 1, 3, -8486.83, 1225.28, 45.3929, 2.91772, 0, 0, 0.993741, 0.111704, 300, 0, 1),
(6600830, 195492, 648, 1, 3, -8489.33, 1202.85, 42.352, 5.01866, 0, 0, 0.590971, -0.806693, 300, 0, 1),
(6600831, 195492, 648, 1, 3, -8510.18, 1184.91, 45.7741, 3.97409, 0, 0, 0.914613, -0.404331, 300, 0, 1),
(6600832, 195492, 648, 1, 3, -8517.74, 1233.65, 54.4453, 1.74356, 0, 0, 0.765474, 0.643467, 300, 0, 1),
(6600833, 195492, 648, 1, 3, -8499.76, 1238.07, 53.1621, 0.314131, 0, 0, 0.15642, 0.987691, 300, 0, 1),
(6600834, 195492, 648, 1, 3, -8433.46, 1228.1, 50.5492, 0.157053, 0, 0, 0.0784459, 0.996918, 300, 0, 1),
(6600835, 195492, 648, 1, 3, -8428.62, 1225.73, 50.4871, 5.52525, 0, 0, 0.36996, -0.929047, 300, 0, 1),
(6600836, 195492, 648, 1, 3, -8415.36, 1203.53, 45.1445, 5.83156, 0, 0, 0.223899, -0.974612, 300, 0, 1),
(6600837, 195492, 648, 1, 3, -8428.53, 1166.02, 40.61, 0.047097, 0, 0, 0.0235463, 0.999723, 300, 0, 1),
(6600838, 195492, 648, 1, 3, -8466, 1122.15, 41.6536, 4.55528, 0, 0, 0.760417, -0.649435, 300, 0, 1),
(6600839, 195492, 648, 1, 3, -8466.01, 1135.38, 40.003, 0.824635, 0, 0, 0.400734, 0.916195, 300, 0, 1),
(6600840, 195492, 648, 1, 3, -8472.91, 1159.39, 40.6961, 1.18592, 0, 0, 0.558818, 0.829291, 300, 0, 1),
(6600841, 195492, 648, 1, 3, -8471.68, 1187.07, 41.9337, 0.137412, 0, 0, 0.0686519, 0.997641, 300, 0, 1),
(6600842, 195492, 648, 1, 3, -8465.71, 1192.91, 41.9337, 4.65738, 0, 0, 0.726285, -0.687394, 300, 0, 1),
(6600843, 195492, 648, 1, 3, -8493.46, 1179.32, 41.9342, 4.09975, 0, 0, 0.887419, -0.460963, 300, 0, 1),
(6600844, 195492, 648, 1, 3, -8496.44, 1171.1, 41.9342, 2.28156, 0, 0, 0.908959, 0.416885, 300, 0, 1);

-- kaja'mite chunks loot
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (195492, 48768, -100, 1, 0, 1, 1);

-- Tunneling Worm fix
DELETE FROM creature_template WHERE entry = 34865;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
(34865, 0, 0, 0, 0, 0, 36101, 0, 0, 0, 'Tunneling Worm', '', '', 0, 1, 1, 0, 0, 34, 34, 2, 1, 1, 1, 0, 3.8, 3.8, 0, 46, 1, 2000, 2000, 1, 0, 2048, 0, 42, 0, 0, 0, 0, 1.9, 1.9, 0, 1, 0, 0, 34865, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 1);
