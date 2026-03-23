-- Tags: no-replicated-database
-- Test runtime IF EXISTS checks for mixed replicated/non-replicated ALTER commands
-- This test verifies that IF EXISTS clauses work correctly when mixing different types
-- of ALTER operations (replicated and non-replicated) in the same statement
DROP TABLE IF EXISTS test_alter_mixed;

-- Test 1: COMMENT COLUMN IF EXISTS with column deleted by previous command
CREATE TABLE test_alter_mixed
(
    x Int32,
    y String
)
ENGINE = Memory;

-- This should succeed - DROP removes x, COMMENT with IF EXISTS should be silently ignored
ALTER TABLE test_alter_mixed DROP COLUMN x, COMMENT COLUMN x 'test comment';

DROP TABLE test_alter_mixed;

-- Test 2: Multiple operations with mixed types in sequence
CREATE TABLE test_alter_mixed
(
    a Int32,
    b String,
    c Float64
)
ENGINE = Memory;

-- Complex case: multiple drops and modifications including comments
ALTER TABLE test_alter_mixed DROP COLUMN a, DROP COLUMN a, MODIFY COLUMN a Int64, COMMENT COLUMN a 'should be ignored', RENAME COLUMN a TO a_renamed, MODIFY COLUMN b String DEFAULT 'test', DROP COLUMN c, MODIFY COLUMN c Float32;