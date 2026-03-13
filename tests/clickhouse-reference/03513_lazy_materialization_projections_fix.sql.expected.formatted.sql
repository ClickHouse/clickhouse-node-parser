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

-- check that table has 2 parts without and with projection
SELECT
    name,
    projections
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'tt1'
ORDER BY name ASC;

-- reading using projection from the table should have 2 reading steps, - one for part w/o proj and one for part with proj
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

-- currently lazy materialization doesn't support such mixed reading
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