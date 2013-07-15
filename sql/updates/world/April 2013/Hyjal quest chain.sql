-- http://www.wowhead.com/quest=27726 // http://www.wowhead.com/quest=27721   Hero's Call: Mount Hyjal! // Warchief's Command: Mount Hyjal!
UPDATE quest_template SET NextQuestIdChain=25316, ExclusiveGroup=27726, NextQuestid=25316 WHERE id=27726;
UPDATE quest_template SET NextQuestIdChain=25316, ExclusiveGroup=27726, NextQuestid=25316 WHERE id=27721;
UPDATE quest_template SET NextQuestIdChain=25317 WHERE id=25316;
UPDATE quest_template SET NextQuestIdChain=25430, PrevQuestId=25316 WHERE id=25317;
UPDATE quest_template SET NextQuestIdChain=25320, PrevQuestId=25317 WHERE id=25430;
UPDATE quest_template SET PrevQuestId=25430 WHERE id=25320;
UPDATE quest_template SET NextQuestIdChain=25321 WHERE id=25320;
UPDATE quest_template SET NextQuestIdChain=25424, PrevQuestId=25320 WHERE id=25321;
UPDATE quest_template SET NextQuestIdChain=25324, PrevQuestId=25321 WHERE id=25424;
UPDATE quest_template SET NextQuestIdChain=25325, PrevQuestId=25424 WHERE id=25324;
UPDATE quest_template SET PrevQuestId=25324 WHERE id=25325;
UPDATE quest_template SET NextQuestIdChain=25578 WHERE id=25325;
UPDATE quest_template SET PrevQuestId=25325 WHERE id=25578;


-- http://www.wowhead.com/quest=25584  The Return of the Ancients
UPDATE quest_template SET NextQuestIdChain=25233 WHERE id=25584;
UPDATE quest_template SET PrevQuestId=25584 WHERE id=25233;
UPDATE quest_template SET PrevQuestId=25233, ExclusiveGroup=25268 WHERE id=25268;
UPDATE quest_template SET PrevQuestId=25233, ExclusiveGroup=25268 WHERE id=25269;


-- http://www.wowhead.com/quest=25611  Return from the Firelands
UPDATE quest_template SET NextQuestIdChain=25404 WHERE id=25611;
UPDATE quest_template SET NextQuestIdChain=25408, PrevQuestId=25611 WHERE id=25404;
UPDATE quest_template SET NextQuestIdChain=25411, PrevQuestId=25404 WHERE id=25408;
UPDATE quest_template SET NextQuestIdChain=25412, PrevQuestId=25408 WHERE id=25411;
UPDATE quest_template SET PrevQuestId=25411 WHERE id=25412;
UPDATE quest_template SET NextQuestIdChain=25428 WHERE id=25412;
UPDATE quest_template SET PrevQuestId=25412 WHERE id=25428;
UPDATE quest_template SET NextQuestIdChain=25385 WHERE id=25611;
UPDATE quest_template SET NextQuestIdChain=25392, PrevQuestId=25611 WHERE id=25385;
UPDATE quest_template SET PrevQuestId=25385 WHERE id=25392;

-- http://www.wowhead.com/quest=25316  As Hyjal Burns
UPDATE quest_template SET NextQuestIdChain=25460 WHERE id=25316;
UPDATE quest_template SET PrevQuestId=25316 WHERE id=25460;
UPDATE quest_template SET NextQuestIdChain=25370 WHERE id=25316;
UPDATE quest_template SET NextQuestIdChain=25574, PrevQuestId=25316 WHERE id=25370;
UPDATE quest_template SET PrevQuestId=25370 WHERE id=25574;


-- http://www.wowhead.com/quest=25317  Protect the World Tree
UPDATE quest_template SET NextQuestIdChain=25319 WHERE id=25317;
UPDATE quest_template SET PrevQuestId=25317 WHERE id=25319;
UPDATE quest_template SET NextQuestIdChain=25472 WHERE id=25317;
UPDATE quest_template SET NextQuestIdChain=25323, PrevQuestId=25317 WHERE id=25472;
UPDATE quest_template SET NextQuestIdChain=25464, PrevQuestId=25472 WHERE id=25323;
UPDATE quest_template SET PrevQuestId=25323 WHERE id=25464;


-- http://www.wowhead.com/quest=25353 // http://www.wowhead.com/quest=25355    Lightning in a Bottle
UPDATE quest_template SET NextQuestIdChain=25352, ExclusiveGroup=25353, NextQuestid=25352 WHERE id=25353;
UPDATE quest_template SET NextQuestIdChain=25352, ExclusiveGroup=25355, NextQuestid=25352 WHERE id=25355;
UPDATE quest_template SET NextQuestIdChain=25354, ExclusiveGroup=25353, NextQuestid=25354 WHERE id=25353;
UPDATE quest_template SET NextQuestIdChain=25354, ExclusiveGroup=25355, NextQuestid=25354 WHERE id=25355;


