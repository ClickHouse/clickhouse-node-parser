SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test_table SELECT
    0,
    'Value_0';

SYSTEM DROP  TABLE IF EXISTS test_table_data;

CREATE TABLE test_table_data
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test_table_data;

INSERT INTO test_table SELECT
    id,
    value
FROM test_table_data;

SELECT
    id,
    value
FROM test_table
ORDER BY id ASC;

SYSTEM DROP  TABLE test_table_data;

SYSTEM DROP  TABLE test_table;