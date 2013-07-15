-- Uldum quests

-- To Uldum!

-- Alliance
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27006;
UPDATE `quest_template` SET `PrevQuestId` = 27006, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27042;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '27040', '8', '27006');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '27040', '8', '27006');	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '27042', '8', '27004');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '27042', '8', '27004');
-- Horde
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27008;
UPDATE `quest_template` SET `PrevQuestId` = 27008, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27043;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '27041', '8', '27008');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '27041', '8', '27008');	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '27043', '8', '27005');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '27043', '8', '27005');	
-- Both
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 27004, `ExclusiveGroup` = 0 WHERE `Id` = 27952;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 27005, `ExclusiveGroup` = 0 WHERE `Id` = 27953;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 27040, `ExclusiveGroup` = 0 WHERE `Id` = 27004;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 27041, `ExclusiveGroup` = 0 WHERE `Id` = 27005;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 27058, `ExclusiveGroup` = 0 WHERE `Id` = 27040;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 27059, `ExclusiveGroup` = 0 WHERE `Id` = 27041;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 28292, `ExclusiveGroup` = 0 WHERE `Id` = 27058;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 28293, `ExclusiveGroup` = 0 WHERE `Id` = 27059;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28292;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28293;
UPDATE `quest_template` SET `PrevQuestId` = 28292, `NextQuestId` = 27003, `ExclusiveGroup` = 0 WHERE `Id` = 28295;
UPDATE `quest_template` SET `PrevQuestId` = 28293, `NextQuestId` = 27003, `ExclusiveGroup` = 0 WHERE `Id` = 28296;
UPDATE `quest_template` SET `PrevQuestId` = 28293, `NextQuestId` = 27003, `ExclusiveGroup` = 0 WHERE `Id` = 28557;
UPDATE `quest_template` SET `PrevQuestId` = 28292, `NextQuestId` = 27003, `ExclusiveGroup` = 0 WHERE `Id` = 28558;


-- Escape and retribution
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27003;
UPDATE `quest_template` SET `PrevQuestId` = 27003 WHERE `Id` = 27922;
UPDATE `quest_template` SET `PrevQuestId` = 27922, `NextQuestId` = 28112, `NextQuestIdChain` = 0, `ExclusiveGroup` = -27923 WHERE `Id` in (27923,28105,27924);
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28112;
UPDATE `quest_template` SET `PrevQuestId` = 28112, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28134;
UPDATE `quest_template` SET `PrevQuestId` = 28134, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28135;
UPDATE `quest_template` SET `PrevQuestId` = 28135, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27520;
UPDATE `quest_template` SET `PrevQuestId` = 28112 WHERE `Id` in (28141,28145,28502,28250);
UPDATE `quest_template` SET `PrevQuestId` = 28112, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27993;
UPDATE `quest_template` SET `PrevQuestId` = 27993, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27141;
UPDATE `quest_template` SET `PrevQuestId` = 28134 WHERE `Id` = 27519;
UPDATE `quest_template` SET `PrevQuestId` = 28134, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28845;
UPDATE `quest_template` SET `PrevQuestId` = 28845, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28760;
UPDATE `quest_template` SET `PrevQuestId` = 28135, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27595;
UPDATE `quest_template` SET `PrevQuestId` = 27595, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27602;
UPDATE `quest_template` SET `PrevQuestId` = 27602, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27623;
UPDATE `quest_template` SET `PrevQuestId` = 27623, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27706;
UPDATE `quest_template` SET `PrevQuestId` = 27706 WHERE `Id` = 27628;


-- Stumping for votes

