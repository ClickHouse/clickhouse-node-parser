SELECT
    level,
    part_type
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_03644_min_level_for_wide_part'
    AND active;

SELECT
    level,
    part_type
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_03644_min_level_for_wide_part_rmt'
    AND active;