DELETE FROM `creature_loot_template` WHERE `entry` IN (48851,46962,49708,49709,50835,48985,49711,49712);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(48851, 53010, 42, 1, 1, 1, 6),
(48851, 58266, 7, 1, 1, 1, 1),
(48851, 59230, 4, 1, 1, 1, 1),
(48851, 68197, 5, 1, 1, 1, 2),
(48851, 68198, 14, 1, 1, 1, 2),
(46962, 6314, 30, 1, 0, 1, 1),
(46962, 6323, 31, 1, 0, 1, 1),
(46962, 6324, 31.1, 1, 0, 1, 1),
(49708, 63433, 19.1, 1, 0, 1, 1),
(49708, 63434, 20.1, 1, 0, 1, 1),
(49708, 63435, 19, 1, 0, 1, 1),
(49708, 63436, 19.2, 1, 0, 1, 1),
(49708, 63437, 20, 1, 0, 1, 1),
(49709, 63438, 19.1, 1, 0, 1, 1),
(49709, 63439, 20, 1, 0, 1, 1),
(49709, 63440, 19.2, 1, 0, 1, 1),
(49709, 63441, 19, 1, 0, 1, 1),
(49709, 63444, 19, 1, 0, 1, 1),
(50835, 53010, 42, 1, 1, 1, 6),
(50835, 58266, 7, 1, 1, 1, 1),
(50835, 59230, 4, 1, 1, 1, 1),
(50835, 68197, 5, 1, 1, 1, 2),
(50835, 68198, 14, 1, 1, 1, 2),
(48985, 53010, 44, 0, 0, 1, 6),
(48985, 58266, 7, 0, 0, 1, 1),
(48985, 59230, 4, 0, 0, 1, 1),
(48985, 68197, 5, 0, 0, 1, 2),
(48985, 68198, 14, 0, 0, 1, 2),
(49711, 63450, 19.3, 1, 0, 1, 1),
(49711, 63452, 19.1, 1, 0, 1, 1),
(49711, 63453, 20, 1, 0, 1, 1),
(49711, 63454, 19.2, 1, 0, 1, 1),
(49711, 63455, 19, 1, 0, 1, 1),
(49712, 52078, 85, 1, 0, 1, 1),
(49712, 63456, 18.3, 1, 0, 1, 1),
(49712, 63457, 18.4, 1, 0, 1, 1),
(49712, 63458, 19.1, 1, 0, 1, 1),
(49712, 63459, 19.3, 1, 0, 1, 1),
(49712, 63460, 18, 1, 0, 1, 1),
(49712, 63461, 19.2, 1, 0, 1, 1),
(49712, 63462, 19, 1, 0, 1, 1),
(49712, 63463, 18.2, 1, 0, 1, 1),
(49712, 63464, 18, 1, 0, 1, 1),
(49712, 63465, 18.1, 1, 0, 1, 1);

DELETE FROM `gameobject` WHERE `guid` = 262016;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(262016, 18895, 33, 2, 1, -242.414, 2159.48, 90.6244, 4.18003, 0, 0, 0.868206, -0.496204, 300, 0, 1);

UPDATE `creature_template` SET `difficulty_entry_1` = '48842' WHERE `entry` =47131;

UPDATE `creature_template` SET `difficulty_entry_1` = '48851' WHERE `entry` =47134;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `dmg_multiplier` = '13', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `lootid` = '48851', `Health_mod` = '4.87' WHERE `entry` =48851;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `lootid` = '48851', `Health_mod` = '4.99' WHERE `entry` =48842;

UPDATE `creature_template` SET `difficulty_entry_1` = '49708', `lootid` = '46962' WHERE `entry` =46962;

UPDATE `creature_template` SET `minlevel` = '87', `maxlevel` = '87', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '713', `maxdmg` = '920', `attackpower` = '992', `dmg_multiplier` = '13', `baseattacktime` = '1500', `minrangedmg` = '477', `maxrangedmg` = '682', `rangedattackpower` = '159', `lootid` = '49708', `mingold` = '6220', `maxgold` = '8046', `Health_mod` = '49.36', `Mana_mod` = '160.51' WHERE `entry` =49708;

