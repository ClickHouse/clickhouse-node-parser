SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(u8 IN (10, 15, 250));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(i8, -3), lessOrEquals(i8, 2)));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(u16, 4000), lessOrEquals(u16, 61000))
    OR u16 == 42);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(i16, -150), lessOrEquals(i16, 250)));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(u32 IN (42, 4294966296));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(i32, -150), lessOrEquals(i32, 250)));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(u64 IN (42, 18446744073709550616));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(i64, -150), lessOrEquals(i64, 250)));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(date32, '1992-01-01'), lessOrEquals(date32, '2023-08-02')));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(dt64_ms, '2000-01-01'), lessOrEquals(dt64_ms, '2005-01-01')));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(dt64_us, toDateTime64(900000000, 2)), lessOrEquals(dt64_us, '2005-01-01')));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(dt64_ns, '2000-01-01'), lessOrEquals(dt64_ns, '2005-01-01')));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(dt64_s, toDateTime64('-2.01e8'::Decimal64(0), 0)), lessOrEquals(dt64_s, toDateTime64(1.5e8::Decimal64(0), 0))));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(dt64_cs, toDateTime64('-2.01e8'::Decimal64(1), 1)), lessOrEquals(dt64_cs, toDateTime64(1.5e8::Decimal64(2), 2))));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(f32, -0.11::Float32), lessOrEquals(f32, 0.06::Float32)));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(f64, -0.11), lessOrEquals(f64, 0.06)));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(s, '-9'), lessOrEquals(s, '1!!!')));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(fs, '-9'), lessOrEquals(fs, '1!!!')));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(d32, '-0.011'::Decimal32(3)), lessOrEquals(d32, 0.006::Decimal32(3))));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(d64, '-0.0000011'::Decimal64(7)), lessOrEquals(d64, 0.0000006::Decimal64(9))));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(d128, '-0.00000000000011'::Decimal128(20)), lessOrEquals(d128, 0.00000000000006::Decimal128(20))));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(and(greaterOrEquals(d256, '-0.00000000000000000000000000011'::Decimal256(40)), lessOrEquals(d256, 0.00000000000000000000000000006::Decimal256(35))));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(0);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(like(s, '99%')
    OR u64 == 2000);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(like(s, 'z%'));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(u8 == 10
    OR 1 == 1);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(u8 < 0);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(u64 + 1000000 == 1001000);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(u64 + 1000000 == 1001000)
SETTINGS input_format_parquet_filter_push_down = 0;

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(u32 + 1000000 == 999000);

SELECT count()
FROM file('02841.parquet')
WHERE indexHint(s > '');

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(isNull(sometimes_null));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(isNull(sometimes_null_lc));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(isNotNull(mostly_null));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(isNotNull(mostly_null_lc));

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(sometimes_null > 850);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(sometimes_null_lc > 850);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(never_null > 850);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(never_null_lc > 850);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(never_null < 150);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(never_null_lc < 150);

-- Quirk with infinities: this reads too much because KeyCondition represents NULLs as infinities.
SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(sometimes_null < 150);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(sometimes_null_lc < 150);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(positive_or_null < 50); -- quirk with infinities

SELECT
    count(),
    sum(number)
FROM file('02841.parquet', Parquet, 'number UInt64, positive_or_null UInt64')
WHERE indexHint(positive_or_null < 50);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(negative_or_null > -50);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet', Parquet, 'number UInt64, negative_or_null Int64')
WHERE indexHint(negative_or_null > -50);

SELECT
    count(),
    sum(number)
FROM file('02841.parquet')
WHERE indexHint(string_or_null == ''); -- quirk with infinities

-- Parquet index analysis doesn't support empty() function yet
SELECT
    count(),
    sum(number)
FROM file('02841.parquet', Parquet, 'number UInt64, string_or_null String')
WHERE indexHint(string_or_null == '')
SETTINGS optimize_empty_string_comparisons = 0;

SELECT
    count(),
    sum(number)
FROM file('02841.parquet', Parquet, 'number UInt64, nEgAtIvE_oR_nUlL Int64')
WHERE indexHint(nEgAtIvE_oR_nUlL > -50)
SETTINGS input_format_parquet_case_insensitive_column_matching = 1;

SELECT *
FROM file('02841.parquet', Parquet, 'x Nullable(String)')
WHERE x NOT IN (1);

SELECT *
FROM file('t.parquet', Parquet, 'x Int64')
WHERE x >= 3;