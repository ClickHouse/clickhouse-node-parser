CREATE TABLE test
(
    key FixedString(10)
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY tuple();

SELECT count()
FROM test
WHERE key = '1';