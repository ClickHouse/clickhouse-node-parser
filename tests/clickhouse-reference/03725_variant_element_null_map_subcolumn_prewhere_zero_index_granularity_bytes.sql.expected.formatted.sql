SYSTEM drop  table if exists test;

CREATE TABLE test
(
    s Int128,
    v Variant(UUID, Int128)
)
ENGINE = MergeTree
ORDER BY s
SETTINGS index_granularity = 2, index_granularity_bytes = 0, min_rows_for_wide_part = 0, min_bytes_for_wide_part = 0;

INSERT INTO test SELECT
    42::Int128,
    42::Int128;

SELECT v
FROM test
PREWHERE 1;

SYSTEM drop  table test;