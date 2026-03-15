-- to use different algorithms for in subquery
SET enable_analyzer = 1;

CREATE TABLE tvs
(
    k UInt32,
    t UInt32,
    tv UInt64
)
ENGINE = Memory;

SELECT SUM(trades.price - tvs.tv)
FROM
    (
        SELECT
            k,
            t,
            t AS price
        FROM
            (
                SELECT toUInt32(number) AS k
                FROM numbers(1000)
            ) AS keys
        CROSS JOIN (
                SELECT toUInt32(number * 10) AS t
                FROM numbers(3000)
            ) AS trade_times
        SETTINGS join_algorithm = 'hash'
    ) AS trades
LEFT JOIN tvs
    USING (k, t);

SELECT SUM(trades.price - tvs.tv)
FROM
    (
        SELECT
            k,
            t,
            t AS price
        FROM
            (
                SELECT toUInt32(number) AS k
                FROM numbers(1000)
            ) AS keys
        CROSS JOIN (
                SELECT toUInt32(number * 10) AS t
                FROM numbers(3000)
            ) AS trade_times
        SETTINGS join_algorithm = 'hash'
    ) AS trades
LEFT JOIN tvs
    USING (k, t)
SETTINGS join_algorithm = 'full_sorting_merge';