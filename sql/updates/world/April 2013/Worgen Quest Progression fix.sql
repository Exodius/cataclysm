/*Gilneas City quests

    A [1] Lockdown!
    A [2] Something's Amiss
    A [2] All Hell Breaks Loose / A [2] Evacuate the Merchant Square / A [2] Salvage the Supplies
    A [3] Royal Orders
	
    -- Class quests
        A Druid [2] The Winds Know Your Name... Apparently & A Druid [2] A Rejuvenating Touch
        A Hunter [2] Someone's Keeping Track of You & A Hunter [2] Steady Shot
        A Mage [2] Arcane Inquiries & A Mage [2] Arcane Missiles
        A Priest [2] Seek the Sister & A Priest [2] Flash Heal
        A Rogue [2] Someone's Looking for You & A Rogue [2] Eviscerate
        A Warlock [2] Shady Associates & A Warlock [2] Immolate
        A Warrior [2] Your Instructor & A Warrior [2] Charge 
		
    A [3] Safety in Numbers
        A [3] While You're At It
        Stoneward Prison
            A [3] Old Divisions
            A [3] The Prison Rooftop
            A [3] By the Skin of His Teeth
            A [3] Brothers in Arms 
    A [4] The Rebel Lord's Arsenal
    A [4] From the Shadows
    A [4] Message to Greymane
    A [4] Save Krennan Aranas
    A [4] Time to Regroup
    A [5] Sacrifices
    A [5] By Blood and Ash
    A [5] Never Surrender, Sometimes Retreat
    A [5] Last Stand */
	
	-- Lockdown! (14078)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14078;
	-- Something's Amiss (14091)
	UPDATE `quest_template` SET `PrevQuestId` = 14078, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14091;
	-- All Hell Breaks Loose (14093)
	UPDATE `quest_template` SET `PrevQuestId` = 14091, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14093;
	-- Evacuate the Merchant Square (14098)
	UPDATE `quest_template` SET `PrevQuestId` = 14091, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14098;
	-- Salvage the Supplies (14094)
	UPDATE `quest_template` SET `PrevQuestId` = 14091, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14094;
	-- Royal Orders (14099)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14099;
	delete from conditions where sourceentry=14099;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14099', '8', '14093');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14099', '8', '14098');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14099', '8', '14094');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14099', '8', '14093');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14099', '8', '14098');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14099', '8', '14094');
	-- Safety in Numbers (Class Quest) (14290,14291,14289,14288,14287,14285,14286)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` =  14157, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` in  (14290,14291,14289,14288,14287,14285,14286);
	-- While You're At It (24930)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24930;
	delete from conditions where sourceentry=24930;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24930', '1', '8', '14290');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24930', '2', '8', '14291');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24930', '3', '8', '14289');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24930', '4', '8', '14288');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24930', '5', '8', '14287');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24930', '6', '8', '14285');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24930', '7', '8', '14286');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24930', '1', '8', '14290');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24930', '2', '8', '14291');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24930', '3', '8', '14289');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24930', '4', '8', '14288');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24930', '5', '8', '14287');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24930', '6', '8', '14285');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24930', '7', '8', '14286');
	-- Old Divisions (Z)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14157;
	-- The Prison Rooftop (28850)
	UPDATE `quest_template` SET `PrevQuestId` = 14157, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 28850;
	-- By the Skin of His Teeth (14154)
	UPDATE `quest_template` SET `PrevQuestId` = 28850, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14154;
	-- Brothers in Arms (26129)
	UPDATE `quest_template` SET `PrevQuestId` = 14154, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 26129;
	-- The Rebel Lord's Arsenal (14159)
	UPDATE `quest_template` SET `PrevQuestId` = 26129, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14159;
	-- From the Shadows (14204)
	UPDATE `quest_template` SET `PrevQuestId` = 14159, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14204;	
	-- Message to Greymane (14214)
	UPDATE `quest_template` SET `PrevQuestId` = 14204, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14214;		
	-- Save Krennan Aranas (14293)
	UPDATE `quest_template` SET `PrevQuestId` = 14214, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14293;		
	-- Time to Regroup (14294)
	UPDATE `quest_template` SET `PrevQuestId` = 14293, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14294;		
	-- Sacrifices (14212)
	UPDATE `quest_template` SET `PrevQuestId` = 14294, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14212;		
	-- By Blood and Ash (14218)
	UPDATE `quest_template` SET `PrevQuestId` = 14212, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14218;		
    -- Never Surrender, Sometimes Retreat (14221)
	UPDATE `quest_template` SET `PrevQuestId` = 14218, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14221;
	-- Last Stand (14222)
	UPDATE `quest_template` SET `PrevQuestId` = 14221, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14222;
	
	-- Quête de classe
	
	-- 1 - Chasseur
	UPDATE `quest_template` SET `PrevQuestId` = 14099, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14275;
	UPDATE `quest_template` SET `PrevQuestId` = 14275, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14276;
	UPDATE `quest_template` SET `PrevQuestId` = 14276 WHERE `Id` = 14290;
	
	-- 2 - Guerrier
	UPDATE `quest_template` SET `PrevQuestId` = 14099, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14265;
	UPDATE `quest_template` SET `PrevQuestId` = 14265, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14266;
	UPDATE `quest_template` SET `PrevQuestId` = 14266 WHERE `Id` = 14286;
	
	
	-- 3 - Mage
	UPDATE `quest_template` SET `PrevQuestId` = 14099, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14277;	
	UPDATE `quest_template` SET `PrevQuestId` = 14277, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14281;
	UPDATE `quest_template` SET `PrevQuestId` = 14281 WHERE `Id` = 14288;
	
	-- 4 - Voleur
	UPDATE `quest_template` SET `PrevQuestId` = 14099, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14269;
	UPDATE `quest_template` SET `PrevQuestId` = 14269, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14272;
	UPDATE `quest_template` SET `PrevQuestId` = 14272 WHERE `Id` = 14285;
	
	-- 5 - Druide
	UPDATE `quest_template` SET `PrevQuestId` = 14099, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14280;
	UPDATE `quest_template` SET `PrevQuestId` = 14280, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14283;
	UPDATE `quest_template` SET `PrevQuestId` = 14283 WHERE `Id` = 14291;
	
	-- -6 Démoniste
	UPDATE `quest_template` SET `PrevQuestId` = 14099, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14273;
	UPDATE `quest_template` SET `PrevQuestId` = 14273, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14274;
	UPDATE `quest_template` SET `PrevQuestId` = 14274 WHERE `Id` = 14287;
	
	
	-- 7- Prêtre
	UPDATE `quest_template` SET `PrevQuestId` = 14099, `NextQuestIdChain` = 0 WHERE `Id` = 14278;
	UPDATE `quest_template` SET `PrevQuestId` = 14278, `NextQuestIdChain` = 0 WHERE `Id` = 14279;
	UPDATE `quest_template` SET `PrevQuestId` = 14279 WHERE `Id` = 14289;
	
	UPDATE `creature_template` SET `KillCredit1` = 44175 WHERE `entry` = 35118;
