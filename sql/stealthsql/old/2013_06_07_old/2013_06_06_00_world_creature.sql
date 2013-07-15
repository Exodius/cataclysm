DELETE FROM `creature` WHERE `guid` = 300696;
INSERT INTO `creature` (`guid`, `id`, `map`, `zone`, `area`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(300696, 41621, 1, 0, 0, 1, 1, 0, 1, 1376.21, -4912.23, 11.6799, 6.02648, 300, 0, 0, 25200, 0, 0, 0, 0, 0);

DELETE FROM `creature` WHERE `guid` IN (3450,4249,6200,6342,45703,45888,47011,48182,49646,55227,56181,58665,59690,63326,66351,68029,68592,70978);