UPDATE `creature_template` SET `difficulty_entry_1` = '48919' WHERE `entry` =47137;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '86', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1035', `maxdmg` = '1373', `attackpower` = '1594', `dmg_multiplier` = '13', `baseattacktime` = '1500', `minrangedmg` = '780', `maxrangedmg` = '1079', `rangedattackpower` = '225', `lootid` = '48851', `mingold` = '3220', `maxgold` = '6046', `Health_mod` = '20' WHERE `entry` =48919;

UPDATE `creature_template` SET `difficulty_entry_1` = '48968' WHERE `entry` =3864;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '713', `maxdmg` = '920', `attackpower` = '24', `dmg_multiplier` = '7.5', `Health_mod` = '4.99' WHERE `entry` =48968;

UPDATE `creature_template` SET `difficulty_entry_1` = '48967' WHERE `entry` =3865;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '15', `faction_H` = '15', `mindmg` = '713', `maxdmg` = '920', `attackpower` = '24', `dmg_multiplier` = '7.5', `Health_mod` = '4.99' WHERE `entry` =48967;

UPDATE `creature_template` SET `difficulty_entry_1` = '48973' WHERE `entry` =47231;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `dmg_multiplier` = '7.5', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `lootid` = '48851', `mingold` = '3220', `maxgold` = '6046', `Health_mod` = '4.00057', `Mana_mod` = '10.03' WHERE `entry` =48973;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 3887;

UPDATE `creature_template` SET `difficulty_entry_1` = '49709', `AIName` = '' WHERE `entry` =3887;

UPDATE `creature_template` SET `minlevel` = '87', `maxlevel` = '87', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1111', `maxdmg` = '1430', `attackpower` = '1613', `dmg_multiplier` = '13', `minrangedmg` = '989', `maxrangedmg` = '1174', `rangedattackpower` = '225', `lootid` = '49709', `mingold` = '6220', `maxgold` = '8046', `Mana_mod` = '0' WHERE `entry` =49709;

UPDATE `creature_template` SET `difficulty_entry_1` = '50835' WHERE `entry` =50834;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `dmgschool` = '127', `attackpower` = '1571', `dmg_multiplier` = '13', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `lootid` = '50835', `mingold` = '3220', `maxgold` = '6046', `Health_mod` = '4.28' WHERE `entry` =50835;

UPDATE `creature_template` SET `difficulty_entry_1` = '48988' WHERE `entry` =47143;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1035', `maxdmg` = '1373', `attackpower` = '1594', `dmg_multiplier` = '13', `baseattacktime` = '1500', `minrangedmg` = '780', `maxrangedmg` = '1079', `rangedattackpower` = '225', `mingold` = '3220', `maxgold` = '6046', `Health_mod` = '15.48' WHERE `entry` =48988;

UPDATE `creature_template` SET `difficulty_entry_1` = '48985', `AIName` = '' WHERE `entry` =3877;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `dmg_multiplier` = '13', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `lootid` = '48985', `mingold` = '3220', `maxgold` = '6046', `Health_mod` = '4.99' WHERE `entry` =48985;

UPDATE `creature_template` SET `difficulty_entry_1` = '49059', `AIName` = '' WHERE `entry` =3873;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `dmg_multiplier` = '13', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `lootid` = '48851', `mingold` = '3220', `maxgold` = '6046', `Health_mod` = '3.49' WHERE `entry` =49059;

UPDATE `creature_template` SET `difficulty_entry_1` = '49710', `modelid1` = '3223', `AIName` = '' WHERE `entry` =4278;

UPDATE `creature_template` SET `minlevel` = '87', `maxlevel` = '87', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '713', `maxdmg` = '920', `attackpower` = '992', `dmg_multiplier` = '13', `baseattacktime` = '2000', `unit_flags` = '32832', `minrangedmg` = '477', `maxrangedmg` = '670', `rangedattackpower` = '159', `lootid` = '49710', `mingold` = '6220', `maxgold` = '8046', `Health_mod` = '48.6', `Mana_mod` = '15.05', `mechanic_immune_mask` = '651116543' WHERE `entry` =49710;

