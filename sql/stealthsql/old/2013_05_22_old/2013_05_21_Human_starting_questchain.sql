-- Human Starting Zone

-- set required races to every alliance race except human for quest "Beating Them Back!" and "Join the Battle!"
UPDATE quest_template SET RequiredRaces=2098252 WHERE id=29078;
UPDATE quest_template SET RequiredRaces=2098252 WHERE id=28789;

-- set required races of "Beating Them Back!" and "Lions for Lambs" class quests to human
UPDATE quest_template SET RequiredRaces=1 WHERE id IN (28757, 28762, 28763, 28764, 28765, 28766, 28767);
UPDATE quest_template SET RequiredRaces=1 WHERE id IN (28769, 28770, 28771, 28772, 28773, 28774, 28759);

-- set questchain for "Lions for Lambs" class quests
-- mage
UPDATE quest_template SET NextQuestIdChain=28769 WHERE id=28757;
UPDATE quest_template SET PrevQuestId=28757 WHERE id=28769;
-- paladin
UPDATE quest_template SET NextQuestIdChain=28770 WHERE id=28762;
UPDATE quest_template SET PrevQuestId=28762 WHERE id=28770;
-- priest
UPDATE quest_template SET NextQuestIdChain=28771 WHERE id=28763;
UPDATE quest_template SET PrevQuestId=28763 WHERE id=28771;
-- rogue
UPDATE quest_template SET NextQuestIdChain=28772 WHERE id=28764;
UPDATE quest_template SET PrevQuestId=28764 WHERE id=28772;
-- warlock
UPDATE quest_template SET NextQuestIdChain=28773 WHERE id=28765;
UPDATE quest_template SET PrevQuestId=28765 WHERE id=28773;
-- warrior
UPDATE quest_template SET NextQuestIdChain=28774 WHERE id=28766;
UPDATE quest_template SET PrevQuestId=28766 WHERE id=28774;
-- hunter
UPDATE quest_template SET NextQuestIdChain=28759 WHERE id=28767;
UPDATE quest_template SET PrevQuestId=28767 WHERE id=28759;

-- class quest "Letter" questchain
-- set required races from worgen only to alliance
UPDATE quest_template SET RequiredRaces=2098253 WHERE id IN (3104, 3101, 3103, 3102, 3105, 3100, 26910, 26916, 26918, 26919, 26915, 26914, 26913, 26917, 28789);
-- mage
UPDATE quest_template SET NextQuestIdChain=3104 WHERE id=28769;
UPDATE quest_template SET NextQuestIdChain=26916, PrevQuestId=28769 WHERE id=3104;
UPDATE quest_template SET NextQuestIdChain=28784, PrevQuestId=3104 WHERE id=26916;
-- paladin
UPDATE quest_template SET NextQuestIdChain=3101 WHERE id=28770;
UPDATE quest_template SET NextQuestIdChain=26918, PrevQuestId=28770 WHERE id=3101;
UPDATE quest_template SET NextQuestIdChain=28785, PrevQuestId=3101 WHERE id=26918;
-- priest
UPDATE quest_template SET NextQuestIdChain=3103 WHERE id=28771;
UPDATE quest_template SET NextQuestIdChain=26919, PrevQuestId=28771 WHERE id=3103;
UPDATE quest_template SET NextQuestIdChain=28786, PrevQuestId=3103 WHERE id=26919;
-- rogue 
UPDATE quest_template SET NextQuestIdChain=3102 WHERE id=28772;
UPDATE quest_template SET NextQuestIdChain=26915, PrevQuestId=28772 WHERE id=3102;
UPDATE quest_template SET NextQuestIdChain=28787, PrevQuestId=3102 WHERE id=26915;
-- warlock
UPDATE quest_template SET NextQuestIdChain=3105 WHERE id=28773;
UPDATE quest_template SET NextQuestIdChain=26914, PrevQuestId=28773 WHERE id=3105;
UPDATE quest_template SET NextQuestIdChain=28788, PrevQuestId=3105 WHERE id=26914;
-- warrior
UPDATE quest_template SET NextQuestIdChain=3100 WHERE id=28774;
UPDATE quest_template SET NextQuestIdChain=26913, PrevQuestId=28774 WHERE id=3100;
UPDATE quest_template SET NextQuestIdChain=28789, PrevQuestId=3100 WHERE id=26913;
-- hunter
UPDATE quest_template SET NextQuestIdChain=26910 WHERE id=28759;
UPDATE quest_template SET NextQuestIdChain=26917, PrevQuestId=28759 WHERE id=26910;
UPDATE quest_template SET NextQuestIdChain=28780, PrevQuestId=26910 WHERE id=26917;

-- set required races of "Join the Battle!" class quests to human
UPDATE quest_template SET RequiredRaces=1 WHERE id IN (28784, 28785, 28786, 28787, 28788, 28789, 28780);

-- set required races of "They Sent Assassins" // "Fear No Evil" // "The Rear Is Clear" rogue class quests to human
UPDATE quest_template SET RequiredRaces=1 WHERE id IN (28795, 28811, 28821);

-- "They Sent Assassins" & "Fear No Evil" & "The Rear is Clear"
-- paladin 28793 // 28809 // 28819
-- warrior 28797 // 28813 // 28823
-- hunter 28791 // 28806 // 28817
-- warlock 28796 // 28812 // 28822
-- rogue 28795 // 28811 // 28821
-- priest 28794 // 28808 // 28820
-- mage 28792 // 28810 // 28818

