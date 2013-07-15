-- Unlock Lost City of the Tol'vir
-- DELETE FROM `disables` WHERE `entry`=644;

-- Script Boss General Husam
UPDATE `creature_template` SET `ScriptName`='boss_general_husam' WHERE `entry`='44577';
UPDATE `creature_template` SET `ScriptName`='boss_general_husam' WHERE `entry`='48932';

-- Script Boss High Prophet Barim
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='43612'; -- Nomal
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='43612';
UPDATE `creature_template` SET `ScriptName`='boss_high_prophet_barim' WHERE `entry`='43612';
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='48951'; -- HC
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='48951';

UPDATE `creature_template` SET `ScriptName`='npc_harbinger_of_darkness' WHERE `entry`='43927';
UPDATE `creature_template` SET `ScriptName`='npc_blaze_of_heavens' WHERE `entry`='48906';
UPDATE `creature_template` SET `ScriptName`='npc_soul_fragment' WHERE `entry`='43934';
UPDATE `creature_template` SET `ScriptName`='npc_blaze_of_heavens_egg' WHERE `entry`='48906';


-- Script Boss Lockmaw
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='43614'; -- Nomal
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='43614';
UPDATE `creature_template` SET `ScriptName`='boss_lockmaw' WHERE `entry`='43614';
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='49043'; -- HC
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='49043';

UPDATE `creature_template` SET `ScriptName`='mob_augh' WHERE `entry`='45379';
UPDATE `creature_template` SET `ScriptName`='mob_crosilik' WHERE `entry`='43658';


-- Script Boss High Prophet Barim
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='44819'; -- Nomal
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='44819';
UPDATE `creature_template` SET `ScriptName`='boss_siamat' WHERE `entry`='44819';
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='51088'; -- HC
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='51088';

/* UPDATE `creature_template` SET `ScriptName`='npc_minion_of_siamat' WHERE `entry`='44704';
UPDATE `creature_template` SET `ScriptName`='npc_servant_of_siamat' WHERE `entry`='48906';
UPDATE `creature_template` SET `ScriptName`='npc_cloud_burst' WHERE `entry`='43934';
UPDATE `creature_template` SET `ScriptName`='npc_wind_tunnel' WHERE `entry`='48906'; */
