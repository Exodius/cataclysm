-- http://www.wowhead.com/npc=49997
DELETE FROM creature WHERE id=49997;
INSERT INTO `creature` VALUES ('306719', '49997', '1', '0', '0', '1', '1', '0', '1', '-843.127', '-4934.9', '20.9852', '0.489636', '300', '0', '0', '610', '0', '0', '0', '0', '0');
UPDATE `creature_template` SET `spell1` = 79833 WHERE `entry` = 49997;