-- http://www.wowhead.com/quest=25630  The Fires of Mount Hyjal
UPDATE quest_template SET NextQuestIdChain=25630 WHERE id=25611;
UPDATE quest_template SET NextQuestIdChain=25381, PrevQuestId=25611 WHERE id=25630;
UPDATE quest_template SET PrevQuestId=25630 WHERE id=25381;
UPDATE quest_template SET NextQuestIdChain=25382 WHERE id=25630;
UPDATE quest_template SET NextQuestIdChain=25940, PrevQuestId=25630 WHERE id=25382;
UPDATE quest_template SET NextQuestIdChain=25462, PrevQuestId=25382 WHERE id=25940;
UPDATE quest_template SET NextQuestIdChain=25490, PrevQuestId=25940 WHERE id=25462;
UPDATE quest_template SET PrevQuestId=25462 WHERE id=25490;
UPDATE quest_template SET NextQuestIdChain=25491 WHERE id=25490;
UPDATE quest_template SET PrevQuestId=25490 WHERE id=25491;
UPDATE quest_template SET NextQuestIdChain=25492 WHERE id=25490;
UPDATE quest_template SET NextQuestIdChain=25502, PrevQuestId=25490 WHERE id=25492;
UPDATE quest_template SET PrevQuestId=25492 WHERE id=25502;
UPDATE quest_template SET NextQuestIdChain=25493 WHERE id=25490;
UPDATE quest_template SET NextQuestIdChain=25507, PrevQuestId=25490 WHERE id=25493;
UPDATE quest_template SET NextQuestIdChain=25510, PrevQuestId=25493 WHERE id=25507;
UPDATE quest_template SET PrevQuestId=25507 WHERE id=25510;
UPDATE quest_template SET PrevQuestId=25510, NextQuestIdChain=25520, ExclusiveGroup=-25514 WHERE id=25514;
UPDATE quest_template SET PrevQuestId=25510, NextQuestIdChain=25520, ExclusiveGroup=-25514 WHERE id=25519;
UPDATE quest_template SET NextQuestIdChain=25985 WHERE id=25520;
UPDATE quest_template SET PrevQuestId=25520 WHERE id=25985;
UPDATE quest_template SET NextQuestIdChain=25663, ExclusiveGroup=25985, NextQuestid=25663 WHERE id=25985;
UPDATE quest_template SET NextQuestIdChain=25663, ExclusiveGroup=25985, NextQuestid=25663 WHERE id=27874;
UPDATE quest_template SET NextQuestIdChain=25665 WHERE id=25663;
UPDATE quest_template SET NextQuestIdChain=25664, PrevQuestId=25663 WHERE id=25665;
UPDATE quest_template SET PrevQuestId=25665 WHERE id=25664;
UPDATE quest_template SET PrevQuestId=25985, NextQuestIdChain=25731, ExclusiveGroup=-25655 WHERE id=25655;
UPDATE quest_template SET PrevQuestId=25985, NextQuestIdChain=25731, ExclusiveGroup=-25655 WHERE id=25656;
UPDATE quest_template SET NextQuestIdChain=25740 WHERE id=25731;
UPDATE quest_template SET NextQuestIdChain=25746, PrevQuestId=25731 WHERE id=25740;
UPDATE quest_template SET PrevQuestId=25740 WHERE id=25746;
UPDATE quest_template SET NextQuestIdChain=25758 WHERE id=25740;
UPDATE quest_template SET NextQuestIdChain=25761, PrevQuestId=25740 WHERE id=25758;
UPDATE quest_template SET PrevQuestId=25758 WHERE id=25761;
UPDATE quest_template SET NextQuestIdChain=25763 WHERE id=25740;
UPDATE quest_template SET NextQuestIdChain=25764, PrevQuestId=25740 WHERE id=25763;
UPDATE quest_template SET PrevQuestId=25763 WHERE id=25764;
UPDATE quest_template SET NextQuestIdChain=25776, ExclusiveGroup=-25761, NextQuestid=25776 WHERE id=25761;
UPDATE quest_template SET NextQuestIdChain=25776, ExclusiveGroup=-25761, NextQuestid=25776 WHERE id=25764;
UPDATE quest_template SET NextQuestIdChain=25795 WHERE id=25776;
UPDATE quest_template SET NextQuestIdChain=25807, PrevQuestId=25776 WHERE id=25795;
UPDATE quest_template SET PrevQuestId=25795 WHERE id=25807;
UPDATE quest_template SET NextQuestIdChain=25810 WHERE id=25807;
UPDATE quest_template SET NextQuestIdChain=25523, PrevQuestId=25807 WHERE id=25810;
UPDATE quest_template SET NextQuestIdChain=25525, PrevQuestId=25810 WHERE id=25523;
UPDATE quest_template SET NextQuestIdChain=25544, PrevQuestId=25523 WHERE id=25525;
UPDATE quest_template SET PrevQuestId=25525 WHERE id=25544;
UPDATE quest_template SET NextQuestIdChain=25560 WHERE id=25544;
UPDATE quest_template SET NextQuestIdChain=25832, PrevQuestId=25544 WHERE id=25560;
UPDATE quest_template SET NextQuestIdChain=25525, PrevQuestId=25560 WHERE id=25832;
UPDATE quest_template SET NextQuestIdChain=25830, PrevQuestId=25832 WHERE id=25525;
UPDATE quest_template SET PrevQuestId=25525 WHERE id=25830;
UPDATE quest_template SET NextQuestIdChain=25842 WHERE id=25830;
UPDATE quest_template SET NextQuestIdChain=25372, PrevQuestId=25830 WHERE id=25842;
UPDATE quest_template SET NextQuestIdChain=25843, PrevQuestId=25842 WHERE id=25372;
UPDATE quest_template SET NextQuestIdChain=25904, PrevQuestId=25372 WHERE id=25843;
UPDATE quest_template SET PrevQuestId=25843 WHERE id=25904;
UPDATE quest_template SET NextQuestIdChain=25906 WHERE id=25904;
UPDATE quest_template SET NextQuestIdChain=25910, PrevQuestId=25904 WHERE id=25906;
UPDATE quest_template SET PrevQuestId=25906 WHERE id=25910;
UPDATE quest_template SET NextQuestIdChain=25915 WHERE id=25906;
UPDATE quest_template SET NextQuestIdChain=25923, PrevQuestId=25906 WHERE id=25915;
UPDATE quest_template SET NextQuestIdChain=25928, PrevQuestId=25915 WHERE id=25923;
UPDATE quest_template SET NextQuestIdChain=25653, PrevQuestId=25923 WHERE id=25928;
UPDATE quest_template SET PrevQuestId=25928 WHERE id=25653;
UPDATE quest_template SET NextQuestIdChain=25597 WHERE id=25653;
UPDATE quest_template SET NextQuestIdChain=25274, PrevQuestId=25653 WHERE id=25597;
UPDATE quest_template SET NextQuestIdChain=25276, PrevQuestId=25597 WHERE id=25274;
UPDATE quest_template SET PrevQuestId=25274 WHERE id=25276;
UPDATE quest_template SET NextQuestIdChain=25881 WHERE id=25843;
UPDATE quest_template SET NextQuestIdChain=25886, PrevQuestId=25843 WHERE id=25881;
UPDATE quest_template SET PrevQuestId=25881 WHERE id=25886;
UPDATE quest_template SET NextQuestIdChain=25899 WHERE id=25843;
UPDATE quest_template SET NextQuestIdChain=25901, PrevQuestId=25843 WHERE id=25899;
UPDATE quest_template SET PrevQuestId=25899 WHERE id=25901;
UPDATE quest_template SET NextQuestIdChain=25223 WHERE id=25276;
UPDATE quest_template SET PrevQuestId=25276 WHERE id=25223;
UPDATE quest_template SET NextQuestIdChain=25224 WHERE id=25276;
UPDATE quest_template SET PrevQuestId=25276 WHERE id=25224;
UPDATE quest_template SET NextQuestIdChain=25330 WHERE id=25276;
UPDATE quest_template SET PrevQuestId=25276 WHERE id=25330;
UPDATE quest_template SET NextQuestIdChain=25291, ExclusiveGroup=-25330, NextQuestid=25291 WHERE id=25330;
UPDATE quest_template SET NextQuestIdChain=25291, ExclusiveGroup=-25330, NextQuestid=25291 WHERE id=25223;
UPDATE quest_template SET NextQuestIdChain=25291, ExclusiveGroup=-25330, NextQuestid=25291 WHERE id=25224;
UPDATE quest_template SET NextQuestIdChain=25509 WHERE id=25291;
UPDATE quest_template SET NextQuestIdChain=25499, PrevQuestId=25291 WHERE id=25509;
UPDATE quest_template SET NextQuestIdChain=25299, PrevQuestId=25509 WHERE id=25499;
UPDATE quest_template SET NextQuestIdChain=25309, PrevQuestId=25499 WHERE id=25299;
UPDATE quest_template SET PrevQuestId=25299 WHERE id=25309;
UPDATE quest_template SET NextQuestIdChain=25584 WHERE id=25578;
UPDATE quest_template SET PrevQuestId=25578 WHERE id=25584;
UPDATE quest_template SET PrevQuestId=25584 WHERE id=25233;
UPDATE quest_template SET PrevQuestId=25584 WHERE id=25234;
UPDATE quest_template SET PrevQuestId=25584 WHERE id=25255;
UPDATE quest_template SET NextQuestIdChain=25270 WHERE id=25269;
UPDATE quest_template SET NextQuestIdChain=25272, PrevQuestId=25269 WHERE id=25270;
UPDATE quest_template SET NextQuestIdChain=25279, PrevQuestId=25270 WHERE id=25272;
UPDATE quest_template SET NextQuestIdChain=25355, PrevQuestId=25272 WHERE id=25279;
UPDATE quest_template SET PrevQuestId=25279 WHERE id=25355;

