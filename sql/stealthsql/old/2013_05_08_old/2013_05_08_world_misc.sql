UPDATE `creature_template` SET `exp` = '3' WHERE `entry` =48851;

DELETE FROM `creature_template_addon` WHERE `entry` = 48973;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(48973, 0, 0, 0, 1, 0, '37816');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (47137,47231,47131,47134,47232,50834,47143,3877,3873,47132,47135,47140,3870,47145,47141,47146,47138);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(47231, 0, 0, 0, 0, 0, 100, 4, 5000, 25000, 40000, 50000, 11, 91325, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Attendant'),
(47231, 0, 1, 0, 0, 0, 100, 4, 10000, 20000, 30000, 40000, 11, 91324, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Attendant'),
(47231, 0, 2, 0, 0, 0, 100, 2, 1000, 20000, 30000, 45000, 11, 91213, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Shadowy Attendant'),
(47137, 0, 0, 0, 0, 0, 100, 4, 15000, 35000, 45000, 55000, 11, 91220, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mindless Horror'),
(47137, 0, 1, 0, 0, 0, 100, 4, 5000, 20000, 30000, 45000, 11, 91217, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mindless Horror'),
(47137, 0, 2, 0, 0, 0, 100, 2, 5000, 20000, 30000, 45000, 11, 91213, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mindless Horror'),
(47131, 0, 0, 0, 0, 0, 100, 4, 2000, 50000, 55000, 59000, 11, 91077, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Frantic Geist'),
(47131, 0, 1, 0, 0, 0, 100, 4, 5000, 10000, 20000, 35000, 11, 91074, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Frantic Geist'),
(47131, 0, 2, 0, 0, 0, 100, 2, 5000, 10000, 20000, 35000, 11, 91064, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Frantic Geist'),
(47134, 0, 0, 0, 0, 0, 100, 4, 5000, 15000, 25000, 35000, 11, 91093, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Corpse Eater'),
(47134, 0, 1, 0, 0, 0, 100, 4, 10000, 20000, 30000, 40000, 11, 91099, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Corpse Eater'),
(47134, 0, 2, 0, 0, 0, 100, 2, 10000, 20000, 30000, 40000, 11, 91088, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Corpse Eater'),
(47232, 0, 0, 0, 0, 0, 100, 6, 5000, 15000, 20000, 25000, 11, 15496, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Ghostly Cook'),
(47232, 0, 1, 0, 0, 0, 100, 4, 8000, 20000, 25000, 35000, 11, 91348, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Ghostly Cook'),
(50834, 0, 0, 0, 0, 0, 100, 2, 10000, 30000, 40000, 50000, 11, 93863, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Rethilgore'),
(50834, 0, 1, 0, 0, 0, 100, 4, 10000, 30000, 40000, 50000, 11, 93920, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Rethilgore'),
(47143, 0, 0, 0, 0, 0, 100, 4, 12000, 22000, 33000, 44000, 11, 91426, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Spitebone Skeleton'),
(47143, 0, 1, 0, 0, 0, 100, 4, 5000, 25000, 35000, 45000, 11, 91425, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Spitebone Skeleton'),
(47143, 0, 2, 0, 0, 0, 100, 2, 5000, 25000, 35000, 45000, 11, 91419, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Spitebone Skeleton'),
(3877, 0, 0, 0, 0, 0, 100, 6, 5000, 25000, 35000, 45000, 11, 7074, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Wailing Guardsman'),
(3877, 0, 1, 0, 0, 0, 100, 4, 10000, 30000, 45000, 55000, 11, 91801, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Wailing Guardsman'),
(3873, 0, 0, 0, 0, 0, 100, 6, 5000, 25000, 35000, 45000, 11, 7054, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Tormented Officer'),
(3873, 0, 1, 0, 0, 0, 100, 6, 15000, 30000, 40000, 50000, 11, 91463, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tormented Officer'),
(3873, 0, 2, 0, 0, 0, 100, 6, 10000, 20000, 30000, 40000, 11, 93844, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Tormented Officer'),
(47132, 0, 0, 0, 0, 0, 100, 6, 5000, 15000, 20000, 30000, 11, 91522, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dark Creeper'),
(47135, 0, 0, 0, 0, 0, 100, 6, 1000, 40000, 50000, 58000, 11, 91561, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fetid Ghoul'),
(47135, 0, 1, 0, 0, 0, 100, 4, 5000, 30000, 40000, 50000, 11, 91554, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Fetid Ghoul'),
(47140, 0, 0, 0, 0, 0, 50, 6, 10000, 20000, 30000, 40000, 11, 13341, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Sorcerous Skeleton'),
(47140, 0, 1, 0, 0, 0, 50, 6, 10000, 20000, 30000, 40000, 11, 15497, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Sorcerous Skeleton'),
(47140, 0, 2, 0, 0, 0, 100, 4, 5000, 25000, 35000, 45000, 11, 91563, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Sorcerous Skeleton'),
(3870, 0, 0, 0, 0, 0, 100, 2, 10000, 20000, 30000, 40000, 11, 30615, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Stone Sleeper'),
(3870, 0, 1, 0, 0, 0, 100, 4, 10000, 20000, 30000, 40000, 11, 38595, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Stone Sleeper'),
(47145, 0, 0, 0, 0, 0, 100, 6, 10000, 20000, 30000, 40000, 11, 11972, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Sorcerous Skeleton'),
(47145, 0, 1, 0, 0, 0, 100, 6, 5000, 25000, 35000, 45000, 11, 87081, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Sorcerous Skeleton'),
(47145, 0, 2, 0, 0, 0, 100, 4, 15000, 30000, 40000, 50000, 11, 91629, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sorcerous Skeleton'),
(47141, 0, 0, 0, 0, 0, 100, 2, 5000, 15000, 25000, 35000, 11, 33833, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 'Dread Scryer'),
(47141, 0, 1, 0, 0, 0, 100, 2, 10000, 20000, 30000, 40000, 11, 12611, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dread Scryer'),
(47141, 0, 2, 0, 0, 0, 100, 4, 15000, 30000, 40000, 50000, 11, 91622, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Dread Scryer'),
(47141, 0, 3, 0, 0, 0, 100, 4, 10000, 25000, 35000, 45000, 11, 91623, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dread Scryer'),
(47141, 0, 4, 0, 0, 0, 100, 4, 5000, 20000, 30000, 40000, 11, 91624, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dread Scryer'),
(47146, 0, 0, 0, 0, 0, 100, 6, 5000, 15000, 20000, 25000, 11, 32731, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Spitebone Flayer'),
(47138, 0, 0, 0, 0, 0, 100, 2, 5000, 15000, 25000, 35000, 11, 91677, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Pustulant Monstrosity'),
(47138, 0, 1, 0, 0, 0, 100, 4, 5000, 15000, 25000, 35000, 11, 91678, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Pustulant Monstrosity');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47231;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47137;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47131;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47134;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47232;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` =50834;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47143;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =3877;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =3873;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47132;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47135;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47140;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =3870;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47145;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47141;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47146;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` =47138;

UPDATE `creature_template` SET `exp` = '3' WHERE `entry` =49712;

UPDATE `creature_template` SET `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827', `dmg_multiplier` = '7.5', `minrangedmg` = '399', `maxrangedmg` = '559', `rangedattackpower` = '169', `lootid` = '43430', `mingold` = '15', `maxgold` = '33', `AIName` = 'SmartAI' WHERE `entry` =43430;

DELETE FROM `creature_loot_template` WHERE `entry` IN (43430,42696,42808,43438,42810,49642,43214,42695,42692,42188);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(43430, 53010, 34.9, 1, 0, 1, 6),
(43430, 55822, 2.2, 1, 0, 1, 1),
(43430, 55823, 2, 1, 0, 1, 1),
(43430, 55824, 2, 1, 0, 1, 1),
(43430, 58256, 3.8, 1, 0, 1, 1),
(43430, 58268, 8.2, 1, 0, 1, 1),
(43430, 68197, 3.9, 1, 0, 1, 2),
(43430, 68198, 12.2, 1, 0, 1, 2),
(42696, 53010, 37.4, 1, 0, 1, 6),
(42696, 55822, 1.9, 1, 0, 1, 1),
(42696, 58256, 4.2, 1, 0, 1, 1),
(42696, 58268, 8.3, 1, 0, 1, 1),
(42696, 68197, 4.4, 1, 0, 1, 2),
(42696, 68198, 12.5, 1, 0, 1, 2),
(42808, 53010, 34.5, 1, 0, 1, 6),
(42808, 55822, 2.1, 1, 0, 1, 1),
(42808, 55823, 1.9, 1, 0, 1, 1),
(42808, 55824, 2.1, 1, 0, 1, 1),
(42808, 58256, 4.1, 1, 0, 1, 1),
(42808, 58268, 8.1, 1, 0, 1, 1),
(42808, 68197, 3.9, 1, 0, 1, 2),
(42808, 68198, 12, 1, 0, 1, 2),
(43438, 55792, 13.1, 1, 1, 1, 1),
(43438, 55793, 13.4, 1, 1, 1, 1),
(43438, 55794, 19.3, 1, 1, 1, 1),
(43438, 55795, 26.2, 1, 1, 1, 1),
(43438, 55796, 20.3, 1, 1, 1, 1),
(42810, 52506, -100, 1, 0, 1, 1),
(42810, 55822, 2.9, 1, 0, 1, 1),
(42810, 55823, 3.1, 1, 0, 1, 1),
(42810, 55824, 3.5, 1, 0, 1, 1),
(42810, 58256, 6.8, 1, 0, 1, 1),
(42810, 58268, 14.1, 1, 0, 1, 1),
(42810, 60486, 6.6, 1, 0, 1, 3),
(49642, 56328, 19, 1, 1, 1, 1),
(49642, 56329, 19.1, 1, 1, 1, 1),
(49642, 56330, 18.9, 1, 1, 1, 1),
(49642, 56331, 19.4, 1, 1, 1, 1),
(49642, 56332, 18.7, 1, 1, 1, 1),
(43214, 55797, 19, 1, 1, 1, 1),
(43214, 55798, 13.2, 1, 1, 1, 1),
(43214, 55799, 24, 1, 1, 1, 1),
(43214, 55800, 0, 1, 1, 1, 1),
(43214, 55801, 19.4, 1, 1, 1, 1),
(43214, 63043, 0.7, 1, 0, 1, 1),
(42695, 53010, 36.3, 1, 0, 1, 6),
(42695, 55823, 2.1, 1, 0, 1, 1),
(42695, 55824, 2.1, 1, 0, 1, 1),
(42695, 58256, 4, 1, 0, 1, 1),
(42695, 58268, 7.7, 1, 0, 1, 1),
(42695, 68197, 4.4, 1, 0, 1, 2),
(42695, 68198, 13, 1, 0, 1, 2),
(42692, 53010, 35.1, 1, 0, 1, 6),
(42692, 55822, 2.1, 1, 0, 1, 1),
(42692, 55823, 2.6, 1, 0, 1, 1),
(42692, 55824, 2.1, 1, 0, 1, 1),
(42692, 58256, 4, 1, 0, 1, 1),
(42692, 58268, 7.6, 1, 0, 1, 1),
(42692, 68197, 4, 1, 0, 1, 2),
(42692, 68198, 13.3, 1, 0, 1, 2),
(42188, 55802, 14, 1, 1, 1, 1),
(42188, 55803, 9, 1, 1, 1, 1),
(42188, 55804, 19.2, 1, 1, 1, 1),
(42188, 55810, 19.6, 1, 1, 1, 1),
(42188, 55811, 29, 1, 1, 1, 1);

DELETE FROM `pickpocketing_loot_template` WHERE `entry` IN (42696,43537);
INSERT INTO `pickpocketing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(42696, 58269, 17, 0, 0, 1, 1),
(42696, 63291, 22, 0, 0, 1, 1),
(42696, 63300, 8, 0, 0, 1, 1),
(42696, 63310, 10, 0, 0, 1, 1),
(42696, 63316, 1.6, 0, 0, 1, 1),
(42696, 63317, 22, 0, 0, 1, 1),
(42696, 63318, 1.1, 0, 0, 1, 1),
(42696, 63348, 23, 0, 0, 1, 1),
(42696, 63349, 22, 0, 0, 1, 1),
(43537, 58269, 16, 0, 0, 1, 1),
(43537, 63291, 23, 0, 0, 1, 1),
(43537, 63300, 7, 0, 0, 1, 1),
(43537, 63310, 11, 0, 0, 1, 1),
(43537, 63316, 1.4, 0, 0, 1, 1),
(43537, 63317, 19, 0, 0, 1, 1),
(43537, 63318, 0.9, 0, 0, 1, 1),
(43537, 63348, 25, 0, 0, 1, 1),
(43537, 63349, 20, 0, 0, 1, 1);

DELETE FROM `skinning_loot_template` WHERE `entry` = 42808;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(42808, 52976, 85, 1, 0, 1, 9),
(42808, 52977, 44, 1, 0, 1, 12);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (43430,43537,42696,42808,42695,42692);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(43430, 0, 0, 0, 0, 0, 100, 7, 1, 200, 0, 0, 11, 81574, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Berserker - Charge'),
(43430, 0, 1, 0, 0, 0, 100, 6, 8000, 8000, 15000, 25000, 11, 81568, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Berserker - Spinning Slash'),
(43537, 0, 0, 0, 0, 0, 100, 6, 5000, 8000, 18000, 20000, 11, 81463, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Earthshaper - Dust Storm'),
(43537, 0, 1, 0, 0, 0, 100, 6, 3500, 4000, 15000, 20000, 11, 81530, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Earthshaper - Ground Shock'),
(43537, 0, 2, 0, 0, 0, 100, 6, 500, 1000, 5000, 6000, 11, 81576, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Earthshaper - Lava Burst'),
(42696, 0, 0, 0, 0, 0, 100, 6, 3000, 3000, 5000, 5000, 11, 15496, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Warbringer - Cleave'),
(42696, 0, 1, 0, 2, 0, 100, 7, 0, 30, 0, 0, 11, 80158, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Warbringer - Rage'),
(42808, 0, 0, 0, 0, 0, 100, 6, 8000, 10000, 10000, 15000, 11, 79922, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Flayer - Flay'),
(42695, 0, 0, 0, 4, 0, 100, 6, 0, 0, 0, 0, 39, 50, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Sentry - Call for Help'),
(42695, 0, 1, 0, 4, 0, 100, 6, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Sentry - Call for Help - Yell'),
(42692, 0, 0, 0, 0, 0, 100, 6, 8000, 8000, 10000, 15000, 11, 80195, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Bruiser - Shockwave'),
(42692, 0, 1, 0, 0, 0, 100, 6, 5000, 6000, 15000, 20000, 11, 80180, 2, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Stonecore: Stonecore Bruiser - Body Slam');

UPDATE `creature_template` SET `mindmg` = '545', `maxdmg` = '723', `attackpower` = '839', `dmg_multiplier` = '7.5', `minrangedmg` = '411', `maxrangedmg` = '568', `rangedattackpower` = '173', `mingold` = '15', `maxgold` = '33' WHERE `entry` =43391;

UPDATE `creature_template` SET `difficulty_entry_1` = '49662', `mindmg` = '516', `maxdmg` = '696', `attackpower` = '813', `dmg_multiplier` = '7.5', `minrangedmg` = '389', `maxrangedmg` = '545', `rangedattackpower` = '104', `lootid` = '43537', `pickpocketloot` = '43537', `AIName` = 'SmartAI', `mechanic_immune_mask` = '613097436' WHERE `entry` =43537;

UPDATE `creature_template` SET `difficulty_entry_1` = '49667', `mindmg` = '509', `maxdmg` = '683', `attackpower` = '805', `dmg_multiplier` = '7.5', `minrangedmg` = '371', `maxrangedmg` = '535', `rangedattackpower` = '146', `lootid` = '42696', `pickpocketloot` = '42696', `AIName` = 'SmartAI', `mechanic_immune_mask` = '613097436' WHERE `entry` =42696;

UPDATE `creature_template` SET `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827', `mingold` = '15', `maxgold` = '33' WHERE `entry` =43662;

UPDATE `creature_template` SET `difficulty_entry_1` = '49663', `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827', `dmg_multiplier` = '7.5', `minrangedmg` = '399', `maxrangedmg` = '559', `rangedattackpower` = '169', `lootid` = '42808', `skinloot` = '42808', `mingold` = '15', `maxgold` = '33', `AIName` = 'SmartAI', `mechanic_immune_mask` = '613097436' WHERE `entry` =42808;

UPDATE `creature_template` SET `difficulty_entry_1` = '49642', `faction_A` = '16', `faction_H` = '16', `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827', `dmg_multiplier` = '7.5', `minrangedmg` = '399', `maxrangedmg` = '559', `rangedattackpower` = '169', `lootid` = '43438', `mingold` = '15', `maxgold` = '33', `mechanic_immune_mask` = '651116543' WHERE `entry` =43438;

UPDATE `creature_template` SET `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827', `dmg_multiplier` = '7.5', `minrangedmg` = '399', `maxrangedmg` = '559', `rangedattackpower` = '169', `lootid` = '42810', `mingold` = '15', `maxgold` = '33' WHERE `entry` =42810;

UPDATE `creature_template` SET `minlevel` = '80', `maxlevel` = '85', `exp` = '2', `faction_A` = '26', `faction_H` = '26', `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827', `dmg_multiplier` = '7.5', `minrangedmg` = '399', `maxrangedmg` = '559', `rangedattackpower` = '169' WHERE `entry` =49267;

UPDATE `creature_template` SET `minlevel` = '87', `maxlevel` = '87', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '5000', `maxdmg` = '6000', `attackpower` = '1613', `dmg_multiplier` = '7.5', `baseattacktime` = '2000', `minrangedmg` = '989', `maxrangedmg` = '1174', `rangedattackpower` = '225', `lootid` = '49642', `mingold` = '19999', `maxgold` = '19999', `mechanic_immune_mask` = '651116543' WHERE `entry` =49642;

UPDATE `creature_template` SET `difficulty_entry_1` = '49538', `maxlevel` = '84', `mindmg` = '2902', `maxdmg` = '3223', `attackpower` = '7.5', `lootid` = '43214', `mingold` = '15', `maxgold` = '33', `mechanic_immune_mask` = '651116543' WHERE `entry` =43214;

UPDATE `creature_template` SET `minlevel` = '87', `maxlevel` = '87', `exp` = '3', `faction_A` = '16', `faction_H` = '16', `mindmg` = '5000', `maxdmg` = '6000', `dmg_multiplier` = '7.5', `baseattacktime` = '2000', `minrangedmg` = '989', `maxrangedmg` = '1174', `rangedattackpower` = '225', `lootid` = '49538', `mingold` = '20012', `maxgold` = '20012', `mechanic_immune_mask` = '651116543' WHERE `entry` =49538;

UPDATE `creature_template` SET `difficulty_entry_1` = '49666', `maxlevel` = '82', `mindmg` = '530', `maxdmg` = '713', `attackpower` = '827', `minrangedmg` = '399', `maxrangedmg` = '559', `rangedattackpower` = '169', `lootid` = '42695', `AIName` = 'SmartAI' WHERE `entry` =42695;

UPDATE `creature_template` SET `mindmg` = '545', `maxdmg` = '723', `minrangedmg` = '411', `maxrangedmg` = '568', `rangedattackpower` = '173', `lootid` = '42692', `AIName` = 'SmartAI', `mechanic_immune_mask` = '613097436' WHERE `entry` =42692;

UPDATE `creature_template` SET `difficulty_entry_1` = '49654', `maxlevel` = '84', `faction_A` = '16', `faction_H` = '16', `speed_walk` = '1', `mindmg` = '519', `maxdmg` = '693', `attackpower` = '815', `dmg_multiplier` = '7.5', `unit_flags` = '0', `unit_flags2` = '0', `minrangedmg` = '384', `maxrangedmg` = '546', `rangedattackpower` = '157', `lootid` = '42188', `mingold` = '15', `maxgold` = '33', `mechanic_immune_mask` = '651116543' WHERE `entry` =42188;

UPDATE `ozeneu_world`.`creature_template` SET `exp` = '2', `mindmg` = '509', `maxdmg` = '683', `attackpower` = '805', `minrangedmg` = '371', `maxrangedmg` = '535', `rangedattackpower` = '146', `flags_extra` = '64' WHERE `creature_template`.`entry` =42428;

UPDATE `creature_template` SET `difficulty_entry_1` = '49624', `faction_A` = '16', `faction_H` = '16', `npcflag` = '3', `mindmg` = '519', `maxdmg` = '693', `attackpower` = '815', `dmg_multiplier` = '7.5', `minrangedmg` = '384', `maxrangedmg` = '546', `rangedattackpower` = '157', `lootid` = '42333', `mingold` = '15', `maxgold` = '33', `mechanic_immune_mask` = '617299803' WHERE `entry` =42333;

UPDATE `creature_template` SET `minlevel` = '85', `maxlevel` = '85', `exp` = '3', `faction_A` = '1683', `faction_H` = '1683', `mindmg` = '2', `maxdmg` = '2', `attackpower` = '24', `unit_flags` = '33554432', `minrangedmg` = '1', `maxrangedmg` = '1', `flags_extra` = '128' WHERE `entry` =42499;
