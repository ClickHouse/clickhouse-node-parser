SET enable_analyzer = 1;

DROP TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test_table;

SELECT '--';

DROP TABLE test_table;