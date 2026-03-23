CREATE TABLE test
(
    type Enum('x'),
    s String
)
ENGINE = MergeTree
ORDER BY s
PARTITION BY type;

INSERT INTO test;

SELECT
    type,
    count()
FROM test
GROUP BY type
ORDER BY type ASC;

INSERT INTO test;