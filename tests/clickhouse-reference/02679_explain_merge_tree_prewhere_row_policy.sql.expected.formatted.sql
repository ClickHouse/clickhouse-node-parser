DROP TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test_table;

DROP ROW POLICY IF EXISTS test_row_policy ON test_table;

CREATE ROW POLICY test_row_policy ON test_table USING id >= 5 TO ALL;

DROP ROW POLICY test_row_policy ON test_table;

DROP TABLE test_table;