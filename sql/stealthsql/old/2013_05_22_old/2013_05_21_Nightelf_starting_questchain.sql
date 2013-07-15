-- Nightelf Starting Zone

-- questchain start for every class
UPDATE quest_template SET NextQuestIdChain=28714 WHERE id=28713;
UPDATE quest_template SET PrevQuestId=28713 WHERE id=28714;

-- sidequest "A Favor for Melithar" and "Demonic Thieves"
UPDATE quest_template SET NextQuestIdChain=28734 WHERE id=28714;
UPDATE quest_template SET NextQuestIdChain=28715, PrevQuestId=28714 WHERE id=28734;
UPDATE quest_template SET PrevQuestId=28734 WHERE id=28715;

-- start of class quests
-- druid
UPDATE quest_template SET NextQuestIdChain=3120 WHERE id=28714;
UPDATE quest_template SET NextQuestIdChain=26948, PrevQuestId=28714 WHERE id=3120;
UPDATE quest_template SET PrevQuestId=3120 WHERE id=26948;
-- hunter
UPDATE quest_template SET NextQuestIdChain=3117 WHERE id=28714;
UPDATE quest_template SET NextQuestIdChain=26947, PrevQuestId=28714 WHERE id=3117;
UPDATE quest_template SET PrevQuestId=3117 WHERE id=26947;
-- mage
UPDATE quest_template SET NextQuestIdChain=26841 WHERE id=28714;
UPDATE quest_template SET NextQuestIdChain=26940, PrevQuestId=28714 WHERE id=26841;
UPDATE quest_template SET PrevQuestId=26841 WHERE id=26940;
-- priest
UPDATE quest_template SET NextQuestIdChain=3119 WHERE id=28714;
UPDATE quest_template SET NextQuestIdChain=26949, PrevQuestId=28714 WHERE id=3119;
UPDATE quest_template SET PrevQuestId=3119 WHERE id=26949;
-- rogue
UPDATE quest_template SET NextQuestIdChain=3118 WHERE id=28714;
UPDATE quest_template SET NextQuestIdChain=26946, PrevQuestId=28714 WHERE id=3118;
UPDATE quest_template SET PrevQuestId=3118 WHERE id=26946;
-- warrior
UPDATE quest_template SET NextQuestIdChain=3116 WHERE id=28714;
UPDATE quest_template SET NextQuestIdChain=26945, PrevQuestId=28714 WHERE id=3116;
UPDATE quest_template SET PrevQuestId=3116 WHERE id=26945;

-- set nextquest for class quests
UPDATE quest_template SET NextQuestIdChain=28723, ExclusiveGroup=26948, NextQuestid=28723 WHERE id=26948;
UPDATE quest_template SET NextQuestIdChain=28723, ExclusiveGroup=26948, NextQuestid=28723 WHERE id=26947;
UPDATE quest_template SET NextQuestIdChain=28723, ExclusiveGroup=26948, NextQuestid=28723 WHERE id=26940;
UPDATE quest_template SET NextQuestIdChain=28723, ExclusiveGroup=26948, NextQuestid=28723 WHERE id=26949;
UPDATE quest_template SET NextQuestIdChain=28723, ExclusiveGroup=26948, NextQuestid=28723 WHERE id=26946;
UPDATE quest_template SET NextQuestIdChain=28723, ExclusiveGroup=26948, NextQuestid=28723 WHERE id=26945;

-- continue normal questchain
UPDATE quest_template SET NextQuestIdChain=28724 WHERE id=28723;
UPDATE quest_template SET NextQuestIdChain=28725, PrevQuestId=28723 WHERE id=28724;
UPDATE quest_template SET NextQuestIdChain=28726, PrevQuestId=28724 WHERE id=28725;
UPDATE quest_template SET NextQuestIdChain=28727, PrevQuestId=28725 WHERE id=28726;
UPDATE quest_template SET PrevQuestId=28726 WHERE id=28727;
UPDATE quest_template SET NextQuestIdChain=28728 WHERE id=28727;
UPDATE quest_template SET NextQuestIdChain=28729, PrevQuestId=28727 WHERE id=28728;
UPDATE quest_template SET NextQuestIdChain=28730, PrevQuestId=28728 WHERE id=28729;
UPDATE quest_template SET NextQuestIdChain=28731, PrevQuestId=28729 WHERE id=28730;
UPDATE quest_template SET PrevQuestId=28730 WHERE id=28731;

-- set prequest for sidequest "Dolanaar Delivery"
UPDATE quest_template SET PrevQuestId=28727 WHERE id=2159;