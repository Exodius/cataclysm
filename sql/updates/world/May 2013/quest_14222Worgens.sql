-- Lord Darius Crowley
SET @ENTRY := 35566;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,19,0,100,0,14222,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1612.78,1531.17,29.2295,6.06306,"on accept quest summon worgen"),
(@ENTRY,@SOURCETYPE,1,2,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1568.56,1542.25,30.5469,3.82863,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,2,3,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1572.34,1544.09,29.2044,3.8672,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,3,4,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1575.35,1535.95,29.2177,3.79102,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,4,5,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1577.5,1521.8,29.2209,2.70077,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,5,6,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1581.37,1509.8,29.2295,2.05596,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,6,7,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1581.52,1544.17,29.218,4.5615,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,7,8,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1583.95,1522.15,29.2315,3.64965,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,8,9,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1587.29,1530.2,29.2265,3.8892,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,9,10,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1587.63,1543.86,29.2268,4.61726,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,10,11,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1590.72,1533.3,29.2293,0.06352,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,11,12,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1607.7,1537.38,29.23,5.24153,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,12,13,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1604.42,1537.31,29.2295,5.04204,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,13,14,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1601.95,1504.42,29.2359,3.43995,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,14,15,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1590.72,1533.3,29.2293,0.06352,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,15,16,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1589.13,1529.14,29.2314,0.494787,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,16,17,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1602.35,1507.24,29.2491,4.82861,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,17,18,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1582.82,1540.9,29.2231,1.34851,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,18,19,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1604.67,1532.28,29.2288,1.97683,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,19,20,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1571.19,1541.67,29.2063,6.2439,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,20,21,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1608.6,1528.87,29.229,2.45592,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,21,22,61,0,100,0,0,0,0,0,12,35627,3,90000,0,0,0,8,0,0,0,-1583.88,1512.24,29.2303,5.55903,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,22,23,61,0,100,0,0,0,0,0,12,36057,3,90000,0,0,0,8,0,0,0,-1583.88,1512.24,29.2303,5.55903,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,23,24,61,0,100,0,0,0,0,0,12,36057,3,90000,0,0,0,8,0,0,0,-1608.6,1528.87,29.229,5.55903,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,24,25,61,0,100,0,0,0,0,0,12,36057,3,90000,0,0,0,8,0,0,0,-1571.19,1541.67,29.2063,5.55903,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,25,26,61,0,100,0,0,0,0,0,12,36057,3,90000,0,0,0,8,0,0,0,-1604.67,1532.28,29.2288,5.55903,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,26,27,61,0,100,0,0,0,0,0,12,36057,3,90000,0,0,0,8,0,0,0,-1582.82,1540.9,29.2231,5.55903,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,27,28,61,0,100,0,0,0,0,0,12,36057,3,90000,0,0,0,8,0,0,0,-1602.35,1507.24,29.2491,5.55903,"on accept quest summon trigger"),
(@ENTRY,@SOURCETYPE,28,0,61,0,100,0,0,0,0,0,12,36057,3,90000,0,0,0,8,0,0,0,-1589.13,1529.14,29.2314,5.55903,"on accept quest summon trigger");
