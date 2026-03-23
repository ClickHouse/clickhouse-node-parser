SET enable_analyzer = 1;
SET single_join_prefer_left_table = 0;
DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=TinyLog;
INSERT INTO test_table VALUES (0, 'Value');
DROP TABLE IF EXISTS test_table_in;
CREATE TABLE test_table_in
(
    id UInt64
) ENGINE=TinyLog;
DROP TABLE IF EXISTS test_table_compound;
CREATE TABLE test_table_compound
(
    id UInt64,
    tuple_value Tuple(value_1 UInt64, value_2 String)
) ENGINE=TinyLog;
INSERT INTO test_table_compound VALUES (0, tuple(0, 'Value'));
DROP TABLE IF EXISTS test_table_join_1;
CREATE TABLE test_table_join_1
(
    id UInt64,
    value String,
    value_join_1 String
) ENGINE=TinyLog;
INSERT INTO test_table_join_1 VALUES (0, 'Join_1_Value', 'Join_1_Value');
DROP TABLE IF EXISTS test_table_join_2;
CREATE TABLE test_table_join_2
(
    id UInt64,
    value String,
    value_join_2 String
) ENGINE=TinyLog;
INSERT INTO test_table_join_2 VALUES (0, 'Join_2_Value', 'Join_2_Value');
DROP TABLE IF EXISTS test_table_join_3;
CREATE TABLE test_table_join_3
(
    id UInt64,
    value String,
    value_join_3 String
) ENGINE=TinyLog;
INSERT INTO test_table_join_3 VALUES (0, 'Join_3_Value', 'Join_3_Value');
SELECT '--';
-- { echoOff }

DROP TABLE test_table_join_1;
DROP TABLE test_table_join_2;
DROP TABLE test_table_join_3;
DROP TABLE test_table;
DROP TABLE test_table_compound;
