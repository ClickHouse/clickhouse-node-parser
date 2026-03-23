SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test_table;

SELECT '--';

SYSTEM DROP  TABLE test_table;