UPDATE quest_template SET NextQuestIdChain=25355 WHERE id=25277;
UPDATE quest_template SET NextQuestIdChain=25617, PrevQuestId=25277 WHERE id=25355;
UPDATE quest_template SET PrevQuestId=25355 WHERE id=25617;
UPDATE quest_template SET PrevQuestId=25277, ExclusiveGroup=25354 WHERE id=25354;
UPDATE quest_template SET PrevQuestId=25277, ExclusiveGroup=25355 WHERE id=25355;

UPDATE quest_template SET NextQuestIdChain=25277 WHERE id=25279;
UPDATE quest_template SET PrevQuestId=25279 WHERE id=25277;

UPDATE quest_template SET NextQuestIdChain=25298 WHERE id=25297;
UPDATE quest_template SET PrevQuestId=25297 WHERE id=25298;

UPDATE quest_template SET NextQuestIdChain=25301 WHERE id=25300;
UPDATE quest_template SET PrevQuestId=25300 WHERE id=25301;

UPDATE quest_template SET PrevQuestId=25301, ExclusiveGroup=25303 WHERE id=25303;
UPDATE quest_template SET PrevQuestId=25301, ExclusiveGroup=25303 WHERE id=25328;

UPDATE quest_template SET NextQuestIdChain=25312 WHERE id=25303;
UPDATE quest_template SET PrevQuestId=25303 WHERE id=25312;

