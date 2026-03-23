-- Tags: no-replicated-database
-- Test runtime IF EXISTS checks for mixed replicated/non-replicated ALTER commands
-- This test verifies that IF EXISTS clauses work correctly when mixing different types
-- of ALTER operations (replicated and non-replicated) in the same statement
SYSTEM DROP  TABLE IF EXISTS test_alter_mixed;

-- Test 1: COMMENT COLUMN IF EXISTS with column deleted by previous command
CREATE TABLE test_alter_mixed
(
    x Int32,
    y String
)
ENGINE = Memory;

SYSTEM DROP  TABLE test_alter_mixed;

-- Test 2: Multiple operations with mixed types in sequence
CREATE TABLE test_alter_mixed
(
    a Int32,
    b String,
    c Float64
)
ENGINE = Memory;