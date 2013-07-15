-- fix for 52363 loot
-- http://www.wowhead.com/npc=52363
UPDATE `creature_template` SET lootid=52363 WHERE `entry`=52363;
DELETE FROM `creature_loot_template` WHERE `entry` = 52363;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(52363, 70376, 5.0353, 1, 0, 1, 1), -- 3Ruthless Gladiator's Pendant of Diffusion
(52363, 71046, 4.9993, 1, 0, 1, 1), -- 3Dark Phoenix Gloves
(52363, 70370, 4.9504, 1, 0, 1, 1), -- 3Ruthless Gladiator's Band of Accuracy
(52363, 70387, 4.9177, 1, 0, 1, 1), -- 3Ruthless Gladiator's Drape of Diffusion
(52363, 70371, 4.8916, 1, 0, 1, 1), -- 3Ruthless Gladiator's Band of Meditation
(52363, 70389, 4.8132, 1, 0, 1, 1), -- 3Ruthless Gladiator's Drape of Meditation
(52363, 70372, 4.7381, 1, 0, 1, 1), -- 3Ruthless Gladiator's Signet of Cruelty
(52363, 71288, 4.6924, 1, 0, 1, 1), -- 3Firehawk Leggings
(52363, 70369, 4.6532, 1, 0, 1, 1), -- 3Ruthless Gladiator's Band of Cruelty
(52363, 70377, 4.6304, 1, 0, 1, 1), -- 3Ruthless Gladiator's Pendant of Alacrity
(52363, 71050, 4.6206, 1, 0, 1, 1), -- 3Flamewaker's Gloves
(52363, 70378, 4.6075, 1, 0, 1, 1), -- 3Ruthless Gladiator's Pendant of Meditation
(52363, 70382, 4.6042, 1, 0, 1, 1), -- 3Ruthless Gladiator's Choker of Accuracy
(52363, 70388, 4.5814, 1, 0, 1, 1), -- 3Ruthless Gladiator's Drape of Prowess
(52363, 70380, 4.5781, 1, 0, 1, 1), -- 3Ruthless Gladiator's Necklace of Proficiency
(52363, 71048, 4.5716, 1, 0, 1, 1), -- 3Dark Phoenix Legguards
(52363, 71286, 4.5650, 1, 0, 1, 1), -- 3Firehawk Gloves
(52363, 70374, 4.5553, 1, 0, 1, 1), -- 3Ruthless Gladiator's Ring of Accuracy
(52363, 70384, 4.5487, 1, 0, 1, 1), -- 3Ruthless Gladiator's Cloak of Prowess
(52363, 70385, 4.4801, 1, 0, 1, 1), -- 3Ruthless Gladiator's Cape of Prowess
(52363, 70375, 4.4573, 1, 0, 1, 1), -- 3Ruthless Gladiator's Ring of Cruelty
(52363, 70379, 4.4279, 1, 0, 1, 1), -- 3Ruthless Gladiator's Necklace of Prowess
(52363, 70381, 4.3691, 1, 0, 1, 1), -- 3Ruthless Gladiator's Choker of Proficiency
(52363, 70386, 4.3659, 1, 0, 1, 1), -- 3Ruthless Gladiator's Cape of Cruelty
(52363, 70373, 4.3332, 1, 0, 1, 1), -- 3Ruthless Gladiator's Signet of Accuracy
(52363, 70383, 4.3234, 1, 0, 1, 1), -- 3Ruthless Gladiator's Cloak of Alacrity
(52363, 71281, 4.3071, 1, 0, 1, 1), -- 3Balespider's Handwraps
(52363, 71283, 4.2810, 1, 0, 1, 1), -- 3Balespider's Leggings
(52363, 71052, 4.2254, 1, 0, 1, 1), -- 3Flamewaker's Legguards
(52363, 70301, 3.3601, 1, 0, 1, 1), -- 3Ruthless Gladiator's Silk Trousers
(52363, 70262, 3.1087, 1, 0, 1, 1), -- 3Ruthless Gladiator's Chain Leggings
(52363, 70299, 3.0434, 1, 0, 1, 1), -- 3Ruthless Gladiator's Silk Handguards
(52363, 70316, 3.0401, 1, 0, 1, 1), -- 3Ruthless Gladiator's Felweave Trousers
(52363, 70295, 3.0205, 1, 0, 1, 1), -- 3Ruthless Gladiator's Leather Gloves
(52363, 70260, 2.9846, 1, 0, 1, 1), -- 3Ruthless Gladiator's Chain Gauntlets
(52363, 70297, 2.9454, 1, 0, 1, 1), -- 3Ruthless Gladiator's Leather Legguards
(52363, 70314, 2.9193, 1, 0, 1, 1), -- 3Ruthless Gladiator's Felweave Handguards
(52363, 70257, 2.9095, 1, 0, 1, 1), -- 3Ruthless Gladiator's Plate Legguards
(52363, 70245, 2.8507, 1, 0, 1, 1), -- 3Ruthless Gladiator's Dreadplate Gauntlets
(52363, 70247, 2.7756, 1, 0, 1, 1), -- 3Ruthless Gladiator's Dreadplate Legguards
(52363, 70397, 2.6940, 1, 0, 1, 1), -- 3Ruthless Gladiator's Emblem of Meditation
(52363, 70255, 2.6711, 1, 0, 1, 1), -- 3Ruthless Gladiator's Plate Gauntlets
(52363, 70953, 2.6417, 1, 0, 1, 1), -- 3Elementium Deathplate Handguards
(52363, 71273, 2.6123, 1, 0, 1, 1), -- 3Legwraps of the Cleansing Flame
(52363, 70401, 2.5829, 1, 0, 1, 1), -- 3Ruthless Gladiator's Badge of Dominance
(52363, 70398, 2.5633, 1, 0, 1, 1), -- 3Ruthless Gladiator's Emblem of Tenacity
(52363, 70400, 2.5405, 1, 0, 1, 1), -- 3Ruthless Gladiator's Badge of Victory
(52363, 70396, 2.4882, 1, 0, 1, 1), -- 3Ruthless Gladiator's Emblem of Cruelty
(52363, 71271, 2.4556, 1, 0, 1, 1), -- 3Handwraps of the Cleansing Flame
(52363, 70402, 2.4295, 1, 0, 1, 1), -- 3Ruthless Gladiator's Insignia of Dominance
(52363, 70404, 2.3838, 1, 0, 1, 1), -- 3Ruthless Gladiator's Insignia of Conquest
(52363, 71278, 2.3838, 1, 0, 1, 1), -- 3Leggings of the Cleansing Flame
(52363, 70403, 2.3642, 1, 0, 1, 1), -- 3Ruthless Gladiator's Insignia of Victory
(52363, 70324, 2.3609, 1, 0, 1, 1), -- 3Ruthless Gladiator's Greaves of Alacrity
(52363, 70367, 2.3413, 1, 0, 1, 1), -- 3Ruthless Gladiator's Treads of Meditation
(52363, 70399, 2.3413, 1, 0, 1, 1), -- 3Ruthless Gladiator's Badge of Conquest
(52363, 70942, 2.3380, 1, 0, 1, 1), -- 3Legguards of the Molten Giant
(52363, 70943, 2.3152, 1, 0, 1, 1), -- 3Handguards of the Molten Giant
(52363, 70338, 2.3119, 1, 0, 1, 1), -- 3Ruthless Gladiator's Wristguards of Alacrity
(52363, 70337, 2.3086, 1, 0, 1, 1), -- 3Ruthless Gladiator's Sabatons of Alacrity
(52363, 70340, 2.2858, 1, 0, 1, 1), -- 3Ruthless Gladiator's Wristguards of Accuracy
(52363, 71069, 2.2727, 1, 0, 1, 1), -- 3Gauntlets of the Molten Giant
(52363, 70325, 2.2531, 1, 0, 1, 1), -- 3Ruthless Gladiator's Bracers of Prowess
(52363, 70327, 2.2531, 1, 0, 1, 1), -- 3Ruthless Gladiator's Armplates of Proficiency
(52363, 70344, 2.2433, 1, 0, 1, 1), -- 3Ruthless Gladiator's Footguards of Meditation
(52363, 70320, 2.2401, 1, 0, 1, 1), -- 3Ruthless Gladiator's Girdle of Cruelty
(52363, 71059, 2.2368, 1, 0, 1, 1), -- 3Elementium Deathplate Gauntlets
(52363, 70323, 2.2139, 1, 0, 1, 1), -- 3Ruthless Gladiator's Warboots of Alacrity
(52363, 70366, 2.2139, 1, 0, 1, 1), -- 3Ruthless Gladiator's Cuffs of Meditation
(52363, 70319, 2.2107, 1, 0, 1, 1), -- 3Ruthless Gladiator's Clasp of Cruelty
(52363, 71276, 2.2107, 1, 0, 1, 1), -- 3Gloves of the Cleansing Flame
(52363, 70336, 2.1944, 1, 0, 1, 1), -- 3Ruthless Gladiator's Links of Cruelty
(52363, 70362, 2.1813, 1, 0, 1, 1), -- 3Ruthless Gladiator's Cord of Accuracy
(52363, 70342, 2.1552, 1, 0, 1, 1), -- 3Ruthless Gladiator's Armbands of Prowess
(52363, 70351, 2.1552, 1, 0, 1, 1), -- 3Ruthless Gladiator's Boots of Alacrity
(52363, 70334, 2.1519, 1, 0, 1, 1), -- 3Ruthless Gladiator's Bracers of Meditation
(52363, 70333, 2.1454, 1, 0, 1, 1), -- 3Ruthless Gladiator's Greaves of Meditation
(52363, 70359, 2.1388, 1, 0, 1, 1), -- 3Ruthless Gladiator's Bindings of Prowess
(52363, 70364, 2.1388, 1, 0, 1, 1), -- 3Ruthless Gladiator's Treads of Alacrity
(52363, 70345, 2.1225, 1, 0, 1, 1), -- 3Ruthless Gladiator's Bindings of Meditation
(52363, 71071, 2.1127, 1, 0, 1, 1), -- 3Legplates of the Molten Giant
(52363, 70349, 2.1029, 1, 0, 1, 1), -- 3Ruthless Gladiator's Waistband of Accuracy
(52363, 70335, 2.0997, 1, 0, 1, 1), -- 3Ruthless Gladiator's Sabatons of Cruelty
(52363, 70348, 2.0768, 1, 0, 1, 1), -- 3Ruthless Gladiator's Boots of Cruelty
(52363, 70321, 2.0703, 1, 0, 1, 1), -- 3Ruthless Gladiator's Warboots of Cruelty
(52363, 70365, 2.0703, 1, 0, 1, 1), -- 3Ruthless Gladiator's Cuffs of Prowess
(52363, 70346, 2.0637, 1, 0, 1, 1), -- 3Ruthless Gladiator's Belt of Cruelty
(52363, 70352, 2.0637, 1, 0, 1, 1), -- 3Ruthless Gladiator's Armwraps of Alacrity
(52363, 70339, 2.0605, 1, 0, 1, 1), -- 3Ruthless Gladiator's Links of Accuracy
(52363, 70350, 2.0605, 1, 0, 1, 1), -- 3Ruthless Gladiator's Armwraps of Accuracy
(52363, 70952, 2.0605, 1, 0, 1, 1), -- 3Elementium Deathplate Legguards
(52363, 70361, 2.0572, 1, 0, 1, 1), -- 3Ruthless Gladiator's Treads of Cruelty
(52363, 70326, 2.0409, 1, 0, 1, 1), -- 3Ruthless Gladiator's Girdle of Prowess
(52363, 71061, 2.0376, 1, 0, 1, 1), -- 3Elementium Deathplate Greaves
(52363, 70329, 2.0213, 1, 0, 1, 1), -- 3Ruthless Gladiator's Sabatons of Meditation
(52363, 70368, 2.0148, 1, 0, 1, 1), -- 3Ruthless Gladiator's Cord of Meditation
(52363, 70330, 1.9919, 1, 0, 1, 1), -- 3Ruthless Gladiator's Armbands of Meditation
(52363, 70341, 1.9495, 1, 0, 1, 1), -- 3Ruthless Gladiator's Sabatons of Alacrity
(52363, 70322, 1.9462, 1, 0, 1, 1), -- 3Ruthless Gladiator's Armplates of Alacrity
(52363, 70343, 1.9201, 1, 0, 1, 1), -- 3Ruthless Gladiator's Belt of Meditation
(52363, 70331, 1.9037, 1, 0, 1, 1), -- 3Ruthless Gladiator's Waistguard of Cruelty
(52363, 70332, 1.9005, 1, 0, 1, 1), -- 3Ruthless Gladiator's Clasp of Meditation
(52363, 70328, 1.8907, 1, 0, 1, 1), -- 3Ruthless Gladiator's Waistguard of Meditation
(52363, 70358, 1.8907, 1, 0, 1, 1), -- 3Ruthless Gladiator's Footguards of Alacrity
(52363, 70363, 1.8678, 1, 0, 1, 1), -- 3Ruthless Gladiator's Cuffs of Accuracy
(52363, 70347, 1.8482, 1, 0, 1, 1), -- 3Ruthless Gladiator's Waistband of Cruelty
(52363, 70360, 1.8352, 1, 0, 1, 1), -- 3Ruthless Gladiator's Cord of Cruelty
(52363, 70306, 1.8156, 1, 0, 1, 1), -- 3Ruthless Gladiator's Mooncloth Leggings
(52363, 71292, 1.7535, 1, 0, 1, 1), -- 3Erupting Volcanic Gloves
(52363, 70949, 1.7209, 1, 0, 1, 1), -- 3Immolation Handguards
(52363, 70947, 1.7111, 1, 0, 1, 1), -- 3Immolation Legguards
(52363, 71066, 1.6980, 1, 0, 1, 1), -- 3Immolation Legplates
(52363, 71297, 1.6947, 1, 0, 1, 1), -- 3Erupting Volcanic Handwraps
(52363, 71294, 1.6392, 1, 0, 1, 1), -- 3Erupting Volcanic Kilt
(52363, 70252, 1.6294, 1, 0, 1, 1), -- 3Ruthless Gladiator's Scaled Legguards
(52363, 71097, 1.6066, 1, 0, 1, 1), -- 3Obsidian Arborweave Grips
(52363, 71302, 1.6033, 1, 0, 1, 1), -- 3Erupting Volcanic Grips
(52363, 71107, 1.6001, 1, 0, 1, 1), -- 3Obsidian Arborweave Gloves
(52363, 70311, 1.5968, 1, 0, 1, 1), -- 3Ruthless Gladiator's Satin Leggings
(52363, 71102, 1.5935, 1, 0, 1, 1), -- 3Obsidian Arborweave Handwraps
(52363, 70304, 1.5837, 1, 0, 1, 1), -- 3Ruthless Gladiator's Mooncloth Gloves
(52363, 70309, 1.5837, 1, 0, 1, 1), -- 3Ruthless Gladiator's Satin Gloves
(52363, 71304, 1.5772, 1, 0, 1, 1), -- 3Erupting Volcanic Legguards
(52363, 70356, 1.5641, 1, 0, 1, 1), -- 3Ruthless Gladiator's Ornamented Legplates
(52363, 71094, 1.5347, 1, 0, 1, 1), -- 3Immolation Greaves
(52363, 71092, 1.5086, 1, 0, 1, 1), -- 3Immolation Gloves
(52363, 71104, 1.5086, 1, 0, 1, 1), -- 3Obsidian Arborweave Legwraps
(52363, 70354, 1.4727, 1, 0, 1, 1), -- 3Ruthless Gladiator's Ornamented Gloves
(52363, 71064, 1.4498, 1, 0, 1, 1), -- 3Immolation Gauntlets
(52363, 71109, 1.4498, 1, 0, 1, 1), -- 3Obsidian Arborweave Leggings
(52363, 70250, 1.4074, 1, 0, 1, 1), -- 3Ruthless Gladiator's Scaled Gauntlets
(52363, 71299, 1.4009, 1, 0, 1, 1), -- 3Erupting Volcanic Legwraps
(52363, 70392, 1.3160, 1, 0, 1, 1), -- 3Ruthless Gladiator's Medallion of Tenacity
(52363, 70395, 1.2278, 1, 0, 1, 1), -- 3Ruthless Gladiator's Medallion of Tenacity
(52363, 70393, 1.2245, 1, 0, 1, 1), -- 3Ruthless Gladiator's Medallion of Cruelty
(52363, 70391, 1.1592, 1, 0, 1, 1), -- 3Ruthless Gladiator's Medallion of Meditation
(52363, 71099, 1.1560, 1, 0, 1, 1), -- 3Obsidian Arborweave Legguards
(52363, 70267, 1.1494, 1, 0, 1, 1), -- 3Ruthless Gladiator's Ringmail Leggings
(52363, 70390, 1.1494, 1, 0, 1, 1), -- 3Ruthless Gladiator's Medallion of Cruelty
(52363, 70277, 1.1429, 1, 0, 1, 1), -- 3Ruthless Gladiator's Mail Leggings
(52363, 70394, 1.1298, 1, 0, 1, 1), -- 3Ruthless Gladiator's Medallion of Meditation
(52363, 70272, 1.0221, 1, 0, 1, 1), -- 3Ruthless Gladiator's Linked Leggings
(52363, 70286, 0.9960, 1, 0, 1, 1), -- 3Ruthless Gladiator's Kodohide Legguards
(52363, 70265, 0.9829, 1, 0, 1, 1), -- 3Ruthless Gladiator's Ringmail Gauntlets
(52363, 70289, 0.9731, 1, 0, 1, 1), -- 3Ruthless Gladiator's Wyrmhide Gloves
(52363, 70279, 0.9502, 1, 0, 1, 1), -- 3Ruthless Gladiator's Dragonhide Gloves
(52363, 70291, 0.9502, 1, 0, 1, 1), -- 3Ruthless Gladiator's Wyrmhide Legguards
(52363, 70281, 0.9078, 1, 0, 1, 1), -- 3Ruthless Gladiator's Dragonhide Legguards
(52363, 70275, 0.8915, 1, 0, 1, 1), -- 3Ruthless Gladiator's Mail Gauntlets
(52363, 70284, 0.8915, 1, 0, 1, 1), -- 3Ruthless Gladiator's Kodohide Gloves
(52363, 70270, 0.8490, 1, 0, 1, 1); -- 3Ruthless Gladiator's Linked Gauntlets