UPDATE `quest_template` SET `RequiredSpellCast1`='5143' WHERE (`id`='14281'); 
UPDATE `quest_template` SET `RequiredSpellCast1`='348' WHERE (`id`='14274'); 
UPDATE `quest_template` SET `RequiredSpellCast1`='2098' WHERE (`id`='14272'); 
UPDATE `quest_template` SET `RequiredSpellCast1`='56641' WHERE (`id`='14276');
UPDATE `quest_template` SET `RequiredSpellCast1`='774' WHERE (`id`='14283');
UPDATE `quest_template` SET `RequiredSpellCast1`='2061' WHERE (`id`='14279');
UPDATE `quest_template` SET `RequiredSpellCast1`='100' WHERE (`id`='14266'); -- War

	
/* Duskhaven 

    A [5] Last Chance at Humanity
    A [5] Among Humans Again
    A [5] In Need of Ingredients
    A [5] Invasion
    A [5] Kill or Be Killed
    A [5] Hold the Line / A [5] You Can't Take 'Em Alone
    A [5] Holding Steady
    A [6] The Allens' Storm Cellar
    A [6] Unleash the Beast / A [6] Two By Sea / A [6] Save the Children!
    A [6] Leader of the Pack 
	
	*/
	-- Last Chance at Humanity (14375)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14375;
	-- Among Humans Again (14313)
	UPDATE `quest_template` SET `PrevQuestId` = 14375, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14313;
	-- In Need of Ingredients (14320)
	UPDATE `quest_template` SET `PrevQuestId` = 14313, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14320;
	-- Invasion (14321)
	UPDATE `quest_template` SET `PrevQuestId` = 14320, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14321;
	-- Kill or Be Killed (14336)
	UPDATE `quest_template` SET `PrevQuestId` = 14321, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14336;
	-- Hold the Line (14347)
	UPDATE `quest_template` SET `PrevQuestId` = 14336, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14347;
	-- You Can't Take 'Em Alone (14348)
	UPDATE `quest_template` SET `PrevQuestId` = 14336, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14348;
	-- Holding Steady (14366)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14366;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14366', '8', '14348');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14366', '8', '14347');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14366', '8', '14348');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14366', '8', '14347');
	-- The Allens' Storm Cellar (14367)
	UPDATE `quest_template` SET `PrevQuestId` = 14366, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14367;
	-- Unleash the Beast (14369)
	UPDATE `quest_template` SET `PrevQuestId` = 14367, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14369;
	-- Two By Sea (14382)
	UPDATE `quest_template` SET `PrevQuestId` = 14367, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14382;
	-- Save the Children! (14368)
	UPDATE `quest_template` SET `PrevQuestId` = 14367, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14368;
	-- Leader of the Pack (14386)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14386;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14386', '8', '14369');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14386', '8', '14382');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14386', '8', '14368');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14386', '8', '14369');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14386', '8', '14382');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14386', '8', '14368');
	
	

