-- Tags: no-azure-blob-storage
SET enable_json_type = 1;

CREATE TABLE test
(
    json JSON(max_dynamic_paths = 8)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1;

SELECT DISTINCT
    dynamicType(json.a) AS type,
    isDynamicElementInSharedData(json.a)
FROM test
ORDER BY type ASC;

SELECT DISTINCT JSONSharedDataPaths(arrayJoin(json.`a[]`)) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT JSONDynamicPaths(arrayJoin(json.`a[]`)) AS path
FROM test
ORDER BY path ASC;

SELECT DISTINCT
    dynamicType(arrayJoin(json.`a[]`.c)) AS type,
    isDynamicElementInSharedData(arrayJoin(json.`a[]`.c))
FROM test
ORDER BY type ASC;

SELECT DISTINCT
    dynamicType(arrayJoin(json.`a[]`.d)) AS type,
    isDynamicElementInSharedData(arrayJoin(json.`a[]`.d))
FROM test
ORDER BY type ASC;