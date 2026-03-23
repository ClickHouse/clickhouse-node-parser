-- Tags: no-random-merge-tree-settings
SET query_plan_optimize_lazy_materialization = 1;

SET query_plan_max_limit_for_lazy_materialization = 10;

SET parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;

SET enable_analyzer = 1;

DROP TABLE IF EXISTS tt0;

CREATE TABLE tt0
(
    k UInt64,
    v String,
    blob String,
    PROJECTION proj_v (    SELECT *
    ORDER BY v ASC)
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO tt0 SELECT
    number,
    toString(number),
    repeat('blob_', number % 10)
FROM numbers(1000000);

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

DROP TABLE IF EXISTS tt1;

CREATE TABLE tt1
(
    k UInt64,
    v String,
    blob String
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS index_granularity = 10;

INSERT INTO tt1 SELECT
    number,
    toString(number),
    repeat('blob_', number % 10)
FROM numbers(1000);

INSERT INTO tt1 SELECT
    number,
    toString(number),
    repeat('blob_', number % 10)
FROM numbers(1000, 1000);

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

DROP TABLE tt1;

DROP TABLE tt0;