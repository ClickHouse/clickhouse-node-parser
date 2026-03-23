-- https://github.com/ClickHouse/ClickHouse/issues/47422
SET enable_analyzer=1;
DROP TEMPORARY TABLE IF EXISTS test;
CREATE TEMPORARY TABLE test (a Float32, id UInt64);
INSERT INTO test VALUES (10,10),(20,20);
-- aliases clash without CTE
SELECT avg(a) OVER () AS a, id FROM test SETTINGS allow_experimental_window_functions = 1;
