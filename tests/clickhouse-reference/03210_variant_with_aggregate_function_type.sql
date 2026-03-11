SELECT
    Name,
    uniqExactMerge(Value.`AggregateFunction(uniqExact, Int64)`) AS Value
FROM test_agg_variant
GROUP BY Name
ORDER BY Name;
SELECT
    Name,
    avgMerge(Value.`AggregateFunction(avg, Int64)`) AS Value
FROM test_agg_variant
GROUP BY Name
ORDER BY Name;
SELECT
    Name,
    uniqExactMerge(Value.`AggregateFunction(uniqExact, Int64)`) AS ValueUniq,
    avgMerge(Value.`AggregateFunction(avg, Int64)`) AS ValueAvg
FROM test_agg_variant
GROUP BY Name
ORDER BY Name;
