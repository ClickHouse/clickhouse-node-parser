CREATE TABLE t
(
    `d` Nullable(Date),
    `f1` Nullable(String),
    `f2` Nullable(String),
    `c` Nullable(Int64)
)
ENGINE = ReplacingMergeTree
ORDER BY (f1, f2, d)
SETTINGS allow_nullable_key = 1;
SELECT
    date_trunc('month', d),
    SUM(c)
FROM t
FINAL
WHERE f2 = 'x'
GROUP BY 1;
CREATE TABLE t
(
    `d` Nullable(Date),
    `f1` Nullable(String),
    `f2` Nullable(String),
    `c` Nullable(Int64)
)
ENGINE = SummingMergeTree
ORDER BY (f1, f2, d)
SETTINGS allow_nullable_key = 1, index_granularity = 1;
CREATE TABLE t (o Nullable(String), p Nullable(String)) ENGINE = ReplacingMergeTree ORDER BY (p, o) SETTINGS allow_nullable_key = 1, index_granularity = 2;
SELECT count() FROM t FINAL;
