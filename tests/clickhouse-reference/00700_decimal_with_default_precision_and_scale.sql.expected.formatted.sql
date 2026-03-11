SELECT type
FROM `system`.`columns`
WHERE table = 'decimal'
    AND database = currentDatabase()
ORDER BY type ASC;

SELECT
    toTypeName(d2),
    toTypeName(d3)
FROM decimal
LIMIT 1;