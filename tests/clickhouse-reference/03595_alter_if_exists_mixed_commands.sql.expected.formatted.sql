-- Test 1: COMMENT COLUMN IF EXISTS with column deleted by previous command
CREATE TABLE test_alter_mixed
(
    x Int32,
    y String
)
ENGINE = Memory;

-- Test 2: Multiple operations with mixed types in sequence
CREATE TABLE test_alter_mixed
(
    a Int32,
    b String,
    c Float64
)
ENGINE = Memory;