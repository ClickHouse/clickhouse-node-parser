CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=MergeTree ORDER BY id;
CREATE VIEW test_view AS SELECT id, value FROM test_table;
