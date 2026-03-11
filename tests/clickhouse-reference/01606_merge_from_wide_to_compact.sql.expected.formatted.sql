SELECT
    name,
    part_type
FROM `system`.parts
WHERE table = 'wide_to_comp'
    AND database = currentDatabase()
    AND active
ORDER BY name ASC;

SELECT count()
FROM wide_to_comp
WHERE NOT ignore(*);