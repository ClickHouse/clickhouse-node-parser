-- Tags: long
SET enable_json_type = 1;

SET max_block_size = 1000;

CREATE TABLE test
(
    json JSON
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT DISTINCT arrayJoin(JSONAllPaths(json)) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT arrayJoin(JSONDynamicPaths(json)) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(json)) AS path
FROM test
ORDER BY path ASC;

CREATE TABLE test
(
    json JSON(max_dynamic_paths=2)
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE test
(
    json JSON(max_dynamic_paths=8)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT DISTINCT arrayJoin(JSONAllPaths(arrayJoin(json.`a[]`))) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT arrayJoin(JSONDynamicPaths(arrayJoin(json.`a[]`))) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(arrayJoin(json.`a[]`))) AS path
FROM test
ORDER BY path ASC;