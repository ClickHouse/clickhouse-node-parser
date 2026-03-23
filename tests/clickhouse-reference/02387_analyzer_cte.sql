SET enable_analyzer = 1;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=MergeTree ORDER BY tuple();
INSERT INTO test_table VALUES (0, 'Value');
SELECT '--';
