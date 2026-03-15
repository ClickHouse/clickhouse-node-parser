-- Test 1: Memory engine - UPDATE + RENAME on same column should be rejected
CREATE TABLE test_alter_atomic (c0 Int32) ENGINE = Memory;
-- Verify the column still has its original name (c0) since the ALTER was rejected
SELECT * FROM test_alter_atomic;
SELECT name FROM system.columns WHERE database = currentDatabase() AND table = 'test_alter_atomic';
SELECT * FROM test_alter_atomic ORDER BY c0;
-- Test 2: MergeTree engine - same behavior expected
CREATE TABLE test_alter_atomic (key Int32, c0 Int32) ENGINE = MergeTree ORDER BY key;
-- Verify column still has original name
SELECT name FROM system.columns WHERE database = currentDatabase() AND table = 'test_alter_atomic' ORDER BY position;
SELECT * FROM test_alter_atomic ORDER BY key;
-- Test 4: Verify UPDATE + RENAME on DIFFERENT columns works fine
CREATE TABLE test_alter_atomic (key Int32, c0 Int32, c1 Int32) ENGINE = MergeTree ORDER BY key;
-- Wait for mutation to complete
SELECT sleepEachRow(0.1) FROM numbers(30) SETTINGS function_sleep_max_microseconds_per_block = 10000000 FORMAT Null;
SELECT key, c0, c2 FROM test_alter_atomic;
