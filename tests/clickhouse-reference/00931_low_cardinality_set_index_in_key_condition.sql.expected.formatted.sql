CREATE TABLE test_in
(
    a LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY a;

SELECT *
FROM test_in
WHERE a IN ('a');