set enable_analyzer=1;
CREATE TABLE test (i UInt64) Engine = MergeTree() order by i;
-- Only set limit
SET limit = 5;
SELECT * FROM test ORDER BY i; -- 5 rows
SELECT * FROM test ORDER BY i OFFSET 20; -- 5 rows
SELECT * FROM (SELECT i FROM test LIMIT 10 OFFSET 50) TMP ORDER BY i; -- 5 rows
SELECT * FROM test ORDER BY i LIMIT 4 OFFSET 192; -- 4 rows
SELECT * FROM test ORDER BY i LIMIT 10 OFFSET 195; -- 5 rows
-- Only set offset
SET limit = 0;
SET offset = 195;
SELECT * FROM test ORDER BY i LIMIT 100; -- no result
SET offset = 10;
SELECT * FROM test ORDER BY i LIMIT 20 OFFSET 100; -- 10 rows
SELECT * FROM test ORDER BY i LIMIT 11 OFFSET 100; -- 1 rows
-- offset and limit together
SET limit = 10;
SELECT * FROM test ORDER BY i LIMIT 50 OFFSET 50; -- 10 rows
SELECT * FROM test ORDER BY i LIMIT 50 OFFSET 190; -- 0 rows
SELECT * FROM test ORDER BY i LIMIT 50 OFFSET 185; -- 5 rows
SELECT * FROM test ORDER BY i LIMIT 18 OFFSET 5; -- 8 rows
