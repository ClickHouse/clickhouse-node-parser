CREATE TABLE test_alter_drop_comment
(
    c0 Int,
    c1 Int,
    c2 String
)
ENGINE = Memory;

SELECT
    table,
    name,
    comment
FROM `system`.`columns`
WHERE table = 'test_alter_drop_comment'
    AND database = currentDatabase()
ORDER BY name ASC;

-- Test with different table engines
-- Test with MergeTree
CREATE TABLE test_alter_drop_comment_mt
(
    id Int32,
    value String,
    status Int8
)
ENGINE = MergeTree()
ORDER BY id;

-- Test edge case: try to drop and comment the same column without IF EXISTS (should fail)
CREATE TABLE test_alter_fail
(
    c0 Int,
    c1 Int
)
ENGINE = Memory;