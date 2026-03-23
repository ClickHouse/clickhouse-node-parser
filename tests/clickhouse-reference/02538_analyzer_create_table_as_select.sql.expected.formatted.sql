SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS test_table_data;

CREATE TABLE test_table_data
(
    id UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY id;

INSERT INTO test_table_data;

SYSTEM DROP  TABLE IF EXISTS test_table;

CREATE TABLE test_table
ENGINE = MergeTree()
ORDER BY tuple() AS
SELECT *
FROM test_table_data;

SELECT *
FROM test_table;

SYSTEM DROP  TABLE test_table_data;

SYSTEM DROP  TABLE test_table;