-- set required prequests for "The Rear is Clear" class quests
-- paladin
UPDATE quest_template SET NextQuestIdChain=28819, ExclusiveGroup=-28793, NextQuestid=28819 WHERE id=28793;
UPDATE quest_template SET NextQuestIdChain=28819, ExclusiveGroup=-28793, NextQuestid=28819 WHERE id=28809;
-- warrior
UPDATE quest_template SET NextQuestIdChain=28823, ExclusiveGroup=-28797, NextQuestid=28823 WHERE id=28797;
UPDATE quest_template SET NextQuestIdChain=28823, ExclusiveGroup=-28797, NextQuestid=28823 WHERE id=28813;
-- hunter
UPDATE quest_template SET NextQuestIdChain=28817, ExclusiveGroup=-28791, NextQuestid=28817 WHERE id=28791;
UPDATE quest_template SET NextQuestIdChain=28817, ExclusiveGroup=-28791, NextQuestid=28817 WHERE id=28806;
-- warlock 
UPDATE quest_template SET NextQuestIdChain=28822, ExclusiveGroup=-28796, NextQuestid=28822 WHERE id=28796;
UPDATE quest_template SET NextQuestIdChain=28822, ExclusiveGroup=-28796, NextQuestid=28822 WHERE id=28812;
-- rogue
UPDATE quest_template SET NextQuestIdChain=28821, ExclusiveGroup=-28795, NextQuestid=28821 WHERE id=28795;
UPDATE quest_template SET NextQuestIdChain=28821, ExclusiveGroup=-28795, NextQuestid=28821 WHERE id=28811;
-- priest
UPDATE quest_template SET NextQuestIdChain=28820, ExclusiveGroup=-28794, NextQuestid=28820 WHERE id=28794;
UPDATE quest_template SET NextQuestIdChain=28820, ExclusiveGroup=-28794, NextQuestid=28820 WHERE id=28808;
-- mage
UPDATE quest_template SET NextQuestIdChain=28818, ExclusiveGroup=-28792, NextQuestid=28818 WHERE id=28792;
UPDATE quest_template SET NextQuestIdChain=28818, ExclusiveGroup=-28792, NextQuestid=28818 WHERE id=28810;

-- set prequest for "Blackrock Invasion"
UPDATE quest_template SET NextQuestIdChain=26389, ExclusiveGroup=28823, NextQuestid=26389 WHERE id=28823;
UPDATE quest_template SET NextQuestIdChain=26389, ExclusiveGroup=28823, NextQuestid=26389 WHERE id=29083;
UPDATE quest_template SET NextQuestIdChain=26389, ExclusiveGroup=28823, NextQuestid=26389 WHERE id=31145;
UPDATE quest_template SET NextQuestIdChain=26389, ExclusiveGroup=28823, NextQuestid=26389 WHERE id=28822;
UPDATE quest_template SET NextQuestIdChain=26389, ExclusiveGroup=28823, NextQuestid=26389 WHERE id=28821;
UPDATE quest_template SET NextQuestIdChain=26389, ExclusiveGroup=28823, NextQuestid=26389 WHERE id=28818;
UPDATE quest_template SET NextQuestIdChain=26389, ExclusiveGroup=28823, NextQuestid=26389 WHERE id=28819;
UPDATE quest_template SET NextQuestIdChain=26389, ExclusiveGroup=28823, NextQuestid=26389 WHERE id=28820;
UPDATE quest_template SET NextQuestIdChain=26389, ExclusiveGroup=28823, NextQuestid=26389 WHERE id=28817;
UPDATE quest_template SET PrevQuestID=0 WHERE id=26389;

-- set prequest for "Extinguishing Hope"
UPDATE quest_template SET NextQuestIdChain=26391, ExclusiveGroup=28823, NextQuestid=26391 WHERE id=28823;
UPDATE quest_template SET NextQuestIdChain=26391, ExclusiveGroup=28823, NextQuestid=26391 WHERE id=29083;
UPDATE quest_template SET NextQuestIdChain=26391, ExclusiveGroup=28823, NextQuestid=26391 WHERE id=31145;
UPDATE quest_template SET NextQuestIdChain=26391, ExclusiveGroup=28823, NextQuestid=26391 WHERE id=28822;
UPDATE quest_template SET NextQuestIdChain=26391, ExclusiveGroup=28823, NextQuestid=26391 WHERE id=28821;
UPDATE quest_template SET NextQuestIdChain=26391, ExclusiveGroup=28823, NextQuestid=26391 WHERE id=28818;
UPDATE quest_template SET NextQuestIdChain=26391, ExclusiveGroup=28823, NextQuestid=26391 WHERE id=28819;
UPDATE quest_template SET NextQuestIdChain=26391, ExclusiveGroup=28823, NextQuestid=26391 WHERE id=28820;
UPDATE quest_template SET NextQuestIdChain=26391, ExclusiveGroup=28823, NextQuestid=26391 WHERE id=28817;
UPDATE quest_template SET PrevQuestID=0 WHERE id=26391;

-- set prequests for "Ending the Invasion!
UPDATE quest_template SET NextQuestIdChain=26390, ExclusiveGroup=-26391, NextQuestid=26390 WHERE id=26391;
UPDATE quest_template SET NextQuestIdChain=26390, ExclusiveGroup=-26391, NextQuestid=26390 WHERE id=26389;

-- set prequest for "Report to Goldshire"
UPDATE quest_template SET NextQuestIdChain=2158 WHERE id=54;
UPDATE quest_template SET PrevQuestId=54 WHERE id=2158;