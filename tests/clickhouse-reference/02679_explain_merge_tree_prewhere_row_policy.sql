CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=MergeTree ORDER BY id;
INSERT INTO test_table VALUES (0, 'Value');
CREATE ROW POLICY test_row_policy ON test_table USING id >= 5 TO ALL;