-- High Priest
UPDATE `quest_template` SET `PrevQuestId` = 27628 WHERE `Id` = 27630;
UPDATE `quest_template` SET `PrevQuestId` = 27630 WHERE `Id` = 27836;
UPDATE `quest_template` SET `PrevQuestId` = 27630 WHERE `Id` = 27837;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '28611', '8', '27836');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '28611', '8', '27836');	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '28611', '8', '27837');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '28611', '8', '27837');
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28611;
UPDATE `quest_template` SET `PrevQuestId` = 28611, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27838;
-- Vizier 
UPDATE `quest_template` SET `PrevQuestId` = 27628, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27629;
UPDATE `quest_template` SET `PrevQuestId` = 27629, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27632;
UPDATE `quest_template` SET `PrevQuestId` = 27632, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27707;
UPDATE `quest_template` SET `PrevQuestId` = 27707, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27738;
UPDATE `quest_template` SET `PrevQuestId` = 27738, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28533;
-- High Commander
UPDATE `quest_template` SET `PrevQuestId` = 27628 WHERE `Id` = 27631;
UPDATE `quest_template` SET `PrevQuestId` = 27628 WHERE `Id` = 28200;
UPDATE `quest_template` SET `PrevQuestId` = 27628, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28201;
UPDATE `quest_template` SET `PrevQuestId` = 28201, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27839;
UPDATE `quest_template` SET `PrevQuestId` = 27631, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28198;
UPDATE `quest_template` SET `PrevQuestId` = 28198, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28210;
UPDATE `quest_template` SET `PrevQuestId` = 28210, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28276;
UPDATE `quest_template` SET `PrevQuestId` = 28276, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28277;
UPDATE `quest_template` SET `PrevQuestId` = 28277, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28291;





-- Down with Neferset City
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '28533', '8', '28291');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '28533', '8', '28291');	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '28533', '8', '27838');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '28533', '8', '27838');
UPDATE `quest_template` SET `PrevQuestId` = 28533 WHERE `Id` = 28561;
UPDATE `quest_template` SET `PrevQuestId` = 28561, `NextQuestId` = 28500, `ExclusiveGroup` = -28498 WHERE `Id` in (28498,28499);	
UPDATE `quest_template` SET `PrevQuestId` = 28500, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28501;
UPDATE `quest_template` SET `PrevQuestId` = 28501, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28623;	
UPDATE `quest_template` SET `PrevQuestId` = 28501 WHERE `Id` = 27755;	
UPDATE `quest_template` SET `PrevQuestId` = 28623, `NextQuestId` = 28486, `ExclusiveGroup` = -28480 WHERE `Id` in (28480,28483);	
UPDATE `quest_template` SET `PrevQuestId` = 28486 WHERE `Id` = 28520;
	
	

-- Harrison's story
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 27196, `ExclusiveGroup` = -27176 WHERE `Id` = 27176;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 27196, `ExclusiveGroup` = -27176 WHERE `Id` = 27179;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27196;
UPDATE `quest_template` SET `PrevQuestId` = 27196, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27511;
UPDATE `quest_template` SET `PrevQuestId` = 27141 WHERE `Id` = 27187;
UPDATE `quest_template` SET `PrevQuestId` = 27511, `NextQuestId` = 27431, `ExclusiveGroup` = 0 WHERE `Id` = 27517;
UPDATE `quest_template` SET `PrevQuestId` = 27511, `NextQuestId` = 27431, `ExclusiveGroup` = 0 WHERE `Id` = 28602;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27431;
UPDATE `quest_template` SET `PrevQuestId` = 27431, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27624;
UPDATE `quest_template` SET `PrevQuestId` = 27624, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27669;
UPDATE `quest_template` SET `PrevQuestId` = 27511, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27541;
UPDATE `quest_template` SET `PrevQuestId` = 27541, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27549;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '27549', '1', '8', '28602');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '27549', '1', '8', '28602');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '27549', '2', '8', '27517');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '27549', '2', '8', '27517');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '27431', '0', '8', '27549');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '27431', '0', '8', '27549');
UPDATE `quest_template` SET `PrevQuestId` = 27431 WHERE `Id` = 27627;
UPDATE `quest_template` SET `PrevQuestId` = 27669, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27899;
UPDATE `quest_template` SET `PrevQuestId` = 27899, `NextQuestId` = 27903, `ExclusiveGroup` = -27900 WHERE `Id` = 27900;
UPDATE `quest_template` SET `PrevQuestId` = 27899, `NextQuestId` = 27903, `ExclusiveGroup` = -27900 WHERE `Id` = 27901;
UPDATE `quest_template` SET `PrevQuestId` = 27901, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27903;
UPDATE `quest_template` SET `PrevQuestId` = 27899, `NextQuestId` = 27926, `ExclusiveGroup` = 0 WHERE `Id` = 27925;
UPDATE `quest_template` SET `PrevQuestId` = 27899, `NextQuestId` = 27926, `ExclusiveGroup` = 0 WHERE `Id` = 28132;
UPDATE `quest_template` SET `PrevQuestId` = 27899, `NextQuestId` = 27926, `ExclusiveGroup` = 0 WHERE `Id` = 29809;
UPDATE `quest_template` SET `PrevQuestId` = 27903 WHERE `Id` = 27905;

