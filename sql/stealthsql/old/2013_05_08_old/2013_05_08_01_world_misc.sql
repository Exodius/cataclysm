UPDATE `creature_template` SET `minlevel` = '84', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '435', `maxdmg` = '606', `attackpower` = '411', `dmg_multiplier` = '13', `minrangedmg` = '423', `maxrangedmg` = '629', `lootid` = '49662', `mingold` = '3220', `maxgold` = '6046', `mechanic_immune_mask` = '613097436' WHERE `entry` =49662;

DELETE FROM `creature_loot_template` WHERE `entry` IN (49662,49667,49663,49654);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(49662, 53010, 41, 0, 0, 1, 6),
(49662, 58256, 4, 0, 0, 1, 1),
(49662, 58268, 7, 0, 0, 1, 1),
(49662, 68197, 5, 0, 0, 1, 2),
(49662, 68198, 14, 0, 0, 1, 2),
(49667, 53010, 42, 0, 0, 1, 9),
(49667, 58256, 4, 0, 0, 1, 1),
(49667, 58268, 8, 0, 0, 1, 1),
(49667, 68197, 4, 0, 0, 1, 2),
(49667, 68198, 13, 0, 0, 1, 2),
(49663, 53010, 34.5, 1, 0, 1, 6),
(49663, 55822, 2.1, 1, 0, 1, 1),
(49663, 55823, 1.9, 1, 0, 1, 1),
(49663, 55824, 2.1, 1, 0, 1, 1),
(49663, 58256, 4.1, 1, 0, 1, 1),
(49663, 58268, 8.1, 1, 0, 1, 1),
(49663, 68197, 3.9, 1, 0, 1, 2),
(49663, 68198, 12, 1, 0, 1, 2),
(49654, 56338, 19, 1, 1, 1, 1),
(49654, 56339, 20, 1, 1, 1, 1),
(49654, 56340, 17.6, 1, 1, 1, 1),
(49654, 56341, 19.3, 1, 1, 1, 1),
(49654, 56342, 18, 1, 1, 1, 1);

UPDATE `creature_template` SET `minlevel` = '84', `maxlevel` = '85', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `dmg_multiplier` = '13', `minrangedmg` = '758', `maxrangedmg` = '1062', `lootid` = '49667', `mingold` = '3220', `maxgold` = '6046', `mechanic_immune_mask` = '613097436' WHERE `entry` =49667;

UPDATE `creature_template` SET `minlevel` = '81', `maxlevel` = '85', `faction_A` = '16', `faction_H` = '16', `mindmg` = '1007', `maxdmg` = '1354', `attackpower` = '1571', `dmg_multiplier` = '13', `minrangedmg` = '758', `maxrangedmg` = '1062', `rangedattackpower` = '220', `lootid` = '49663', `mingold` = '12182', `maxgold` = '12182', `mechanic_immune_mask` = '613097436' WHERE `entry` =49663;

UPDATE `creature_template` SET `minlevel` = '88', `maxlevel` = '88', `faction_A` = '14', `faction_H` = '14', `mindmg` = '2', `maxdmg` = '2', `attackpower` = '24', `minrangedmg` = '1', `maxrangedmg` = '1', `flags_extra` = '128' WHERE `entry` =43242;

UPDATE `gameobject_template` SET `faction` = '0', `flags` = '0', `size` = '1.75' WHERE `entry` =204381;

UPDATE `creature_template` SET `InhabitType` = '5' WHERE `entry` IN (43214,49538);

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `faction_A` = '16', `faction_H` = '16', `mindmg` = '441', `maxdmg` = '617', `attackpower` = '425', `minrangedmg` = '434', `maxrangedmg` = '640', `rangedattackpower` = '188', `lootid` = '49666', `mingold` = '3220', `maxgold` = '6046', `flags_extra` = '64' WHERE `entry` =49666;

UPDATE `creature_template` SET `minlevel` = '87', `maxlevel` = '87', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '5000', `maxdmg` = '6000', `attackpower` = '1613', `dmg_multiplier` = '7.5', `minrangedmg` = '989', `maxrangedmg` = '1174', `rangedattackpower` = '225', `lootid` = '49654', `mingold` = '20011', `maxgold` = '20011', `mechanic_immune_mask` = '651116543' WHERE `entry` =49654;

UPDATE `creature_template` SET `minlevel` = '87', `maxlevel` = '87', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '5000', `maxdmg` = '6000', `dmg_multiplier` = '7.5', `lootid` = '49624', `VehicleId` = '903', `mingold` = '20027', `maxgold` = '20027', `mechanic_immune_mask` = '617299803', `flags_extra` = '1' WHERE `entry` =49624;

UPDATE `creature_template` SET `exp` = '3' WHERE `entry` =42428;
