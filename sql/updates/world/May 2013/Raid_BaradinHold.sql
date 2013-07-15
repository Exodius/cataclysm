-- Raid Baradin Hold

-- Script Boss Alizabal
UPDATE `creature_template` SET `ScriptName`='boss_alizabal' WHERE `entry`='55869';
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='55869'; -- Nomal
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='55869';

-- Script Boss Argaloth
UPDATE `creature_template` SET `ScriptName`='boss_argaloth' WHERE `entry`='47120';
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='47120'; -- Nomal
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='47120';

-- Script Boss Occu'thar
UPDATE `creature_template` SET `ScriptName`='boss_occuthar' WHERE `entry`='52363';
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='52363'; -- Nomal
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='55869';

-- Trash will next
