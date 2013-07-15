-- creature corect hp for 45294:
UPDATE creature_template SET health_mod=3.231 WHERE entry=45294;

-- add missing items for http://www.wowhead.com/npc=44125
UPDATE creature_template SET npcflag=128 WHERE entry=44125;
DELETE FROM npc_vendor WHERE entry=44125;
INSERT INTO `npc_vendor` VALUES ('44125', '0', '60379', '0', '0', '0', '1');
INSERT INTO `npc_vendor` VALUES ('44125', '0', '60376', '0', '0', '0', '1');
INSERT INTO `npc_vendor` VALUES ('44125', '0', '60377', '0', '0', '0', '1');
INSERT INTO `npc_vendor` VALUES ('44125', '0', '60378', '0', '0', '0', '1');
INSERT INTO `npc_vendor` VALUES ('44125', '0', '60375', '0', '0', '0', '1');

-- add missing items from vendor http://www.wowhead.com/npc=36717
-- DELETE FROM npc_vendor WHERE entry=36717;
INSERT INTO `npc_vendor` VALUES ('36717', '0', '2491', '0', '0', '0', '1');
INSERT INTO `npc_vendor` VALUES ('36717', '0', '2492', '0', '0', '0', '1');
INSERT INTO `npc_vendor` VALUES ('36717', '0', '2493', '0', '0', '0', '1');
INSERT INTO `npc_vendor` VALUES ('36717', '0', '2495', '0', '0', '0', '1');
INSERT INTO `npc_vendor` VALUES ('36717', '0', '2489', '0', '0', '0', '1');
INSERT INTO `npc_vendor` VALUES ('36717', '0', '2490', '0', '0', '0', '1');
INSERT INTO `npc_vendor` VALUES ('36717', '0', '2494', '0', '0', '0', '1');
INSERT INTO `npc_vendor` VALUES ('36717', '0', '2488', '0', '0', '0', '1');
