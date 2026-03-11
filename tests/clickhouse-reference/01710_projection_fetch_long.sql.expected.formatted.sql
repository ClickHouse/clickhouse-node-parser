SELECT *
FROM tp_2
ORDER BY x ASC;

SELECT count()
FROM `system`.projection_parts
WHERE database = currentDatabase()
    AND table = 'tp_2'
    AND name = 'pp'
    AND active;

SELECT *
FROM `system`.projection_parts
WHERE database = currentDatabase()
    AND table = 'tp_2'
    AND name = 'pp'
    AND active;