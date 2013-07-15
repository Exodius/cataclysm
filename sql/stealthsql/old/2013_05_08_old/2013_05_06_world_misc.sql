UPDATE `instance_template` SET `script` = 'instance_throne_of_the_four_winds' WHERE `map` =754;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` = 15984;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(15984, 11, 0, 0, 'achievement_not_static_at_all');

DELETE FROM `instance_template` WHERE `map` = 33;
INSERT INTO `instance_template` (`map`, `parent`, `script`, `allowMount`) VALUES
(33, 0, 'instance_shadowfang_keep', 0);

UPDATE `gameobject_template` SET `ScriptName` = 'go_rocket_sling' WHERE `entry` =196439;

UPDATE `gameobject_template` SET `ScriptName` = 'go_goblin_escape_pod' WHERE `entry` =195188;

UPDATE `gameobject_template` SET `ScriptName` = 'go_blackhoof_cage' WHERE `entry` =186287;

UPDATE `gameobject_template` SET `ScriptName` = 'go_merchant_square_door' WHERE `entry` =195327;

UPDATE `gameobject_template` SET `ScriptName` = 'go_halfus_whelp_cage' WHERE `entry` =205087;

UPDATE `gameobject_template` SET `ScriptName` = 'go_throne_of_tides_defence_system' WHERE `entry` =203199;
