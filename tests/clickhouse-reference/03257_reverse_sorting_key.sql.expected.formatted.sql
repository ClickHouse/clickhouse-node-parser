SELECT *
FROM x1
WHERE i = 3;

SELECT count()
FROM x1
WHERE and(greaterOrEquals(i, 3), lessOrEquals(i, 10));

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM x1
        ORDER BY i DESC
        LIMIT 5
    )
WHERE ilike(`explain`, '%sort%')
SETTINGS
    max_threads = 1,
    enable_analyzer = 1;

SELECT *
FROM x1
ORDER BY i DESC
LIMIT 5;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM x1
        ORDER BY i ASC
        LIMIT 5
    )
WHERE ilike(`explain`, '%sort%')
SETTINGS
    max_threads = 1,
    enable_analyzer = 1;

SELECT *
FROM x1
ORDER BY i ASC
LIMIT 5;

SELECT *
FROM x2
WHERE j = 1003;

SELECT count()
FROM x2
WHERE and(greaterOrEquals(i, 3), lessOrEquals(i, 10))
    AND and(greaterOrEquals(j, 1003), lessOrEquals(j, 1008));

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM x2
        ORDER BY
            i ASC,
            j DESC
        LIMIT 5
    )
WHERE ilike(`explain`, '%sort%')
SETTINGS
    max_threads = 1,
    enable_analyzer = 1;

SELECT *
FROM x2
ORDER BY
    i ASC,
    j DESC
LIMIT 5;

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM x2
        ORDER BY
            i ASC,
            j ASC
        LIMIT 5
    )
WHERE ilike(`explain`, '%sort%')
SETTINGS
    max_threads = 1,
    enable_analyzer = 1;

SELECT *
FROM x2
ORDER BY
    i ASC,
    j ASC
LIMIT 5;