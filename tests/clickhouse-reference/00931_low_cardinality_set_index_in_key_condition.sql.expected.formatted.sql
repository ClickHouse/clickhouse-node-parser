CREATE TABLE test_in
(
    a LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY a;

INSERT INTO test_in;

SELECT *
FROM test_in
WHERE a IN ('a');