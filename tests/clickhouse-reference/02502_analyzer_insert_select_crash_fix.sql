SET enable_analyzer = 1;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=MergeTree ORDER BY id;
CREATE TABLE test_table_data
(
    id UInt64,
    value String
) ENGINE=MergeTree ORDER BY id;
SELECT id, value FROM test_table ORDER BY id;
