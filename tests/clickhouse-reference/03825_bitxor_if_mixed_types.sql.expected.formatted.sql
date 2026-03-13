-- Simple case: bitXor with IF returning Int64 (from Int32 and Int64)
SELECT bitXor(if(like(c_str, 'i5%v0%'), c_int32, toInt64(floor(7850539625197349647))), c_int32) AS result
FROM test_bitxor_if
ORDER BY c_int32 ASC;

-- With CASE WHEN wrapping
SELECT multiIf(c_int32 > 0, bitXor(if(like(c_str, 'i5%v0%'), c_int32, toInt64(floor(7850539625197349647))), c_int32), 0) AS result
FROM test_bitxor_if
ORDER BY c_int32 ASC;

-- Verify types
SELECT
    toTypeName(if(like(c_str, 'i5%v0%'), c_int32, toInt64(floor(7850539625197349647)))) AS if_type,
    toTypeName(bitXor(if(like(c_str, 'i5%v0%'), c_int32, toInt64(floor(7850539625197349647))), c_int32)) AS bitxor_type
FROM test_bitxor_if
LIMIT 1;