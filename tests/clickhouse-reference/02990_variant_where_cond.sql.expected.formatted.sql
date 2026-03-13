-- These now throw errors because Variant(String, UInt64) has incompatible types
SELECT *
FROM test
WHERE v = 'Hello'; -- {serverError TYPE_MISMATCH}

SELECT *
FROM test
WHERE v = 42; -- {serverError NO_COMMON_TYPE}

SELECT *
FROM test
WHERE v = 42::UInt64::Variant(String, UInt64); -- {serverError NO_COMMON_TYPE}

SELECT *
FROM test_compat
WHERE v = 42;

SELECT *
FROM test_compat
WHERE v = 10;