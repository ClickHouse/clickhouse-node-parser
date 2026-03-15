CREATE TABLE tab (x UInt32) ENGINE = MergeTree ORDER BY x;
SELECT count(*)
FROM system.parts
WHERE database = currentDatabase()
    AND table = 'tab'
    AND active = 1
