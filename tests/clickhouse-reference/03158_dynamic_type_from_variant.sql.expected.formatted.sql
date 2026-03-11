SELECT
    v,
    toTypeName(v)
FROM test_variable
ORDER BY v ASC;

SELECT
    d,
    dynamicType(d)
FROM test_dynamic
ORDER BY d ASC;