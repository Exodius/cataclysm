UPDATE `creature_template` SET `unit_class` = '2' WHERE `entry` IN (49508,43876,43879,45913,45918,45925,45927,45931,45936,49708,49711,49712,49072,50277,39983,40018,49262,50285);

UPDATE `creature_template` SET `unit_class` = '8' WHERE `entry` IN (45931,45936,49130,49164,48973);

UPDATE `creature_template` SET `unit_class` = '4' WHERE `entry` IN (49053,49050,48815);

UPDATE `creature_template` SET `ScriptName` = 'npc_oathsworn_scorpid_keeper' WHERE `entry` =45062;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (93674,86911,76164);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(76164, 'shadow_of_obsidius_absorb'),
(86911, 'spell_asaad_grounding_dummy');

UPDATE `event_scripts` SET `datalong` = '23952' WHERE `id` =8420 AND `delay` =460 AND `command` =9 AND `datalong` =99775 AND `datalong2` =900 AND `dataint` =0 AND CONCAT(`x`) = '0' AND CONCAT(`y`) = '0' AND CONCAT(`z`) = '0' AND CONCAT(`o`) = '0';

UPDATE `event_scripts` SET `datalong` = '23949' WHERE `id` =8420 AND `delay` =370 AND `command` =9 AND `datalong` =99776 AND `datalong2` =900 AND `dataint` =0 AND CONCAT(`x`) = '0' AND CONCAT(`y`) = '0' AND CONCAT(`z`) = '0' AND CONCAT(`o`) = '0';

UPDATE `event_scripts` SET `datalong` = '23946' WHERE `id` =8420 AND `delay` =300 AND `command` =9 AND `datalong` =99777 AND `datalong2` =900 AND `dataint` =0 AND CONCAT(`x`) = '0' AND CONCAT(`y`) = '0' AND CONCAT(`z`) = '0' AND CONCAT(`o`) = '0';

UPDATE `creature` SET `MovementType` = '2' WHERE `guid` IN (300440,300439,300350);

DELETE FROM `creature_addon` WHERE `guid` IN (248991,300440,300350,248997,248998,248999,248992,248993,248968,248970,248969,248958,248959,248960,248961,248994,248972,248971,248973,248939,248940,248941,99778,99779,99780,99781,99782,99774,99784,99896,99783);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(300440, 6766210, 0, 0, 0, 0, NULL),
(300350, 6766222, 0, 0, 0, 0, NULL);

UPDATE `creature_template_addon` SET `auras` = '86302 54341' WHERE `entry` IN (49864,39795,39613,39635,40835,47922,50284,40817,40784,45469,44765,46147,45993,45992,49580,40597);

UPDATE `creature_template` SET `unit_class` = '1' WHERE `entry` =80043;

UPDATE `creature_template` SET `npcflag` = '0' WHERE `entry` =39698;

UPDATE `creature_template` SET `npcflag` = '1' WHERE `entry` =49094;

UPDATE `creature_template` SET `npcflag` = '3' WHERE `entry` IN (49624,49072);

UPDATE `creature_template` SET `dmgschool` = '0' WHERE `entry` =50835;

UPDATE `disables` SET `entry` = '939' WHERE `sourceType` =2 AND `entry` =816;

DELETE FROM `event_scripts` WHERE `id` IN (8420,2609,11424,13666,18940,8428);

UPDATE `creature_template` SET `unit_class` = '1' WHERE `entry` IN (42178,42180,49050,49051,49052);

UPDATE `creature_template` SET `npcflag` = '2' WHERE `entry` IN (39698,39700,39705);

DELETE FROM `gameobject_template` WHERE `entry` = 401904;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `data24`, `data25`, `data26`, `data27`, `data28`, `data29`, `data30`, `data31`, `unkInt32`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
(401904, 3, 9554, 'BLACKROCKV2_LABROOM_CAULDRON', '', '', '', 0, 48, 0.731427, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 13623);

UPDATE `conditions` SET `ConditionTarget` = '1', `ConditionValue1` = '0' WHERE `SourceTypeOrReferenceId` =13 AND `SourceGroup` =0 AND `SourceEntry` =75676 AND `SourceId` =0 AND `ElseGroup` =0 AND `ConditionTypeOrReference` =18 AND `ConditionTarget` =0 AND `ConditionValue1` =1 AND `ConditionValue2` =0 AND `ConditionValue3` =0;

UPDATE `conditions` SET `ConditionTarget` = '1', `ConditionValue1` = '0' WHERE `SourceTypeOrReferenceId` =13 AND `SourceGroup` =0 AND `SourceEntry` =75677 AND `SourceId` =0 AND `ElseGroup` =0 AND `ConditionTypeOrReference` =18 AND `ConditionTarget` =0 AND `ConditionValue1` =1 AND `ConditionValue2` =39842 AND`ConditionValue3` =0;

UPDATE `conditions` SET `ConditionTarget` = '1', `ConditionValue1` = '0' WHERE `SourceTypeOrReferenceId` =13 AND `SourceGroup` =0 AND `SourceEntry` =75677 AND `SourceId` =0 AND `ElseGroup` =0 AND `ConditionTypeOrReference` =18 AND `ConditionTarget` =0 AND `ConditionValue1` =1 AND `ConditionValue2` =39985 AND `ConditionValue3` =0;

UPDATE `conditions` SET `ConditionTarget` = '1', `ConditionValue1` = '0' WHERE `SourceTypeOrReferenceId` =13 AND `SourceGroup` =0 AND `SourceEntry` =82393 AND `SourceId` =0 AND `ElseGroup` =0 AND `ConditionTypeOrReference` =18 AND `ConditionTarget` =0 AND `ConditionValue1` =1 AND `ConditionValue2` =39670 AND `ConditionValue3` =0;

UPDATE `creature_template` SET `npcflag` = '2' WHERE `entry` =39699;

UPDATE `creature_template` SET `unit_class` = '1' WHERE `entry` IN (49053,49054,49055);

UPDATE `creature_template` SET `npcflag` = '2' WHERE `entry` IN (39701,39706);
