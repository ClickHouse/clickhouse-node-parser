SELECT *
FROM
    tab_l AS l
INNER JOIN tab_m AS m
    ON l.a * 2 = m.c + m.d
    AND l.d = m.a
    AND l.b + l.c = m.b * 2
ORDER BY l.a ASC
LIMIT 10
OFFSET 999990;

SELECT `explain` AS e
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            tab_l AS l
        INNER JOIN tab_m AS m
            ON l.a * 2 = m.c + m.d
            AND l.b + l.c = m.b * 2
    )
WHERE like(e, '%ReadFromMergeTree%')
    OR like(e, '%Expression%')
    OR like(e, '%Join%')
    OR like(e, '%Clauses%')
    OR like(e, '%Sharding%');

SELECT *
FROM
    tab_l AS l
INNER JOIN tab_m AS m
    ON l.a * 2 = m.c + m.d
    AND l.d = m.a
    AND l.b + l.c = m.b * 2
INNER JOIN tab_r AS r
    ON l.a * 2 = r.a * 2
    AND l.b + l.c = r.c * 2
    AND l.d = r.d
ORDER BY l.a ASC
LIMIT 10
OFFSET 999990;

SELECT `explain` AS e
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            tab_l AS l
        INNER JOIN tab_m AS m
            ON l.a * 2 = m.c + m.d
            AND l.d = m.a
            AND l.b + l.c = m.b * 2
        INNER JOIN tab_r AS r
            ON l.a * 2 = r.a * 2
            AND l.b + l.c = r.c * 2
            AND l.d = r.d
    )
WHERE like(e, '%ReadFromMergeTree%')
    OR like(e, '%Expression%')
    OR like(e, '%Join%')
    OR like(e, '%Clauses%')
    OR like(e, '%Sharding%');

SELECT *
FROM
    tab_l AS l
INNER JOIN tab_m AS m
    ON l.a * 2 = m.c + m.d
    AND l.d = m.a
INNER JOIN tab_r AS r
    ON l.a * 2 = r.a * 2
    AND l.b + l.c = r.c * 2
    AND l.d = r.d
ORDER BY l.a ASC
LIMIT 10
OFFSET 999990;

SELECT `explain` AS e
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            tab_l AS l
        INNER JOIN tab_m AS m
            ON l.a * 2 = m.c + m.d
            AND l.d = m.a
        INNER JOIN tab_r AS r
            ON l.a * 2 = r.a * 2
            AND l.b + l.c = r.c * 2
            AND l.d = r.d
    )
WHERE like(e, '%ReadFromMergeTree%')
    OR like(e, '%Expression%')
    OR like(e, '%Join%')
    OR like(e, '%Clauses%')
    OR like(e, '%Sharding%');

SELECT *
FROM
    tab_l AS l
INNER JOIN tab_m AS m
    ON l.a * 2 = m.c + m.d
    AND l.d = m.a
    AND l.b + l.c = m.b * 2
INNER JOIN tab_r AS r
    ON l.a * 2 = r.a * 2
    AND l.d = r.d
ORDER BY l.a ASC
LIMIT 10
OFFSET 999990;

SELECT `explain` AS e
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            tab_l AS l
        INNER JOIN tab_m AS m
            ON l.a * 2 = m.c + m.d
            AND l.d = m.a
            AND l.b + l.c = m.b * 2
        INNER JOIN tab_r AS r
            ON l.a * 2 = r.a * 2
            AND l.d = r.d
    )
WHERE like(e, '%ReadFromMergeTree%')
    OR like(e, '%Expression%')
    OR like(e, '%Join%')
    OR like(e, '%Clauses%')
    OR like(e, '%Sharding%');

SELECT *
FROM
    tab_l AS l
INNER JOIN tab_m AS m
    ON l.d = m.a
INNER JOIN tab_r AS r
    ON l.a * 2 = r.a * 2
    AND l.b + l.c = r.c * 2
    AND l.d = r.d
ORDER BY l.a ASC
LIMIT 10
OFFSET 999990;

SELECT `explain` AS e
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            tab_l AS l
        INNER JOIN tab_m AS m
            ON l.d = m.a
        INNER JOIN tab_r AS r
            ON l.a * 2 = r.a * 2
            AND l.b + l.c = r.c * 2
            AND l.d = r.d
    )
WHERE like(e, '%ReadFromMergeTree%')
    OR like(e, '%Expression%')
    OR like(e, '%Join%')
    OR like(e, '%Clauses%')
    OR like(e, '%Sharding%');

SELECT *
FROM
    tab_l AS l
RIGHT JOIN tab_m AS m
    ON l.a * 2 = m.c + m.d
    AND l.d = m.a
    AND l.b + l.c = m.b * 2
ORDER BY l.a ASC
LIMIT 10
OFFSET 999990;

SELECT `explain` AS e
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            tab_l AS l
        RIGHT JOIN tab_m AS m
            ON l.a * 2 = m.c + m.d
            AND l.b + l.c = m.b * 2
    )
WHERE like(e, '%ReadFromMergeTree%')
    OR like(e, '%Expression%')
    OR like(e, '%Join%')
    OR like(e, '%Clauses%')
    OR like(e, '%Sharding%');

SELECT *
FROM
    tab_l AS l
LEFT JOIN tab_m AS m
    ON l.a * 2 = m.c + m.d
    AND l.d = m.a
    AND l.b + l.c = m.b * 2
LEFT JOIN tab_r AS r
    ON l.a * 2 = r.a * 2
    AND l.b + l.c = r.c * 2
    AND l.d = r.d
ORDER BY l.a ASC
LIMIT 10
OFFSET 999990;

SELECT `explain` AS e
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            tab_l AS l
        LEFT JOIN tab_m AS m
            ON l.a * 2 = m.c + m.d
            AND l.d = m.a
            AND l.b + l.c = m.b * 2
        LEFT JOIN tab_r AS r
            ON l.a * 2 = r.a * 2
            AND l.b + l.c = r.c * 2
            AND l.d = r.d
    )
WHERE like(e, '%ReadFromMergeTree%')
    OR like(e, '%Expression%')
    OR like(e, '%Join%')
    OR like(e, '%Clauses%')
    OR like(e, '%Sharding%');