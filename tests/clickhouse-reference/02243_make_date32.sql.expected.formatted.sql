SELECT toTypeName(makeDate32(1991, 8, 24));

SELECT toTypeName(makeDate32(CAST(1991 AS Nullable(UInt64)), 8, 24));

SELECT toTypeName(makeDate32(1991, CAST(8 AS Nullable(UInt64)), 24));

SELECT toTypeName(makeDate32(1991, 8, CAST(24 AS Nullable(UInt64))));

SELECT toTypeName(makeDate32(1991, CAST(8 AS Nullable(UInt64)), CAST(24 AS Nullable(UInt64))));

SELECT makeDate32(1970, 1, 1);

SELECT makeDate32(2020, 8, 24);

SELECT makeDate32(1980, 10, 17);

SELECT makeDate32(-1980, 10, 17);

SELECT makeDate32(1980, -10, 17);

SELECT makeDate32(1980, 10, -17);

SELECT makeDate32(1980.0, 9, 30.0 / 2);

SELECT makeDate32(-1980.0, 9, 32.0 / 2);

SELECT makeDate32(CAST(1980.1 AS Decimal(20,5)), 9, 17);

SELECT makeDate32(CAST('-1980.1' AS Decimal(20,5)), 9, 18);

SELECT makeDate32(CAST(1980.1 AS Float32), 9, 19);

SELECT makeDate32(CAST(-1980.1 AS Float32), 9, 20);

SELECT makeDate32(CAST(1980 AS Date), 10, 30);

SELECT makeDate32(CAST(-1980 AS Date), 10, 30);

SELECT makeDate32(CAST(1980 AS Date32), 10, 30);

SELECT makeDate32(CAST(-1980 AS Date32), 10, 30);

SELECT makeDate32(CAST(1980 AS DateTime), 10, 30);

SELECT makeDate32(CAST(-1980 AS DateTime), 10, 30);

SELECT makeDate32(CAST(1980 AS DateTime64), 10, 30);

SELECT makeDate32(CAST(-1980 AS DateTime64), 10, 30);

SELECT makeDate32(0.0, 1, 2);

SELECT makeDate32(1980, 15, 1);

SELECT makeDate32(1980, 2, 29);

SELECT makeDate32(1984, 2, 30);

SELECT makeDate32(19800, 12, 3);

SELECT makeDate32(2148, 1, 1);

SELECT makeDate32(2149, 1, 1);

SELECT makeDate32(2149, 6, 6);

SELECT makeDate32(2149, 6, 7);

SELECT makeDate32(2150, 1, 1);

SELECT makeDate32(1969, 1, 1);

SELECT makeDate32(1969, 12, 1);

SELECT makeDate32(1969, 12, 31);

SELECT makeDate32(2298, 1, 1);

SELECT makeDate32(2299, 1, 1);

SELECT makeDate32(2299, 12, 31);

SELECT makeDate32(2300, 1, 1);

SELECT makeDate32(1899, 1, 1);

SELECT makeDate32(1899, 12, 1);

SELECT makeDate32(1899, 12, 31);

SELECT makeDate32(1970, 0, 0);

SELECT makeDate32(1970, 0, 1);

SELECT makeDate32(1970, 1, 0);

SELECT makeDate32(1990, 0, 1);

SELECT makeDate32(1990, 1, 0);

SELECT makeDate32(0x7fff + 2010, 1, 1);

SELECT makeDate32(0xffff + 2010, 1, 2);

SELECT makeDate32(0x7fffffff + 2010, 1, 3);

SELECT makeDate32(0xffffffff + 2010, 1, 4);

SELECT makeDate32(0x7fffffffffffffff + 2010, 1, 3);

SELECT makeDate32(0xffffffffffffffff + 2010, 1, 4);

SELECT makeDate32('1980', '10', '20');

SELECT makeDate32('-1980', 3, 17);

SELECT makeDate32('aa', 3, 24);

SELECT makeDate32(1994, 'aa', 24);

SELECT makeDate32(1984, 3, 'aa');

SELECT makeDate32(true, 3, 24);

SELECT makeDate32(1994, true, 24);

SELECT makeDate32(1984, 3, true);

SELECT makeDate32(false, 3, 24);

SELECT makeDate32(1994, false, 24);

SELECT makeDate32(1984, 3, false);

SELECT makeDate32(NULL, 3, 4);

SELECT makeDate32(1980, NULL, 4);

SELECT makeDate32(1980, 3, NULL);

SELECT makeDate32(1980);

SELECT makeDate32(1980, 1, 1, 1);

SELECT makeDate32(year, month, day)
FROM (
        SELECT
            NULL AS year,
            2 AS month,
            3 AS day
        UNION ALL
        SELECT
            1984 AS year,
            2 AS month,
            3 AS day
    )
ORDER BY
    year ASC,
    month ASC,
    day ASC;

SELECT makeDate32(year, month, day)
FROM (
        SELECT
            NULL AS year,
            2 AS month,
            3 AS day
        UNION ALL
        SELECT
            NULL AS year,
            2 AS month,
            3 AS day
    )
ORDER BY
    year ASC,
    month ASC,
    day ASC;

SELECT makeDate32(year, month, day)
FROM (
        SELECT
            1984 AS year,
            2 AS month,
            3 AS day
        UNION ALL
        SELECT
            1984 AS year,
            2 AS month,
            4 AS day
    )
ORDER BY
    year ASC,
    month ASC,
    day ASC;