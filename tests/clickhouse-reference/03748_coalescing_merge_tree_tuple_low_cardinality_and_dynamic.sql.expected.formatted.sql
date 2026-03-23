SET mutations_sync = 1;

DROP TABLE IF EXISTS test;

CREATE TABLE test
(
    id UInt64,
    t Tuple(a LowCardinality(String), json JSON)
)
ENGINE = CoalescingMergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1, index_granularity = 32, merge_max_block_size = 32;

INSERT INTO test SELECT
    number,
    tuple('str', '{}')
FROM numbers(100);

SELECT DISTINCT arrayJoin(JSONDynamicPaths(t.json))
FROM test;

SELECT DISTINCT arrayJoin(JSONSharedDataPaths(t.json))
FROM test;

DROP TABLE test;