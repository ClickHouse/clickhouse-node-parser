SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(i8 IN (10, 15, -6));

SELECT
    count(1),
    min(i8),
    max(i8)
FROM file('02892.orc')
WHERE i8 IN (10, 15, -6);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(i8, -3), lessOrEquals(i8, 2)));

SELECT
    count(1),
    min(i8),
    max(i8)
FROM file('02892.orc')
WHERE and(greaterOrEquals(i8, -3), lessOrEquals(i8, 2));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(i16, 4000), lessOrEquals(i16, 61000))
    OR i16 == 42);

SELECT
    count(1),
    min(i16),
    max(i16)
FROM file('02892.orc')
WHERE and(greaterOrEquals(i16, 4000), lessOrEquals(i16, 61000))
    OR i16 == 42;

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(i16, -150), lessOrEquals(i16, 250)));

SELECT
    count(1),
    min(i16),
    max(i16)
FROM file('02892.orc')
WHERE and(greaterOrEquals(i16, -150), lessOrEquals(i16, 250));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(i32 IN (42, -1000));

SELECT
    count(1),
    min(i32),
    max(i32)
FROM file('02892.orc')
WHERE i32 IN (42, -1000);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(i32, -150), lessOrEquals(i32, 250)));

SELECT
    count(1),
    min(i32),
    max(i32)
FROM file('02892.orc')
WHERE and(greaterOrEquals(i32, -150), lessOrEquals(i32, 250));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(i64 IN (42, -1000));

SELECT
    count(1),
    min(i64),
    max(i64)
FROM file('02892.orc')
WHERE i64 IN (42, -1000);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(i64, -150), lessOrEquals(i64, 250)));

SELECT
    count(1),
    min(i64),
    max(i64)
FROM file('02892.orc')
WHERE and(greaterOrEquals(i64, -150), lessOrEquals(i64, 250));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(date32, '1992-01-01'), lessOrEquals(date32, '2023-08-02')));

SELECT
    count(1),
    min(date32),
    max(date32)
FROM file('02892.orc')
WHERE and(greaterOrEquals(date32, '1992-01-01'), lessOrEquals(date32, '2023-08-02'));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(dt64_ms, '2000-01-01'), lessOrEquals(dt64_ms, '2005-01-01')));

SELECT
    count(1),
    min(dt64_ms),
    max(dt64_ms)
FROM file('02892.orc')
WHERE and(greaterOrEquals(dt64_ms, '2000-01-01'), lessOrEquals(dt64_ms, '2005-01-01'));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(dt64_us, toDateTime64(900000000, 2)), lessOrEquals(dt64_us, '2005-01-01')));

SELECT
    count(1),
    min(dt64_us),
    max(dt64_us)
FROM file('02892.orc')
WHERE (and(greaterOrEquals(dt64_us, toDateTime64(900000000, 2)), lessOrEquals(dt64_us, '2005-01-01')));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(dt64_ns, '2000-01-01'), lessOrEquals(dt64_ns, '2005-01-01')));

SELECT
    count(1),
    min(dt64_ns),
    max(dt64_ns)
FROM file('02892.orc')
WHERE (and(greaterOrEquals(dt64_ns, '2000-01-01'), lessOrEquals(dt64_ns, '2005-01-01')));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(dt64_s, toDateTime64('-2.01e8'::Decimal64(0), 0)), lessOrEquals(dt64_s, toDateTime64(1.5e8::Decimal64(0), 0))));

SELECT
    count(1),
    min(dt64_s),
    max(dt64_s)
FROM file('02892.orc')
WHERE (and(greaterOrEquals(dt64_s, toDateTime64('-2.01e8'::Decimal64(0), 0)), lessOrEquals(dt64_s, toDateTime64(1.5e8::Decimal64(0), 0))));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(dt64_cs, toDateTime64('-2.01e8'::Decimal64(1), 1)), lessOrEquals(dt64_cs, toDateTime64(1.5e8::Decimal64(2), 2))));

SELECT
    count(1),
    min(dt64_cs),
    max(dt64_cs)
FROM file('02892.orc')
WHERE (and(greaterOrEquals(dt64_cs, toDateTime64('-2.01e8'::Decimal64(1), 1)), lessOrEquals(dt64_cs, toDateTime64(1.5e8::Decimal64(2), 2))));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(f32, -0.11::Float32), lessOrEquals(f32, 0.06::Float32)));

SELECT
    count(1),
    min(f32),
    max(f32)
FROM file('02892.orc')
WHERE (and(greaterOrEquals(f32, -0.11::Float32), lessOrEquals(f32, 0.06::Float32)));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(f64, -0.11), lessOrEquals(f64, 0.06)));

SELECT
    count(1),
    min(f64),
    max(f64)
