CREATE TABLE test (c String) ENGINE = Log;
SELECT * FROM test ORDER BY c, c.size FORMAT Null;
