SELECT count()
FROM (
        EXPLAIN PLAN
        SELECT number
        FROM numbers(5)
    )
WHERE like(`explain`, '%Sorting%');

SELECT count()
FROM (
        EXPLAIN PLAN
        SELECT number
        FROM numbers(5)
        ORDER BY number ASC
    )
WHERE like(`explain`, '%Sorting%');

SELECT count()
FROM (
        EXPLAIN PLAN
        SELECT number
        FROM numbers(5)
        UNION ALL
        SELECT number
        FROM numbers(5)
    )
WHERE like(`explain`, '%Sorting%');