FROM file('02892.orc')
WHERE (and(greaterOrEquals(f64, -0.11), lessOrEquals(f64, 0.06)));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(s, '-9'), lessOrEquals(s, '1!!!')));

SELECT
    count(1),
    min(s),
    max(s)
FROM file('02892.orc')
WHERE (and(greaterOrEquals(s, '-9'), lessOrEquals(s, '1!!!')));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(fs, '-9'), lessOrEquals(fs, '1!!!')));

SELECT
    count(1),
    min(fs),
    max(fs)
FROM file('02892.orc')
WHERE (and(greaterOrEquals(fs, '-9'), lessOrEquals(fs, '1!!!')));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(d32, '-0.011'::Decimal32(3)), lessOrEquals(d32, 0.006::Decimal32(3))));

SELECT
    count(1),
    min(d32),
    max(d32)
FROM file('02892.orc')
WHERE (and(greaterOrEquals(d32, '-0.011'::Decimal32(3)), lessOrEquals(d32, 0.006::Decimal32(3))));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(d64, '-0.0000011'::Decimal64(7)), lessOrEquals(d64, 0.0000006::Decimal64(9))));

SELECT
    count(1),
    min(d64),
    max(d64)
FROM file('02892.orc')
WHERE (and(greaterOrEquals(d64, '-0.0000011'::Decimal64(7)), lessOrEquals(d64, 0.0000006::Decimal64(9))));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(and(greaterOrEquals(d128, '-0.00000000000011'::Decimal128(20)), lessOrEquals(d128, 0.00000000000006::Decimal128(20))));

SELECT
    count(1),
    min(d128),
    max(128)
FROM file('02892.orc')
WHERE (and(greaterOrEquals(d128, '-0.00000000000011'::Decimal128(20)), lessOrEquals(d128, 0.00000000000006::Decimal128(20))));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(0);

SELECT
    count(),
    min(number),
    max(number)
FROM file('02892.orc')
WHERE indexHint(0);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(like(s, '99%')
    OR i64 == 2000);

SELECT
    count(),
    min(s),
    max(s)
FROM file('02892.orc')
WHERE (like(s, '99%')
    OR i64 == 2000);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(like(s, 'z%'));

SELECT
    count(),
    min(s),
    max(s)
FROM file('02892.orc')
WHERE (like(s, 'z%'));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(i8 == 10
    OR 1 == 1);

SELECT
    count(),
    min(i8),
    max(i8)
FROM file('02892.orc')
WHERE (i8 == 10
    OR 1 == 1);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(i8 < 0);

SELECT
    count(),
    min(i8),
    max(i8)
FROM file('02892.orc')
WHERE (i8 < 0);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(isNull(sometimes_null));

SELECT
    count(),
    min(sometimes_null),
    max(sometimes_null)
FROM file('02892.orc')
WHERE (isNull(sometimes_null));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(isNull(sometimes_null_lc));

SELECT
    count(),
    min(sometimes_null_lc),
    max(sometimes_null_lc)
FROM file('02892.orc')
WHERE (isNull(sometimes_null_lc));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(isNotNull(mostly_null));

SELECT
    count(),
    min(mostly_null),
    max(mostly_null)
FROM file('02892.orc')
WHERE (isNotNull(mostly_null));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(isNotNull(mostly_null_lc));

SELECT
    count(),
    min(mostly_null_lc),
    max(mostly_null_lc)
FROM file('02892.orc')
WHERE (isNotNull(mostly_null_lc));

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(sometimes_null > 850);

SELECT
    count(),
    min(sometimes_null),
    max(sometimes_null)
FROM file('02892.orc')
WHERE (sometimes_null > 850);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(sometimes_null_lc > 850);

SELECT
    count(),
    min(sometimes_null_lc),
    max(sometimes_null_lc)
FROM file('02892.orc')
WHERE (sometimes_null_lc > 850);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(never_null > 850);

SELECT
    count(),
    min(never_null),
    max(never_null)
FROM file('02892.orc')
WHERE (never_null > 850);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(never_null_lc > 850);

SELECT
    count(),
    min(never_null_lc),
    max(never_null_lc)
FROM file('02892.orc')
WHERE (never_null_lc > 850);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(never_null < 150);

SELECT
    count(),
    min(never_null),
    max(never_null)
FROM file('02892.orc')
WHERE (never_null < 150);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(never_null_lc < 150);

SELECT
    count(),
    min(never_null_lc),
    max(never_null_lc)
FROM file('02892.orc')
WHERE (never_null_lc < 150);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(sometimes_null < 150);

SELECT
    count(),
    min(sometimes_null),
    max(sometimes_null)
FROM file('02892.orc')
WHERE (sometimes_null < 150);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(sometimes_null_lc < 150);

