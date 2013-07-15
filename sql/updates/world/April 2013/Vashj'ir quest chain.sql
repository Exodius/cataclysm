-- Vashj'ir - Kelp'thar Forest quests

-- Seafarer's Tomb/Legion's End
-- Alliance
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28825;
UPDATE `quest_template` SET `PrevQuestId` = 28825, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28826;
UPDATE `quest_template` SET `PrevQuestId` = 28826, `NextQuestId` = 14482, `ExclusiveGroup` = 0 WHERE `Id` = 14481;
UPDATE `quest_template` SET `PrevQuestId` = 28826, `NextQuestId` = 14482, `ExclusiveGroup` = 0 WHERE `Id` = 27724;
UPDATE `quest_template` SET `PrevQuestId` = 28826, `NextQuestId` = 14482, `ExclusiveGroup` = 0 WHERE `Id` = 28827;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 14482;
UPDATE `quest_template` SET `PrevQuestId` = 14482, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 24432;
UPDATE `quest_template` SET `PrevQuestId` = 24432, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25281;
UPDATE `quest_template` SET `PrevQuestId` = 25281, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25405;
UPDATE `quest_template` SET `PrevQuestId` = 25405, `NextQuestId` = 25545, `ExclusiveGroup` = 0 WHERE `Id` = 25357;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 25545, `ExclusiveGroup` = 0 WHERE `Id` = 25546;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 25547, `ExclusiveGroup` = 0 WHERE `Id` = 25545;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 25547, `ExclusiveGroup` = 0 WHERE `Id` = 25564;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25547;
UPDATE `quest_template` SET `PrevQuestId` = 25547, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25558;
-- Horde
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28790;
UPDATE `quest_template` SET `PrevQuestId` = 28790, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28805;
UPDATE `quest_template` SET `PrevQuestId` = 28805, `NextQuestId` = 25924, `ExclusiveGroup` = 0 WHERE `Id` = 27718;
UPDATE `quest_template` SET `PrevQuestId` = 28805, `NextQuestId` = 25924, `ExclusiveGroup` = 0 WHERE `Id` = 28816;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25924;
UPDATE `quest_template` SET `PrevQuestId` = 25924, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25929;
UPDATE `quest_template` SET `PrevQuestId` = 25929, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25936;
UPDATE `quest_template` SET `PrevQuestId` = 25936, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25941;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 25942, `ExclusiveGroup` = 0 WHERE `Id` = 27668;
UPDATE `quest_template` SET `PrevQuestId` = 25941, `NextQuestId` = 25944, `ExclusiveGroup` = 0 WHERE `Id` = 25942;
UPDATE `quest_template` SET `PrevQuestId` = 27668, `NextQuestId` = 25944, `ExclusiveGroup` = 0 WHERE `Id` = 25943;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 25944, `ExclusiveGroup` = 0 WHERE `Id` = 25946;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 25948, `ExclusiveGroup` = 0 WHERE `Id` = 25944;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 25948, `ExclusiveGroup` = 0 WHERE `Id` = 25947;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25948;
UPDATE `quest_template` SET `PrevQuestId` = 25948, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25949;



