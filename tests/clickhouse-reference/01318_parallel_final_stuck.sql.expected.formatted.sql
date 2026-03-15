CREATE TABLE final_bug
(
    x UInt64,
    y UInt8
)
ENGINE = ReplacingMergeTree(y)
ORDER BY x
SETTINGS index_granularity = 8;

SELECT x
FROM final_bug FINAL
ORDER BY x ASC
SETTINGS
    max_threads = 2,
    max_final_threads = 2,
    max_block_size = 8
FORMAT Null;