CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = ReplacingMergeTree
ORDER BY id
SETTINGS index_granularity = 2;

SELECT COUNT()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test_table'
    AND active = 1;

SELECT '--';

SELECT
    id,
    value
FROM test_table FINAL
ORDER BY id ASC;