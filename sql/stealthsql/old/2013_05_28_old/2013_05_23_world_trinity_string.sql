DELETE FROM `trinity_string` WHERE `entry` IN (12004,12002,12001,12003,820,821);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(12004, 'The Alliance lost the Venture Bay Lighthouse!', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(12002, 'The Alliance has taken the Venture Bay Lighthouse!', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(12001, 'The Horde has taken the Venture Bay Lighthouse!', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(12003, 'The Horde lost the Venture Bay Lighthouse!', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(820, '* has gossip (%u)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(821, '* is quest giver (%u)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
