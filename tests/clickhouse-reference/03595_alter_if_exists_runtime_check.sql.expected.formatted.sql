-- Test 1: DROP COLUMN IF EXISTS with column deleted by previous command
CREATE TABLE test_alter_if_exists
(
    c0 Int32,
    c1 String
)
ENGINE = Memory;

-- Test 3: RENAME COLUMN IF EXISTS with column deleted by previous command
CREATE TABLE test_alter_if_exists
(
    x Int32,
    y String
)
ENGINE = Memory;