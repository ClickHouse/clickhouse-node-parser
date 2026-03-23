-- Tags: no-fasttest, no-parallel
SET output_format_parquet_row_group_size = 100;

SET input_format_null_as_default = 1;

SET engine_file_truncate_on_insert = 1;

SET optimize_or_like_chain = 0;

SET max_block_size = 100000;

SET max_insert_threads = 1;

SET input_format_parquet_bloom_filter_push_down = 0;

SET input_format_parquet_page_filter_push_down = 0;

-- Try all the types.
INSERT INTO FUNCTION file('02841.parquet') WITH 5000 - number AS n

SELECT
    number,
    intDiv(n, 11)::UInt8 AS u8,
    n::UInt16 AS u16,
    n::UInt32 AS u32,
    n::UInt64 AS u64,
    intDiv(n, 11)::Int8 AS i8,
    n::Int16 AS i16,
    n::Int32 AS i32,
    n::Int64 AS i64,
    toDate32(n * 500000) AS date32,
    toDateTime64(n * 1e6, 3) AS dt64_ms,
    toDateTime64(n * 1e6, 6) AS dt64_us,
    toDateTime64(n * 1e6, 9) AS dt64_ns,
    toDateTime64(n * 1e6, 0) AS dt64_s,
    toDateTime64(n * 1e6, 2) AS dt64_cs,
    ((n / 1000))::Float32 AS f32,
    ((n / 1000))::Float64 AS f64,
    n::String AS s,
    n::String::FixedString(9) AS fs,
    n::Decimal32(3) / 1234 AS d32,
    n::Decimal64(10) / 12345678 AS d64,
    n::Decimal128(20) / 123456789012345 AS d128,
    n::Decimal256(40) / 123456789012345 / 678901234567890 AS d256
FROM numbers(10000);

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

INSERT INTO FUNCTION file('02841.parquet') SELECT arrayStringConcat(range(number * 1000000)) AS s
FROM numbers(2);

SELECT count()
FROM file('02841.parquet')
WHERE indexHint(s > '');

INSERT INTO FUNCTION file('02841.parquet') SELECT
    number,
    if(number % 234 == 0, NULL, number) AS sometimes_null,
    toNullable(number) AS never_null,
    if(number % 345 == 0, number::String, NULL) AS mostly_null,
    toLowCardinality(if(number % 234 == 0, NULL, number)) AS sometimes_null_lc,
    toLowCardinality(toNullable(number)) AS never_null_lc,
    toLowCardinality(if(number % 345 == 0, number::String, NULL)) AS mostly_null_lc
FROM numbers(1000);

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

INSERT INTO FUNCTION file('02841.parquet') SELECT
    number,
    if(number % 234 == 0, NULL, number + 100) AS positive_or_null,
    if(number % 234 == 0, NULL, negate(number) - 100) AS negative_or_null,
    if(number % 234 == 0, NULL, 'I am a string') AS string_or_null
FROM numbers(1000);

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

INSERT INTO FUNCTION file('02841.parquet') SELECT 42 AS x;

SELECT *
FROM file('02841.parquet', Parquet, 'x Nullable(String)')
WHERE x NOT IN (1);

INSERT INTO FUNCTION file('t.parquet', Parquet, 'x String');

SELECT *
FROM file('t.parquet', Parquet, 'x Int64')
WHERE x >= 3;