UPDATE quest_template SET NextQuestIdChain=25332 WHERE id=25328;
UPDATE quest_template SET PrevQuestId=25328 WHERE id=25332;

UPDATE quest_template SET NextQuestIdChain=25599, ExclusiveGroup=-25575, NextQuestid=25599 WHERE id=25575;
UPDATE quest_template SET NextQuestIdChain=25599, ExclusiveGroup=-25575, NextQuestid=25599 WHERE id=25577;
UPDATE quest_template SET NextQuestIdChain=25599, ExclusiveGroup=-25575, NextQuestid=25599 WHERE id=25576;

UPDATE quest_template SET NextQuestIdChain=25600 WHERE id=25599;
UPDATE quest_template SET NextQuestIdChain=25611, PrevQuestId=25599 WHERE id=25600;
UPDATE quest_template SET PrevQuestId=25600 WHERE id=25611;

UPDATE quest_template SET NextQuestIdChain=25630 WHERE id=25611;
UPDATE quest_template SET PrevQuestId=25611 WHERE id=25630;

UPDATE quest_template SET NextQuestIdChain=0, ExclusiveGroup=25520, NextQuestid=0 WHERE id=25520;
UPDATE quest_template SET NextQuestIdChain=27874, ExclusiveGroup=25520, NextQuestid=27874 WHERE id=25611;

UPDATE quest_template SET PrevQuestId=25630 WHERE id=25381;
UPDATE quest_template SET PrevQuestId=25630 WHERE id=25382;
UPDATE quest_template SET PrevQuestId=25630 WHERE id=25385;
UPDATE quest_template SET PrevQuestId=25630 WHERE id=25404;

UPDATE quest_template SET NextQuestIdChain=25408 WHERE id=25404;
UPDATE quest_template SET NextQuestIdChain=25411, PrevQuestId=25404 WHERE id=25408;
UPDATE quest_template SET NextQuestIdChain=25412, PrevQuestId=25408 WHERE id=25411;
UPDATE quest_template SET NextQuestIdChain=25428, PrevQuestId=25411 WHERE id=25412;
UPDATE quest_template SET PrevQuestId=25412 WHERE id=25428;
 
UPDATE quest_template SET NextQuestIdChain=25392 WHERE id=25385;
UPDATE quest_template SET PrevQuestId=25385 WHERE id=25392;

UPDATE quest_template SET NextQuestIdChain=25940, ExclusiveGroup=-25392, NextQuestid=25940 WHERE id=25392;
UPDATE quest_template SET NextQuestIdChain=25940, ExclusiveGroup=-25392, NextQuestid=25940 WHERE id=25428;
UPDATE quest_template SET NextQuestIdChain=25462 WHERE id=25940;
UPDATE quest_template SET PrevQuestId=25940 WHERE id=25462;

UPDATE quest_template SET NextQuestIdChain=25490 WHERE id=25462;
UPDATE quest_template SET PrevQuestId=25462 WHERE id=25490;

