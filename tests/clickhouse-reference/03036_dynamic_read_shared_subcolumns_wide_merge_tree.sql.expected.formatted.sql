-- Tags: long, no-tsan, no-msan, no-ubsan, no-asan
SET allow_experimental_variant_type = 1;

SET use_variant_as_common_type = 1;

SET allow_experimental_dynamic_type = 1;

SET min_bytes_to_use_direct_io = 0; -- min_bytes_to_use_direct_io > 0 is broken

CREATE TABLE test
(
    id UInt64,
    d Dynamic(max_types=2)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1;

SELECT DISTINCT dynamicType(d) AS type
FROM test
ORDER BY type ASC;

SELECT count()
FROM test
WHERE dynamicType(d) == 'UInt64';

SELECT count()
FROM test
WHERE isNotNull(d.UInt64);

SELECT count()
FROM test
WHERE dynamicType(d) == 'String';

SELECT count()
FROM test
WHERE isNotNull(d.String);

SELECT count()
FROM test
WHERE dynamicType(d) == 'Date';

SELECT count()
FROM test
WHERE isNotNull(d.Date);

SELECT count()
FROM test
WHERE dynamicType(d) == 'LowCardinality(String)';

SELECT count()
FROM test
WHERE isNotNull(d.`LowCardinality(String)`);

SELECT count()
FROM test
WHERE dynamicType(d) == 'Array(Variant(String, UInt64))';

SELECT count()
FROM test
WHERE NOT empty(d.`Array(Variant(String, UInt64))`);

SELECT count()
FROM test
WHERE dynamicType(d) == 'Array(Array(Dynamic))';

SELECT count()
FROM test
WHERE NOT empty(d.`Array(Array(Dynamic))`);

SELECT count()
FROM test
WHERE isNull(d);

SELECT count()
FROM test
WHERE NOT empty(d.`Tuple(a Array(Dynamic))`.a.String);

SELECT
    d,
    d.UInt64,
    d.String,
    d.`Array(Variant(String, UInt64))`
FROM test
FORMAT Null;

SELECT
    d.UInt64,
    d.String,
    d.`Array(Variant(String, UInt64))`
FROM test
FORMAT Null;

SELECT
    d.Int8,
    d.Date,
    d.`Array(String)`
FROM test
FORMAT Null;

SELECT
    d,
    d.UInt64,
    d.Date,
    d.`Array(Variant(String, UInt64))`,
    d.`Array(Variant(String, UInt64))`.size0,
    d.`Array(Variant(String, UInt64))`.UInt64
FROM test
FORMAT Null;

SELECT
    d.UInt64,
    d.Date,
    d.`Array(Variant(String, UInt64))`,
    d.`Array(Variant(String, UInt64))`.size0,
    d.`Array(Variant(String, UInt64))`.UInt64,
    d.`Array(Variant(String, UInt64))`.String
FROM test
FORMAT Null;

SELECT
    d,
    d.`Tuple(a UInt64, b String)`.a,
    d.`Array(Dynamic)`.`Variant(String, UInt64)`.UInt64,
    d.`Array(Variant(String, UInt64))`.UInt64
FROM test
FORMAT Null;

SELECT
    d.`Array(Dynamic)`.`Variant(String, UInt64)`.UInt64,
    d.`Array(Dynamic)`.size0,
    d.`Array(Variant(String, UInt64))`.UInt64
FROM test
FORMAT Null;

SELECT
    d.`Array(Array(Dynamic))`.size1,
    d.`Array(Array(Dynamic))`.UInt64,
    d.`Array(Array(Dynamic))`.`Map(String, Tuple(a UInt64))`.values.a
FROM test
FORMAT Null;