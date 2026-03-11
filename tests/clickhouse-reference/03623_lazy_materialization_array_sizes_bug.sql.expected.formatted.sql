SELECT
    a.size0,
    a
FROM test
WHERE y > 5
ORDER BY y ASC
LIMIT 2;

SELECT
    a,
    a.size0
FROM test
WHERE y > 5
ORDER BY y ASC
LIMIT 2;