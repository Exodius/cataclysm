-- Draenei starting zone questline

-- Questchain You Survived! line
UPDATE quest_template SET NextQuestIdChain=9280 WHERE id=9279;
UPDATE quest_template SET NextQuestIdChain=9409, PrevQuestId=9279 WHERE id=9280;
UPDATE quest_template SET NextQuestIdChain=9283, PrevQuestId=9280 WHERE id=9409;
UPDATE quest_template SET PrevQuestId=9409 WHERE id=9283;

-- Botanist Taerix line
UPDATE quest_template SET NextQuestIdChain=10302 WHERE id=9371;
UPDATE quest_template SET NextQuestIdChain=9293, PrevQuestId=9371 WHERE id=10302;
UPDATE quest_template SET PrevQuestId=10302 WHERE id=9293;
-- sidequest Botanical Legwork
UPDATE quest_template SET NextQuestIdChain=9799 WHERE id=9293;
UPDATE quest_template SET PrevQuestId=9293 WHERE id=9799;
-- questline continues
UPDATE quest_template SET NextQuestIdChain=9294 WHERE id=9293;
UPDATE quest_template SET PrevQuestId=9293 WHERE id=9294;
UPDATE quest_template SET NextQuestIdChain=10304 WHERE id=9294;
UPDATE quest_template SET NextQuestIdChain=9303, PrevQuestId=9294 WHERE id=10304;
UPDATE quest_template SET NextQuestIdChain=9309, PrevQuestId=10304 WHERE id=9303;
UPDATE quest_template SET NextQuestIdChain=10303, PrevQuestId=9303 WHERE id=9309;
UPDATE quest_template SET PrevQuestId=9309 WHERE id=10303;
-- sidequest Spare Parts
UPDATE quest_template SET NextQuestIdChain=9305 WHERE id=9303;
UPDATE quest_template SET PrevQuestId=9303 WHERE id=9305;
-- questline continues
UPDATE quest_template SET NextQuestIdChain=9309 WHERE id=9303;
UPDATE quest_template SET NextQuestIdChain=10303, PrevQuestId=9303 WHERE id=9309;
UPDATE quest_template SET NextQuestIdChain=9311, PrevQuestId=9309 WHERE id=10303;
UPDATE quest_template SET PrevQuestId=10303 WHERE id=9311;
-- sidequest Blood Elf Plans
UPDATE quest_template SET NextQuestIdChain=9798 WHERE id=9311;
UPDATE quest_template SET PrevQuestId=9311 WHERE id=9798;
-- questline continues
UPDATE quest_template SET NextQuestIdChain=9312 WHERE id=9311;
UPDATE quest_template SET NextQuestIdChain=9313, PrevQuestId=9311 WHERE id=9312;
UPDATE quest_template SET PrevQuestId=9312 WHERE id=9313;
-- sidequest Word from Azure Watch
UPDATE quest_template SET NextQuestIdChain=9314 WHERE id=9313;
UPDATE quest_template SET PrevQuestId=9313 WHERE id=9314;