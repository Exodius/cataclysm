DELETE FROM `npc_trainer` WHERE `entry` = 200004 AND `spell` = 2842;
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES
(200004, 2842, 700, 0, 0, 10);

DELETE FROM `npc_trainer` WHERE `entry` = 3401 AND `spell` = 2842;
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES
(3401, 2842, 700, 0, 0, 10);