-- Shallow's End and Smuggler's Scar
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25477;
UPDATE `quest_template` SET `PrevQuestId` = 25477, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25371;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25477', '1', '8', '25558');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25477', '1', '8', '25558');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25477', '2', '8', '25949');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25477', '2', '8', '25949');
UPDATE `quest_template` SET `PrevQuestId` = 25371, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27685;
UPDATE `quest_template` SET `PrevQuestId` = 27685, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25587;
UPDATE `quest_template` SET `PrevQuestId` = 25587, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25598;
UPDATE `quest_template` SET `PrevQuestId` = 25587, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25377;
UPDATE `quest_template` SET `PrevQuestId` = 25587, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25388;
UPDATE `quest_template` SET `PrevQuestId` = 25598, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25384;
UPDATE `quest_template` SET `PrevQuestId` = 25384, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25602;
UPDATE `quest_template` SET `PrevQuestId` = 25598, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25390;
UPDATE `quest_template` SET `PrevQuestId` = 25598, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25389;
UPDATE `quest_template` SET `PrevQuestId` = 25602, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25459;
-- Budd's Dig
UPDATE `quest_template` SET `PrevQuestId` = 25602, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25651;
UPDATE `quest_template` SET `PrevQuestId` = 25651, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25657;
UPDATE `quest_template` SET `PrevQuestId` = 25657, `NextQuestId` = 25670, `ExclusiveGroup` = 0 WHERE `Id` = 25737;
UPDATE `quest_template` SET `PrevQuestId` = 25657, `NextQuestId` = 25670, `ExclusiveGroup` = 0 WHERE `Id` = 27699;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 25732, `ExclusiveGroup` = 25670 WHERE `Id` = 25670;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 25732, `ExclusiveGroup` = 25670 WHERE `Id` = 25738;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 25743, `ExclusiveGroup` = 25732 WHERE `Id` = 25732;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 25743, `ExclusiveGroup` = 25732 WHERE `Id` = 25742;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25743;
-- The Clutch
UPDATE `quest_template` SET `PrevQuestId` = 25459, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25638;
UPDATE `quest_template` SET `PrevQuestId` = 25638, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25794;
-- Alliance
UPDATE `quest_template` SET `PrevQuestId` = 25794, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25812;
UPDATE `quest_template` SET `PrevQuestId` = 25812, `NextQuestId` = 25887, `ExclusiveGroup` = 0 WHERE `Id` = 25824;
UPDATE `quest_template` SET `PrevQuestId` = 25887 WHERE `Id` = 25888;
UPDATE `quest_template` SET `PrevQuestId` = 25887 WHERE `Id` = 25885;
-- Horde
UPDATE `quest_template` SET `PrevQuestId` = 25794, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26000;
UPDATE `quest_template` SET `PrevQuestId` = 26000, `NextQuestId` = 25887, `ExclusiveGroup` = 0 WHERE `Id` = 26007;
UPDATE `quest_template` SET `PrevQuestId` = 25887 WHERE `Id` = 26008;
UPDATE `quest_template` SET `PrevQuestId` = 25887 WHERE `Id` = 26040;
-- Both
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25887;
UPDATE `quest_template` SET `PrevQuestId` = 25887, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25884;
UPDATE `quest_template` SET `PrevQuestId` = 25884, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27708;
UPDATE `quest_template` SET `PrevQuestId` = 27708, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25471;
UPDATE `quest_template` SET `PrevQuestId` = 25471, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25334;
UPDATE `quest_template` SET `PrevQuestId` = 25887 WHERE `Id` = 25883;


-- Vashj'ir - Shimmering Expanse quests
-- Silver Tide Hollow
UPDATE `quest_template` SET `PrevQuestId` = 25334 WHERE `Id` = 25164;
UPDATE `quest_template` SET `PrevQuestId` = 25164, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25221;
UPDATE `quest_template` SET `PrevQuestId` = 25221, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25222;
UPDATE `quest_template` SET `PrevQuestId` = 25222, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25216;
UPDATE `quest_template` SET `PrevQuestId` = 25216, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25218;
UPDATE `quest_template` SET `PrevQuestId` = 25218, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25217;
UPDATE `quest_template` SET `PrevQuestId` = 25217, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25456;
UPDATE `quest_template` SET `PrevQuestId` = 25456, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25359;
UPDATE `quest_template` SET `PrevQuestId` = 25222, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25219;
UPDATE `quest_template` SET `PrevQuestId` = 25222, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25220;
UPDATE `quest_template` SET `PrevQuestId` = 25222, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25215;
UPDATE `quest_template` SET `PrevQuestId` = 25216 WHERE `Id` = 25360;
UPDATE `quest_template` SET `PrevQuestId` = 25359 WHERE `Id` = 25441;
UPDATE `quest_template` SET `PrevQuestId` = 25359, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25439;
UPDATE `quest_template` SET `PrevQuestId` = 25439, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25440;

-- Nespirah
UPDATE `quest_template` SET `PrevQuestId` = 25440, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25442;
UPDATE `quest_template` SET `PrevQuestId` = 25442, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25890;
UPDATE `quest_template` SET `PrevQuestId` = 25890, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25900;

