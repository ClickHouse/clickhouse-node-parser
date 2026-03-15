CREATE TABLE tab
(
    d Int64,
    s AggregateFunction(groupUniqArrayArray, Array(UInt64)),
    c SimpleAggregateFunction(groupUniqArrayArray, Array(UInt64))
)
ENGINE = SummingMergeTree()
ORDER BY d;