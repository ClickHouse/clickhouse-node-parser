SELECT count()
FROM (
        SELECT *
        FROM test_03444_lazy
        WHERE n >= 0
        ORDER BY rand() ASC
        LIMIT 5
    );

SELECT trimLeft(`explain`) AS s
FROM (
        EXPLAIN
        SELECT *
        FROM test_03444_lazy
        WHERE n >= 0
        ORDER BY rand() ASC
        LIMIT 5
    )
WHERE ilike(s, 'LazilyRead%');