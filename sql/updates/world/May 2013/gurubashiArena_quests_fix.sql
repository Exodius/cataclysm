-- for quests 26451 and 26452 
-- www.wowhead.com/npc=43110
-- corect the hp exp becose its random level 30 to 90 so if hes have exp 3 and hes level lower then 82 then he will have  hp 2 
UPDATE `creature_template` SET `maxlevel`=80, `exp`=0, `mindmg`=126, `maxdmg`=311 WHERE `entry`=43110;
UPDATE quest_template SET RequiredNpcOrGo1=43110 WHERE RequiredNpcOrGo1=43120;
