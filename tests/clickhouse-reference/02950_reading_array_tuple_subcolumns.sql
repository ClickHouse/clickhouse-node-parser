CREATE TABLE test
(
    `id` UInt64,
    `t` Tuple(a UInt64, b Array(Tuple(c UInt64, d UInt64)))
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1, index_granularity = 8192;
SELECT t.b, t.b.c FROM test ORDER BY id FORMAT Null;
