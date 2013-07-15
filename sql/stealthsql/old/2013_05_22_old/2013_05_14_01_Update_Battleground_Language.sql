-- Add Language for Battleground Twin Peak and Battle for Gilneas
-- Twin Peak
DELETE FROM `trinity_string` WHERE `entry` BETWEEN 1230 AND 1240;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES 
(1230, 'The battle for Twin Peaks begins in 2 minutes.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1231, 'The battle for Twin Peaks begins in 1 minute.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1232, 'The battle for Twin Peaks begins in 30 seconds. Prepare yourselves!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1233, 'Let the battle for Twin Peaks begin!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1234, '$n captured the Horde flag!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1235, '$n captured the Alliance flag!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1236, 'The Horde flag was dropped by $n!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1237, 'The Alliance Flag was dropped by $n!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1238, 'The Alliance Flag was returned to its base by $n!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1239, 'The Horde flag was returned to its base by $n!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1240, 'The Horde flag was picked up by $n!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Battle for Gilneas
DELETE FROM `trinity_string` WHERE `entry` BETWEEN 1250 AND 1264;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES 
(1250, 'The Battle for Gilneas begins in 2 minutes.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1251, 'The Battle for Gilneas begins in 1 minute.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1252, 'The Battle for Gilneas begins in 30 seconds. Prepare yourselves!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1253, 'The Battle for Gilneas has begun!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1254, 'Alliance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1255, 'Horde', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1256, 'lighthouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1257, 'waterworks', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1258, 'mine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1259, 'The %s has taken the %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1260, '$n has defended the %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1261, '$n has assaulted the %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1262, '$n claims the %s! If left unchallenged, the %s will control it in 1 minute!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1263, 'The Alliance has gathered $1776W resources, and is near victory!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1264, 'The Horde has gathered $1777W resources, and is near victory!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);