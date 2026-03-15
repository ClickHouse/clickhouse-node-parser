SET enable_analyzer = 1;

CREATE TABLE test_table
(
    c0 String ALIAS c1,
    c1 String,
    c2 String
)
ENGINE = MergeTree
ORDER BY c1;

SELECT MAX(1)
FROM test_table;