UPDATE quest_template SET PrevQuestId=25490 WHERE id=25491;
UPDATE quest_template SET PrevQuestId=25490 WHERE id=25493;
UPDATE quest_template SET PrevQuestId=25490 WHERE id=25492;

UPDATE quest_template SET NextQuestIdChain=25507 WHERE id=25493;
UPDATE quest_template SET NextQuestIdChain=25510, PrevQuestId=25493 WHERE id=25507;
UPDATE quest_template SET PrevQuestId=25507 WHERE id=25510;
 
UPDATE quest_template SET NextQuestIdChain=25502 WHERE id=25492;
UPDATE quest_template SET PrevQuestId=25492 WHERE id=25502;

UPDATE quest_template SET NextQuestIdChain=25831, ExclusiveGroup=-25491, NextQuestid=25831 WHERE id=25491;
UPDATE quest_template SET NextQuestIdChain=25831, ExclusiveGroup=-25491, NextQuestid=25831 WHERE id=25502;
UPDATE quest_template SET NextQuestIdChain=25831, ExclusiveGroup=-25491, NextQuestid=25831 WHERE id=25520;

UPDATE quest_template SET PrevQuestId=25510, NextQuestIdChain=25520, ExclusiveGroup=-25514 WHERE id=25514;
UPDATE quest_template SET PrevQuestId=25510, NextQuestIdChain=25520, ExclusiveGroup=-25514 WHERE id=25519;

UPDATE quest_template SET PrevQuestId=25600 WHERE id=25611;
UPDATE quest_template SET PrevQuestId=25600 WHERE id=25612;

UPDATE quest_template SET NextQuestIdChain=27874, ExclusiveGroup=25611, NextQuestid=27874 WHERE id=25611;
UPDATE quest_template SET NextQuestIdChain=27874, ExclusiveGroup=25611, NextQuestid=27874 WHERE id=25612;
UPDATE quest_template SET NextQuestIdChain=0, ExclusiveGroup=25611, NextQuestid=0 WHERE id=25520;

UPDATE quest_template SET NextQuestIdChain=25412 WHERE id=25411;
UPDATE quest_template SET PrevQuestId=25411 WHERE id=25412;

UPDATE quest_template SET NextQuestIdChain=25520, ExclusiveGroup=25519, NextQuestid=25520 WHERE id=25519;
UPDATE quest_template SET NextQuestIdChain=25520, ExclusiveGroup=25519, NextQuestid=25520 WHERE id=25514;

UPDATE quest_template SET NextQuestIdChain=25985 WHERE id=25578;
UPDATE quest_template SET PrevQuestId=25578 WHERE id=25985;

UPDATE quest_template SET NextQuestIdChain=25578 WHERE id=25325;
UPDATE quest_template SET PrevQuestId=25325 WHERE id=25578;

UPDATE quest_template SET PrevQuestId=25301, ExclusiveGroup=25328 WHERE id=25328;
UPDATE quest_template SET PrevQuestId=25301, ExclusiveGroup=25303 WHERE id=25303;

UPDATE quest_template SET PrevQuestId=25355, ExclusiveGroup=25617 WHERE id=25617;
UPDATE quest_template SET PrevQuestId=25355, ExclusiveGroup=25617 WHERE id=25624;

UPDATE quest_template SET NextQuestIdChain=25354 WHERE id=25277;
UPDATE quest_template SET PrevQuestId=25277 WHERE id=25354;

UPDATE quest_template SET NextQuestIdChain=25352 WHERE id=25278;
UPDATE quest_template SET PrevQuestId=25278 WHERE id=25352;

UPDATE quest_template SET NextQuestIdChain=25630, ExclusiveGroup=25612, NextQuestid=25630 WHERE id=25612;
UPDATE quest_template SET NextQuestIdChain=25630, ExclusiveGroup=25612, NextQuestid=25630 WHERE id=25611;

UPDATE quest_template SET NextQuestIdChain=25940, ExclusiveGroup=-25428, NextQuestid=25940 WHERE id=25428;
UPDATE quest_template SET NextQuestIdChain=25940, ExclusiveGroup=-25428, NextQuestid=25940 WHERE id=25392;
UPDATE quest_template SET NextQuestIdChain=25940, ExclusiveGroup=-25428, NextQuestid=25940 WHERE id=25382;
UPDATE quest_template SET NextQuestIdChain=25940, ExclusiveGroup=-25428, NextQuestid=25940 WHERE id=25381;

UPDATE quest_template SET PrevQuestId=25510, ExclusiveGroup=25514 WHERE id=25514;
UPDATE quest_template SET PrevQuestId=25510, ExclusiveGroup=25519 WHERE id=25519;

UPDATE quest_template SET NextQuestIdChain=25740, ExclusiveGroup=-25731, NextQuestid=25740 WHERE id=25731;
UPDATE quest_template SET NextQuestIdChain=25740, ExclusiveGroup=-25731, NextQuestid=25740 WHERE id=25664;

