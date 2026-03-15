CREATE TABLE test_table
(
    id UInt64,
    value IPv6
)
ENGINE = MergeTree
ORDER BY id;

SELECT *
FROM test_table
ORDER BY id ASC;