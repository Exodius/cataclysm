-- DEEPHOLM quest Chain


-- Upper World Pillar Fragment

UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 27203, `ExclusiveGroup` = 0 WHERE `Id` = 27722;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 27203, `ExclusiveGroup` = 0 WHERE `Id` = 27727;

UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27203;
UPDATE `quest_template` SET `PrevQuestId` = 27203, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27123;
UPDATE `quest_template` SET `PrevQuestId` = 27123, `NextQuestId` = 26247, `ExclusiveGroup` = 26245 WHERE `Id` = 26245;
UPDATE `quest_template` SET `PrevQuestId` = 27123, `NextQuestId` = 26247, `ExclusiveGroup` = 26245 WHERE `Id` = 26246;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26247;

UPDATE `quest_template` SET `PrevQuestId` = 27123 WHERE `Id` = 27136;
UPDATE `quest_template` SET `PrevQuestId` = 27123 WHERE `Id` = 26244;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26247', '8', '27136');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26247', '8', '26244');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26247', '8', '27136');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26247', '8', '26244');

UPDATE `quest_template` SET `PrevQuestId` = 26247, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26248;
UPDATE `quest_template` SET `PrevQuestId` = 26248, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26251;

UPDATE `quest_template` SET `PrevQuestId` = 26247, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26249;
UPDATE `quest_template` SET `PrevQuestId` = 26249, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26427;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26251', '8', '26427');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26251', '8', '26427');



	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26250', '8', '26427');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26250', '8', '26248');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26250', '8', '26427');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26250', '8', '26248');


UPDATE `quest_template` SET `PrevQuestId` = 26255 WHERE `Id` = 26259;

UPDATE `quest_template` SET `PrevQuestId` = 27007, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27100;
UPDATE `quest_template` SET `PrevQuestId` = 27100, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27101;
UPDATE `quest_template` SET `PrevQuestId` = 27101, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27102;

UPDATE `quest_template` SET `PrevQuestId` = 27061, `NextQuestId` = 26771, `ExclusiveGroup` = 0 WHERE `Id` = 26766;
UPDATE `quest_template` SET `PrevQuestId` = 27061, `NextQuestId` = 26771, `ExclusiveGroup` = 0 WHERE `Id` = 26768;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26771;
UPDATE `quest_template` SET `PrevQuestId` = 26771, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26857;
UPDATE `quest_template` SET `PrevQuestId` = 26857, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26876;

UPDATE `quest_template` SET `PrevQuestId` = 26771 WHERE `Id` = 26861;


	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26876', '8', '26861');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26876', '8', '26861');


-- Middle World Pillar Fragment
UPDATE `quest_template` SET `PrevQuestId` = 26876 WHERE `Id` = 26409;

UPDATE `quest_template` SET `PrevQuestId` = 26409, `NextQuestId` = 26411, `ExclusiveGroup` = 0 WHERE `Id` = 26410;
UPDATE `quest_template` SET `PrevQuestId` = 26409, `NextQuestId` = 26411, `ExclusiveGroup` = 0 WHERE `Id` = 27135;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26411;
UPDATE `quest_template` SET `PrevQuestId` = 26411, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26413;
UPDATE `quest_template` SET `PrevQuestId` = 26413, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26484;
UPDATE `quest_template` SET `PrevQuestId` = 26484, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27931;

UPDATE `quest_template` SET `PrevQuestId` = 26484, `NextQuestId` = 27934, `ExclusiveGroup` = 0 WHERE `Id` = 27932;
UPDATE `quest_template` SET `PrevQuestId` = 26484, `NextQuestId` = 27934, `ExclusiveGroup` = 0 WHERE `Id` = 27933;
UPDATE `quest_template` SET `PrevQuestId` = 27931, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27934;
UPDATE `quest_template` SET `PrevQuestId` = 27934, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27935;
UPDATE `quest_template` SET `PrevQuestId` = 27934, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27936;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26499;
UPDATE `quest_template` SET `PrevQuestId` = 26499, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26501;
UPDATE `quest_template` SET `PrevQuestId` = 26501, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26537;
UPDATE `quest_template` SET `PrevQuestId` = 26537, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26625;

UPDATE `quest_template` SET `PrevQuestId` = 27934, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26500;
UPDATE `quest_template` SET `PrevQuestId` = 26500, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26502;
UPDATE `quest_template` SET `PrevQuestId` = 26502, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26564;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26537', '8', '26502');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26537', '8', '26502');
	
UPDATE `quest_template` SET `PrevQuestId` = 26537 WHERE `Id` = 26591;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26625', '8', '26591');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26625', '8', '26591');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26625', '8', '26564');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26625', '8', '26564');

UPDATE `quest_template` SET `PrevQuestId` = 26625, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27126;
UPDATE `quest_template` SET `PrevQuestId` = 27126, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26632;
UPDATE `quest_template` SET `PrevQuestId` = 26632, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26755;
UPDATE `quest_template` SET `PrevQuestId` = 26755, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26762;
UPDATE `quest_template` SET `PrevQuestId` = 26762, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26834;

UPDATE `quest_template` SET `PrevQuestId` = 26755 WHERE `Id` = 26770;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26834', '8', '26770');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26834', '8', '26770');