UPDATE `quest_template` SET `PrevQuestId` = 25900, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25907;
UPDATE `quest_template` SET `PrevQuestId` = 25900, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25908;


-- Alliance
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25989', '1', '8', '25907');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25989', '1', '8', '25907');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25989', '2', '8', '25908');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25989', '2', '8', '25908');
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25989;
UPDATE `quest_template` SET `PrevQuestId` = 25989, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25990;
UPDATE `quest_template` SET `PrevQuestId` = 25990, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25991;
UPDATE `quest_template` SET `PrevQuestId` = 25991, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25993;
UPDATE `quest_template` SET `PrevQuestId` = 25917, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25918;
UPDATE `quest_template` SET `PrevQuestId` = 25917, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25920;


UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25921;
UPDATE `quest_template` SET `PrevQuestId` = 25921, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25922;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25921', '8', '25919');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25921', '8', '25919');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25921', '8', '25918');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25921', '8', '25918');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25921', '8', '25920');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25921', '8', '25920');
	
	
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27393;
UPDATE `quest_template` SET `PrevQuestId` = 27393, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25583;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25583', '8', '25580');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25583', '8', '25579');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25583', '8', '25582');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25583', '8', '25580');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25583', '8', '25579');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25583', '8', '25582');

-- Horde
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25909', '1', '8', '25907');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25909', '1', '8', '25907');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25909', '2', '8', '25908');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25909', '2', '8', '25908');
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25909;
UPDATE `quest_template` SET `PrevQuestId` = 25909, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25916;
UPDATE `quest_template` SET `PrevQuestId` = 25916, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25917;
UPDATE `quest_template` SET `PrevQuestId` = 25917, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25919;
UPDATE `quest_template` SET `PrevQuestId` = 25991, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25992;
UPDATE `quest_template` SET `PrevQuestId` = 25991, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25994;

UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25995;
UPDATE `quest_template` SET `PrevQuestId` = 25995, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25996;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25995', '8', '25993');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25995', '8', '25993');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25995', '8', '25992');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25995', '8', '25992');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25995', '8', '25994');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25995', '8', '25994');

-- Ruins of Vashj'ir
-- Both
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25619;
UPDATE `quest_template` SET `PrevQuestId` = 25619, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25620;
UPDATE `quest_template` SET `PrevQuestId` = 25620, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25637;
UPDATE `quest_template` SET `PrevQuestId` = 25637, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25659;

delete from conditions where sourceentry=25619 and SourceTypeOrReferenceId=19;
delete from conditions where sourceentry=25619 and SourceTypeOrReferenceId=20;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25619', '1', '8', '25760');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25619', '1', '8', '25760');

delete from conditions where sourceentry=25619 and SourceTypeOrReferenceId=19;
delete from conditions where sourceentry=25619 and SourceTypeOrReferenceId=20;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25619', '2', '8', '25957');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25619', '2', '8', '25957');

UPDATE `quest_template` SET `PrevQuestId` = 25620 WHERE `Id` = 25658;

-- Alliance
UPDATE `quest_template` SET `PrevQuestId` = 25922 WHERE `Id` = 25536;

UPDATE `quest_template` SET `PrevQuestId` = 25922, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25535;
UPDATE `quest_template` SET `PrevQuestId` = 25535, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25539;

UPDATE `quest_template` SET `PrevQuestId` = 25539, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25537;
UPDATE `quest_template` SET `PrevQuestId` = 25537, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25538;
UPDATE `quest_template` SET `PrevQuestId` = 25538 WHERE `Id` = 25540;

UPDATE `quest_template` SET `PrevQuestId` = 25540 WHERE `Id` = 25580;

UPDATE `quest_template` SET `PrevQuestId` = 25540 WHERE `Id` = 25579;

UPDATE `quest_template` SET `PrevQuestId` = 25540 WHERE `Id` = 25582;
UPDATE `quest_template` SET `PrevQuestId` = 25540 WHERE `Id` = 25581; -- Side Quest
	UPDATE `quest_template` SET `PrevQuestId` = 25583, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25760;
UPDATE `quest_template` SET `PrevQuestId` = 25760, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25747;
UPDATE `quest_template` SET `PrevQuestId` = 25747, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25748;

