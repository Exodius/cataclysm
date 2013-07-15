-- Spawn some NPCs and quest givers
DELETE FROM creature WHERE guid >= 600400 and guid <= 600499;
INSERT INTO creature (guid, id, map, zone, area, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, 
spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUES 
(600400, 24029, 571, 0, 0, 1, 1, 0, 1, 2628.38, -3539.61, 162.148, 2.17273, 120, 0, 0, 9291, 3231, 0, 0, 0, 0),
(600401, 25026, 571, 0, 0, 1, 1, 0, 1, 114.658, -3698.49, 0.853066, 2.13244, 120, 0, 0, 8982, 0, 0, 0, 0, 0),
(600402, 25026, 571, 0, 0, 1, 1, 0, 1, 120.775, -3708.47, 2.22592, 5.68243, 120, 0, 0, 8982, 0, 0, 0, 0, 0),
(600403, 24277, 571, 0, 0, 1, 1, 0, 0, 2709.43, -3039.89, 96.8052, 5.37224, 120, 0, 0, 13937, 0, 0, 0, 0, 0),
(600404, 24019, 571, 0, 0, 1, 1, 0, 0, 2824.08, -3603.34, 245.716, 4.05206, 120, 0, 0, 18582, 0, 0, 0, 0, 0);
