SELECT marks
FROM `system`.projection_parts
WHERE active
    AND database = currentDatabase()
    AND table = 't'
    AND name = 'p3';

SELECT marks
FROM `system`.projection_parts
WHERE active
    AND database = currentDatabase()
    AND table = 't'
    AND name = 'p4';

SELECT
    name,
    `settings`
FROM `system`.projections
WHERE database = currentDatabase()
    AND table = 't'
ORDER BY name ASC;