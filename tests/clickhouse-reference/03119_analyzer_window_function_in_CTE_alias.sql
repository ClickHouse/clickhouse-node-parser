-- https://github.com/ClickHouse/ClickHouse/issues/47422
SET enable_analyzer=1;
CREATE TEMPORARY TABLE test (a Float32, id UInt64);
-- aliases clash without CTE
SELECT avg(a) OVER () AS a, id FROM test SETTINGS allow_experimental_window_functions = 1;
