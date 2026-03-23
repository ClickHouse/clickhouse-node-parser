CREATE TABLE test
(
    id UInt64,
    json JSON
)
ENGINE = CoalescingMergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = '100G', merge_max_block_size = 33, index_granularity = 800;

INSERT INTO test SELECT
    number,
    '{}'
FROM numbers(10000);