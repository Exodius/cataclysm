--Fix Quest loot The Yeti Next Door for creature Frosthorn Ram
UPDATE creature_loot_template SET ChanceOrQuestChance=-100 WHERE item=33352;