/* Departing Duskhaven

    A [6] As the Land Shatters
    A [6] Gasping for Breath
    A [7] Evacuation
        Gramma 
        A [7] Grandma Wahl
        A [7] Grandma's Lost It Alright
        A [7] I Can't Wear This
        A [7] Grandma's Cat
        A [7] Ready to Go (optional) -- DERNIER
        Haywards 
        A [7] The Hayward Brothers
            A [7] Not Quite Shipshape
            A [7] Washed Up 
        A [7] Escape By Sea (optional) -- DERNIER
        Crowley 
        A [7] The Crowley Orchard
        A [7] The Hungry Ettin
        A [7] Horses for Duskhaven (optional)  -- DERNIER
    A [7] To Greymane Manor
    A [7] The King's Observatory
    A [7] Alas, Gilneas!
    A [8] Exodus 
		*/
	-- As the Land Shatters (14396)
	UPDATE `quest_template` SET `PrevQuestId` = 14386, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14396;
	-- Gasping for Breath (14395)
	UPDATE `quest_template` SET `PrevQuestId` = 14396, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14395;
	-- Evacuation (14397)
	UPDATE `quest_template` SET `PrevQuestId` = 14395, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14397;
	-- Grandma Wahl (14398)
	UPDATE `quest_template` SET `PrevQuestId` = 14397, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14398;
	-- Grandma's Lost It Alright (14399)
	UPDATE `quest_template` SET `PrevQuestId` = 14398, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14399;
	-- I Can't Wear This (14400)
	UPDATE `quest_template` SET `PrevQuestId` = 14399, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14400;
	-- Grandma's Cat (14401)
	UPDATE `quest_template` SET `PrevQuestId` = 14400, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14401;
	-- Ready to Go (optional) -- DERNIER (14402)
	UPDATE `quest_template` SET `PrevQuestId` = 14401, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14402;
	-- The Hayward Brothers (14403)
	UPDATE `quest_template` SET `PrevQuestId` = 14397, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14403;
	-- Not Quite Shipshape (14404)
	UPDATE `quest_template` SET `PrevQuestId` = 14403, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14404;
	-- Washed Up (14412)
	UPDATE `quest_template` SET `PrevQuestId` = 14404, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14412;
	-- Escape By Sea (optional) -- DERNIER  (14405)
	UPDATE `quest_template` SET `PrevQuestId` = 14412, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14405;
	-- The Crowley Orchard (14406)
	UPDATE `quest_template` SET `PrevQuestId` = 14397, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14406;
	-- The Hungry Ettin (14416)
	UPDATE `quest_template` SET `PrevQuestId` = 14406, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14416;
	-- Horses for Duskhaven (optional)  -- DERNIER (14463)
	UPDATE `quest_template` SET `PrevQuestId` = 14416, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14463;
	-- To Greymane Manor (14465)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14465;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14465', '8', '14402');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14465', '8', '14405');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14465', '8', '14463');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14465', '8', '14402');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14465', '8', '14405');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14465', '8', '14463');
	-- The King's Observatory (14466)
	UPDATE `quest_template` SET `PrevQuestId` = 14465, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14466;
	-- Alas, Gilneas! (14467)
	UPDATE `quest_template` SET `PrevQuestId` = 14466, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14467;
	-- Exodus  (24438)
	UPDATE `quest_template` SET `PrevQuestId` = 14467, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24438;