SELECT
    count(),
    min(sometimes_null_lc),
    max(sometimes_null_lc)
FROM file('02892.orc')
WHERE (sometimes_null_lc < 150);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(positive_or_null < 50);

SELECT
    count(),
    min(positive_or_null),
    max(positive_or_null)
FROM file('02892.orc')
WHERE (positive_or_null < 50);

SELECT
    count(),
    sum(number)
FROM file('02892.orc', ORC, 'number UInt64, positive_or_null UInt64')
WHERE indexHint(positive_or_null < 50);

SELECT
    count(),
    min(positive_or_null),
    max(positive_or_null)
FROM file('02892.orc', ORC, 'number UInt64, positive_or_null UInt64')
WHERE (positive_or_null < 50);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(negative_or_null > -50);

SELECT
    count(),
    min(negative_or_null),
    max(negative_or_null)
FROM file('02892.orc')
WHERE (negative_or_null > -50);

SELECT
    count(),
    sum(number)
FROM file('02892.orc', ORC, 'number UInt64, negative_or_null Int64')
WHERE indexHint(negative_or_null > -50);

SELECT
    count(),
    min(negative_or_null),
    max(negative_or_null)
FROM file('02892.orc', ORC, 'number UInt64, negative_or_null Int64')
WHERE (negative_or_null > -50);

SELECT
    count(),
    sum(number)
FROM file('02892.orc')
WHERE indexHint(string_or_null == '');

SELECT
    count(),
    min(string_or_null),
    max(string_or_null)
FROM file('02892.orc')
WHERE (string_or_null == '');

SELECT
    count(),
    sum(number)
FROM file('02892.orc', ORC, 'number UInt64, string_or_null String')
WHERE indexHint(string_or_null == '');

SELECT
    count(),
    min(string_or_null),
    max(string_or_null)
FROM file('02892.orc', ORC, 'number UInt64, string_or_null String')
WHERE (string_or_null == '');

SELECT
    count(),
    sum(number)
FROM file('02892.orc', ORC, 'number UInt64, nEgAtIvE_oR_nUlL Int64')
WHERE indexHint(nEgAtIvE_oR_nUlL > -50)
SETTINGS input_format_orc_case_insensitive_column_matching = 1;

SELECT
    count(),
    min(nEgAtIvE_oR_nUlL),
    max(nEgAtIvE_oR_nUlL)
FROM file('02892.orc', ORC, 'number UInt64, nEgAtIvE_oR_nUlL Int64')
WHERE (nEgAtIvE_oR_nUlL > -50)
SETTINGS input_format_orc_case_insensitive_column_matching = 1;

SELECT
    count(),
    sum(number)
FROM file('02892.orc', ORC, 'number UInt64, negative_or_null Int64')
WHERE indexHint(negative_or_null < -500);

SELECT
    count(),
    min(negative_or_null),
    max(negative_or_null)
FROM file('02892.orc', ORC, 'number UInt64, negative_or_null Int64')
WHERE (negative_or_null < -500);

SELECT
    count(),
    sum(number)
FROM file('02892.orc', ORC, 'number UInt64, negative_or_null Int64')
WHERE indexHint(isNull(negative_or_null))
SETTINGS enable_analyzer = 1;

SELECT
    count(),
    min(negative_or_null),
    max(negative_or_null)
FROM file('02892.orc', ORC, 'number UInt64, negative_or_null Int64')
WHERE (isNull(negative_or_null));

SELECT
    count(),
    sum(number)
FROM file('02892.orc', ORC, 'number UInt64, negative_or_null Int64')
WHERE indexHint(negative_or_null IN (0, -1, -10, -100, -1000));

SELECT
    count(),
    min(negative_or_null),
    max(negative_or_null)
FROM file('02892.orc', ORC, 'number UInt64, negative_or_null Int64')
WHERE (negative_or_null IN (0, -1, -10, -100, -1000));

SELECT
    count(),
    sum(number)
FROM file('02892.orc', ORC, 'number UInt64, string_or_null LowCardinality(String)')
WHERE indexHint(like(string_or_null, 'I am%'));

SELECT
    count(),
    min(string_or_null),
    max(string_or_null)
FROM file('02892.orc', ORC, 'number UInt64, string_or_null LowCardinality(String)')
WHERE (like(string_or_null, 'I am%'));

SELECT
    count(),
    sum(number)
FROM file('02892.orc', ORC, 'number UInt64, string_or_null LowCardinality(Nullable(String))')
WHERE indexHint(like(string_or_null, 'I am%'));

SELECT
    count(),
    min(string_or_null),
    max(string_or_null)
FROM file('02892.orc', ORC, 'number UInt64, string_or_null LowCardinality(Nullable(String))')
WHERE (like(string_or_null, 'I am%'));