-- Horde
UPDATE `quest_template` SET `PrevQuestId` = 25996 WHERE id in (25592,25593,25595,25594);
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25953', '8', '25592');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25953', '8', '25593');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25953', '8', '25595');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25953', '8', '25594');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25953', '8', '25592');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25953', '8', '25593');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25953', '8', '25595');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25953', '8', '25594');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25952', '8', '25592');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25952', '8', '25593');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25952', '8', '25595');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25952', '8', '25594');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25952', '8', '25592');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25952', '8', '25593');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25952', '8', '25595');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25952', '8', '25594');	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25955', '8', '25592');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25955', '8', '25593');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25955', '8', '25595');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25955', '8', '25594');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25955', '8', '25592');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25955', '8', '25593');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25955', '8', '25595');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25955', '8', '25594');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25954', '8', '25592');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25954', '8', '25593');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25954', '8', '25595');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25954', '8', '25594');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25954', '8', '25592');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25954', '8', '25593');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25954', '8', '25595');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25954', '8', '25594');
		UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27394;
	UPDATE `quest_template` SET `PrevQuestId` = 27394, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25956;	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25956', '8', '25953');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25956', '8', '25952');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25956', '8', '25955');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25956', '8', '25953');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25956', '8', '25952');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25956', '8', '25955');	
		UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25957;
UPDATE `quest_template` SET `PrevQuestId` = 25957, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25958;
UPDATE `quest_template` SET `PrevQuestId` = 25958, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25959;	
	
	
	-- Ruins of Vashj'ir quest chain Part2

-- Both	
delete from conditions where sourceentry=25858 and SourceTypeOrReferenceId=19;
delete from conditions where sourceentry=25858 and SourceTypeOrReferenceId=20;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25858', '1', '8', '25755');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25858', '1', '8', '25755');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25858', '2', '8', '25966');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25858', '2', '8', '25966');
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25858;
UPDATE `quest_template` SET `PrevQuestId` = 25858, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25859;
UPDATE `quest_template` SET `PrevQuestId` = 25858 WHERE `Id` = 25861;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25862', '8', '25861');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25862', '8', '25859');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25862', '8', '25858');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25862', '8', '25861');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25862', '8', '25859');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25862', '8', '25858');
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25862;
UPDATE `quest_template` SET `PrevQuestId` = 25862, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25863;
UPDATE `quest_template` SET `PrevQuestId` = 25863 WHERE `Id` = 26191;	
-- Alliance
UPDATE `quest_template` SET `PrevQuestId` = 25747 WHERE `Id` = 25749;
UPDATE `quest_template` SET `PrevQuestId` = 25747 WHERE `Id` = 25751;
UPDATE `quest_template` SET `PrevQuestId` = 25747 WHERE `Id` = 27716;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25752', '8', '25749');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25752', '8', '25751');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25752', '8', '25748');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25752', '8', '25749');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25752', '8', '25751');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25752', '8', '25748');	
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25752;
UPDATE `quest_template` SET `PrevQuestId` = 25752, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25754;
UPDATE `quest_template` SET `PrevQuestId` = 25752 WHERE `Id` = 25753;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25755', '8', '25753');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25755', '8', '25754');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25755', '8', '25753');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25755', '8', '25754');
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25755;
UPDATE `quest_template` SET `PrevQuestId` = 25755, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25892;
UPDATE `quest_template` SET `PrevQuestId` = 25892, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25893;
-- Horde
UPDATE `quest_template` SET `PrevQuestId` = 25958 WHERE `Id` = 25960;
UPDATE `quest_template` SET `PrevQuestId` = 25958 WHERE `Id` = 25962;
UPDATE `quest_template` SET `PrevQuestId` = 25958 WHERE `Id` = 27717;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25963', '8', '25960');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25963', '8', '25962');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25963', '8', '25959');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25963', '8', '25960');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25963', '8', '25962');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25963', '8', '25959');	
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25963;
UPDATE `quest_template` SET `PrevQuestId` = 25963, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25965;
UPDATE `quest_template` SET `PrevQuestId` = 25963 WHERE `Id` = 25964;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25966', '8', '25964');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25966', '8', '25965');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25966', '8', '25964');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25966', '8', '25965');
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25966;
UPDATE `quest_template` SET `PrevQuestId` = 25966, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25967;
UPDATE `quest_template` SET `PrevQuestId` = 25967, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25968;


