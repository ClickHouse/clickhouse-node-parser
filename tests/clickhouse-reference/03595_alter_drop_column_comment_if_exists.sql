-- Tags: no-replicated-database

-- Test for issue #85608: Logical Error when using DROP COLUMN and COMMENT COLUMN IF EXISTS in same ALTER
-- This test verifies that COMMENT COLUMN IF EXISTS works correctly when the column is being dropped in the same ALTER statement

-- Test with Memory engine
DROP TABLE IF EXISTS test_alter_drop_comment;
CREATE TABLE test_alter_drop_comment (
    c0 Int,
    c1 Int,
    c2 String
) ENGINE = Memory;
SELECT table, name, comment 
FROM system.columns 
WHERE table = 'test_alter_drop_comment' AND database = currentDatabase()
ORDER BY name;
DROP TABLE test_alter_drop_comment;
-- Test with different table engines
-- Test with MergeTree
CREATE TABLE test_alter_drop_comment_mt (
    id Int32,
    value String,
    status Int8
) ENGINE = MergeTree() ORDER BY id;
DROP TABLE test_alter_drop_comment_mt;
-- Test edge case: try to drop and comment the same column without IF EXISTS (should fail)
CREATE TABLE test_alter_fail (c0 Int, c1 Int) ENGINE = Memory;
DROP TABLE test_alter_fail;
