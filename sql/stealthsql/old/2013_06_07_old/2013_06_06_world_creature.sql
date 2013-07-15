DELETE FROM creature WHERE guid = 127632;
DELETE FROM creature WHERE guid = 127633;
DELETE FROM creature WHERE guid = 127635;
DELETE FROM creature WHERE guid = 127712;

INSERT INTO `creature` (`guid`, `id`, `map`, `zone`, `area`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(306001, 42877, 0, 0, 0, 1, 1, 0, 0, -761.733, -3792.48, 233.808, 0.529536, 300, 0, 0, 1856, 963, 0, 0, 0, 0),
(306002, 38142, 1, 0, 0, 1, 1, 0, 0, -1135.82, -5414.14, 13.2339, 3.25782, 0, 0, 0, 160, 0, 0, 0, 0, 0);
