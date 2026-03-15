CREATE TABLE test
(
    x Enum('hello' = 1, 'world' = 2),
    y String
)
ENGINE = MergeTree
ORDER BY y
PARTITION BY x;

SELECT *
FROM test;

SELECT
    name,
    `partition`,
    partition_id
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test'
    AND active
ORDER BY `partition` ASC;

SELECT *
FROM test
ORDER BY x ASC;