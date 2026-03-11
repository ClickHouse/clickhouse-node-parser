SELECT
    id,
    any(value1),
    any(value2),
    any(value3),
    any(value4)
FROM test_table_unsigned_values
GROUP BY id
ORDER BY id ASC;

SELECT
    id,
    any(value1),
    any(value2),
    any(value3),
    any(value4)
FROM test_table_signed_values
GROUP BY id
ORDER BY id ASC;

SELECT
    id,
    any(value1),
    any(value2)
FROM test_table_float_values
GROUP BY id
ORDER BY id ASC;

SELECT
    id,
    any(value1),
    any(value2),
    any(value3),
    any(value4)
FROM test_table_nullable_unsigned_values
GROUP BY id
ORDER BY id ASC;

SELECT
    id,
    any(value1),
    any(value2),
    any(value3),
    any(value4)
FROM test_table_nullable_signed_values
GROUP BY id
ORDER BY id ASC;

SELECT
    id,
    any(value1),
    any(value2)
FROM test_table_nullable_float_values
GROUP BY id
ORDER BY id ASC;

SELECT
    id,
    any(value1),
    any(value2),
    any(value3)
FROM test_table_null_specifics
GROUP BY id
ORDER BY id ASC;