-- fix for 52363 skinning
-- http://www.wowhead.com/npc=52363
DELETE FROM `skinning_loot_template` WHERE `entry` = 52363;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(52363, 52976, 100.5937, 1, 0, 1, 9); -- 6Savage Leather
UPDATE `creature_template` SET `skinloot` = 52363 WHERE `entry` = 52363;

UPDATE `creature_template` SET `spell1`=103419, `spell2`=103558, `spell3`=103790, `spell4`=103562, `spell5`=102726, `spell6`=103587 WHERE `entry`=54968;
UPDATE `creature_template` SET lootid=54968 WHERE `entry`=54968;
--  http://www.wowhead.com/npc=54968
DELETE FROM `creature_loot_template` WHERE `entry` = 54968;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(54968, 76151, 36.9156, 1, 0, 1, 1), -- 3Cloak of Subtle Light
(54968, 72859, 36.8068, 1, 0, 1, 1), -- 3Dawnslayer Helm
(54968, 71638, -32.5223, 1, 0, 1, 1), -- 4Ornate Weapon
(54968, 72860, 29.9849, 1, 0, 1, 1), -- 3Mandible of the Old Ones
(54968, 72855, 29.7540, 1, 0, 1, 1), -- 3Corrupted Carapace
(54968, 72857, 24.0221, 1, 0, 1, 1), -- 3Leggings of Blinding Speed
(54968, 72856, 23.6558, 1, 0, 1, 1), -- 3Pauldrons of Midnight Whispers
(54968, 22206, 12.9090, 1, 0, 1, 1), -- 5Bouquet of Red Roses
(54968, 77957, 4.9305, 1, 0, 1, 1); -- 6Urgent Twilight Missive

