-- to make  invisble bunny creatures and triggers
UPDATE creature_template set modelid1=16480,modelid2=0, modelid3=0,modelid4=0 WHERE name LIKE '%trigger%';
UPDATE creature_template set modelid1=16480,modelid2=0, modelid3=0,modelid4=0 WHERE name LIKE '%bunny%';
UPDATE creature_template set flags_extra=128 WHERE name LIKE '%bunny%' and flags_extra=0;
UPDATE creature_template set flags_extra=128 WHERE name LIKE '%trigger%' and flags_extra=0;
