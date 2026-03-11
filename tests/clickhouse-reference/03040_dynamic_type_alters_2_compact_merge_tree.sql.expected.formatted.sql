SELECT
    count(),
    dynamicType(d)
FROM test
GROUP BY dynamicType(d)
ORDER BY
    count() ASC,
    dynamicType(d) ASC;

SELECT
    x,
    y,
    d,
    d.String,
    d.UInt64,
    d.`Tuple(a UInt64)`.a
FROM test
ORDER BY x ASC;

SELECT
    x,
    y,
    d,
    d.String,
    d.UInt64,
    d.Date,
    d.`Tuple(a UInt64)`.a
FROM test
ORDER BY x ASC;

SELECT
    count(),
    dynamicType(d1)
FROM test
GROUP BY dynamicType(d1)
ORDER BY
    count() ASC,
    dynamicType(d1) ASC;

SELECT
    x,
    y,
    d1,
    d1.String,
    d1.UInt64,
    d1.Date,
    d1.`Tuple(a UInt64)`.a
FROM test
ORDER BY x ASC;

SELECT
    x,
    y,
    d1,
    d1.String,
    d1.UInt64,
    d1.Date,
    d1.`Tuple(a UInt64)`.a,
    d1.`Array(Dynamic)`.UInt64,
    d1.`Array(Dynamic)`.String,
    d1.`Array(Dynamic)`.Date
FROM test
ORDER BY x ASC;

SELECT
    count(),
    dynamicType(d2)
FROM test
GROUP BY dynamicType(d2)
ORDER BY
    count() ASC,
    dynamicType(d2) ASC;

SELECT
    x,
    y,
    d2,
    d2.String,
    d2.UInt64,
    d2.Date,
    d2.`Tuple(a UInt64)`.a,
    d2.`Array(Dynamic)`.UInt64,
    d2.`Array(Dynamic)`.String,
    d2.`Array(Dynamic)`.Date
FROM test
ORDER BY x ASC;