-- DK create info
UPDATE `playercreateinfo` SET `map` = 609, `zone` = 4298, `position_x` = '2355.84', `position_y` = '-5662.21', `position_z` = '426.028', `orientation` = '3.93485' WHERE `class` = 6;

-- Death Gate
UPDATE `spell_target_position` SET `target_map`=0 WHERE `id`=53821;
