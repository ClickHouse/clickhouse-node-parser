CREATE TABLE test
(
    s String,
    json JSON MATERIALIZED s
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM test;