UPDATE `quest_template` SET `PrevQuestId` = 26834, `NextQuestId` = 26835, `ExclusiveGroup` = 0 WHERE `Id` = 26791;
UPDATE `quest_template` SET `PrevQuestId` = 26834, `NextQuestId` = 26835, `ExclusiveGroup` = 0 WHERE `Id` = 26792;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26835;
UPDATE `quest_template` SET `PrevQuestId` = 26835, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26836;
UPDATE `quest_template` SET `PrevQuestId` = 26836, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27937;
UPDATE `quest_template` SET `PrevQuestId` = 27937, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 27938;


-- Lower World Pillar Fragment
UPDATE `quest_template` SET `PrevQuestId` = 27938 WHERE `Id` = 26326;

UPDATE `quest_template` SET `PrevQuestId` = 26326, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` in (26312,26314,26313);

UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26315;
UPDATE `quest_template` SET `PrevQuestId` = 26315, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26328;


	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26315', '8', '26312');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26315', '8', '26312');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26315', '8', '26314');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26315', '8', '26314');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26315', '8', '26313');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26315', '8', '26313');


UPDATE `quest_template` SET `PrevQuestId` = 26328, `NextQuestId` = 26426, `ExclusiveGroup` = 0 WHERE `Id` = 26376;
UPDATE `quest_template` SET `PrevQuestId` = 26328, `NextQuestId` = 26426, `ExclusiveGroup` = 0 WHERE `Id` = 26377;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26426;
UPDATE `quest_template` SET `PrevQuestId` = 26426, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26869;
UPDATE `quest_template` SET `PrevQuestId` = 26869, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26871;


UPDATE `quest_template` SET `PrevQuestId` = 26328 WHERE `Id` = 26375;


	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26426', '8', '26375');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26426', '8', '26375');
UPDATE `quest_template` SET `PrevQuestId` = 26871 WHERE `Id` = 26436;

UPDATE `quest_template` SET `PrevQuestId` = 26436 WHERE `Id` in (26438,26437,26439);

UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 28869;
UPDATE `quest_template` SET `PrevQuestId` = 28869, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26440;
UPDATE `quest_template` SET `PrevQuestId` = 26440, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26441;


	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26440', '8', '26438');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26440', '8', '26438');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26440', '8', '26437');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26440', '8', '26437');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26440', '8', '26439');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26440', '8', '26439');
	
UPDATE `quest_template` SET `PrevQuestId` = 26441 WHERE `Id` in(26575,26507);


UPDATE `quest_template` SET `PrevQuestId` = 26575, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26576;
UPDATE `quest_template` SET `PrevQuestId` = 26576, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26656;


UPDATE `quest_template` SET `PrevQuestId` = 26656, `NextQuestId` = 26659, `ExclusiveGroup` = 0 WHERE `Id` = 26657;
UPDATE `quest_template` SET `PrevQuestId` = 26656, `NextQuestId` = 26659, `ExclusiveGroup` = 0 WHERE `Id` = 26658;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 26750, `ExclusiveGroup` = 0 WHERE `Id` = 26584;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26659;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26750;
UPDATE `quest_template` SET `PrevQuestId` = 26750, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26752;
UPDATE `quest_template` SET `PrevQuestId` = 26752, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26827;
UPDATE `quest_template` SET `PrevQuestId` = 26827, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26828;

UPDATE `quest_template` SET `PrevQuestId` = 26659 WHERE `Id` = 26577;
UPDATE `quest_template` SET `PrevQuestId` = 26577 WHERE `Id` in (26578,26579);

UPDATE `quest_template` SET `PrevQuestId` = 26577, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26580;
UPDATE `quest_template` SET `PrevQuestId` = 26580, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26581;
UPDATE `quest_template` SET `PrevQuestId` = 26581, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26582;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26584', '8', '26578');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26584', '8', '26578');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26584', '8', '26579');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26584', '8', '26579');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26584', '8', '26582');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26584', '8', '26582');
	
	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26585', '8', '26578');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26585', '8', '26578');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26585', '8', '26579');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26585', '8', '26579');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26585', '8', '26582');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26585', '8', '26582');
	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26583', '8', '26578');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26583', '8', '26578');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26583', '8', '26579');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26583', '8', '26579');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26583', '8', '26582');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26583', '8', '26582');
	

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26750', '8', '26585');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26750', '8', '26585');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26750', '8', '26583');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26750', '8', '26583');
	
	UPDATE `quest_template` SET `PrevQuestId` = 26828, `NextQuestId` = 26833, `ExclusiveGroup` = 0 WHERE `Id` = 26829;
UPDATE `quest_template` SET `PrevQuestId` = 26828, `NextQuestId` = 26833, `ExclusiveGroup` = 0 WHERE `Id` = 26832;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26833;
UPDATE `quest_template` SET `PrevQuestId` = 26833, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26875;
UPDATE `quest_template` SET `PrevQuestId` = 26875, `NextQuestId` = 0, `ExclusiveGroup` = 0 WHERE `Id` = 26971;
UPDATE `quest_template` SET `PrevQuestId` = 26828 WHERE `Id` = 26831;

	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '26833', '8', '26831');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '26833', '8', '26831');

UPDATE `quest_template` SET `PrevQuestId` = 26971 WHERE `Id` = 26709;