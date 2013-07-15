UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id` IN (8851, 12855, 12865);

DELETE FROM `gossip_menu` WHERE (`entry`=12854 AND `text_id`=18086) OR (`entry`=12855 AND `text_id`=17774) OR (`entry`=12857 AND `text_id`=18087) OR (`entry`=12858 AND `text_id`=18088) OR (`entry`=12859 AND `text_id`=18089) OR (`entry`=12860 AND `text_id`=18090) OR (`entry`=12861 AND `text_id`=18091) OR (`entry`=12862 AND `text_id`=18092) OR (`entry`=12863 AND `text_id`=18093) OR (`entry`=12864 AND `text_id`=18094) OR (`entry`=12865 AND `text_id`=17774) OR (`entry`=12866 AND `text_id`=18095) OR (`entry`=12867 AND `text_id`=18096) OR (`entry`=12868 AND `text_id`=18097) OR (`entry`=12869 AND `text_id`=18098) OR (`entry`=12870 AND `text_id`=18099) OR (`entry`=12871 AND `text_id`=18100) OR (`entry`=12872 AND `text_id`=18101) OR (`entry`=12873 AND `text_id`=18102) OR (`entry`=12874 AND `text_id`=18103) OR (`entry`=12875 AND `text_id`=18104) OR (`entry`=12876 AND `text_id`=18105) OR (`entry`=12877 AND `text_id`=18106) OR (`entry`=12878 AND `text_id`=18107) OR (`entry`=12879 AND `text_id`=18108);

INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(12854, 18086), 
(12855, 17774), 
(12857, 18087), 
(12858, 18088), 
(12859, 18089), 
(12860, 18090), 
(12861, 18091), 
(12862, 18092), 
(12863, 18093), 
(12864, 18094), 
(12865, 17774), 
(12866, 18095), 
(12867, 18096), 
(12868, 18097), 
(12869, 18098), 
(12870, 18099), 
(12871, 18100), 
(12872, 18101), 
(12873, 18102), 
(12874, 18103), 
(12875, 18104), 
(12876, 18105), 
(12877, 18106), 
(12878, 18107), 
(12879, 18108); 

UPDATE `gossip_menu_option` SET `action_menu_id`=12854, `action_poi_id`=477 WHERE `menu_id`=8851 AND `id`=1;
UPDATE `gossip_menu_option` SET `action_menu_id`=12855 WHERE `menu_id`=8851 AND `id`=2;
UPDATE `gossip_menu_option` SET `action_menu_id`=12857, `action_poi_id`=478 WHERE `menu_id`=12855 AND `id`=0;
UPDATE `gossip_menu_option` SET `action_menu_id`=12858, `action_poi_id`=479 WHERE `menu_id`=12855 AND `id`=1;
UPDATE `gossip_menu_option` SET `action_menu_id`=12859, `action_poi_id`=480 WHERE `menu_id`=12855 AND `id`=2;
UPDATE `gossip_menu_option` SET `action_menu_id`=12860, `action_poi_id`=481 WHERE `menu_id`=12855 AND `id`=3;
UPDATE `gossip_menu_option` SET `action_menu_id`=12861, `action_poi_id`=482 WHERE `menu_id`=12855 AND `id`=4;
UPDATE `gossip_menu_option` SET `action_menu_id`=12862, `action_poi_id`=483 WHERE `menu_id`=12855 AND `id`=5;
UPDATE `gossip_menu_option` SET `action_menu_id`=12863, `action_poi_id`=484 WHERE `menu_id`=12855 AND `id`=6;
UPDATE `gossip_menu_option` SET `action_menu_id`=12864, `action_poi_id`=485 WHERE `menu_id`=12855 AND `id`=7;
UPDATE `gossip_menu_option` SET `action_menu_id`=12865 WHERE `menu_id`=8851 AND `id`=3;
UPDATE `gossip_menu_option` SET `action_menu_id`=12866, `action_poi_id`=486 WHERE `menu_id`=12865 AND `id`=0;
UPDATE `gossip_menu_option` SET `action_menu_id`=12867, `action_poi_id`=487 WHERE `menu_id`=12865 AND `id`=1;
UPDATE `gossip_menu_option` SET `action_menu_id`=12868, `action_poi_id`=488 WHERE `menu_id`=12865 AND `id`=2;
UPDATE `gossip_menu_option` SET `action_menu_id`=12869, `action_poi_id`=489 WHERE `menu_id`=12865 AND `id`=3;
UPDATE `gossip_menu_option` SET `action_menu_id`=12870, `action_poi_id`=490 WHERE `menu_id`=12865 AND `id`=4;
UPDATE `gossip_menu_option` SET `action_menu_id`=12871, `action_poi_id`=491 WHERE `menu_id`=12865 AND `id`=5;
UPDATE `gossip_menu_option` SET `action_menu_id`=12872, `action_poi_id`=492 WHERE `menu_id`=12865 AND `id`=6;
UPDATE `gossip_menu_option` SET `action_menu_id`=12873, `action_poi_id`=493 WHERE `menu_id`=12865 AND `id`=7;
UPDATE `gossip_menu_option` SET `action_menu_id`=12866, `action_poi_id`=494 WHERE `menu_id`=12865 AND `id`=8;
UPDATE `gossip_menu_option` SET `action_menu_id`=12874, `action_poi_id`=495 WHERE `menu_id`=12865 AND `id`=9;
UPDATE `gossip_menu_option` SET `action_menu_id`=12875, `action_poi_id`=496 WHERE `menu_id`=12865 AND `id`=10;
UPDATE `gossip_menu_option` SET `action_menu_id`=12876, `action_poi_id`=497 WHERE `menu_id`=12865 AND `id`=11;
UPDATE `gossip_menu_option` SET `action_menu_id`=12877, `action_poi_id`=498 WHERE `menu_id`=12865 AND `id`=12;
UPDATE `gossip_menu_option` SET `action_menu_id`=12878, `action_poi_id`=498 WHERE `menu_id`=12865 AND `id`=13;
UPDATE `gossip_menu_option` SET `action_menu_id`=12876, `action_poi_id`=499 WHERE `menu_id`=12865 AND `id`=14;
UPDATE `gossip_menu_option` SET `action_menu_id`=12879, `action_poi_id`=500 WHERE `menu_id`=12865 AND `id`=15;

DELETE FROM `npc_text` WHERE `ID` BETWEEN 18086 AND 18108;
INSERT INTO `npc_text` VALUES ('18086', 'Speak to Paymaster Lendry on the second floor of the barracks.\n\nHe can arrange to store your goods with Theramore\'s treasury.', 'Speak to Paymaster Lendry on the second floor of the barracks.\n\nHe can arrange to store your goods with Theramore\'s treasury.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18087', 'Look for Jensen Farran near the archery range.', 'Look for Jensen Farran near the archery range.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18088', 'You\'ll find Horace Alder pacing about above the ground level of Lady Proudmoore\'s tower.', 'You\'ll find Horace Alder pacing about above the ground level of Lady Proudmoore\'s tower.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18089', 'Look for Brother Karman overseeing training at the combat dummies outside the barracks.', 'Look for Brother Karman overseeing training at the combat dummies outside the barracks.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18090', 'Look for Allen Bright at the sparring ring near the barracks.\n\nHe and Doctor Gustaf VanHowzen oversee the training of the isle\'s healers.', 'Look for Allen Bright at the sparring ring near the barracks.\n\nHe and Doctor Gustaf VanHowzen oversee the training of the isle\'s healers.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18097', 'Ask for Marie Holdston at the smithy.', 'Ask for Marie Holdston at the smithy.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18091', 'I\'m not certain. Try asking Calia Hastings, by the docks. I\'m told she has connections to SI:7.', 'I\'m not certain. Try asking Calia Hastings, by the docks. I\'m told she has connections to SI:7.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18092', 'A shaman...?\n\nThere\'s a rather rough-looking dwarven lass staying in Theramore\'s inn; I believe she came to visit an old friend of hers here.\n\nShe might be able to help you.', 'A shaman...?\n\nThere\'s a rather rough-looking dwarven lass staying in Theramore\'s inn; I believe she came to visit an old friend of hers here.\n\nShe might be able to help you.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18093', 'Well... ah... don\'t tell her I sent you, but look for a red-robed woman above the ground level of the central tower.\n\nRedia Vaunt is her name. But do not mention me!', 'Well... ah... don\'t tell her I sent you, but look for a red-robed woman above the ground level of the central tower.\n\nRedia Vaunt is her name. But do not mention me!', '0', '1', '274', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18094', 'Report to Captain Evencane on the second level of the barracks. He can see to your training.', 'Report to Captain Evencane on the second level of the barracks. He can see to your training.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '15050');
INSERT INTO `npc_text` VALUES ('18095', 'Alchemist Narett and Brant Jasperbloom teach Alchemy and Herbalism out of a small shop here; they\'ll be able to help you.', 'Alchemist Narett and Brant Jasperbloom teach Alchemy and Herbalism out of a small shop here; they\'ll be able to help you.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18096', 'I know that one of those visiting Woolybush dwarves is an archaeologist.\n\nI think it\'s the wife, Faena. They\'re both explorers of some sort. Look for them in the inn.', 'I know that one of those visiting Woolybush dwarves is an archaeologist.\n\nI think it\'s the wife, Faena. They\'re both explorers of some sort. Look for them in the inn.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18098', 'Craig Nollward works the inn\'s kitchen. He\'ll be able to help you.', 'Craig Nollward works the inn\'s kitchen. He\'ll be able to help you.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18099', 'Lissah Spellwick, at the top of mage tower, is the mistress of Lady Jaina\'s enchanters.', 'Lissah Spellwick, at the top of mage tower, is the mistress of Lady Jaina\'s enchanters.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18100', 'Look for Caz Twosprocket at the smithy.', 'Look for Caz Twosprocket at the smithy.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '15595');
INSERT INTO `npc_text` VALUES ('18101', 'Doctor Gustaf VanHowzen works on the ground level of the barracks.', 'Doctor Gustaf VanHowzen works on the ground level of the barracks.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18102', 'Michael Crowe, down by the docks, can teach you anything you need to know about catching and gutting fish.', 'Michael Crowe, down by the docks, can teach you anything you need to know about catching and gutting fish.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18103', 'Look for Theoden Manners at the top of Lady Proudmoore\'s tower.', 'Look for Theoden Manners at the top of Lady Proudmoore\'s tower.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18104', 'I\'m certain that one of the visiting Woolybush dwarves is a jewelcrafter.\n\nI believe it\'s the husband, Ingo. They\'re both explorers of some sort. Look for them in the inn.', 'I\'m certain that one of the visiting Woolybush dwarves is a jewelcrafter.\n\nI believe it\'s the husband, Ingo. They\'re both explorers of some sort. Look for them in the inn.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18105', 'Seek out the Tanwell brothers in Theramore\'s inn. One of them will be able to help you.', 'Seek out the Tanwell brothers in Theramore\'s inn. One of them will be able to help you.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18106', 'Look out for the dwarf, Kerik, outside Theramore\'s smithy.\n\nHe\'s a drunkard and a bit free with the explosives, but he\'s friendly enough and knows his way around a mine.', 'Look out for the dwarf, Kerik, outside Theramore\'s smithy.\n\nHe\'s a drunkard and a bit free with the explosives, but he\'s friendly enough and knows his way around a mine.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18107', 'You\'ll want to find Sansha MacVince, just outside Theramore\'s stables.', 'You\'ll want to find Sansha MacVince, just outside Theramore\'s stables.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');
INSERT INTO `npc_text` VALUES ('18108', 'Timothy Worthington works out of the second floor of one of Theramore\'s larger buildings. He\'ll do you right.', 'Timothy Worthington works out of the second floor of one of Theramore\'s larger buildings. He\'ll do you right.', '0', '1', '396', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '14545');

DELETE FROM `points_of_interest` WHERE `entry` BETWEEN 477 AND 500;
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES
(477, -3721.332, -4538.389, 7, 99, 0, 'Theramore Banker'),
(478, -3779.576, -4542.243, 7, 99, 0, 'Theramore Hunter'),
(479, -3760.573, -4458.26, 7, 99, 0, 'Theramore Mage'),
(480, -3692.575, -4513.229, 7, 99, 0, 'Theramore Paladin'),
(481, -3651.748, -4501.245, 7, 99, 0, 'Theramore Priest'),
(482, -3819.238, -4563.955, 7, 99, 0, 'Theramore Rogue'),
(483, -3616.101, -4471.278, 7, 99, 0, 'Theramore Shaman'),
(484, -3744.523, -4435.247, 7, 99, 0, 'Theramore Warlock'),
(485, -3727.549, -4538.478, 7, 99, 0, 'Theramore Warrior'),
(486, -3700.832, -4331.733, 7, 99, 0, 'Theramore Alchemy'),
(487, -3618.908, -4454.213, 7, 99, 0, 'Theramore Archaeology'),
(488, -3785.925, -4366.835, 7, 99, 0, 'Theramore Blacksmithing'),
(489, -3617.13, -4486.976, 7, 99, 0, 'Theramore Cooking'),
(490, -3772.045, -4441.656, 7, 99, 0, 'Theramore Enchanting'),
(491, -3798.238, -4374.755, 7, 99, 0, 'Theramore Engineering'),
(492, -3747.083, -4532.172, 7, 99, 0, 'Theramore First Aid'),
(493, -3849.286, -4610.167, 7, 99, 0, 'Theramore Fishing'),
(494, -3697.021, -4335.253, 7, 99, 0, 'Theramore Herbalism'),
(495, -3774.651, -4448.427, 7, 99, 0, 'Theramore Inscription'),
(496, -3612.543, -4456.313, 7, 99, 0, 'Theramore Jewelcrafting'),
(497, -3613.028, -4461.912, 7, 99, 0, 'Theramore Leatherworking'),
(498, -3777.125, -4366.255, 7, 99, 0, 'Theramore Mining'),
(499, -3843.384, -4405.833, 7, 99, 0, 'Theramore Riding'),
(500, -3612.49, -4458.981, 7, 99, 0, 'Theramore Skinning');
