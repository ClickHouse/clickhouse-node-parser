SELECT count()
FROM t1
WHERE c1 IN (
        SELECT 'BBBBBB'
        UNION ALL
        SELECT NULL
    );

SELECT count()
FROM t1
WHERE CAST(c1 AS Nullable(String)) IN (
        SELECT 'BBBBBB'
        UNION ALL
        SELECT NULL
    );