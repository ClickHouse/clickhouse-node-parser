CREATE TABLE test
(
    `x` Tuple(UInt64, UInt64)
)
ENGINE = MergeTree
ORDER BY x;
SELECT COUNT() FROM test;
