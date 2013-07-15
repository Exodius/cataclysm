DELETE FROM `trinity_string` WHERE `entry` = 788;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(788, '|cffff0000[%s]|cff3df500%s: |cffffcc00%s|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

DELETE FROM `command` WHERE `name` = ('admin');
DELETE FROM `command` WHERE `name` = ('server shutdown');
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('server shutdown', 6, 'Syntax: .server shutdown #seconds #Message [#message optional]\r\n\r\nThe Server Shutdowns after the #second value. You can optinal put a Message on it, to let your Players know whats happen'),
('admin', 6, 'Syntax: .aname $Message');