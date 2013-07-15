/*Lost Isles
First Island

    H [7] Don't Go Into the Light!
    H [6] Goblin Escape Pods
    H [6] Get Our Stuff Back! / H [6] It's Our Problem Now / H [6] Monkey Business
    H [6] Help Wanted
    H [6] Miner Troubles
    Mandatory side quests: H [6] Capturing the Unknown, H [6] Orcs Can Write?
    H [6] The Enemy of My Enemy
    H [6] The Vicious Vale
    H [6] Weed Whacker
    H [7] Back to Aggra
    H [7] Forward Movement
    H [7] Infrared = Infradead
    H [7] To The Cliffs
    H [7] Get To The Gyrochoppa!
    H [7] Precious Cargo
    H [7] Meet Me Up Top
    H [7] Warchief's Revenge
    H [7] Farewell, For Now
    H [7] Up, Up & Away! 
	*/
	
	-- Don't Go Into the Light! (14239)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14239;
	-- Goblin Escape Pods (14474)
	UPDATE `quest_template` SET `PrevQuestId` = 14239, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14474;
	-- Get Our Stuff Back! (14014)
	UPDATE `quest_template` SET `PrevQuestId` = 14474, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14014;
	-- It's Our Problem Now (14473)
	UPDATE `quest_template` SET `PrevQuestId` = 14474, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14473;
	-- Monkey Business (14019)
	UPDATE `quest_template` SET `PrevQuestId` = 14474, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14019;
	-- Help Wanted (14248)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14248;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14248', '8', '14019');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14248', '8', '14473');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14248', '8', '14014');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14248', '8', '14019');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14248', '8', '14473');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14248', '8', '14014');
	-- Miner Troubles (14021)
	UPDATE `quest_template` SET `PrevQuestId` = 14248, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14021;
	-- Capturing the Unknown (14031)
	UPDATE `quest_template` SET `PrevQuestId` = 14021, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14031;
	-- Orcs Can Write? (14233)
	UPDATE `quest_template` SET `PrevQuestId` = 14021, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14233;
	-- The Enemy of My Enemy (14234)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14234;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14234', '8', '14021');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14234', '8', '14233');	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14234', '8', '14021');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14234', '8', '14233');	
	-- The Vicious Vale (14235)
	UPDATE `quest_template` SET `PrevQuestId` = 14234, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14235;
	-- Weed Whacker (14236)
	UPDATE `quest_template` SET `PrevQuestId` = 14235, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14236;
	-- Back to Aggra (14303)
	UPDATE `quest_template` SET `PrevQuestId` = 14236, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14303;
	-- Forward Movement (14237)
	UPDATE `quest_template` SET `PrevQuestId` = 14303, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14237;
	-- Infrared = Infradead (14238)
	UPDATE `quest_template` SET `PrevQuestId` = 14237, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14238;
	-- To The Cliffs (14240)
	UPDATE `quest_template` SET `PrevQuestId` = 14238, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14240;
	-- Get To The Gyrochoppa! (14241)
	UPDATE `quest_template` SET `PrevQuestId` = 14240, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14241;
	-- Precious Cargo (14242)
	UPDATE `quest_template` SET `PrevQuestId` = 14241, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14242;
	-- Meet Me Up Top (14326)
	UPDATE `quest_template` SET `PrevQuestId` = 14242, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14326;
	-- Warchief's Revenge (14243)
	UPDATE `quest_template` SET `PrevQuestId` = 14326, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14243;
	-- Farewell, For Now (14445)
	UPDATE `quest_template` SET `PrevQuestId` = 14243, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14445;
	-- Up, Up & Away! (14244)
	UPDATE `quest_template` SET `PrevQuestId` = 14445, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14244;

	
	
