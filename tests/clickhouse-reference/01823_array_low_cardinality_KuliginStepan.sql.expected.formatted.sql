CREATE TEMPORARY TABLE test
(
    arr Array(Array(LowCardinality(String)))
);

SELECT arrayFilter(x -> 1, arr)
FROM test;