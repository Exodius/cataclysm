-- Elemental Bonds questline
UPDATE quest_template SET NextQuestIdChain=29326, ExclusiveGroup=29440, NextQuestid=29326 WHERE id=29440;
UPDATE quest_template SET NextQuestIdChain=29326, ExclusiveGroup=29440, NextQuestid=29326 WHERE id=29439;
UPDATE quest_template SET NextQuestIdChain=29437 WHERE id=29326;
UPDATE quest_template SET PrevQuestId=29326 WHERE id=29437;

UPDATE quest_template SET NextQuestIdChain=29335 WHERE id=29326;
UPDATE quest_template SET NextQuestIdChain=29327, PrevQuestId=29326 WHERE id=29335;
UPDATE quest_template SET NextQuestIdChain=29336, PrevQuestId=29335 WHERE id=29327;
UPDATE quest_template SET NextQuestIdChain=29328, PrevQuestId=29327 WHERE id=29336;
UPDATE quest_template SET PrevQuestId=29336 WHERE id=29328;
 
UPDATE quest_template SET NextQuestIdChain=29337 WHERE id=29328;
UPDATE quest_template SET NextQuestIdChain=29329, PrevQuestId=29328 WHERE id=29337;
UPDATE quest_template SET NextQuestIdChain=29338, PrevQuestId=29337 WHERE id=29329;
UPDATE quest_template SET NextQuestIdChain=29330, PrevQuestId=29329 WHERE id=29338;
UPDATE quest_template SET PrevQuestId=29338 WHERE id=29330;

UPDATE quest_template SET NextQuestIdChain=29331 WHERE id=29330;
UPDATE quest_template SET PrevQuestId=29330 WHERE id=29331;

-- Invasion of the Firelands questline

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(19,20) AND SourceEntry IN(29387,29388) AND ConditionTypeOrReference=8 AND ConditionValue1 IN(29391,29390);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`) VALUES
(20,0,29387,0,1,8,0,29391,0,0,0,0),
(20,0,29387,0,2,8,0,29390,0,0,0,0),
(20,0,29388,0,1,8,0,29391,0,0,0,0),
(20,0,29388,0,2,8,0,29390,0,0,0,0),
(19,0,29387,0,1,8,0,29391,0,0,0,0),
(19,0,29387,0,2,8,0,29390,0,0,0,0),
(19,0,29388,0,1,8,0,29391,0,0,0,0),
(19,0,29388,0,2,8,0,29390,0,0,0,0);


UPDATE quest_template SET NextQuestIdChain=29145, ExclusiveGroup=29387, NextQuestid=29145 WHERE id=29387;
UPDATE quest_template SET NextQuestIdChain=29145, ExclusiveGroup=29387, NextQuestid=29145 WHERE id=29388;
UPDATE quest_template SET NextQuestIdChain=29195 WHERE id=29145;
UPDATE quest_template SET NextQuestIdChain=29196, PrevQuestId=29145 WHERE id=29195;
UPDATE quest_template SET NextQuestIdChain=29197, PrevQuestId=29195 WHERE id=29196;
UPDATE quest_template SET PrevQuestId=29196 WHERE id=29197;

UPDATE quest_template SET NextQuestIdChain=29198 WHERE id=29197;
UPDATE quest_template SET PrevQuestId=29197 WHERE id=29198;

UPDATE quest_template SET NextQuestIdChain=29199 WHERE id=29198;
UPDATE quest_template SET NextQuestIdChain=29200, PrevQuestId=29198 WHERE id=29199;
UPDATE quest_template SET NextQuestIdChain=29201, PrevQuestId=29199 WHERE id=29200;
UPDATE quest_template SET PrevQuestId=29200 WHERE id=29201;

UPDATE quest_template SET NextQuestIdChain=29284 WHERE id=29283;
UPDATE quest_template SET PrevQuestId=29283 WHERE id=29284;

UPDATE quest_template SET NextQuestIdChain=29281 WHERE id=29201;
UPDATE quest_template SET NextQuestIdChain=29282, PrevQuestId=29201 WHERE id=29281;
UPDATE quest_template SET PrevQuestId=29281 WHERE id=29282;

UPDATE quest_template SET PrevQuestId=29281 WHERE id=29263;
UPDATE quest_template SET PrevQuestId=29281 WHERE id=29278;
UPDATE quest_template SET PrevQuestId=29281 WHERE id=29295;
UPDATE quest_template SET PrevQuestId=29281 WHERE id=29297;

UPDATE quest_template SET NextQuestIdChain=29280 WHERE id=29279;
UPDATE quest_template SET NextQuestIdChain=29203, PrevQuestId=29279 WHERE id=29280;
UPDATE quest_template SET NextQuestIdChain=29298, PrevQuestId=29280 WHERE id=29203;
UPDATE quest_template SET NextQuestIdChain=29302, PrevQuestId=29203 WHERE id=29298;
UPDATE quest_template SET PrevQuestId=29298 WHERE id=29302;

UPDATE quest_template SET NextQuestIdChain=29303 WHERE id=29302;
UPDATE quest_template SET NextQuestIdChain=29310, PrevQuestId=29302 WHERE id=29303;
UPDATE quest_template SET NextQuestIdChain=29311, PrevQuestId=29303 WHERE id=29310;
UPDATE quest_template SET PrevQuestId=29310 WHERE id=29311;