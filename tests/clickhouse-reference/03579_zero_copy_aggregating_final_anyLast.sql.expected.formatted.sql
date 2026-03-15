CREATE TABLE t_coalesce
(
    k UInt64,
    v1 SimpleAggregateFunction(anyLast, Nullable(String)),
    v2 SimpleAggregateFunction(anyLast, Nullable(FixedString(20))),
    v3 SimpleAggregateFunction(anyLast, Array(String)),
    v4 SimpleAggregateFunction(anyLast, Map(String, String)),
    v5 SimpleAggregateFunction(anyLast, JSON),
    v6 SimpleAggregateFunction(anyLast, Variant(String, UInt64)),
    v7 SimpleAggregateFunction(anyLast, Dynamic)
)
ENGINE = AggregatingMergeTree()
ORDER BY k;

SELECT
    k,
    v1,
    v2,
    v3,
    v4,
    v5,
    v6,
    v7
FROM t_coalesce FINAL;

CREATE TABLE t_coalesce2
(
    k UInt64,
    v1 SimpleAggregateFunction(any, Nullable(String)),
    v2 SimpleAggregateFunction(any, Nullable(FixedString(20))),
    v3 SimpleAggregateFunction(any, Array(String)),
    v4 SimpleAggregateFunction(any, Map(String, String)),
    v5 SimpleAggregateFunction(any, JSON),
    v6 SimpleAggregateFunction(any, Variant(String, UInt64)),
    v7 SimpleAggregateFunction(any, Dynamic)
)
ENGINE = AggregatingMergeTree()
ORDER BY k;

SELECT
    k,
    v1,
    v2,
    v3,
    v4,
    v5,
    v6,
    v7
FROM t_coalesce2 FINAL;