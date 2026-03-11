SELECT
    name,
    comment
FROM `system`.tables
WHERE name IN ('t1', 't2', 't3', 't4', 't5', 't6')
    AND database = currentDatabase()
ORDER BY name ASC;