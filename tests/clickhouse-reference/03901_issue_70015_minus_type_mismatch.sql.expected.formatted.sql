-- The problematic query pattern from the issue:
-- if(CAST(equals(), 'Nullable(Bool)'), sign(Int64), Int64) - Int32
SELECT if(CAST(c_izfnu = c_l8d2_b, 'Nullable(Bool)'), sign(c_izfnu), c_hmbcdw) - c_zjw AS result
FROM t_70015
ORDER BY result ASC;

-- Additional test cases for type promotion in minus
SELECT toInt64(10) - toInt32(5);

SELECT toInt64(10) - toInt16(5);

SELECT toInt64(10) - toInt8(5);

SELECT toInt32(10) - toInt64(5);