/*Town-In-A-Box

    H [8] It's A Town-In-A-Box
    H [7] Hobart Needs You
    H [7] Cluster Cluck
    H [8] Trading Up
    H [8] The Biggest Egg Ever
    H [8] Who's Top Of The Food Chain Now?
    H [8] A Goblin in Shark's Clothing
    H [8] Invasion Imminent!
    H [8] Bilgewater Cartel Represent / H [8] Naga Hide
    H [8] Irresistible Pool Pony
    H [8] Surrender or Else!
    H [8] Get Back to Town 
	*/
	-- It's A Town-In-A-Box (14245)
	UPDATE `quest_template` SET `PrevQuestId` = 14244, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14245;
	-- Hobart Needs You (27139)
	UPDATE `quest_template` SET `PrevQuestId` = 14245, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 27139;
	-- Cluster Cluck (24671)
	UPDATE `quest_template` SET `PrevQuestId` = 27139, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24671;
	-- Trading Up (24741)
	UPDATE `quest_template` SET `PrevQuestId` = 24671, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24741;
	-- The Biggest Egg Ever (24744)
	UPDATE `quest_template` SET `PrevQuestId` = 24741, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24744;
	-- Who's Top Of The Food Chain Now? (24816)
	UPDATE `quest_template` SET `PrevQuestId` = 24744, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24816;
	-- A Goblin in Shark's Clothing (24817)
	UPDATE `quest_template` SET `PrevQuestId` = 24816, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24817;
	-- Invasion Imminent! (24856)
	UPDATE `quest_template` SET `PrevQuestId` = 24817, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24856;
	-- Bilgewater Cartel Represent (24858)
	UPDATE `quest_template` SET `PrevQuestId` = 24856, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24858;
	-- Naga Hide (24859)
	UPDATE `quest_template` SET `PrevQuestId` = 24856, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24859;
	-- Irresistible Pool Pony (24864)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24864;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24864', '8', '24858');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24864', '8', '24859');	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24864', '8', '24858');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24864', '8', '24859');
	-- Surrender or Else! (24868)
	UPDATE `quest_template` SET `PrevQuestId` = 24864, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24868;
	-- Get Back to Town (24897)
	UPDATE `quest_template` SET `PrevQuestId` = 24868, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24897;

	
	
	/* Pygmy mayhem

    H [8] Town-In-A-Box: Under Attack
    H [8] Oomlot Village
    H [8] Free the Captives / H [8] Send a Message
    H [8] Oomlot Dealt With
    H [8] Up the Volcano
    H [8] Zombies vs. Super Booster Rocket Boots / H [9] Three Little Pygmies / H [8] Rockin' Powder
    H [8] Rocket Boot Boost
    H [8] Children of a Turtle God
    H [9] Volcanoth!
    H [9] Old Friends 
*/
	-- Town-In-A-Box: Under Attack (24901)
	UPDATE `quest_template` SET `PrevQuestId` = 24897, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24901;
	-- Oomlot Village (24924)
	UPDATE `quest_template` SET `PrevQuestId` = 24901, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24924;
	-- Free the Captives (24925)
	UPDATE `quest_template` SET `PrevQuestId` = 24924, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24925;
	-- Send a Message (24929)
	UPDATE `quest_template` SET `PrevQuestId` = 24924, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24929;
	-- Oomlot Dealt With (24937)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24937;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24937', '8', '24925');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24937', '8', '24929');	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24937', '8', '24925');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24937', '8', '24929');
	-- Up the Volcano (24940)
	UPDATE `quest_template` SET `PrevQuestId` = 24937, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24940;
	-- Zombies vs. Super Booster Rocket Boots (24942)
	UPDATE `quest_template` SET `PrevQuestId` = 24940, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24942;
	-- Three Little Pygmies (24945)
	UPDATE `quest_template` SET `PrevQuestId` = 24940, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24945;
	-- Rockin' Powder (24946)
	UPDATE `quest_template` SET `PrevQuestId` = 24940, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24946;
	-- Rocket Boot Boost (24952)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24952;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24952', '8', '24942');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24952', '8', '24945');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '24952', '8', '24946');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24952', '8', '24942');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24952', '8', '24945');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '24952', '8', '24946');
	-- Children of a Turtle God (24954)
	UPDATE `quest_template` SET `PrevQuestId` = 24952, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24954;
	-- Volcanoth! (24958)
	UPDATE `quest_template` SET `PrevQuestId` = 24954, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 24958;
	-- Old Friends (25023)
	UPDATE `quest_template` SET `PrevQuestId` = 24958, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25023;

	
	
	
