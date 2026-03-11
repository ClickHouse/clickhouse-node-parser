SELECT '-- no projection';

SELECT trimLeft(`explain`) AS s
FROM (
        EXPLAIN
        SELECT *
        FROM tt0
        ORDER BY k ASC
        LIMIT 10
    )
WHERE ilike(s, 'LazilyRead%');

SELECT *
FROM tt0
ORDER BY k ASC
LIMIT 10;

SELECT trimLeft(`explain`) AS s
FROM (
        EXPLAIN
        SELECT *
        FROM tt0
        WHERE v = '3'
        ORDER BY v ASC
        LIMIT 10
    )
WHERE ilike(s, 'ReadFromMergeTree (proj_v)');

SELECT trimLeft(`explain`) AS s
FROM (
        EXPLAIN
        SELECT *
        FROM tt0
        WHERE v = '3'
        ORDER BY v ASC
        LIMIT 10
    )
WHERE ilike(s, 'LazilyRead%');

SELECT *
FROM tt0
WHERE v = '3'
ORDER BY v ASC
LIMIT 10;

SELECT
    name,
    projections
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'tt1'
ORDER BY name ASC;

SELECT concat('Reading steps: ', count())
FROM (
        EXPLAIN
        SELECT *
        FROM tt1
        WHERE v = '1001'
        ORDER BY v ASC
        LIMIT 10
    )
WHERE ilike(trimLeft(`explain`), 'ReadFromMergeTree%');

SELECT trimLeft(`explain`) AS s
FROM (
        EXPLAIN
        SELECT *
        FROM tt1
        WHERE v = '1001'
        ORDER BY v ASC
        LIMIT 10
    )
WHERE ilike(s, 'LazilyRead%');