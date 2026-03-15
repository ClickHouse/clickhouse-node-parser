CREATE TABLE test (x UInt8, y UInt8, z String DEFAULT toString(x)) PARTITION BY x ORDER BY x;
SET mutations_sync = 1;
SELECT * FROM test ORDER BY ALL;
-- SELECT * FROM system.part_log WHERE database = currentDatabase() FORMAT Vertical;
SELECT DISTINCT throwIf(empty(partition)) FROM system.part_log WHERE database = currentDatabase();
