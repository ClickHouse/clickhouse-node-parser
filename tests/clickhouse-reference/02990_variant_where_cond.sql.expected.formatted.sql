SELECT *
FROM test
WHERE v = 'Hello';

SELECT *
FROM test
WHERE v = 42;

SELECT *
FROM test
WHERE v = 42::UInt64::Variant(String, UInt64);

SELECT *
FROM test_compat
WHERE v = 42;

SELECT *
FROM test_compat
WHERE v = 10;