/*Stormglen

    A [8] Stranded at the Marsh
    A [8] Introductions Are in Order
    A [8] Stormglen
    A [8] Pest Control
        A [8] Pieces of the Past 
    A [9] Queen-Sized Troubles
    A [8] The Blackwald
    A [9] Losing Your Tail
    A [9] Tal'doren, the Wild Home
    A [9] At Our Doorstep
        A [11] Preparations 
    A [9] Take Back What's Ours
    A [9] Neither Human Nor Beast
    A [9] Return to Stormglen
    A [9] Onwards and Upwards 
	
	*/
	-- Stranded at the Marsh (24468)
	UPDATE `quest_template` SET `PrevQuestId` = 24438, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24468;
	-- Introductions Are in Order (24472)
	UPDATE `quest_template` SET `PrevQuestId` = 24468, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24472;
	--  Stormglen (24483)
	UPDATE `quest_template` SET `PrevQuestId` = 24472, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24483;
	-- Pest Control (24484)
	UPDATE `quest_template` SET `PrevQuestId` = 24483, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24484;
	-- Pieces of the Past  (24495)
	UPDATE `quest_template` SET `PrevQuestId` = 24483, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24495;
	-- Queen-Sized Troubles  (24501)
	UPDATE `quest_template` SET `PrevQuestId` = 24484, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24501;
	-- The Blackwald (24578)
	UPDATE `quest_template` SET `PrevQuestId` = 24501, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24578;
	-- Losing Your Tail (24616)
	UPDATE `quest_template` SET `PrevQuestId` = 24578, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24616;
	-- Tal'doren, the Wild Home (24617)
	UPDATE `quest_template` SET `PrevQuestId` = 24616, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24617;
	-- At Our Doorstep (24627)
	UPDATE `quest_template` SET `PrevQuestId` = 24617, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24627;
	-- Preparations  24628
	UPDATE `quest_template` SET `PrevQuestId` = 24617, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24628;
	-- Take Back What's Ours (24646)
	UPDATE `quest_template` SET `PrevQuestId` = 24627, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24646;
	-- Neither Human Nor Beast (24593)
	UPDATE `quest_template` SET `PrevQuestId` = 24646, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24593;
	-- Return to Stormglen (24673)
	UPDATE `quest_template` SET `PrevQuestId` = 24593, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24673;
	-- Onwards and Upwards (24672)
	UPDATE `quest_template` SET `PrevQuestId` = 24673, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24672;


	
	
	/*Battle for Gilneas City and the conclusion

    A [10] Betrayal at Tempest's Reach
    A [10] Flank the Forsaken
    A [10] Liberation Day / A [10] Last Meal / A [10] Slaves to No One
    A [11] Push Them Out
    A [11] The Battle for Gilneas City
    A [11] The Hunt for Sylvanas
    A [11] Vengeance or Survival
    A [11] Slowing the Inevitable
    A [11] Knee-Deep
    A [11] Laid to Rest
    A [11] Patriarch's Blessing
    A [12] Keel Harbor
    A [12] They Have Allies, But So Do We
    A [12] Endgame
    A [12] Rut'theran Village */
	
	-- Betrayal at Tempest's Reach (24592)
	UPDATE `quest_template` SET `PrevQuestId` = 24672, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24592;
	-- Flank the Forsaken (24677)
	UPDATE `quest_template` SET `PrevQuestId` = 24592, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24677;
	-- Liberation Day (24575)
	UPDATE `quest_template` SET `PrevQuestId` = 24677, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24575;
	-- Last Meal (24675)
	UPDATE `quest_template` SET `PrevQuestId` = 24677, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24675;
	-- Slaves to No One (24674)
	UPDATE `quest_template` SET `PrevQuestId` = 24677, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24674;
	-- Push Them Out (24676)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24676;
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24676', '8', '24674');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24676', '8', '24675');
	INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24676', '8', '24575');
    INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24676', '8', '24674');
    INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24676', '8', '24675');
    INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24676', '8', '24575');
	-- The Battle for Gilneas City (24904)
	UPDATE `quest_template` SET `PrevQuestId` = 24676, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24904;
	-- The Hunt for Sylvanas (24902)
	UPDATE `quest_template` SET `PrevQuestId` = 24904, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24902;
	-- Vengeance or Survival (24903)
	UPDATE `quest_template` SET `PrevQuestId` = 24902, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24903;
	-- Slowing the Inevitable (24920)
	UPDATE `quest_template` SET `PrevQuestId` = 24903, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24920;
	-- Knee-Deep (24678)
	UPDATE `quest_template` SET `PrevQuestId` = 24920, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24678;
	-- Laid to Rest (24602)
	UPDATE `quest_template` SET `PrevQuestId` = 24678, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24602;
	-- Patriarch's Blessing (24679)
	UPDATE `quest_template` SET `PrevQuestId` = 24602, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24679;
	-- Keel Harbor (24680)
	UPDATE `quest_template` SET `PrevQuestId` = 24679, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24680;
	-- They Have Allies, But So Do We (24681)
	UPDATE `quest_template` SET `PrevQuestId` = 24680, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24681;
	-- Endgame (26706)
	UPDATE `quest_template` SET `PrevQuestId` = 24681, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 26706;
	-- Rut'theran Village (14434)
	UPDATE `quest_template` SET `PrevQuestId` = 26706, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14434;
	
	/* 
	    A [10] The Howling Oak
    A [10] Breaking Waves of Change
    A [10] The Last Wave of Survivors 
	*/
	-- The Howling Oak (28517)
	UPDATE `quest_template` SET `PrevQuestId` = 14434, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 28517;
	-- Breaking Waves of Change (26385)
	UPDATE `quest_template` SET `PrevQuestId` = 28517, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 26385;
	-- The Last Wave of Survivors  (13518)
	UPDATE `quest_template` SET `PrevQuestId` = 26385, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 13518;
	
	
	