/* Warchief's Lookout

    H [9] Repel the Paratroopers / H [10] The Heads of the SI:7 / H [9] Mine Disposal, the Goblin Way
    H [9] The Pride of Kezan
    H [9] The Warchief Wants You
    H [9] Borrow Bastia
    H [9] Let's Ride
    H [9] The Gallywix Labor Mine
    H [9] Kaja'Cola Gives You IDEAS! (TM)
    H [9] Morale Boost / H [10] Throw It On the Ground!
    H [9] Light at the End of the Tunnel
    H [9] Wild Mine Cart Ride
    H [10] Shredder Shutdown / H [10] The Ultimate Footbomb Uniform
    KTC Oil Rig
        H [10] Release the Valves & H [10] Good-bye, Sweet Oil
        H [11] What Kind of Name is Chip, Anyway? / H [11] The Fastest Way to His Heart 
    H [10] The Slave Pits
        H [10] Escape Velocity
        H [11] She Loves Me, She Loves Me NOT! / H [11] What Kind of Name is Candy, Anyway? 
    H [11] Final Confrontation
    H [10] Victory!
    H [11] Warchief's Emissary??
    H [11] Message for Garrosh??
    H [11] Report to the Labor Captain? */
	
	-- Repel the Paratroopers (25024)
	UPDATE `quest_template` SET `PrevQuestId` = 25023, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25024;
	-- The Heads of the SI:7 (25093)
	UPDATE `quest_template` SET `PrevQuestId` = 25023, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25093;
	-- Mine Disposal, the Goblin Way (25058)
	UPDATE `quest_template` SET `PrevQuestId` = 25023, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25058;
	-- The Pride of Kezan (25066)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25066;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25066', '8', '25024');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25066', '8', '25093');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25066', '8', '25058');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25066', '8', '25024');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25066', '8', '25093');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25066', '8', '25058');
	-- The Warchief Wants You (25098)
	UPDATE `quest_template` SET `PrevQuestId` = 25066, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25098;
	-- Borrow Bastia  (25099)
	UPDATE `quest_template` SET `PrevQuestId` = 25098, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25099;
	-- Let's Ride (25100)
	UPDATE `quest_template` SET `PrevQuestId` = 25099, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25100;
	-- The Gallywix Labor Mine (25109)
	UPDATE `quest_template` SET `PrevQuestId` = 25100, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25109;
	-- Kaja'Cola Gives You IDEAS! (TM) (25110)
	UPDATE `quest_template` SET `PrevQuestId` = 25109, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25110;
	-- Morale Boost (25122)
	UPDATE `quest_template` SET `PrevQuestId` = 25110, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25122;
	-- Throw It On the Ground! (25123)
	UPDATE `quest_template` SET `PrevQuestId` = 25110, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25123;
	-- Light at the End of the Tunnel (25125)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25125;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25125', '8', '25122');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25125', '8', '25123');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25125', '8', '25122');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25125', '8', '25123');
	-- Wild Mine Cart Ride (25184)
	UPDATE `quest_template` SET `PrevQuestId` = 25125, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25184;
	-- Shredder Shutdown (25200)
	UPDATE `quest_template` SET `PrevQuestId` = 25184, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25200;
	-- The Ultimate Footbomb Uniform (25201)
	UPDATE `quest_template` SET `PrevQuestId` = 25184, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25201;
	-- Release the Valves & H (25204)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25204;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25204', '8', '25200');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25204', '8', '25201');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25204', '8', '25200');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25204', '8', '25201');
	-- Good-bye, Sweet Oil (25207)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25207;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25207', '8', '25200');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25207', '8', '25201');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25207', '8', '25200');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25207', '8', '25201');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25207', '8', '25204');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25207', '8', '25204');
	UPDATE `quest_template` SET `PrevQuestId` = 25204 WHERE `Id` = 25207;
	-- What Kind of Name is Chip, Anyway? (25203)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25203;
	DELETE from conditions where SourceTypeOrReferenceId=19 and sourceentry=25203;
	DELETE from conditions where SourceTypeOrReferenceId=20 and sourceentry=25203;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25203', '8', '25200');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25203', '8', '25201');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25203', '8', '25200');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25203', '8', '25201');
	-- The Fastest Way to His Heart (25202)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25202;
	DELETE from conditions where SourceTypeOrReferenceId=19 and sourceentry=25202;
	DELETE from conditions where SourceTypeOrReferenceId=20 and sourceentry=25202;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25202', '8', '25200');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25202', '8', '25201');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25202', '8', '25200');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25202', '8', '25201');
	-- The Slave Pits (25213)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25213;
	delete from conditions where sourceentry=25213;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25213', '8', '25204');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25213', '8', '25207');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25213', '8', '25204');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25213', '8', '25207');	
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25213', '8', '25203');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25213', '8', '25202');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25213', '8', '25202');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25213', '8', '25203');
	-- Escape Velocity (25214)
	UPDATE `quest_template` SET `PrevQuestId` = 25213, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25214;
	-- She Loves Me, She Loves Me NOT! (25243)
	UPDATE `quest_template` SET `PrevQuestId` = 25214, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25243;
	-- What Kind of Name is Candy, Anyway?  (25244)
	UPDATE `quest_template` SET `PrevQuestId` = 25214, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25244;
	-- Final Confrontation (25251)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25251;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25251', '8', '25243');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '25251', '8', '25244');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25251', '8', '25243');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '25251', '8', '25244');
	-- Victory! (25265)
	UPDATE `quest_template` SET `PrevQuestId` = 25251, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25265;
	-- Warchief's Emissary?? (25266)
	UPDATE `quest_template` SET `PrevQuestId` = 25265, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25266;
	-- Message for Garrosh?? (25267)
	UPDATE `quest_template` SET `PrevQuestId` = 25266, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25267;
	-- Report to the Labor Captain? (25275)
	UPDATE `quest_template` SET `PrevQuestId` = 25267, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 25275;
	-- Warchief's Command: Azshara! (28496)
	UPDATE `quest_template` SET `PrevQuestId` = 25275, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 28496;
	
	    /*H [11] Runaway Shredder!
    H [11] The Captain's Logs
    H [11] Up a Tree
    H [11] Defend the Gates!
    H [11] Arborcide 

Bloodfist

    H [11] The Eyes of Ashenvale
        H [11] Venison for the Troops 
    H [10] Return of the Highborne?
    H [10] Return of the Highborne? 
	
	*/
	
	-- Runaway Shredder! (14129)
	UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14129;
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14129', '8', '28496');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('19', '14129', '8', '25275');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14129', '8', '28496');
	REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('20', '14129', '8', '25275');
	-- The Captain's Logs (14134)
	UPDATE `quest_template` SET `PrevQuestId` = 14129, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14134;
	-- Up a Tree (14135)
	UPDATE `quest_template` SET `PrevQuestId` = 14134, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14135;
	-- Defend the Gates! (14146)
	UPDATE `quest_template` SET `PrevQuestId` = 14135, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14146;
	-- Arborcide (14155)
	UPDATE `quest_template` SET `PrevQuestId` = 14146, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14155;
	-- The Eyes of Ashenvale (14117)
	UPDATE `quest_template` SET `PrevQuestId` = 14155, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14117;
	-- Venison for the Troops  (14118)
	UPDATE `quest_template` SET `PrevQuestId` = 14117, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14118;
	-- Return of the Highborne? (14127)
	UPDATE `quest_template` SET `PrevQuestId` = 14118, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14127;
	-- Return of the Highborne?  (14128)
	UPDATE `quest_template` SET `PrevQuestId` = 14127, `NextQuestId` = 0, `ExclusiveGroup` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 14128;
	