DELETE FROM creature_template WHERE entry=55085;
INSERT INTO `creature_template` VALUES ('55085', '0', '0', '0', '0', '0', '39182', '0', '0', '0', 'Peroth\'arn', '', '', '0', '87', '87', '3', '0', '2387', '2387', '0', '3.6', '2.57143', '1', '1', '4024', '6014', '0', '382', '4.1', '2000', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '72', '0', '55085', '0', '0', '0', '0', '0', '0', '0', '0', '104905', '105521', '105545', '105544', '108141', '105526', '0', '0', '0', '0', '0', '0', 'SmartAI', '0', '3', '1', '145.5', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '894', '1', '0', '0', '1', '', '15595');


DELETE FROM creature_template WHERE entry=54590;
INSERT INTO `creature_template` VALUES ('54590', '0', '0', '0', '0', '0', '39397', '0', '0', '0', 'Arcurion', '', '', '0', '87', '87', '3', '0', '14', '14', '0', '1', '1.14286', '1', '1', '4012', '5041', '0', '267', '4.2', '2000', '0', '1', '0', '2048', '0', '0', '0', '0', '0', '0', '0', '0', '0', '4', '72', '0', '54590', '0', '0', '0', '0', '0', '0', '0', '0', '102582', '102593', '103252', '103904', '104050', '103962', '0', '0', '0', '0', '0', '0', '', '0', '3', '1', '75', '20', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '', '15595');

-- Loot fix for  http://www.wowhead.com/npc=54590
DELETE FROM `creature_loot_template` WHERE `entry` = 54590;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(54590, 77957, 35.5933, 1, 0, 1, 1), -- 6Urgent Twilight Missive
(54590, 72853, 34.3598, 1, 0, 1, 1), -- 3Arcurion Legguards
(54590, 72851, 34.0174, 1, 0, 1, 1), -- 3Chillbane Belt
(54590, 72849, 32.5979, 1, 0, 1, 1), -- 3Wayfinder Boots
(54590, 72854, 22.8317, 1, 0, 1, 1), -- 3Iceward Cloak
(54590, 72850, 22.3555, 1, 0, 1, 1), -- 3Surestride Boots
(54590, 76150, 22.3464, 1, 0, 1, 1); -- 3Evergreen Wristbands

-- fix the invulnerability of  the http://wowhead.com/npc=39425 according with this issue https://github.com/dreamwowcom/ozeneu-434-source/issues/9
UPDATE `creature_template` SET spell4=0 WHERE `spell4`=74938;