UPDATE quest_template SET NextQuestIdChain=25830 WHERE id=25807;
UPDATE quest_template SET PrevQuestId=25807 WHERE id=25830;

UPDATE quest_template SET NextQuestIdChain=25830 WHERE id=25807;
UPDATE quest_template SET NextQuestIdChain=25842, PrevQuestId=25807 WHERE id=25830;
UPDATE quest_template SET NextQuestIdChain=25372, PrevQuestId=25830 WHERE id=25842;
UPDATE quest_template SET NextQuestIdChain=25843, PrevQuestId=25842 WHERE id=25372;
UPDATE quest_template SET PrevQuestId=25372 WHERE id=25843;

UPDATE quest_template SET NextQuestIdChain=25525 WHERE id=25523;
UPDATE quest_template SET NextQuestIdChain=25544, PrevQuestId=25523 WHERE id=25525;
UPDATE quest_template SET NextQuestIdChain=25560, PrevQuestId=25525 WHERE id=25544;
UPDATE quest_template SET NextQuestIdChain=25832, PrevQuestId=25544 WHERE id=25560;
UPDATE quest_template SET PrevQuestId=25560 WHERE id=25832;

UPDATE quest_template SET NextQuestIdChain=25830 WHERE id=25807;
UPDATE quest_template SET NextQuestIdChain=25842, PrevQuestId=25807 WHERE id=25830;
UPDATE quest_template SET NextQuestIdChain=25372, PrevQuestId=25830 WHERE id=25842;
UPDATE quest_template SET NextQuestIdChain=25843, PrevQuestId=25842 WHERE id=25372;
UPDATE quest_template SET PrevQuestId=25372 WHERE id=25843;
 
UPDATE quest_template SET PrevQuestId=25843 WHERE id=25904;
UPDATE quest_template SET PrevQuestId=25843 WHERE id=25881;
UPDATE quest_template SET PrevQuestId=25843 WHERE id=25899;

UPDATE quest_template SET NextQuestIdChain=25886 WHERE id=25881;
UPDATE quest_template SET PrevQuestId=25881 WHERE id=25886;

UPDATE quest_template SET NextQuestIdChain=25901 WHERE id=25899;
UPDATE quest_template SET PrevQuestId=25899 WHERE id=25901;

UPDATE quest_template SET NextQuestIdChain=25906 WHERE id=25904;
UPDATE quest_template SET NextQuestIdChain=25910, PrevQuestId=25904 WHERE id=25906;
UPDATE quest_template SET PrevQuestId=25906 WHERE id=25910;

UPDATE quest_template SET NextQuestIdChain=25915 WHERE id=25906;
UPDATE quest_template SET NextQuestIdChain=25923, PrevQuestId=25906 WHERE id=25915;
UPDATE quest_template SET NextQuestIdChain=25928, PrevQuestId=25915 WHERE id=25923;
UPDATE quest_template SET NextQuestIdChain=25653, PrevQuestId=25923 WHERE id=25928;
UPDATE quest_template SET PrevQuestId=25928 WHERE id=25653;

UPDATE quest_template SET NextQuestIdChain=25597 WHERE id=25653;
UPDATE quest_template SET NextQuestIdChain=25274, PrevQuestId=25653 WHERE id=25597;
UPDATE quest_template SET NextQuestIdChain=25276, PrevQuestId=25597 WHERE id=25274;
UPDATE quest_template SET PrevQuestId=25274 WHERE id=25276;

UPDATE quest_template SET PrevQuestId=25276 WHERE id=25223;
UPDATE quest_template SET PrevQuestId=25276 WHERE id=25224;
UPDATE quest_template SET PrevQuestId=25276 WHERE id=25330;

UPDATE quest_template SET NextQuestIdChain=25291, ExclusiveGroup=25223, NextQuestid=25291 WHERE id=25223;
UPDATE quest_template SET NextQuestIdChain=25291, ExclusiveGroup=25224, NextQuestid=25291 WHERE id=25224;
UPDATE quest_template SET NextQuestIdChain=25291, ExclusiveGroup=25230, NextQuestid=25291 WHERE id=25330;

UPDATE quest_template SET PrevQuestId=25291 WHERE id=25509;
UPDATE quest_template SET PrevQuestId=25291 WHERE id=25294;
UPDATE quest_template SET PrevQuestId=25291 WHERE id=25296;

UPDATE quest_template SET NextQuestIdChain=25499 WHERE id=25509;
UPDATE quest_template SET NextQuestIdChain=25299, PrevQuestId=25509 WHERE id=25499;
UPDATE quest_template SET NextQuestIdChain=25309, PrevQuestId=25499 WHERE id=25299;
UPDATE quest_template SET PrevQuestId=25299 WHERE id=25309;

