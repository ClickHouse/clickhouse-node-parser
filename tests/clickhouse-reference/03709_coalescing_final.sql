CREATE TABLE test_table
(
    key UInt32,
    A Nullable(UInt32),
    B Nullable(String),
    C Tuple(Nullable(String))
)
ENGINE = CoalescingMergeTree()
ORDER BY key;
SET optimize_on_insert = 0;
SELECT * FROM test_table FINAL;
