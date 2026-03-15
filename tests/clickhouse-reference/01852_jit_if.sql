SET compile_expressions = 1;
SET min_count_to_compile_expression = 0;
CREATE TABLE test_jit_nonnull (value UInt8) ENGINE = TinyLog;
SELECT value, multiIf(value = 1, 2, value, 1, 0), if (value, 1, 0) FROM test_jit_nonnull;
CREATE TABLE test_jit_nullable (value Nullable(UInt8)) ENGINE = TinyLog;
SELECT value, multiIf(value = 1, 2, value, 1, 0), if (value, 1, 0) FROM test_jit_nullable;
