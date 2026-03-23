SET enable_analyzer = 1;
SET single_join_prefer_left_table = 0;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=TinyLog;
INSERT INTO test_table VALUES (0, 'Value');
CREATE TABLE test_table_in
(
    id UInt64
) ENGINE=TinyLog;
CREATE TABLE test_table_compound
(
    id UInt64,
    tuple_value Tuple(value_1 UInt64, value_2 String)
) ENGINE=TinyLog;
INSERT INTO test_table_compound VALUES (0, tuple(0, 'Value'));
CREATE TABLE test_table_join_1
(
    id UInt64,
    value String,
    value_join_1 String
) ENGINE=TinyLog;
INSERT INTO test_table_join_1 VALUES (0, 'Join_1_Value', 'Join_1_Value');
CREATE TABLE test_table_join_2
(
    id UInt64,
    value String,
    value_join_2 String
) ENGINE=TinyLog;
INSERT INTO test_table_join_2 VALUES (0, 'Join_2_Value', 'Join_2_Value');
CREATE TABLE test_table_join_3
(
    id UInt64,
    value String,
    value_join_3 String
) ENGINE=TinyLog;
INSERT INTO test_table_join_3 VALUES (0, 'Join_3_Value', 'Join_3_Value');
SELECT '--';
