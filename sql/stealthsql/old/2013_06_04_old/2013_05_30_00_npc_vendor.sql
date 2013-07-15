--  http://www.wowhead.com/npc=52278
DELETE FROM `npc_vendor` WHERE `entry` = 52278;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES 
(52278, 19, 31779, 0, 0, 0, 1), 
(52278, 19, 31804, 0, 0, 0, 1), 
(52278, 19, 31776, 0, 0, 0, 1), 
(52278, 19, 5976, 0, 0, 0, 1), 
(52278, 19, 23999, 0, 0, 0, 1), 
(52278, 19, 31777, 0, 0, 0, 1), 
(52278, 19, 15198, 0, 0, 0, 1), 
(52278, 19, 32828, 0, 0, 0, 1), 
(52278, 19, 31781, 0, 0, 0, 1), 
(52278, 19, 32445, 0, 0, 0, 1), 
(52278, 19, 31775, 0, 0, 0, 1),
(52278, 19, 31778, 0, 0, 0, 1), 
(52278, 19, 31780, 0, 0, 0, 1), 
(52278, 19, 15196, 0, 0, 0, 1), 
(52278, 19, 19032, 0, 0, 0, 1), 
(52278, 19, 35221, 0, 0, 0, 1);

-- Brian Terrel'
SET @ENTRY := 49605;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,11308,1,3600,0),
(@ENTRY,0,5956,0,0,0),
(@ENTRY,0,3857,0,0,0),
(@ENTRY,0,44643,0,0,0),
(@ENTRY,0,44637,0,0,0),
(@ENTRY,0,18567,0,0,0),
(@ENTRY,0,3027,0,0,0),
(@ENTRY,0,2901,0,0,0),
(@ENTRY,0,3026,0,0,0),
(@ENTRY,0,3466,0,0,0),
(@ENTRY,0,2880,0,0,0);

-- Caelyb Coppercrag'
SET @ENTRY := 49592;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,5956,0,0,0),
(@ENTRY,0,3857,0,0,0),
(@ENTRY,0,18567,0,0,0),
(@ENTRY,0,2901,0,0,0),
(@ENTRY,0,3466,0,0,0),
(@ENTRY,0,2880,0,0,0);

-- Carrick Irongrin'
SET @ENTRY := 49575;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,5956,0,0,0),
(@ENTRY,0,3857,0,0,0),
(@ENTRY,0,18567,0,0,0),
(@ENTRY,0,2901,0,0,0),
(@ENTRY,0,3466,0,0,0),
(@ENTRY,0,2880,0,0,0);

-- Cecily Stormbrow'
SET @ENTRY := 49581;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,58261,5,3600,0),
(@ENTRY,0,58274,5,3600,0),
(@ENTRY,0,58275,5,3600,0),
(@ENTRY,0,58257,5,3600,0),
(@ENTRY,0,58260,5,3600,0),
(@ENTRY,0,58256,5,3600,0);

-- Glenda Breezeboot'
SET @ENTRY := 49578;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,63388,0,0,0),
(@ENTRY,0,64670,5,3600,0);

-- Logan Breezeboot'
SET @ENTRY := 49579;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,6532,0,0,0),
(@ENTRY,0,3371,5,3600,0),
(@ENTRY,0,38426,0,0,0),
(@ENTRY,0,20815,0,0,0),
(@ENTRY,0,39354,0,0,0),
(@ENTRY,0,14341,0,0,0),
(@ENTRY,0,39505,0,0,0);

-- Sloan Simmersquall'
SET @ENTRY := 49596;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,58261,5,3600,0),
(@ENTRY,0,58274,5,3600,0),
(@ENTRY,0,58275,5,3600,0),
(@ENTRY,0,58257,5,3600,0),
(@ENTRY,0,58260,5,3600,0),
(@ENTRY,0,58256,5,3600,0);

-- Winifred Earlywind'
SET @ENTRY := 49595;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,6532,0,0,0),
(@ENTRY,0,3371,5,3600,0),
(@ENTRY,0,38426,0,0,0),
(@ENTRY,0,20815,0,0,0),
(@ENTRY,0,39354,0,0,0),
(@ENTRY,0,14341,0,0,0),
(@ENTRY,0,39505,0,0,0);

-- Berkan Thunderfist'
SET @ENTRY := 49594;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,63388,0,0,0),
(@ENTRY,0,64670,5,3600,0);

-- Craw MacGraw'
SET @ENTRY := 49386;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,62432,0,0,0),
(@ENTRY,0,62434,0,0,0),
(@ENTRY,0,62427,0,0,0),
(@ENTRY,0,62428,0,0,0),
(@ENTRY,0,62424,0,0,0),
(@ENTRY,0,62430,0,0,0),
(@ENTRY,0,62423,0,0,0),
(@ENTRY,0,62429,0,0,0),
(@ENTRY,0,65908,0,0,0);

