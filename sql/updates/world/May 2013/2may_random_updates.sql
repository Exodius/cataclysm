-- Trade Prince Gallywix
 SET @ENTRY := 36403;
 SET @SOURCETYPE := 0;
 DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE; 
 UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1; 
 INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES (@ENTRY,@SOURCETYPE,1,0,1,0,50,0,30000,125000,30000,125000,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"TEXT phase 1"), 
 (@ENTRY,@SOURCETYPE,2,0,19,0,100,0,14120,0,0,0,28,59074,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Remove aura 59074 when quest add 14120"), (@ENTRY,@SOURCETYPE,3,0,20,0,100,0,14126,0,0,0,28,68481,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Remove aura 68481 when quest end 14126"), (@ENTRY,@SOURCETYPE,4,0,20,0,100,0,14126,0,0,0,75,69010,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Put aura on quest end"), 
 (@ENTRY,@SOURCETYPE,5,0,20,0,100,0,14126,0,0,0,62,648,0,0,0,0,0,7,0,0,0,533.77,3274.62,0.198,4.9,"Teleport"), 
 (@ENTRY,@SOURCETYPE,6,0,20,0,100,0,14126,0,0,0,68,22,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Play Movie");
