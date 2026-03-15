CREATE TABLE test_table
(
    n Int32,
    s String
)
ENGINE = MergeTree()
ORDER BY n
PARTITION BY n % 10;

SELECT *
FROM test_table
ORDER BY
    n ASC,
    s ASC
LIMIT 30;