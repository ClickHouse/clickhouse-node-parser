SELECT
    value,
    multiIf(value = 1, 2, value, 1, 0),
    if(value, 1, 0)
FROM test_jit_nonnull;

SELECT
    value,
    multiIf(value = 1, 2, value, 1, 0),
    if(value, 1, 0)
FROM test_jit_nullable;