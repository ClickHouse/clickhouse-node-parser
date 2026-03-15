SET allow_experimental_variant_type = 1;

CREATE TABLE source
(
    Name String,
    Value Int64
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE test_agg_variant
(
    Name String,
    Value Variant(AggregateFunction(uniqExact, Int64), AggregateFunction(avg, Int64))
)
ENGINE = MergeTree
ORDER BY (Name);

SELECT
    Name,
    uniqExactMerge(Value.`AggregateFunction(uniqExact, Int64)`) AS Value
FROM test_agg_variant
GROUP BY Name
ORDER BY Name ASC;

SELECT
    Name,
    avgMerge(Value.`AggregateFunction(avg, Int64)`) AS Value
FROM test_agg_variant
GROUP BY Name
ORDER BY Name ASC;

SELECT
    Name,
    uniqExactMerge(Value.`AggregateFunction(uniqExact, Int64)`) AS ValueUniq,
    avgMerge(Value.`AggregateFunction(avg, Int64)`) AS ValueAvg
FROM test_agg_variant
GROUP BY Name
ORDER BY Name ASC;