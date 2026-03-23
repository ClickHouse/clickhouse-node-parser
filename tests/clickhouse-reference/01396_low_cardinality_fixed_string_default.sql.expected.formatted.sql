CREATE TABLE test
(
    id UInt32,
    code LowCardinality(FixedString(2)) DEFAULT '--'
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY id;

INSERT INTO test;

SELECT *
FROM test
ORDER BY code ASC;