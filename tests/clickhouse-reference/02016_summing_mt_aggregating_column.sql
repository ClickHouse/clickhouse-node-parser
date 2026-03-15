CREATE TABLE summing_mt_aggregating_column
(
    Key UInt64,
    Value UInt64,
    ConcatArraySimple SimpleAggregateFunction(groupArrayArray, Array(UInt64)),
    ConcatArrayComplex AggregateFunction(groupArrayArray, Array(UInt64))
)
ENGINE = SummingMergeTree()
ORDER BY Key;
SELECT Key, any(Value), any(ConcatArraySimple), groupArrayArrayMerge(ConcatArrayComplex) FROM summing_mt_aggregating_column GROUP BY Key;
