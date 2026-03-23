-- Test runtime IF EXISTS checks for ALTER COLUMN commands
-- This test verifies that IF EXISTS clauses work correctly when column state changes
-- between validate() and apply() phases within the same ALTER statement

DROP TABLE IF EXISTS test_alter_if_exists;
-- Test 1: DROP COLUMN IF EXISTS with column deleted by previous command
CREATE TABLE test_alter_if_exists (c0 Int32, c1 String) ENGINE = Memory;
DROP TABLE test_alter_if_exists;
-- Test 3: RENAME COLUMN IF EXISTS with column deleted by previous command
CREATE TABLE test_alter_if_exists (x Int32, y String) ENGINE = Memory;
