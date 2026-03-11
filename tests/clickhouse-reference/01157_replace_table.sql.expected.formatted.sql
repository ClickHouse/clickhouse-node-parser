SELECT *
FROM t
ORDER BY n ASC;

SELECT count()
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'join';

SELECT *
FROM
    numbers(10) AS t
INNER JOIN `join`
    ON t.number = `join`.n
ORDER BY n ASC;

SELECT name
FROM `system`.tables
WHERE database = currentDatabase()
ORDER BY name ASC;