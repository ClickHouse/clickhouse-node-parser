CREATE TABLE max_length_alias_14053__fuzz_45
(
    `a` Date,
    `b` Nullable(Decimal(76, 45)),
    `c.d` Array(Nullable(DateTime64(3))),
    `dcount` Int8 ALIAS length(c.d)
)
ENGINE = MergeTree
PARTITION BY toMonday(a)
ORDER BY (a, b)
SETTINGS allow_nullable_key = 1, index_granularity = 8192;
SELECT count(), min(length(c.d)) AS minExpr, min(dcount) AS minAlias, max(length(c.d)) AS maxExpr, max(dcount) AS maxAlias, b FROM max_length_alias_14053__fuzz_45 GROUP BY b;