UPDATE quest_template SET PrevQuestId=25309, ExclusiveGroup=25310 WHERE id=25310;
UPDATE quest_template SET PrevQuestId=25309, ExclusiveGroup=25310 WHERE id=25311;

UPDATE quest_template SET NextQuestIdChain=25314, ExclusiveGroup=-25311, NextQuestid=25314 WHERE id=25311;
UPDATE quest_template SET NextQuestIdChain=25314, ExclusiveGroup=-25311, NextQuestid=25314 WHERE id=25310;
UPDATE quest_template SET NextQuestIdChain=25314, ExclusiveGroup=-25311, NextQuestid=25314 WHERE id=25496;
UPDATE quest_template SET NextQuestIdChain=25314, ExclusiveGroup=-25311, NextQuestid=25314 WHERE id=25308;

UPDATE quest_template SET NextQuestIdChain=25294 WHERE id=25291;
UPDATE quest_template SET NextQuestIdChain=25494, PrevQuestId=25291 WHERE id=25294;
UPDATE quest_template SET NextQuestIdChain=25496, PrevQuestId=25294 WHERE id=25494;
UPDATE quest_template SET PrevQuestId=25494 WHERE id=25496;

UPDATE quest_template SET NextQuestIdChain=25296 WHERE id=25291;
UPDATE quest_template SET NextQuestIdChain=25308, PrevQuestId=25291 WHERE id=25296;
UPDATE quest_template SET PrevQuestId=25296 WHERE id=25308;

UPDATE quest_template SET NextQuestIdChain=25313 WHERE id=25309;
UPDATE quest_template SET PrevQuestId=25309 WHERE id=25313;

UPDATE quest_template SET NextQuestIdChain=25601 WHERE id=25314;
UPDATE quest_template SET PrevQuestId=25314 WHERE id=25601;

UPDATE quest_template SET NextQuestIdChain=25554 WHERE id=25608;
UPDATE quest_template SET NextQuestIdChain=25555, PrevQuestId=25608 WHERE id=25554;
UPDATE quest_template SET NextQuestIdChain=25551, PrevQuestId=25554 WHERE id=25555;
UPDATE quest_template SET PrevQuestId=25555 WHERE id=25551;

UPDATE quest_template SET PrevQuestId=25551, ExclusiveGroup=27398 WHERE id=27398;
UPDATE quest_template SET PrevQuestId=25551, ExclusiveGroup=27398 WHERE id=27399;

UPDATE quest_template SET PrevQuestId=25278, ExclusiveGroup=25353 WHERE id=25353;
UPDATE quest_template SET PrevQuestId=25278, ExclusiveGroup=25352 WHERE id=25352;

UPDATE quest_template SET NextQuestIdChain=25280 WHERE id=25273;
UPDATE quest_template SET NextQuestIdChain=25278, PrevQuestId=25273 WHERE id=25280;
UPDATE quest_template SET PrevQuestId=25280 WHERE id=25278;
 
UPDATE quest_template SET PrevQuestId=25353, ExclusiveGroup=25618 WHERE id=25618;
UPDATE quest_template SET PrevQuestId=25353, ExclusiveGroup=25618 WHERE id=25623;

UPDATE quest_template SET NextQuestIdChain=25644 WHERE id=25608;
UPDATE quest_template SET PrevQuestId=25608 WHERE id=25644;

UPDATE quest_template SET NextQuestIdChain=29182 WHERE id=29181;
UPDATE quest_template SET PrevQuestId=29181 WHERE id=29182;

UPDATE quest_template SET NextQuestIdChain=29177 WHERE id=25544;
UPDATE quest_template SET PrevQuestId=25544 WHERE id=29177;

UPDATE quest_template SET NextQuestIdChain=25278 WHERE id=25280;
UPDATE quest_template SET PrevQuestId=25280 WHERE id=25278;

UPDATE quest_template SET NextQuestIdChain=25277 WHERE id=25279;
UPDATE quest_template SET PrevQuestId=25279 WHERE id=25277;

UPDATE quest_template SET Method = 0 WHERE id = 29066;

DELETE FROM `creature_questrelation` WHERE quest = 25443 AND id = 39933;
DELETE FROM `creature_involvedrelation` WHERE quest = 25443 AND id = 39933;

DELETE FROM `gameobject_questrelation` WHERE quest IN (25296, 25308, 25314, 25601) AND id = 202701;
INSERT INTO `gameobject_questrelation` (`id`, `quest`) VALUES
('202701', '25296'),
('202701', '25308'),
('202701', '25314'),
('202701', '25601');

DELETE FROM `gameobject_involvedrelation` WHERE quest IN (25296, 25308, 25314) AND id = 202701;
INSERT INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES
('202701', '25296'),
('202701', '25308'),
('202701', '25314');

