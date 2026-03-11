SELECT
    finalizeAggregation(d.`AggregateFunction(sum, UInt64)`),
    sumMerge(d.`AggregateFunction(sum, UInt64)`)
FROM t
GROUP BY d.`AggregateFunction(sum, UInt64)`;