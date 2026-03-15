SET allow_materialized_view_with_bad_select = 1;

CREATE TABLE test_table
(
    key UInt32,
    value Decimal(16, 6)
)
ENGINE = SummingMergeTree()
ORDER BY key;

CREATE TABLE numbers
(
    number UInt64
)
ENGINE = Memory;

CREATE MATERIALIZED VIEW test_mv
TO test_table
(
    number UInt64,
    value Decimal(38, 6)
)
AS
SELECT
    number,
    sum(number) AS value
FROM (
        SELECT
            *,
            toDecimal64(number, 6) AS val
        FROM numbers
    )
GROUP BY number;

SELECT sum(value)
FROM test_mv;

SELECT sum(value)
FROM (
        SELECT
            number,
            sum(number) AS value
        FROM (
                SELECT
                    *,
                    toDecimal64(number, 6) AS val
                FROM numbers
            )
        GROUP BY number
    );

CREATE TABLE src
(
    n UInt64,
    s FixedString(16)
)
ENGINE = Memory;

CREATE TABLE dst
(
    n UInt8,
    s String
)
ENGINE = Memory;

CREATE MATERIALIZED VIEW mv
TO dst
(
    n String
)
AS
SELECT *
FROM src;

CREATE TABLE dist
(
    n Int128
)
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), mv);

SELECT
    count(),
    sum(n),
    sum(toInt64(s)),
    max(n),
    min(n)
FROM src;

SELECT
    count(),
    sum(n),
    sum(toInt64(s)),
    max(n),
    min(n)
FROM dst;

SELECT
    count(),
    sum(toInt64(n)),
    max(n),
    min(n)
FROM mv;

SELECT
    count(),
    sum(toInt64(n)),
    max(n),
    min(n)
FROM dist; -- { serverError CANNOT_CONVERT_TYPE }

SELECT
    count(),
    sum(toInt64(n)),
    max(toUInt32(n)),
    min(toInt128(n))
FROM dist;