UPDATE quest_template SET PrevQuestId=0, ExclusiveGroup=25297 WHERE id=25297;
UPDATE quest_template SET PrevQuestId=0, ExclusiveGroup=25300 WHERE id=25300;

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(19,20) AND SourceEntry IN(25575,25577);
DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(19,20) AND SourceEntry=25576;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`) VALUES
(20,0,25575,0,1,8,0,25617,0,0,0,0),
(20,0,25575,0,2,8,0,25624,0,0,0,0),
(20,0,25577,0,1,8,0,25617,0,0,0,0),
(20,0,25577,0,2,8,0,25624,0,0,0,0),
(19,0,25575,0,1,8,0,25617,0,0,0,0),
(19,0,25575,0,2,8,0,25624,0,0,0,0),
(19,0,25577,0,1,8,0,25617,0,0,0,0),
(19,0,25577,0,2,8,0,25624,0,0,0,0),
(20,0,25576,0,1,8,0,25617,0,0,0,0),
(20,0,25576,0,2,8,0,25624,0,0,0,0),
(19,0,25576,0,1,8,0,25617,0,0,0,0),
(19,0,25576,0,2,8,0,25624,0,0,0,0),
(20,0,25575,0,3,8,0,25618,0,0,0,0),
(20,0,25575,0,4,8,0,25623,0,0,0,0),
(20,0,25577,0,3,8,0,25618,0,0,0,0),
(20,0,25577,0,4,8,0,25623,0,0,0,0),
(19,0,25575,0,3,8,0,25618,0,0,0,0),
(19,0,25575,0,4,8,0,25623,0,0,0,0),
(19,0,25577,0,3,8,0,25618,0,0,0,0),
(19,0,25577,0,4,8,0,25623,0,0,0,0),
(20,0,25576,0,3,8,0,25618,0,0,0,0),
(20,0,25576,0,4,8,0,25623,0,0,0,0),
(19,0,25576,0,3,8,0,25618,0,0,0,0),
(19,0,25576,0,4,8,0,25623,0,0,0,0);

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(19,20) AND SourceEntry IN(25297,25300) AND ConditionTypeOrReference=8 AND ConditionValue1 IN(25279,25280);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`) VALUES
(20,0,25297,0,1,8,0,25279,0,0,0,0),
(20,0,25297,0,2,8,0,25280,0,0,0,0),
(20,0,25300,0,1,8,0,25279,0,0,0,0),
(20,0,25300,0,2,8,0,25280,0,0,0,0),
(19,0,25297,0,3,8,0,25279,0,0,0,0),
(19,0,25297,0,4,8,0,25280,0,0,0,0),
(19,0,25300,0,3,8,0,25279,0,0,0,0),
(19,0,25300,0,4,8,0,25280,0,0,0,0);


-- Mount Hyjal Horde Quests
UPDATE `quest_template` SET `requiredraces` = 946 WHERE `id` = 27721;
UPDATE `quest_template` SET `requiredraces` = 946 WHERE `id` = 25277;
UPDATE `quest_template` SET `requiredraces` = 946 WHERE `id` = 25270;
UPDATE `quest_template` SET `requiredraces` = 946 WHERE `id` = 25617;
UPDATE `quest_template` SET `requiredraces` = 946 WHERE `id` = 25624;
UPDATE `quest_template` SET `requiredraces` = 946 WHERE `id` = 25355;
UPDATE `quest_template` SET `requiredraces` = 946 WHERE `id` = 25272;
UPDATE `quest_template` SET `requiredraces` = 946 WHERE `id` = 25612;
UPDATE `quest_template` SET `requiredraces` = 946 WHERE `id` = 25354;
UPDATE `quest_template` SET `requiredraces` = 946 WHERE `id` = 25279;
UPDATE `quest_template` SET `requiredraces` = 946 WHERE `id` = 25269;

-- Mount Hyjal Alliance Quests
UPDATE `quest_template` SET `requiredraces` = 2098253 WHERE `id` = 27726;
UPDATE `quest_template` SET `requiredraces` = 2098253 WHERE `id` = 25278;
UPDATE `quest_template` SET `requiredraces` = 2098253 WHERE `id` = 25271;
UPDATE `quest_template` SET `requiredraces` = 2098253 WHERE `id` = 25618;
UPDATE `quest_template` SET `requiredraces` = 2098253 WHERE `id` = 25623;
UPDATE `quest_template` SET `requiredraces` = 2098253 WHERE `id` = 25353;
UPDATE `quest_template` SET `requiredraces` = 2098253 WHERE `id` = 25273;
UPDATE `quest_template` SET `requiredraces` = 2098253 WHERE `id` = 25611;
UPDATE `quest_template` SET `requiredraces` = 2098253 WHERE `id` = 25352;
UPDATE `quest_template` SET `requiredraces` = 2098253 WHERE `id` = 25280;
UPDATE `quest_template` SET `requiredraces` = 2098253 WHERE `id` = 25268;