-- Tarm Deepgale'
SET @ENTRY := 49593;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,37460,0,0,0);

-- Baird Darkfeather'
SET @ENTRY := 49577;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,37460,0,0,0);

-- Bren Stoneforge'
SET @ENTRY := 49800;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,5956,0,0,0),
(@ENTRY,0,3857,0,0,0),
(@ENTRY,0,18567,0,0,0),
(@ENTRY,0,2901,0,0,0),
(@ENTRY,0,3466,0,0,0),
(@ENTRY,0,2880,0,0,0);

-- Kennen'
SET @ENTRY := 49803;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,37460,0,0,0);

-- Hurley Hoppleham'
SET @ENTRY := 49802;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,58261,5,3600,0),
(@ENTRY,0,58274,5,3600,0),
(@ENTRY,0,58275,5,3600,0),
(@ENTRY,0,58257,5,3600,0),
(@ENTRY,0,58260,5,3600,0),
(@ENTRY,0,58256,5,3600,0);

-- Dierdre'
SET @ENTRY := 49805;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,6532,0,0,0),
(@ENTRY,0,3371,5,3600,0),
(@ENTRY,0,38426,0,0,0),
(@ENTRY,0,20815,0,0,0),
(@ENTRY,0,39354,0,0,0),
(@ENTRY,0,14341,0,0,0),
(@ENTRY,0,39505,0,0,0);

-- Philip O\'Tool'
SET @ENTRY := 49723;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,2528,0,0,0),
(@ENTRY,0,2530,0,0,0),
(@ENTRY,0,2531,0,0,0),
(@ENTRY,0,2532,0,0,0),
(@ENTRY,0,2534,0,0,0),
(@ENTRY,0,2533,0,0,0),
(@ENTRY,0,2535,0,0,0),
(@ENTRY,0,2529,0,0,0);

-- Richard Maschner'
SET @ENTRY := 49726;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,5956,0,0,0),
(@ENTRY,0,3857,0,0,0),
(@ENTRY,0,18567,0,0,0),
(@ENTRY,0,2901,0,0,0),
(@ENTRY,0,3466,0,0,0),
(@ENTRY,0,2880,0,0,0);

-- Oslow Pliny'
SET @ENTRY := 49707;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,20815,0,0,0),
(@ENTRY,0,52188,0,0,0);

-- Dorgan Slagfist'
SET @ENTRY := 49695;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,5956,0,0,0),
(@ENTRY,0,3857,0,0,0),
(@ENTRY,0,18567,0,0,0),
(@ENTRY,0,2901,0,0,0),
(@ENTRY,0,3466,0,0,0),
(@ENTRY,0,2880,0,0,0);

-- Brundall Chiselgut'
SET @ENTRY := 50382;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,66100,0,0,0),
(@ENTRY,0,66113,0,0,0),
(@ENTRY,0,66106,0,0,0),
(@ENTRY,0,66115,0,0,0),
(@ENTRY,0,66107,0,0,0),
(@ENTRY,0,67603,0,0,0),
(@ENTRY,0,66111,0,0,0),
(@ENTRY,0,66112,0,0,0),
(@ENTRY,0,66114,0,0,0),
(@ENTRY,0,66110,0,0,0),
(@ENTRY,0,66116,0,0,0),
(@ENTRY,0,67606,0,0,0),
(@ENTRY,0,66105,0,0,0),
(@ENTRY,0,66104,0,0,0),
(@ENTRY,0,66109,0,0,0),
(@ENTRY,0,66108,0,0,0),
(@ENTRY,0,66101,0,0,0),
(@ENTRY,0,66103,0,0,0),
(@ENTRY,0,66127,0,0,0),
(@ENTRY,0,66128,0,0,0),
(@ENTRY,0,66125,0,0,0),
(@ENTRY,0,66132,0,0,0),
(@ENTRY,0,66126,0,0,0),
(@ENTRY,0,66131,0,0,0),
(@ENTRY,0,66130,0,0,0),
(@ENTRY,0,66129,0,0,0),
(@ENTRY,0,66119,0,0,0),
(@ENTRY,0,66120,0,0,0),
(@ENTRY,0,66117,0,0,0),
(@ENTRY,0,66124,0,0,0),
(@ENTRY,0,66118,0,0,0),
(@ENTRY,0,66123,0,0,0),
(@ENTRY,0,66122,0,0,0),
(@ENTRY,0,66121,0,0,0);

