SELECT
    a,
    b,
    and(a, b),
    or(a, b),
    xor(a, b)
FROM test_table;

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