-- Ruins of Vashj'ir quest chain Part3

-- Both
delete from conditions where sourceentry=25896 and SourceTypeOrReferenceId=19;
delete from conditions where sourceentry=25896 and SourceTypeOrReferenceId=20;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25896', '1', '8', '25626');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25896', '1', '8', '25626');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25896', '2', '8', '26135');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25896', '2', '8', '26135');
UPDATE `quest_template` SET `PrevQuestId` = 25896 WHERE `Id` = 25629;
UPDATE `quest_template` SET `PrevQuestId` = 25629, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25860;
UPDATE `quest_template` SET `PrevQuestId` = 25860, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25951;

-- Alliance
UPDATE `quest_template` SET `PrevQuestId` = 25893 WHERE `Id` = 25895;
UPDATE `quest_template` SET `PrevQuestId` = 25893 WHERE `Id` = 25897;
UPDATE `quest_template` SET `PrevQuestId` = 25893 WHERE `Id` = 25894;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25898', '8', '25895');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25898', '8', '25897');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25898', '8', '25894');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25898', '8', '25895');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25898', '8', '25897');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25898', '8', '25894');

UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25898;
UPDATE `quest_template` SET `PrevQuestId` = 25898, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25911;

UPDATE `quest_template` SET `PrevQuestId` = 25911, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25626;
UPDATE `quest_template` SET `PrevQuestId` = 25626, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26005;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26005', '8', '25896');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26005', '8', '25629');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26005', '8', '25860');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26005', '8', '25951');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26005', '8', '25896');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26005', '8', '25629');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26005', '8', '25860');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26005', '8', '25951');	

-- Horde
UPDATE `quest_template` SET `PrevQuestId` = 25968 WHERE `Id` = 25970;
UPDATE `quest_template` SET `PrevQuestId` = 25968 WHERE `Id` = 25971;
UPDATE `quest_template` SET `PrevQuestId` = 25968 WHERE `Id` = 25969;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25972', '8', '25970');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25972', '8', '25971');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25972', '8', '25969');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25972', '8', '25970');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25972', '8', '25971');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25972', '8', '25969');
	
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25972;
UPDATE `quest_template` SET `PrevQuestId` = 25972, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25973;

UPDATE `quest_template` SET `PrevQuestId` = 25973, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26135;
UPDATE `quest_template` SET `PrevQuestId` = 26135, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26006;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26006', '8', '25896');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26006', '8', '25629');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26006', '8', '25860');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26006', '8', '25951');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26006', '8', '25896');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26006', '8', '25629');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26006', '8', '25860');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26006', '8', '25951');
	
	
	
	
	
	
	
-- Vashj'ir - Abyssal Depths quests

-- Alliance
UPDATE `quest_template` SET `PrevQuestId` = 26005 WHERE `Id` = 26219;
UPDATE `quest_template` SET `PrevQuestId` = 26219, `NextQuestId` = 26014, `ExclusiveGroup` = -26106 WHERE `Id` = 26121;
UPDATE `quest_template` SET `PrevQuestId` = 26219, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26103;
UPDATE `quest_template` SET `PrevQuestId` = 26103, `NextQuestId` = 26014, `ExclusiveGroup` = -26106 WHERE `Id` = 26106;


UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26014;
UPDATE `quest_template` SET `PrevQuestId` = 26014, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26015;

UPDATE `quest_template` SET `PrevQuestId` = 26015 WHERE `Id` = 26017;
UPDATE `quest_template` SET `PrevQuestId` = 26015 WHERE `Id` = 26018;


UPDATE `quest_template` SET `PrevQuestId` = 26015, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26019;
UPDATE `quest_template` SET `PrevQuestId` = 26019, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26021;



	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26080', '8', '26017');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26080', '8', '26018');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26080', '8', '26017');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26080', '8', '26018');
