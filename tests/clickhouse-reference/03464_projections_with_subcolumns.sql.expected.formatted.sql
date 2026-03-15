-- Tags: long
SET enable_analyzer = 1;

SET mutations_sync = 1;

SET parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;

CREATE TABLE test
(
    a UInt32,
    json JSON(a UInt32),
    t Tuple(a UInt32, b UInt32),
    PROJECTION p1 (    SELECT json
    ORDER BY json.a ASC),
    PROJECTION p2 (    SELECT t
    ORDER BY t.a ASC),
    PROJECTION p3 (    SELECT json
    ORDER BY json.`c[]`.d.:Int64 ASC)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1;

SELECT trimLeft(*)
FROM (
        EXPLAIN indexes = 1
        SELECT json
        FROM test
        WHERE json.a = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%');

SELECT json
FROM test
WHERE json.a = 1;

SELECT trimLeft(*)
FROM (
        EXPLAIN indexes = 1
        SELECT t
        FROM test
        WHERE t.a = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%');

SELECT t
FROM test
WHERE t.a = 1;

SELECT trimLeft(*)
FROM (
        EXPLAIN indexes = 1
        SELECT json
        FROM test
        WHERE json.`c[]`.d.:Int64 = [1]
    )
WHERE like(`explain`, '%ReadFromMergeTree%');

SELECT json
FROM test
WHERE json.`c[]`.d.:Int64 = [1];

SELECT '------------------------------------------------------------------';

CREATE TABLE test
(
    a UInt32,
    json JSON(a UInt32),
    t Tuple(a UInt32, b UInt32)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1;