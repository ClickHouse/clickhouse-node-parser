CREATE TABLE async_insert_mt_test
(
    a UInt64,
    b Array(UInt64)
)
ENGINE = MergeTree()
ORDER BY a;

SET async_insert_use_adaptive_busy_timeout = 1;