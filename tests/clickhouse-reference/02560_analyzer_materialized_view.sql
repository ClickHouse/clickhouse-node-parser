SET enable_analyzer = 1;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=MergeTree ORDER BY id;
CREATE MATERIALIZED VIEW test_materialized_view
(
    id UInt64,
    value String
) ENGINE=MergeTree ORDER BY id AS SELECT id, value FROM test_table;
INSERT INTO test_table VALUES (0, 'Value_0');
SELECT id, value FROM test_materialized_view ORDER BY id;
SELECT '--';
INSERT INTO test_table VALUES (1, 'Value_1');
CREATE TABLE test_table_data
(
    id UInt64,
    value String
) ENGINE=MergeTree ORDER BY id;
INSERT INTO test_table_data VALUES (2, 'Value_2'), (3, 'Value_3');
INSERT INTO test_table SELECT id, value FROM test_table_data;
