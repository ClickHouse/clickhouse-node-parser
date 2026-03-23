SET allow_experimental_dynamic_type = 1;

SET allow_experimental_variant_type = 1;

SET use_variant_as_common_type = 1;

CREATE TABLE test
(
    x UInt64,
    y UInt64
)
ENGINE = MergeTree
ORDER BY x
SETTINGS min_rows_for_wide_part = 100000000, min_bytes_for_wide_part = 1000000000;

INSERT INTO test SELECT
    number,
    number
FROM numbers(3);

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

INSERT INTO test SELECT
    number,
    number,
    number
FROM numbers(3, 3);

INSERT INTO test SELECT
    number,
    number,
    concat('str_', toString(number))
FROM numbers(6, 3);

INSERT INTO test SELECT
    number,
    number,
    NULL
FROM numbers(9, 3);

INSERT INTO test SELECT
    number,
    number,
    multiIf(number % 3 == 0, number, number % 3 == 1, concat('str_', toString(number)), NULL)
FROM numbers(12, 3);

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

INSERT INTO test SELECT
    number,
    number,
    multiIf(number % 4 == 0, number, number % 4 == 1, concat('str_', toString(number)), number % 4 == 2, toDate(number), NULL)
FROM numbers(15, 4);

INSERT INTO test SELECT
    number,
    number,
    multiIf(number % 4 == 0, number, number % 4 == 1, concat('str_', toString(number)), number % 4 == 2, toDate(number), NULL)
FROM numbers(19, 4);

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

INSERT INTO test SELECT
    number,
    multiIf(number % 3 == 0, number, number % 3 == 1, concat('str_', toString(number)), NULL),
    NULL
FROM numbers(23, 3);