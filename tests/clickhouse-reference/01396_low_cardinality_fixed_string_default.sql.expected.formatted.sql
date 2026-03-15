CREATE TABLE test
(
    id UInt32,
    code LowCardinality(FixedString(2)) DEFAULT '--'
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY id;

SELECT *
FROM test
ORDER BY code ASC;