UPDATE `quest_template` SET `PrevQuestId` = 26080 WHERE `Id` in (25975,25950,25977);

UPDATE `quest_template` SET `PrevQuestId` = 26080, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25981;
UPDATE `quest_template` SET `PrevQuestId` = 25981, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25987;
UPDATE `quest_template` SET `PrevQuestId` = 25987, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25983;
UPDATE `quest_template` SET `PrevQuestId` = 26140 WHERE `Id` = 26144;
UPDATE `quest_template` SET `PrevQuestId` = 26143 WHERE `Id` = 26181;
UPDATE `quest_template` SET `PrevQuestId` = 26181 WHERE `Id` = 26193;

-- Horde
UPDATE `quest_template` SET `PrevQuestId` = 26006 WHERE `Id` = 26221;

UPDATE `quest_template` SET `PrevQuestId` = 26221, `NextQuestId` = 26086, `ExclusiveGroup` = -26122 WHERE `Id` = 26125;

UPDATE `quest_template` SET `PrevQuestId` = 26221, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26122;
UPDATE `quest_template` SET `PrevQuestId` = 26122, `NextQuestId` = 26086, `ExclusiveGroup` = -26122 WHERE `Id` = 26126;

UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26086;
UPDATE `quest_template` SET `PrevQuestId` = 26086, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26087;

UPDATE `quest_template` SET `PrevQuestId` = 26087 WHERE `Id` = 26088;
UPDATE `quest_template` SET `PrevQuestId` = 26087 WHERE `Id` = 26089;

UPDATE `quest_template` SET `PrevQuestId` = 26087, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26090;
UPDATE `quest_template` SET `PrevQuestId` = 26090, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26091;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26092', '8', '26088');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26092', '8', '26089');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26092', '8', '26088');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26092', '8', '26089');
UPDATE `quest_template` SET `PrevQuestId` = 26092 WHERE `Id` in (25976,25974,25980);

UPDATE `quest_template` SET `PrevQuestId` = 26092, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25982;
UPDATE `quest_template` SET `PrevQuestId` = 25982, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25988;
UPDATE `quest_template` SET `PrevQuestId` = 25988, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 25984;
UPDATE `quest_template` SET `PrevQuestId` = 25984, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26071;
UPDATE `quest_template` SET `PrevQuestId` = 26140 WHERE `Id` = 26149;
UPDATE `quest_template` SET `PrevQuestId` = 26143 WHERE `Id` = 26182;
UPDATE `quest_template` SET `PrevQuestId` = 26182 WHERE `Id` = 26194;
-- Both
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26096', '1', '8', '25983');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26096', '1', '8', '25983');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26096', '2', '8', '25984');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26096', '2', '8', '25984');

REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26072', '1', '8', '25983');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26072', '1', '8', '25983');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26072', '2', '8', '25984');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26072', '2', '8', '25984');

REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26070', '1', '8', '25983');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26070', '1', '8', '25983');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26070', '2', '8', '25984');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26070', '2', '8', '25984');

REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26065', '1', '8', '25983');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26065', '1', '8', '25983');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26065', '2', '8', '25984');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26065', '2', '8', '25984');

UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26072;
UPDATE `quest_template` SET `PrevQuestId` = 26072, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26111;
UPDATE `quest_template` SET `PrevQuestId` = 26111, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26130;
UPDATE `quest_template` SET `PrevQuestId` = 26130, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26140;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26111', '8', '26096');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26111', '8', '26072');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26111', '8', '26096');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26111', '8', '26072');
	
UPDATE `quest_template` SET `PrevQuestId` = 26111 WHERE `Id` = 26132;
UPDATE `quest_template` SET `PrevQuestId` = 26111 WHERE `Id` = 26133;


UPDATE `quest_template` SET `PrevQuestId` = 26140, `NextQuestId` = 26154, `ExclusiveGroup` = 0 WHERE `Id` = 26141;
UPDATE `quest_template` SET `PrevQuestId` = 26140, `NextQuestId` = 26154, `ExclusiveGroup` = 0 WHERE `Id` = 26142;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26154;
UPDATE `quest_template` SET `PrevQuestId` = 26154, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26143;