-- Curse of the Tombs
UPDATE `quest_template` SET `PrevQuestId` = 28501, `NextQuestId` = 0 WHERE `Id` = 27760;
UPDATE `quest_template` SET `PrevQuestId` = 27760, `NextQuestId` = 27778, `ExclusiveGroup` = -27761 WHERE `Id` = 27761;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 27778, `ExclusiveGroup` = -27761 WHERE `Id` = 27777;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27778;
UPDATE `quest_template` SET `PrevQuestId` = 27778 WHERE `Id` = 27779;





-- Schnottz's Landing
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27926;
UPDATE `quest_template` SET `PrevQuestId` = 27926, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27928;
UPDATE `quest_template` SET `PrevQuestId` = 27928, `NextQuestId` = 27950, `ExclusiveGroup` = -27941 WHERE `Id` = 27941;

UPDATE `quest_template` SET `PrevQuestId` = 27926, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27939;
UPDATE `quest_template` SET `PrevQuestId` = 27939, `NextQuestId` = 27950, `ExclusiveGroup` = -27941 WHERE `Id` = 27942;
UPDATE `quest_template` SET `PrevQuestId` = 27939, `NextQuestId` = 27950, `ExclusiveGroup` = -27941 WHERE `Id` = 27943;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27950;
UPDATE `quest_template` SET `PrevQuestId` = 27950 WHERE `Id` = 27969;
UPDATE `quest_template` SET `PrevQuestId` = 27969 WHERE `Id` = 28002;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27990;
UPDATE `quest_template` SET `PrevQuestId` = 27990, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28187;
UPDATE `quest_template` SET `PrevQuestId` = 28187, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28193;
UPDATE `quest_template` SET `PrevQuestId` = 28193, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28195;
UPDATE `quest_template` SET `PrevQuestId` = 28195, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28267;
UPDATE `quest_template` SET `PrevQuestId` = 28187 WHERE `Id` = 28194;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '28267', '0', '8', '28194');
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '28267', '0', '8', '28194');


-- Temple of Uldum
UPDATE `quest_template` SET `PrevQuestId` = 28267, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28269;
UPDATE `quest_template` SET `PrevQuestId` = 28269, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28273;
UPDATE `quest_template` SET `PrevQuestId` = 28273, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28274;
UPDATE `quest_template` SET `PrevQuestId` = 28274, `NextQuestId` = 28353, `ExclusiveGroup` = -28350 WHERE `Id` = 28350;
UPDATE `quest_template` SET `PrevQuestId` = 28274, `NextQuestId` = 28353, `ExclusiveGroup` = -28350 WHERE `Id` in (28352,28351);
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28353;
UPDATE `quest_template` SET `PrevQuestId` = 28353, `NextQuestId` = 28363, `ExclusiveGroup` = -28271 WHERE `Id` = 28271;
UPDATE `quest_template` SET `PrevQuestId` = 28353, `NextQuestId` = 28363, `ExclusiveGroup` = -28271 WHERE `Id` = 28272;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28363;
UPDATE `quest_template` SET `PrevQuestId` = 28363, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28367;
UPDATE `quest_template` SET `PrevQuestId` = 28367, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28402;
UPDATE `quest_template` SET `PrevQuestId` = 28402, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28403;
UPDATE `quest_template` SET `PrevQuestId` = 28403, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28404;
UPDATE `quest_template` SET `PrevQuestId` = 28404, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28482;
UPDATE `quest_template` SET `PrevQuestId` = 28482, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28497;
UPDATE `quest_template` SET `PrevQuestId` = 28497, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28613;
UPDATE `quest_template` SET `PrevQuestId` = 28613, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27748;
UPDATE `quest_template` SET `PrevQuestId` = 27748, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28612;


-- Coffer of Promise/Halls of Origination
UPDATE `quest_template` SET `PrevQuestId` = 28612, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28621;
UPDATE `quest_template` SET `PrevQuestId` = 28621, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28622;
UPDATE `quest_template` SET `PrevQuestId` = 28622, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28633;
UPDATE `quest_template` SET `PrevQuestId` = 28633, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28654;
UPDATE `quest_template` SET `PrevQuestId` = 28654, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28746;
UPDATE `quest_template` SET `PrevQuestId` = 28746, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28753;