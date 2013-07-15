UPDATE creature_template SET VehicleId = 494, ScriptName = 'npc_king_greymanes_horse' WHERE entry = 35905;

UPDATE creature_template SET InhabitType = 5 WHERE entry = 35753;

UPDATE creature_template SET ScriptName = 'npc_krennan_aranas' WHERE entry = 35907;

DELETE FROM `creature` WHERE `id` = 35753;
INSERT INTO `creature` (`guid`, `id`, `map`, `zone`, `area`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(300693, 35753, 654, 0, 0, 1, 8, 0, 0, -1677.11, 1346.71, 21.2159, 0.374957, 7200, 0, 0, 1, 0, 0, 0, 0, 0);

DELETE FROM creature_template_addon WHERE entry = 35753;
INSERT INTO creature_template_addon (entry, emote, auras) VALUES
(35753, 472, '49414 0');

DELETE FROM conditions WHERE SourceEntry IN (68228,67805);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 68228, 0, 0, 18, 0, 1, 35753, 0, 0, 0, 0, '', NULL),
(13, 0, 67805, 0, 0, 18, 0, 1, 35463, 0, 0, 0, 0, '', NULL);

DELETE FROM spell_script_names WHERE spell_id IN (68219, 68228);
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES
(68219, 'spell_rescue_krennan');

DELETE FROM spell_area WHERE spell = 49416;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 4757, 14293, 1, 0, 0, 0, 2, 0, 64, 11);

DELETE FROM waypoint_data WHERE id IN(3590700,3590701);
INSERT INTO waypoint_data (id,point,position_x,position_y,position_z,move_flag) VALUES 
(3590700, 1, -1798.511108, 1398.395630, 19.863216, 1),
(3590700, 2, -1793.586548, 1377.932983, 19.794540, 1),
(3590700, 3, -1770.100342, 1355.922852, 19.730570, 1),
(3590700, 4, -1745.694702, 1360.722656, 19.721403, 1),
(3590700, 5, -1707.294556, 1349.699951, 19.896275, 1),
(3590701, 1, -1667.122437, 1348.478394, 15.189490, 1),
(3590701, 2, -1665.192261, 1360.726563, 15.134825, 1),
(3590701, 3, -1676.682861, 1361.144653, 15.134825, 1),
(3590701, 4, -1692.466431, 1352.553833, 15.121456, 1),
(3590701, 5, -1705.095947, 1347.391357, 19.896536, 1),
(3590701, 6, -1737.430908, 1371.958618, 19.811749, 1),
(3590701, 7, -1767.937622, 1403.527466, 19.726831, 1),
(3590701, 8, -1775.702637, 1424.763672, 19.783419, 1);

DELETE FROM creature_text WHERE entry IN(35753, 35905);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(35905, 0, 0, 'Rescue Krennan Aranas by using your vehicle''s ability.$B|TInterface\\Icons\\inv_misc_groupneedmore.blp:64|t', 5, 0, 100, 0, 0, 0, 'King Greymane''s Horse'),
(35753, 0, 0, 'Help!  Up here!', 1, 0, 100, 0, 0, 0, 'King Greymane''s Horse');

UPDATE creature_questrelation SET id = 34863 WHERE quest = 14091;

DELETE FROM creature_template_addon WHERE entry IN (35077,35753);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(35077, 0, 0, 0, 0,   0, '67503'),
(35753, 0, 0, 0, 0, 472, '49414');

DELETE FROM quest_start_scripts WHERE id = 14154;

UPDATE `creature_template` SET dmg_multiplier = 1, `ScriptName`='npc_lord_darius_crowley', AIName = '' WHERE (`entry`='35077');

UPDATE creature_template SET MovementType = 0, ScriptName = 'npc_soht_worgen', AIName = '' WHERE entry IN (35456, 35188, 35167, 35170);

DELETE FROM creature_template_addon WHERE entry IN (35456, 35188, 35167, 35170);

DELETE FROM spell_linked_spell WHERE spell_trigger = 67805;
INSERT INTO spell_linked_spell (spell_trigger, spell_effect, type, comment) VALUES
(67805, -5916, 1, 'Attack Lurker - Remove Stealth');

UPDATE creature_template SET ScriptName = 'npc_defensive_creature' WHERE entry = 35463;

DELETE FROM creature_template_addon WHERE entry = 35463;
INSERT INTO creature_template_addon (entry,auras) VALUES 
(35463,'5916');

UPDATE `quest_template` SET `RewardSpellCast` = '76642', `SourceSpellId` = '68232' WHERE `Id` =14293;

UPDATE `creature_template` SET `unit_flags` = '0' WHERE `entry` =35753;

DELETE FROM `creature_template_addon` WHERE `entry` = 35118;

UPDATE `creature_template` SET `faction_A` = '16', `faction_H` = '16' WHERE `entry` =35118;

UPDATE `conditions` SET `SourceGroup` = '1' WHERE `SourceTypeOrReferenceId` =13 AND `SourceGroup` =0 AND `SourceEntry` =67805 AND `SourceId` =0 AND `ElseGroup` =0 AND `ConditionTypeOrReference` =18 AND `ConditionTarget` =0 AND `ConditionValue1` =1 AND `ConditionValue2` =35463 AND `ConditionValue3` =0;

UPDATE `conditions` SET `SourceGroup` = '1' WHERE `SourceTypeOrReferenceId` =13 AND `SourceGroup` =0 AND `SourceEntry` =68228 AND `SourceId` =0 AND `ElseGroup` =0 AND `ConditionTypeOrReference` =18 AND `ConditionTarget` =0 AND `ConditionValue1` =1 AND `ConditionValue2` =35753 AND `ConditionValue3` =0;

UPDATE `creature` SET `map` = '638', `phaseMask` = '4' WHERE `guid` =300693;
