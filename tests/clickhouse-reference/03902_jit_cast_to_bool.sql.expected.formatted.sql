SELECT CAST(a, 'Bool') AS result
FROM test_jit_bool
WHERE a < 3
ORDER BY a ASC;

SELECT CAST(a = b, 'Nullable(Bool)') AS result
FROM test_jit_bool
WHERE a < 5
ORDER BY a ASC;

SELECT if(CAST(a = b, 'Nullable(Bool)'), sign(a), b) - a AS result
FROM test_jit_bool
WHERE a < 5
ORDER BY a ASC;