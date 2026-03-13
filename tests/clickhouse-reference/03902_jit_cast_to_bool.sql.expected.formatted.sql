-- Test CAST to Bool with JIT
SELECT CAST(a, 'Bool') AS result
FROM test_jit_bool
WHERE a < 3
ORDER BY a ASC;

-- Test CAST to Nullable(Bool) with JIT - this was crashing before the fix
SELECT CAST(a = b, 'Nullable(Bool)') AS result
FROM test_jit_bool
WHERE a < 5
ORDER BY a ASC;

-- Test in complex expression that triggers JIT compilation
SELECT if(CAST(a = b, 'Nullable(Bool)'), sign(a), b) - a AS result
FROM test_jit_bool
WHERE a < 5
ORDER BY a ASC;