SET compile_expressions = 1;

SET min_count_to_compile_expression = 0;

CREATE TABLE test_table
(
    a UInt8,
    b UInt8
)
ENGINE = TinyLog;

SELECT
    a,
    b,
    and(a, b),
    or(a, b),
    xor(a, b)
FROM test_table;

CREATE TABLE test_table_nullable
(
    a UInt8,
    b Nullable(UInt8)
)
ENGINE = TinyLog;

SELECT
    a,
    b,
    and(a, b),
    or(a, b),
    xor(a, b)
FROM test_table_nullable;

SELECT
    and(b, b),
    or(b, b),
    xor(b, b)
FROM test_table_nullable;