-- Deorim'
SET @ENTRY := 50458;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,10938,1,3600,0),
(@ENTRY,0,6217,0,0,0),
(@ENTRY,0,38682,0,0,0),
(@ENTRY,0,4470,0,0,0),
(@ENTRY,0,11291,0,0,0),
(@ENTRY,0,10940,1,3600,0);

-- Leah Drewry'
SET @ENTRY := 49705;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,2325,0,0,0),
(@ENTRY,0,2324,0,0,0),
(@ENTRY,0,6260,0,0,0),
(@ENTRY,0,2320,0,0,0),
(@ENTRY,0,38426,0,0,0),
(@ENTRY,0,2321,0,0,0),
(@ENTRY,0,4340,0,0,0),
(@ENTRY,0,2605,0,0,0),
(@ENTRY,0,8343,0,0,0),
(@ENTRY,0,6261,0,0,0),
(@ENTRY,0,10290,0,0,0),
(@ENTRY,0,4342,0,0,0),
(@ENTRY,0,2604,0,0,0),
(@ENTRY,0,14341,0,0,0),
(@ENTRY,0,4291,0,0,0),
(@ENTRY,0,4341,0,0,0);

-- Senthii'
SET @ENTRY := 50134;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,52736,0,0,0),
(@ENTRY,0,52733,0,0,0),
(@ENTRY,0,52735,0,0,0),
(@ENTRY,0,67312,0,0,0),
(@ENTRY,0,64411,0,0,0),
(@ENTRY,0,64412,0,0,0),
(@ENTRY,0,52738,0,0,0),
(@ENTRY,0,64413,0,0,0),
(@ENTRY,0,52740,0,0,0),
(@ENTRY,0,52739,0,0,0),
(@ENTRY,0,52737,0,0,0),
(@ENTRY,0,64414,0,0,0),
(@ENTRY,0,64415,0,0,0);

-- Casandra Downs'
SET @ENTRY := 49703;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,39489,0,0,0),
(@ENTRY,0,67348,0,0,0),
(@ENTRY,0,3371,5,3600,0),
(@ENTRY,0,62323,0,0,0),
(@ENTRY,0,63388,0,0,0),
(@ENTRY,0,39354,0,0,0),
(@ENTRY,0,67319,0,0,0),
(@ENTRY,0,68047,0,0,0),
(@ENTRY,0,67335,0,0,0),
(@ENTRY,0,68810,0,0,0),
(@ENTRY,0,64670,5,3600,0),
(@ENTRY,0,39505,0,0,0);

-- Frank Natale'
SET @ENTRY := 49702;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,59491,0,0,0),
(@ENTRY,0,59480,0,0,0),
(@ENTRY,0,68660,0,0,0),
(@ENTRY,0,59489,0,0,0),
(@ENTRY,0,59479,0,0,0),
(@ENTRY,0,59493,0,0,0),
(@ENTRY,0,59478,0,0,0),
(@ENTRY,0,59496,0,0,0),
(@ENTRY,0,59477,0,0,0),
(@ENTRY,0,5956,0,0,0),
(@ENTRY,0,3857,0,0,0),
(@ENTRY,0,10647,0,0,0),
(@ENTRY,0,39684,0,0,0),
(@ENTRY,0,4400,0,0,0),
(@ENTRY,0,20815,0,0,0),
(@ENTRY,0,39354,0,0,0),
(@ENTRY,0,2901,0,0,0),
(@ENTRY,0,30746,0,0,0),
(@ENTRY,0,3466,0,0,0),
(@ENTRY,0,40533,0,0,0),
(@ENTRY,0,2880,0,0,0),
(@ENTRY,0,4399,0,0,0);

-- Sal Ferraga'
SET @ENTRY := 50386;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,54601,0,0,0),
(@ENTRY,0,68199,0,0,0),
(@ENTRY,0,54603,0,0,0),
(@ENTRY,0,54602,0,0,0),
(@ENTRY,0,54604,0,0,0),
(@ENTRY,0,54605,0,0,0),
(@ENTRY,0,54599,0,0,0),
(@ENTRY,0,54600,0,0,0),
(@ENTRY,0,54593,0,0,0),
(@ENTRY,0,54594,0,0,0),
(@ENTRY,0,54595,0,0,0),
(@ENTRY,0,54596,0,0,0),
(@ENTRY,0,54597,0,0,0),
(@ENTRY,0,54598,0,0,0);

