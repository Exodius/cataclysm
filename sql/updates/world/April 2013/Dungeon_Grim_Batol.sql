-- Unlock Grim Batol
-- DELETE FROM `disables` WHERE `entry`=670;

-- Script + Loot Boss Drahga Shadowburner
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='40319'; -- Nomal
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='40319';
UPDATE `creature_template` SET `ScriptName`='boss_drahga_shadowburner' WHERE `entry`='40319';
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='48784'; -- HC
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='48784';

UPDATE `creature_template` SET `ScriptName`='mob_valiona_gb' WHERE `entry`='40320';
UPDATE `creature_template` SET `ScriptName`='mob_invoked_flame_spirit' WHERE `entry`='40357';


-- Script + Loot Boss Erudax
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='40484'; -- Nomal
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='40484';
UPDATE `creature_template` SET `ScriptName`='boss_erudax' WHERE `entry`='40484';
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='48822'; -- HC
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='48822';

UPDATE `creature_template` SET `ScriptName`='mob_faceless' WHERE `entry`='40600';
UPDATE `creature_template` SET `ScriptName`='mob_alexstraszas_eggs' WHERE `entry`='40486';
UPDATE `creature_template` SET `ScriptName`='mob_shadow_gale_stalker' WHERE `entry`='40567';


-- Script + Loot Boss Forgemaster Throngus
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='40177'; -- Nomal
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='40177';
UPDATE `creature_template` SET `ScriptName`='boss_forgemaster_throngus' WHERE `entry`='40177';
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='48702'; -- HC
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='48702';

UPDATE `creature_template` SET `ScriptName`='mob_twilight_archer' WHERE `entry`='40197';


-- Script + Loot Boss Erudax
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='39625'; -- Nomal
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='39625';
UPDATE `creature_template` SET `ScriptName`='boss_general_umbriss' WHERE `entry`='39625';
UPDATE `creature_loot_template` SET `lootmode`='1' WHERE `entry`='48337'; -- HC
UPDATE `creature_loot_template` SET `groupid`='1' WHERE `entry`='48337';

UPDATE `creature_template` SET `ScriptName`='npc_trogg_dweller' WHERE `entry`='45467';
UPDATE `creature_template` SET `ScriptName`='npc_malignant' WHERE `entry`='39984';
-- UPDATE `creature_template` SET `ScriptName`='npc_habitant' WHERE `entry`='45467';
-- UPDATE `creature_template` SET `ScriptName`='npc_malveillant' WHERE `entry`='39984';



-- NPC 
UPDATE `creature_template` SET `ScriptName`='mob_gardien_de_la_nuee_azur' WHERE `entry`='39854';

UPDATE `creature_template` SET `ScriptName`='mob_gardien_de_la_nuee_cramoisie' WHERE `entry`='39381';

UPDATE `creature_template` SET `ScriptName`='mob_prophete_de_la_nuee_azur' WHERE `entry`='39855';

UPDATE `creature_template` SET `ScriptName`='mob_prophete_de_la_nuee_azur' WHERE `entry`='40291';

UPDATE `creature_template` SET `ScriptName`='mob_brise_tempete_du_crepuscule' WHERE `entry`='39854';

UPDATE `creature_template` SET `ScriptName`='mob_esprit_de_leau_asservi' WHERE `entry`='39961';

UPDATE `creature_template` SET `ScriptName`='mob_maitre_darmes_du_crepuscule' WHERE `entry`='41073';

UPDATE `creature_template` SET `ScriptName`='mob_maitre_darmes_du_crepuscule' WHERE `entry`='40306';

UPDATE `creature_template` SET `ScriptName`='mob_elementaire_de_roche_asservi' WHERE `entry`='39900';

UPDATE `creature_template` SET `ScriptName`='mob_sculpte_terre_du_crepuscule' WHERE `entry`='39890';

UPDATE `creature_template` SET `ScriptName`='mob_massacreur_du_crepuscule' WHERE `entry`='40448';

UPDATE `creature_template` SET `ScriptName`='mob_massacreur_du_crepuscule' WHERE `entry`='39956';

UPDATE `creature_template` SET `ScriptName`='mob_chercheflamme_rehausse' WHERE `entry`='39415';

UPDATE `creature_template` SET `ScriptName`='mob_marche_vent_rehausse' WHERE `entry`='39414';

UPDATE `creature_template` SET `ScriptName`='mob_tisseur_dombre_du_crepuscule' WHERE `entry`='39954';

UPDATE `creature_template` SET `ScriptName`='mob_seigneur_de_guerre_de_la_nuee_azur' WHERE `entry`='39909';

UPDATE `creature_template` SET `ScriptName`='mob_seigneur_de_guerre_de_la_nuee_cramoisie' WHERE `entry`='39626';

UPDATE `creature_template` SET `ScriptName`='mob_imposteur_du_crepuscule' WHERE `entry`='40167';

UPDATE `creature_template` SET `ScriptName`='mob_brute_gronn_asservie' WHERE `entry`='40166';

UPDATE `creature_template` SET `ScriptName`='mob_esprit_du_tonnerre_asservie' WHERE `entry`='40269';

UPDATE `creature_template` SET `ScriptName`='mob_mande_tonnerre_du_crepuscule' WHERE `entry`='40270';

UPDATE `creature_template` SET `ScriptName`='mob_grippe_feu_du_crepuscule' WHERE `entry`='39870';

UPDATE `creature_template` SET `ScriptName`='mob_braise_ardente_asservie' WHERE `entry`='39892';

UPDATE `creature_template` SET `ScriptName`='mob_flagellant_aquatique_rehausse' WHERE `entry`='40273';

UPDATE `creature_template` SET `ScriptName`='mob_brise_roche_rehausse' WHERE `entry`='40272';

UPDATE `creature_template` SET `ScriptName`='mob_drake_du_crepuscule' WHERE `entry`='41095';

UPDATE `creature_template` SET `ScriptName`='mob_drake_du_crepuscule' WHERE `entry`='39390';

UPDATE `creature_template` SET `ScriptName`='mob_corrupteur_sans_visage' WHERE `entry`='39392';

UPDATE `creature_template` SET `ScriptName`='mob_corrupteur_sans_visage' WHERE `entry`='48844';

UPDATE `creature_template` SET `ScriptName`='mob_habitant_trogg' WHERE `entry`='39450';