-- Fix server crash--
DELETE FROM npc_vendor WHERE entry = 52029 and item = 395;

-- Magmaw "Lava parasite" NPC faction issue--
UPDATE creature_template SET faction_A = 14 WHERE entry = 42321;
UPDATE creature_template SET faction_H = 14 WHERE entry = 42321;

-- Sharptalon Eagle faction issue--
UPDATE creature_template SET faction_A = 16 WHERE entry = 42321;
UPDATE creature_template SET faction_H = 16 WHERE entry = 42321;

-- DK quest chain adjustments, maybe some rows not affected but this make it work perfectly so apply all sql--

UPDATE quest_template SET method = 0 where Id = 12641; -- the fucking eye is slower than hell, also its a really boring quest--

DELETE FROM creature_involvedrelation WHERE id = 28357 and quest = 12636; -- duplicated id in different npc for same quest--

UPDATE quest_template SET PrevQuestId = 12670 WHERE Id = 12678;
UPDATE quest_template SET NextQuestId = 12680 WHERE Id = 12678;
UPDATE quest_template SET PrevQuestId = 12678 WHERE Id = 12733;
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 12733;
UPDATE quest_template SET PrevQuestId = 12678 WHERE Id = 12679;
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 12679;
UPDATE quest_template SET PrevQuestId = 12678 WHERE Id = 12680;
UPDATE quest_template SET NextQuestId = 12687 WHERE Id = 12680;
UPDATE quest_template SET PrevQuestId = 12680 WHERE Id = 12687;  
UPDATE quest_template SET NextQuestId = 12697 WHERE Id = 12687; 
UPDATE quest_template SET PrevQuestId = 12687 WHERE Id = 12697;


DELETE FROM creature WHERE guid = 129683;
DELETE FROM creature WHERE guid = 129682;
DELETE FROM creature WHERE guid = 129769;
DELETE FROM creature WHERE guid = 130001;
DELETE FROM creature WHERE guid = 130002;
DELETE FROM creature WHERE guid = 129664;

UPDATE quest_template SET method = 0 where Id = 12748;
UPDATE quest_template SET method = 0 where Id = 12747;
UPDATE quest_template SET method = 0 where Id = 12749;
UPDATE quest_template SET method = 0 where Id = 12750;
UPDATE quest_template SET method = 0 where Id = 28650;
UPDATE quest_template SET method = 0 where Id = 12739;
UPDATE quest_template SET method = 0 where Id = 28649;
UPDATE quest_template SET method = 0 where Id = 12743;
UPDATE quest_template SET method = 0 where Id = 12744;
UPDATE quest_template SET method = 0 where Id = 12745;
UPDATE quest_template SET method = 0 where Id = 12746;
UPDATE quest_template SET method = 0 where Id = 12742;

DELETE FROM npc_vendor WHERE entry = 52033 and item = 395; -- rong loot
DELETE FROM npc_vendor WHERE entry = 52028 and item = 392; -- rong loot
