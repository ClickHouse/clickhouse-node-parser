SELECT *
FROM mt_compact
ORDER BY a ASC
LIMIT 10;

SELECT DISTINCT part_type
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'mt_compact'
    AND active;

SELECT
    part_type,
    count()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'mt_compact'
    AND active
GROUP BY part_type
ORDER BY part_type ASC;

SELECT *
FROM mt_compact
ORDER BY
    a ASC,
    s ASC
LIMIT 10;

SELECT *
FROM mt_compact
WHERE a > 1
ORDER BY
    a ASC,
    s ASC
LIMIT 10;