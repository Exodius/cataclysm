REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `data24`, `data25`, `data26`, `data27`, `data28`, `data29`, `data30`, `data31`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
('180058','1','6251','Alliance Banner','','','','1801','32','1','0','0','0','0','0','0','0','1479','3000','180100','1','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('180059','1','6252','Contested Banner','','','','1801','32','1','0','0','0','0','0','0','0','1479','0','180102','1','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('180060','1','6253','Horde Banner','','','','1802','32','1','0','0','0','0','0','0','0','1479','3000','180101','1','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('180061','1','6254','Contested Banner','','','','1802','32','1','0','0','0','0','0','0','0','1479','0','180102','1','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('180100','6','9167','Alliance Banner Aura','','','','114','0','5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('180101','6','9166','Horde Banner Aura','','','','114','0','5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('180102','6','9165','Neutral Banner Aura','','','','114','0','5','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('180322','5','6391','Ghost Gate','','','','0','0','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1'),
('205557','10','6271','Lighthouse Banner','','','','35','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','13623'),
('207178','0','10215','Horde Gate','','','','114','32','1.05','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1'),
('208779','10','6271','Lighthouse Banner','','Capturing','','35','0','1','0','0','0','0','0','0','1479','0','0','3000','0','0','0','0','0','0','23936','1','0','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('208780','10','6271','Waterworks Banner','','Capturing','','35','0','1','0','0','0','0','0','0','1479','0','0','3000','0','0','0','0','0','0','23936','1','0','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('208781','10','6271','Mines Banner','','Capturing','','35','0','1','0','0','0','0','0','0','1479','0','0','3000','0','0','0','0','0','0','23936','1','0','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340');

UPDATE `gameobject_template` SET `faction` = 114, `flags` = 32 WHERE `entry` IN (205496,207177);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (14822,14933,14967,14934,14935,14936,14937,14938,14939,14940,14941,14942,14968,14943,14822,14891,16247,14945);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(14933, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14967, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14934, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14935, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14936, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14937, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14938, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14939, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14940, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14941, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14942, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14968, 11, 0, 0, 'achievement_bg_bog_dont_get_cocky_kid'),
(14943, 11, 0, 0, 'achievement_bg_bog_full_coverage'),
(14891, 11, 0, 0, 'achievement_bg_tp_double_jeopardy'),
(16247, 11, 0, 0, 'achievement_bg_tp_double_jeopardy'),
(14822, 11, 0, 0, 'achievement_bg_tp_twin_peaks_perfection'),
(14945, 11, 0, 0, 'achievement_bg_bog_jugger_not');

DELETE FROM `disables` WHERE `sourceType` = 3 AND `entry` = 120;

DELETE FROM `trinity_string` WHERE `entry` BETWEEN '1259' AND '1264';
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(1259, 'The %s has taken the %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1260, '$n has defended the %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1261, '$n has assaulted the %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1262, '$n claims the %s! If left unchallenged, the %s will control it in 1 minute!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1263, 'The Alliance has gathered $1776W resources, and is near victory!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1264, 'The Horde has gathered $1777W resources, and is near victory!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE `battleground_template` SET `AllianceStartO` = '5.934119', `HordeStartO` = '3.063053' WHERE `id` =120;

UPDATE `game_event` SET `holiday` = '435' WHERE `eventEntry` =78;

DELETE FROM `gameobject` WHERE `guid` IN (108001,108002,108003);

UPDATE `creature_template` SET `modelid1` = '17519', `modelid2` = '11686', `modelid3` = '0', `modelid4` = '0', `minlevel` = '80', `maxlevel` = '80', `exp` = '0', `faction_A` = '114', `faction_H` = '114', `dynamicflags` = '8', `flags_extra` = '130' WHERE `entry` =12999;

DELETE FROM `creature` WHERE `map` = 726;

DELETE FROM `spell_area` WHERE `spell` IN (46392, 46393);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES
(46392, 3277, 0, 0, 0, 0, 0, 2, 0),
(46392, 5031, 0, 0, 0, 0, 0, 2, 0),
(46393, 3277, 0, 0, 0, 0, 0, 2, 0),
(46393, 5031, 0, 0, 0, 0, 0, 2, 0);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 46393;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(46393, -46392, 1, 'Remove Focused Assault when Brutal Assault is added');

UPDATE `gameobject_template` SET `faction` = '114', `flags` = '0' WHERE `entry` IN (208205,208206,208207);

UPDATE `gameobject_template` SET `faction` = '0', `flags` = '1' WHERE `entry` IN (206655,206654,206653);

DELETE FROM `disables` WHERE `sourceType` = 3 AND entry IN (120,108,100);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(3, 100, 0, '', '', 'Rated Battleground');
