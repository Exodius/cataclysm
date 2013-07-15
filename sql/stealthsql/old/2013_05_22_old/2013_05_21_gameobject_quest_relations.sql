-- Twilight Highlands
DELETE FROM `gameobject_questrelation` WHERE quest IN (28243, 27954, 28242, 27951) AND id = 206569;
INSERT INTO `gameobject_questrelation` (`id`, `quest`) VALUES
('206569', '28243'),
('206569', '27954'),
('206569', '28242'),
('206569', '27951');

DELETE FROM `gameobject_involvedrelation` WHERE quest IN (27947, 28241, 28242, 27951) AND id = 206569;
INSERT INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES
('206569', '27947'),
('206569', '28241'),
('206569', '28242'),
('206569', '27951');

-- Deepholm
DELETE FROM `gameobject_involvedrelation` WHERE quest = 26260 AND id = 205134;
INSERT INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES
('205134', '26260');

DELETE FROM `gameobject_questrelation` WHERE quest = 27007 AND id = 205134;
INSERT INTO `gameobject_questrelation` (`id`, `quest`) VALUES
('205134', '27007');