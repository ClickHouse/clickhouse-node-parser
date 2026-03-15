CREATE TABLE smta
(
    k Int64,
    a AggregateFunction(max, Int64),
    city SimpleAggregateFunction(max, LowCardinality(String))
)
ENGINE = SummingMergeTree
ORDER BY k;

SELECT
    k,
    city
FROM smta;