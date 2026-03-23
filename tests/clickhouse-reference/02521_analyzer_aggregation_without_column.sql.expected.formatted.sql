SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    c0 String ALIAS c1,
    c1 String,
    c2 String
)
ENGINE = MergeTree
ORDER BY c1;

INSERT INTO test_table;

SELECT MAX(1)
FROM test_table;

SYSTEM DROP  TABLE test_table;