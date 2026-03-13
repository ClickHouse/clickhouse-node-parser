SELECT makeDateTime64(1991, 8, 24, 21, 4, 0);

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 123);

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 6);

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 7, 'CET');

SELECT CAST(makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 7, 'CET') AS DateTime64(7, 'UTC'));

SELECT toTypeName(makeDateTime64(1991, 8, 24, 21, 4, 0));

SELECT toTypeName(makeDateTime64(1991, 8, 24, 21, 4, 0, 123));

SELECT toTypeName(makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 6));

SELECT toTypeName(makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 7, 'CET'));

SELECT toTypeName(CAST(makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 7, 'CET') AS DateTime64(7, 'UTC')));

SELECT makeDateTime64(1900, 1, 1, 0, 0, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1899, 12, 31, 23, 59, 59, 999999999, 9, 'UTC');

SELECT makeDateTime64(2299, 12, 31, 23, 59, 59, 99999999, 8, 'UTC');

SELECT makeDateTime64(2299, 12, 31, 23, 59, 59, 999999999, 9, 'UTC'); -- { serverError DECIMAL_OVERFLOW }

SELECT makeDateTime64(2262, 4, 11, 23, 47, 16, 854775807, 9, 'UTC');

SELECT makeDateTime64(2262, 4, 11, 23, 47, 16, 854775808, 9, 'UTC'); -- { serverError DECIMAL_OVERFLOW }

SELECT makeDateTime64(2262, 4, 11, 23, 47, 16, 85477581, 8, 'UTC');

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 0, 'CET');

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 1, 'CET');

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 2, 'CET');

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 3, 'CET');

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 4, 'CET');

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 5, 'CET');

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 6, 'CET');

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 8, 'CET');

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 9, 'CET');

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, 10, 'CET'); -- { serverError ARGUMENT_OUT_OF_BOUND }

SELECT makeDateTime64(1991, 8, 24, 21, 4, 0, 1234, -1, 'CET'); -- { serverError ARGUMENT_OUT_OF_BOUND }

SELECT makeDateTime64(1984, 0, 1, 0, 0, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 0, 0, 0, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 13, 1, 0, 0, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 41, 0, 0, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 25, 0, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 0, 70, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 0, 0, 70, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 0, 0, 0, 0, 9, 'not a timezone'); -- { serverError BAD_ARGUMENTS }

SELECT makeDateTime64(1984, 1, 1, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 2, 29, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1983, 2, 29, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 2, 30, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1983, 2, 30, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 2, 31, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1983, 2, 31, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 2, 32, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1983, 2, 32, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(-1984, 1, 1, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, -1, 1, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 1, -1, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, -1, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 2, -1, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 2, 3, -1, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 2, 3, 4, -1, 9, 'UTC');

SELECT makeDateTime64(nan, 1, 1, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, nan, 1, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 1, nan, 2, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, nan, 3, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 2, nan, 4, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 2, 3, nan, 5, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 2, 3, 4, nan, 9, 'UTC');

SELECT makeDateTime64(1984.5, 1, 1, 0, 0, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1.5, 1, 0, 0, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1.5, 0, 0, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 0.5, 0, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 0, 0.5, 0, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 0, 0, 0.5, 0, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 0, 0, 0, 0.5, 9, 'UTC');

SELECT makeDateTime64(1984, 1, 1, 0, 0, 0, 0, 9.5, 'UTC');

SELECT makeDateTime64(65537, 8, 24, 21, 4, 0);

SELECT makeDateTime64(1991, 65537, 24, 21, 4, 0);

SELECT makeDateTime64(1991, 8, 65537, 21, 4, 0);

SELECT makeDateTime64(1991, 8, 24, 65537, 4, 0);

SELECT makeDateTime64(1991, 8, 24, 21, 65537, 0);

SELECT makeDateTime64(1991, 8, 24, 21, 4, 65537);

-- bug 58590
SELECT makeDateTime64(2024, 1, 8, 11, 12, 13, materialize(14));

SELECT makeDateTime64(year, 1, 1, 1, 0, 0, 0, precision, timezone)
FROM (
        SELECT
            1984 AS year,
            5 AS precision,
            'UTC' AS timezone
        UNION ALL
        SELECT
            1985 AS year,
            5 AS precision,
            'UTC' AS timezone
    ); -- { serverError ILLEGAL_COLUMN }