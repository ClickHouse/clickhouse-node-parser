SET enable_analyzer = 1;

CREATE TABLE test_table_data
(
    id UInt64,
    value String
)
ENGINE = MergeTree()
ORDER BY id;

CREATE TABLE test_table
ENGINE = MergeTree()
ORDER BY tuple() AS
SELECT *
FROM test_table_data;

SELECT *
FROM test_table;