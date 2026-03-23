-- Tags: long
SET mutations_sync = 1;

CREATE TABLE test_updates
(
    id UInt64,
    json JSON,
    dynamic Dynamic
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 10000000, min_bytes_for_wide_part = 1000000000, index_granularity = 8192, index_granularity_bytes = '10Mi';

INSERT INTO test_updates SELECT
    number,
    '{"a" : 42, "b" : 42, "c" : 42}',
    42::Int64
FROM numbers(100000);

SELECT DISTINCT arrayJoin(JSONDynamicPaths(json))
FROM test_updates
ORDER BY `all` ASC;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(json))
FROM test_updates
ORDER BY `all` ASC;

SELECT
    dynamicType(json.a),
    isDynamicElementInSharedData(json.a),
    count()
FROM test_updates
GROUP BY ALL
ORDER BY `all` ASC;

SELECT
    dynamicType(dynamic),
    isDynamicElementInSharedData(dynamic),
    count()
FROM test_updates
GROUP BY ALL
ORDER BY `all` ASC;

SELECT
    json,
    json.a,
    dynamic
FROM test_updates
WHERE id IN (49999, 50000)
ORDER BY id ASC;

SELECT
    json,
    dynamic
FROM test_updates
FORMAT Null;

CREATE TABLE test_updates
(
    id UInt64,
    json JSON,
    dynamic Dynamic
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1, index_granularity = 8192, index_granularity_bytes = '10Mi';