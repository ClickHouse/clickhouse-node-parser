SET optimize_distinct_in_order = 1;

CREATE TABLE test_string
(
    c1 String,
    c2 String
)
ENGINE = MergeTree
ORDER BY c1;

SELECT DISTINCT
    c2,
    c1
FROM test_string;