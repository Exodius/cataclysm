DELETE FROM gossip_menu_option WHERE menu_id=435;
INSERT INTO `gossip_menu_option` VALUES ('435', '15', '0', 'Vendor', '1', '1', '0', '470', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '14', '0', 'Stable Master', '1', '1', '4925', '26', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '13', '0', 'Profession Trainer', '1', '1', '421', '0', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '12', '0', 'Portals', '1', '1', '0', '471', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '11', '0', 'Points of Interest', '1', '1', '0', '473', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '10', '0', 'Mailbox', '1', '1', '0', '472', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '9', '0', 'Inn', '1', '1', '3126', '22', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '8', '0', 'Guild Master & Vendor', '1', '1', '383', '24', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '7', '0', 'Flight Master', '1', '1', '382', '23', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '6', '0', 'Class Trainer', '1', '1', '401', '0', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '5', '0', 'Barber', '1', '1', '382', '30', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '4', '0', 'Bank', '1', '1', '265', '19', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '3', '0', 'Auction House', '1', '1', '3102', '18', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '2', '0', '|cFF0008E8NEW|r: Void Storage', '1', '1', '36800', '475', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '1', '0', '|cFF0008E8NEW|r: Transmogrification', '1', '1', '36800', '476', '0', '0', '');
INSERT INTO `gossip_menu_option` VALUES ('435', '0', '0', '|cFF0008E8NEW|r: Reforging', '1', '1', '36800', '474', '0', '0', '');

DELETE FROM points_of_interest WHERE entry IN (18, 19, 22, 23, 24, 26, 30, 470, 471, 472, 473, 474, 475, 476);
INSERT INTO `points_of_interest` VALUES ('18', '-8845', '628', '7', '99', '0', 'Stormwind Auction House');
INSERT INTO `points_of_interest` VALUES ('19', '-8819', '632', '7', '99', '0', 'Stormwind Bank');
INSERT INTO `points_of_interest` VALUES ('22', '-8867', '673.634', '7', '99', '0', 'The Gilded Rose');
INSERT INTO `points_of_interest` VALUES ('23', '-8839', '487.546', '7', '99', '0', 'Stormwind Gryphon Master');
INSERT INTO `points_of_interest` VALUES ('24', '-8886', '595.38', '7', '99', '0', 'Stormwind Visitor\'s Center');
INSERT INTO `points_of_interest` VALUES ('26', '-8432', '555.121', '7', '99', '0', 'Jenova Stoneshield');
INSERT INTO `points_of_interest` VALUES ('30', '-8755', '657.7', '7', '99', '0', 'Stormwind Barber');
INSERT INTO `points_of_interest` VALUES ('470', '-8776', '413', '7', '0', '0', 'Stormind Vendors');
INSERT INTO `points_of_interest` VALUES ('471', '-8210', '428', '7', '0', '0', 'Stormwind Portals Direction');
INSERT INTO `points_of_interest` VALUES ('472', '-8862', '638', '7', '0', '0', 'Mailbox Stormwind');
INSERT INTO `points_of_interest` VALUES ('473', '-8834', '619', '7', '0', '0', 'Points of Interest Stormwind');
INSERT INTO `points_of_interest` VALUES ('474', '-8693', '843', '7', '0', '0', 'Reforger Stormwind');
INSERT INTO `points_of_interest` VALUES ('475', '-8696', '841', '7', '0', '0', 'Void Storage Stormwind');
INSERT INTO `points_of_interest` VALUES ('476', '-8696', '841', '7', '0', '0', 'Transmogrification Stormwind');

DELETE FROM npc_text VALUES ID = '36800';
INSERT INTO `npc_text` VALUES ('36800', 'It is located in the The Canals .  It is nearly straight on from the entrance of Cathedral Square.', 'It is located in the The Canals citizen.  It is nearly straight on from the entrance of Cathedral Square.', '0', '1', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', null, null, '0', '0', '0', '0', '0', '0', '0', '0', '1');

-- btw i test before push mister MOS and 0 error