UPDATE `creature_template` SET `difficulty_entry_1` = '49125' WHERE `entry` =47132;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `lootid` = '48851', `mingold` = '3220', `maxgold` = '6046' WHERE `entry` =49125;

UPDATE `creature_template` SET `difficulty_entry_1` = '49126', `maxlevel` = '19' WHERE `entry` =47135;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `dmg_multiplier` = '13', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '0220', `lootid` = '48851', `mingold` = '3220', `maxgold` = '6046', `Health_mod` = '4.99' WHERE `entry` =49126;

UPDATE `creature_template` SET `difficulty_entry_1` = '49130', `maxlevel` = '19' WHERE `entry` =47140;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `dmg_multiplier` = '13', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `lootid` = '48851', `mingold` = '3220', `maxgold` = '6046', `Health_mod` = '4', `Mana_mod` = '10.03' WHERE `entry` =49130;

UPDATE `creature_template` SET `difficulty_entry_1` = '49160' WHERE `entry` =3870;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `dmg_multiplier` = '13', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `lootid` = '48851', `Health_mod` = '4.99' WHERE `entry` =49160;

UPDATE `creature_template` SET `difficulty_entry_1` = '49174', `maxlevel` = '19' WHERE `entry` =47145;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `dmg_multiplier` = '13', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `lootid` = '48851', `mingold` = '3220', `maxgold` = '6046', `Health_mod` = '15.48' WHERE `entry` =49174;

UPDATE `creature_template` SET `difficulty_entry_1` = '49711' WHERE `entry` =46963;

UPDATE `creature_template` SET `minlevel` = '87', `maxlevel` = '87', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '643', `maxdmg` = '838', `attackpower` = '992', `dmg_multiplier` = '13', `minrangedmg` = '477', `maxrangedmg` = '682', `rangedattackpower` = '159', `lootid` = '49711', `mingold` = '6220', `maxgold` = '8046', `Health_mod` = '49.4', `Mana_mod` = '16.05' WHERE `entry` =49711;

UPDATE `creature_template` SET `difficulty_entry_1` = '49187', `maxlevel` = '20' WHERE `entry` =47138;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1035', `maxdmg` = '1373', `attackpower` = '1594', `dmg_multiplier` = '13', `minrangedmg` = '780', `maxrangedmg` = '1079', `rangedattackpower` = '225', `mingold` = '3220', `maxgold` = '6046', `Health_mod` = '15.48' WHERE `entry` =49187;

UPDATE `creature_template` SET `difficulty_entry_1` = '49712' WHERE `entry` =46964;

UPDATE `creature_template` SET `minlevel` = '87', `maxlevel` = '87', `faction_A` = '16', `faction_H` = '16', `mindmg` = '643', `maxdmg` = '838', `attackpower` = '992', `dmg_multiplier` = '13', `minrangedmg` = '477', `maxrangedmg` = '682', `rangedattackpower` = '159', `lootid` = '49712', `mingold` = '6220', `maxgold` = '8046', `Health_mod` = '49.4', `Mana_mod` = '16.05' WHERE `entry` =49712;

UPDATE `creature_template` SET `difficulty_entry_1` = '49164', `maxlevel` = '20' WHERE `entry` =47141;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `dmg_multiplier` = '13', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `Health_mod` = '4', `Mana_mod` = '10.03' WHERE `entry` =49164;

UPDATE `creature_template` SET `difficulty_entry_1` = '49186', `maxlevel` = '20' WHERE `entry` =47146;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `faction_A` = '16', `faction_H` = '16', `mindmg` = '713', `maxdmg` = '920', `attackpower` = '24', `dmg_multiplier` = '7.5', `lootid` = '48851', `mingold` = '3220', `maxgold` = '6046', `Health_mod` = '12.41' WHERE `entry` =49186;
