DELETE FROM `spell_proc_event` WHERE `entry` IN (
91369, 91366, 91150, 92217, 92180, 92185, 92095, 92097, 92093, 92070,
91817, 92346, 90990, 90993, 92054, 92088, 91361, 91365, 90897, 90899,
90886, 90888, 91137, 91140, 92164, 92175, 92219, 92221, 91011, 92319,
91193, 95713, 94747, 95653, 94746, 94747, 91048, 91822, 92343, 92114,
92125, 92350, 92127, 92353, 91025, 92322, 91186, 92333, 90848, 92044,
92056, 91353, 91080, 95878, 91142, 92209, 92207, 89088, 75176, 95763);

INSERT INTO `spell_proc_event` (`entry`, `procEx`, `Cooldown`) VALUES
(91369, 0x2, 50), -- Right Eye of Rajh (Heroic)
(91366, 0x2, 50), -- Right Eye of Rajh (Normal)
(91150, 0x0, 105), -- Blood of Isiset (Heroic)
(92217, 0x0, 60), -- Bloodthirsty Gladiator's Insignia of Victory
(92219, 0x0, 40), -- Bloodthirsty Gladiator's Insignia of Dominance
(92221, 0x0, 45), -- Bloodthirsty Gladiator's Insignia of Conquest
(92180, 0x0, 30), -- Leaden Despair (Normal)
(92185, 0x0, 30), -- Leaden Despair (Heroic)
(92095, 0x2, 50), -- Left Eye of Rajh (Normal)
(92097, 0x2, 50), -- Left Eye of Rajh (Heroic)
(92093, 0x0, 75), -- Key to the Endless Chamber (Heroic)
(92070, 0x0, 75), -- Key to the Endless Chamber (Normal)
(91817, 0x0, 90), -- Heart of Rage (Normal)
(92346, 0x0, 90), -- Heart of Rage (Heroic)
(90990, 0x0, 45), -- Anhuur's Hymnal (Normal)
(90993, 0x0, 45), -- Anhuur's Hymnal (Heroic)
(92054, 0x0, 100), -- Grace of the Herald (Normal)
(92088, 0x0, 100), -- Grace of the Herald (Heroic)
(91361, 0x0, 120), -- Heart of Solace (Normal)
(91365, 0x0, 120), -- Heart of Solace (Heroic)
(90897, 0x0, 75), -- Tendrils of Burrowing Dark (Normal)
(90899, 0x0, 75), -- Tendrils of Burrowing Dark (Heroic)
(90886, 0x0, 75), -- Witching Hourglass (Normal)
(90888, 0x0, 75), -- Witching Hourglass (Heroic)
(91137, 0x2, 60), -- Tear of Blood (Normal)
(91140, 0x2, 60), -- Tear of Blood (Heroic)
(92164, 0x0, 80), -- Porcelain Crab (Normal)
(92175, 0x0, 80), -- Porcelain Crab (Heroic)
(91011, 0x0, 100), -- Bell of Enraging Resonance (Normal)
(92319, 0x0, 100), -- Bell of Enraging Resonance (Heroic)
(91193, 0x0, 50), -- Mandala of Stirring Patterns
(95713, 0x0, 30), -- Gnomish X-Ray Scope
(95653, 0x0, 20), -- Enchant Weapon - Heartsong
(94746, 0x0, 45), -- Enchant Weapon - Power Torrent
(94747, 0x0, 45), -- Enchant Weapon - Hurricane
(91048, 0x0, 75), -- Stump of Time
(91822, 0x0, 75), -- Crushing Weight (Normal)
(92343, 0x0, 75), -- Crushing Weight (Heroic)
(92114, 0x0, 50), -- Unheeded Warning
(92125, 0x0, 75), -- Prestor's Talisman of Machination (Normal)
(92350, 0x0, 75), -- Prestor's Talisman of Machination (Heroic)
(92127, 0x0, 50), -- Essence of the Cyclone (Normal)
(92353, 0x0, 50), -- Essence of the Cyclone (Heroic)
-- (89086, 0x0, ), -- Darkmoon Card: Hurricane
(91025, 0x0, 90), -- Theralion's Mirror (Normal)
(92322, 0x0, 90), -- Theralion's Mirror (Heroic)
(91186, 0x0, 75), -- Fall of Mortality (Normal)
(92333, 0x0, 75), -- Fall of Mortality (Heroic)
(90848, 0x0, 50), -- Pelagic Prism
(92044, 0x0, 75), -- Bileberry Smelling Salts
(92056, 0x2, 100), -- Gear Detector
(91353, 0x2, 100), -- Tank-Commander Insignia
(91080, 0x0, 100), -- Harmlight Token
(95878, 0x0, 100), -- Talisman of Sinister Order
(91142, 0x0, 75), -- Rainsong
(92209, 0x20, 60), -- Throngus's Finger (Normal)
(92207, 0x20, 60), -- Throngus's Finger (Heroic)
(89088, 0x0, 45), -- Darkmoon Card: Volcano
(75176, 0x0, 60),  -- Swordguard Embroidery
(95763, 0x0, 50); -- Agony and Torment

DELETE FROM `spelldifficulty_dbc` WHERE `id` = 3275;
INSERT INTO `spelldifficulty_dbc` (`id`, `spellid0`, `spellid1`, `spellid2`, `spellid3`) VALUES
(3275, 89773, 91912, 94616, 94617);
