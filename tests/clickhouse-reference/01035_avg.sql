SELECT avg(i8), avg(i16), avg(i32), avg(i64), avg(i128), avg(i256),
       avg(u8), avg(u16), avg(u32), avg(u64), avg(u128), avg(u256),
       avg(f32), avg(f64),
       avg(d32), avg(d64), avg(d128), avg(d256) FROM test_01035_avg;
SELECT avg(i8 * i16) FROM test_01035_avg;
SELECT avg(f32 + f64) FROM test_01035_avg;
SELECT avg(d128 - d64) FROM test_01035_avg;
-- Checks that the internal SUM does not overflow Int8
SELECT avg(key), avgIf(key, key > 0), avg(key2), avgIf(key2, key2 > 0), avg(key3), avgIf(key3, key3 > 0)
FROM
(
     SELECT 1::Int8 as key, Null::Nullable(Int8) AS key2, 1::Nullable(Int8) as key3
     FROM numbers(100000)
)
