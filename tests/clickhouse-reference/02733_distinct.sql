CREATE TABLE test
(
    c1 String,
    c2 String,
    c3 String
)
ENGINE = ReplacingMergeTree
ORDER BY (c1, c3);
SELECT c1, c2, c3 FROM test GROUP BY c1, c2, c3 ORDER BY c1, c2, c3;
SELECT DISTINCT c1, c2, c3 FROM test;
