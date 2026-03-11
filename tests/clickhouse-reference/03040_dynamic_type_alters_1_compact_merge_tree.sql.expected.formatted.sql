SELECT
    count(),
    dynamicType(d),
    isDynamicElementInSharedData(d)
FROM test
GROUP BY
    dynamicType(d),
    isDynamicElementInSharedData(d)
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
    x,
    y,
    y.UInt64,
    y.String,
    y.`Tuple(a UInt64)`.a,
    d.String,
    d.UInt64,
    d.Date,
    d.`Tuple(a UInt64)`.a
FROM test
ORDER BY x ASC;