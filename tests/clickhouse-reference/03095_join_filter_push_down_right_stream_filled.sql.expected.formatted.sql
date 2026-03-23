CREATE TABLE t1__fuzz_0
(
    x UInt8,
    str String
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO t1__fuzz_0 SELECT
    number,
    toString(number)
FROM numbers(10);

CREATE TABLE left_join__fuzz_2
(
    x UInt32,
    s LowCardinality(String)
)
ENGINE = Join(`ALL`, `LEFT`, x);

INSERT INTO left_join__fuzz_2 SELECT
    number,
    toString(number)
FROM numbers(10);

SELECT 14
FROM
    t1__fuzz_0
LEFT JOIN left_join__fuzz_2
    USING (x)
WHERE pointInPolygon(materialize((-inf, 1023)), [(5, 0.9998999834060669), (1.1920928955078125e-7, 100.0000991821289), (1.000100016593933, 100.0000991821289)])
ORDER BY
    toNullable('202.79.32.10') DESC,
    toNullable(toLowCardinality(toUInt256(14))) ASC,
    x DESC;