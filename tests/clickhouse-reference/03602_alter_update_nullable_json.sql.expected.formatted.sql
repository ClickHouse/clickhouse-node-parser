SET mutations_sync = 1;

SET max_block_size = 1000;

CREATE TABLE test
(
    id UInt32,
    json Nullable(JSON(max_dynamic_paths = 1))
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = '200G';

SELECT DISTINCT arrayJoin(JSONDynamicPaths(assumeNotNull(json)))
FROM test;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(assumeNotNull(json)))
FROM test;

CREATE TABLE test
(
    id UInt32,
    json Nullable(JSON(max_dynamic_paths = 1))
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1;