-- Evan Silvia'
SET @ENTRY := 49704;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,58274,5,3600,0),
(@ENTRY,0,58263,5,3600,0),
(@ENTRY,0,58257,5,3600,0),
(@ENTRY,0,58269,5,3600,0),
(@ENTRY,0,58268,5,3600,0),
(@ENTRY,0,58277,5,3600,0),
(@ENTRY,0,58262,5,3600,0),
(@ENTRY,0,58256,5,3600,0),
(@ENTRY,0,58280,5,3600,0);

-- Ashley Downs'
SET @ENTRY := 49733;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,63388,0,0,0),
(@ENTRY,0,64670,5,3600,0);

-- Lynn Baxter'
SET @ENTRY := 49729;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,3024,0,0,0),
(@ENTRY,0,3025,0,0,0),
(@ENTRY,0,2723,0,0,0),
(@ENTRY,0,2594,0,0,0),
(@ENTRY,0,2593,0,0,0),
(@ENTRY,0,2511,0,0,0),
(@ENTRY,0,2595,0,0,0),
(@ENTRY,0,3023,0,0,0),
(@ENTRY,0,2596,0,0,0);

-- Misty Merriweather'
SET @ENTRY := 50381;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,52980,0,0,0),
(@ENTRY,0,67095,0,0,0),
(@ENTRY,0,67070,0,0,0),
(@ENTRY,0,67084,0,0,0),
(@ENTRY,0,67094,0,0,0),
(@ENTRY,0,67073,0,0,0),
(@ENTRY,0,67100,0,0,0),
(@ENTRY,0,68193,0,0,0),
(@ENTRY,0,71721,0,0,0),
(@ENTRY,0,67068,0,0,0),
(@ENTRY,0,67082,0,0,0),
(@ENTRY,0,67072,0,0,0),
(@ENTRY,0,67083,0,0,0),
(@ENTRY,0,67096,0,0,0),
(@ENTRY,0,67064,0,0,0),
(@ENTRY,0,67063,0,0,0),
(@ENTRY,0,67049,0,0,0),
(@ENTRY,0,67090,0,0,0),
(@ENTRY,0,67053,0,0,0),
(@ENTRY,0,67091,0,0,0),
(@ENTRY,0,67079,0,0,0),
(@ENTRY,0,67078,0,0,0),
(@ENTRY,0,67080,0,0,0),
(@ENTRY,0,67065,0,0,0),
(@ENTRY,0,67054,0,0,0),
(@ENTRY,0,67093,0,0,0),
(@ENTRY,0,67066,0,0,0),
(@ENTRY,0,67081,0,0,0),
(@ENTRY,0,67092,0,0,0),
(@ENTRY,0,67055,0,0,0),
(@ENTRY,0,67076,0,0,0),
(@ENTRY,0,67060,0,0,0),
(@ENTRY,0,67046,0,0,0),
(@ENTRY,0,67087,0,0,0),
(@ENTRY,0,67048,0,0,0),
(@ENTRY,0,67077,0,0,0),
(@ENTRY,0,67089,0,0,0),
(@ENTRY,0,67062,0,0,0),
(@ENTRY,0,67044,0,0,0),
(@ENTRY,0,67058,0,0,0),
(@ENTRY,0,67042,0,0,0),
(@ENTRY,0,67075,0,0,0),
(@ENTRY,0,67056,0,0,0),
(@ENTRY,0,67086,0,0,0),
(@ENTRY,0,67085,0,0,0),
(@ENTRY,0,67074,0,0,0);

-- Alexandra Merriweather'
SET @ENTRY := 49714;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,2325,0,0,0),
(@ENTRY,0,6260,0,0,0),
(@ENTRY,0,2320,0,0,0),
(@ENTRY,0,38426,0,0,0),
(@ENTRY,0,2321,0,0,0),
(@ENTRY,0,4340,0,0,0),
(@ENTRY,0,2605,0,0,0),
(@ENTRY,0,8343,0,0,0),
(@ENTRY,0,6261,0,0,0),
(@ENTRY,0,10290,0,0,0),
(@ENTRY,0,4342,0,0,0),
(@ENTRY,0,2604,0,0,0),
(@ENTRY,0,14341,0,0,0),
(@ENTRY,0,4289,0,0,0),
(@ENTRY,0,4291,0,0,0),
(@ENTRY,0,7005,0,0,0),
(@ENTRY,0,4341,0,0,0);

-- Bonnie Hennigan'
SET @ENTRY := 49689;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,37460,0,0,0);

-- Matthew Churchill'
SET @ENTRY := 49600;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,37460,0,0,0);

-- Daniel Lanchester'
SET @ENTRY := 49601;
DELETE FROM `npc_vendor` WHERE `entry`=@ENTRY;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
(@ENTRY,0,63388,0,0,0),
(@ENTRY,0,64670,5,3600,0);
