SET mutations_sync = 1;

CREATE TABLE test
(
    id UInt64,
    json JSON
)
ENGINE = SummingMergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1, index_granularity = 32, merge_max_block_size = 32;

SELECT DISTINCT arrayJoin(JSONDynamicPaths(json))
FROM test;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(json))
FROM test;

CREATE TABLE test
(
    id UInt64,
    json JSON
)
ENGINE = AggregatingMergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1, index_granularity = 32, merge_max_block_size = 32;

CREATE TABLE test
(
    id UInt64,
    json JSON
)
ENGINE = CoalescingMergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1, index_granularity = 32, merge_max_block_size = 32;