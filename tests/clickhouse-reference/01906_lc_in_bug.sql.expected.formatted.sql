SELECT
    count() AS c,
    x IN ('a', 'bb') AS g
FROM tab
GROUP BY g
ORDER BY c ASC;

SELECT COUNT()
FROM test
WHERE key <= 100000
    AND (NOT toLowCardinality('') IN (
        SELECT ''
    ));