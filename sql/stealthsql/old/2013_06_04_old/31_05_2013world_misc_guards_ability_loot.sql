-- http://www.wowhead.com/npc=51346
UPDATE `creature_template` SET `gossip_menu_id` = '1951' WHERE `entry` = 51346;
-- http://www.wowhead.com/npc=51348
UPDATE `creature_template` SET `gossip_menu_id` = '435' WHERE `entry` = 51348;
-- http://www.wowhead.com/npc=68
UPDATE `creature_template` SET `pickpocketloot` = 68, `spell1` = 95826 WHERE `entry` = 68;
--  http://old.wowhead.com/npc=68
DELETE FROM `pickpocketing_loot_template` WHERE `entry` = 68;
INSERT INTO `pickpocketing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(68, 5432, 35.1351, 1, 0, 1, 1), -- 7Hickory Pipe
(68, 16885, 16.2162, 1, 0, 1, 1), -- 6Heavy Junkbox
(68, 8953, 8.1081, 1, 0, 1, 1), -- 6Deep Fried Plantains
(68, 8950, 5.4054, 1, 0, 1, 1), -- 6Homemade Cherry Pie
(68, 3928, 2.7027, 1, 0, 1, 1), -- 6Superior Healing Potion
(68, 8932, 2.7027, 1, 0, 1, 1); -- 6Alterac Swiss
-- http://www.wowhead.com/npc=51348
UPDATE `creature_template` SET  `spell1` = 95826, `spell2` = 71507, `spell3` = 96161  WHERE `entry` = 51348;
-- http://www.wowhead.com/npc=3296
UPDATE `creature_template` SET  `spell1` = 40505, `spell2` = 71507, `spell3` = 95826   WHERE `entry` = 3296;
-- http://www.wowhead.com/npc=51346
UPDATE `creature_template` SET `lootid` = 51346, `spell1` = 95826 WHERE `entry` = 51346;
-- http://www.wowhead.com/npc=51346
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(51346, 6291, 50, 1, 0, 1, 1), -- Raw Brilliant Smallfish
(51346, 6289, 50, 1, 0, 1, 1); -- Raw Longjaw Mud Snapper
