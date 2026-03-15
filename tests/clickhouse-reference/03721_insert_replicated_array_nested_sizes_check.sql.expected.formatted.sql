SET enable_analyzer = 1;

CREATE TABLE test
(
    a Array(UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM test;