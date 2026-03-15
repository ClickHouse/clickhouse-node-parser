SET allow_experimental_dynamic_type = 1;

SET allow_experimental_variant_type = 1;

SET use_variant_as_common_type = 1;

CREATE TABLE test
(
    x UInt64,
    y UInt64
)
ENGINE = Memory;

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