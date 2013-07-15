-- prince liam
DELETE FROM creature_text WHERE entry = 34850;
INSERT INTO `creature_text` VALUES 
(34850, 0, 0, 'I want the perimeter secured and the gates manned by two guards at all times. No one gets in, no one gets out.', 12, 0, 100, 0, 0, 19615, 'YELL_PRINCE_LIAM_GREYMANE_1'),
(34850, 1, 0, 'We protected Gilneas from the Scourge. We protected Gilneas during the Northgate rebellion. We will protect Gilneas from whatever this new threat may be.', 12, 0, 100, 0, 0, 19616, 'YELL_PRINCE_LIAM_GREYMANE_2'),
(34850, 2, 0, 'Stand ready, guards! We don\'t know how many intruders we\'re dealing with, but the Headlands are overrun and we\'re cut off from the harbor towns. Expect to be outnumbered.', 12, 0, 100, 0, 0, 19614, 'YELL_PRINCE_LIAM_GREYMANE_2');

-- Panicked citizen
DELETE FROM creature_text WHERE entry = 44086;
INSERT INTO `creature_text` VALUES 
(44086, 0, 0, 'What\'s going on? I thought I saw something on the rooftops.', 12, 0, 33, 0, 0, 0, 'Panicked Citizen Random Saying'),
(44086, 0, 1, 'My children are in Stormglen alone! I have to get to them!', 12, 0, 33, 0, 0, 0, 'Panicked Citizen Random Saying'),
(44086, 0, 2, 'You can\'t do this to us!', 12, 0, 33, 0, 0, 0, 'Panicked Citizen Random Saying'),
(44086, 0, 3, 'What... what are those things on the rooftops?', 12, 0, 33, 0, 0, 0, 'Panicked Citizen Random Saying'),
(44086, 0, 4, 'We have to get out of here! The howling gets louder every night.', 12, 0, 33, 0, 0, 0, 'Panicked Citizen Random Saying'),
(44086, 0, 5, 'They told us Gilneas City was safe...', 12, 0, 33, 0, 0, 0, 'Panicked Citizen Random Saying');

-- Josiah Avery
DELETE FROM creature_text WHERE entry = 35369;
INSERT INTO `creature_text` VALUES 
(35369, 0, 0, 'Make it stop!', 14, 0, 100, 0, 0, 0, 'Josiah Avery - Random Phrases'),
(35369, 1, 0, 'My face! What\'s wrong with my face!', 14, 0, 100, 0, 0, 0, 'Josiah Avery - Random Phrases'),
(35369, 2, 0, 'I can\'t fight it!', 14, 0, 100, 0, 0, 0, 'Josiah Avery - Random Phrases'),
(35369, 3, 0, 'My hands... Don\'t look at my hands!', 14, 0, 100, 0, 0, 0, 'Josiah Avery - Random Phrases'),
(35369, 4, 0, 'The pain is unbearable!', 14, 0, 100, 0, 0, 0, 'Josiah Avery - Random Phrases');

-- Lorna
DELETE FROM creature_text WHERE entry = 35378;
INSERT INTO `creature_text` VALUES 
(35378, 0, 0, 'This mastiff will help you find the hidden worgen.', 12, 0, 100, 0, 0, 19696, 'Lorna - Quest Accept');
