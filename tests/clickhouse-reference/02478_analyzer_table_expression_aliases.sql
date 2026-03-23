SET enable_analyzer = 1;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE = TinyLog;
INSERT INTO test_table VALUES (0, 'Value');
SELECT * FROM test_table AS test_table;
SELECT '--';
SELECT * FROM test_table AS t1, t1;
SELECT * FROM t1, test_table AS t1;
SELECT * FROM test_table AS test_table, test_table;
SELECT * FROM (SELECT 1) AS test_table, test_table AS subquery;
SELECT * FROM test_table AS subquery, (SELECT 1) AS test_table;
SELECT * FROM t3, test_table AS t1, t1 AS t2, t2 AS t3;
SELECT * FROM t3 AS t4, (SELECT 1) AS t1, t1 AS t2, t2 AS t3;
