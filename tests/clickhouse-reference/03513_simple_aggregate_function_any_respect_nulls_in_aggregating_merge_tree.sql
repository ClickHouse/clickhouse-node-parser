CREATE TABLE simple_agf_any_aggregating_mt
(
    a Int64,
    any_simple SimpleAggregateFunction(any_respect_nulls, Nullable(UInt64)),
    any_agg AggregateFunction(any_respect_nulls, Nullable(UInt64)),
    anyLast_simple SimpleAggregateFunction(anyLast_respect_nulls, Nullable(UInt64)),
    anyLast_agg AggregateFunction(anyLast_respect_nulls, Nullable(UInt64))
)
ENGINE = AggregatingMergeTree
ORDER BY a;
SELECT
    a,
    any_respect_nulls(any_simple),
    any_respect_nullsMerge(any_agg),
    anyLast_respect_nulls(anyLast_simple),
    anyLast_respect_nullsMerge(anyLast_agg)
FROM simple_agf_any_aggregating_mt
GROUP BY a
ORDER BY a;
