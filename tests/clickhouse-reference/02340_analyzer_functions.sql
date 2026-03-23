SET enable_analyzer = 1;
SELECT 1 + 1;
SELECT '--';
SELECT dummy + dummy;
DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=TinyLog;
INSERT INTO test_table VALUES (0, 'Value');
SELECT id + length(value) FROM test_table;
SELECT concat(concat(toString(id), '_'), (value)) FROM test_table;
