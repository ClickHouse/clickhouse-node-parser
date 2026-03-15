---- partition merge
SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE summing_merge_tree_aggregate_function
(
    d Date,
    k UInt64,
    u AggregateFunction(uniq, UInt64)
)
ENGINE = SummingMergeTree(d, k, 1);

SELECT count()
FROM summing_merge_tree_aggregate_function;

CREATE TABLE summing_merge_tree_aggregate_function
(
    d MATERIALIZED today(),
    k UInt64,
    c UInt64,
    u AggregateFunction(uniq, UInt8),
    ue AggregateFunction(uniqExact, UInt8)
)
ENGINE = SummingMergeTree(d, k, 8192);

SELECT
    k,
    sum(c),
    uniqMerge(u),
    uniqExactMerge(ue)
FROM summing_merge_tree_aggregate_function
GROUP BY k;

---- sum + topK
CREATE TABLE summing_merge_tree_aggregate_function
(
    d MATERIALIZED today(),
    k UInt64,
    c UInt64,
    x AggregateFunction(topK(2), UInt8)
)
ENGINE = SummingMergeTree(d, k, 8192);

SELECT
    k,
    sum(c),
    topKMerge(2)(x)
FROM summing_merge_tree_aggregate_function
GROUP BY k;

---- sum + topKWeighted
CREATE TABLE summing_merge_tree_aggregate_function
(
    d MATERIALIZED today(),
    k UInt64,
    c UInt64,
    x AggregateFunction(topKWeighted(2), UInt8, UInt8)
)
ENGINE = SummingMergeTree(d, k, 8192);

SELECT
    k,
    sum(c),
    topKWeightedMerge(2)(x)
FROM summing_merge_tree_aggregate_function
GROUP BY k;

---- avg
CREATE TABLE summing_merge_tree_aggregate_function
(
    d MATERIALIZED today(),
    k UInt64,
    x AggregateFunction(avg, Float64)
)
ENGINE = SummingMergeTree(d, k, 8192);

SELECT
    k,
    avgMerge(x)
FROM summing_merge_tree_aggregate_function
GROUP BY k;

---- quantile
CREATE TABLE summing_merge_tree_aggregate_function
(
    d MATERIALIZED today(),
    k UInt64,
    x AggregateFunction(quantile(0.1), Float64)
)
ENGINE = SummingMergeTree(d, k, 8192);

SELECT
    k,
    round(quantileMerge(0.1)(x), 1)
FROM summing_merge_tree_aggregate_function
GROUP BY k;

---- sum + uniq with more data
CREATE TABLE summing_merge_tree_null
(
    d MATERIALIZED today(),
    k UInt64,
    c UInt64,
    u UInt64
)
ENGINE = Null;

CREATE MATERIALIZED VIEW summing_merge_tree_aggregate_function
(
    d Date,
    k UInt64,
    c UInt64,
    u AggregateFunction(uniq, UInt64)
)
ENGINE = SummingMergeTree(d, k, 8192)
AS
SELECT
    d,
    k,
    sum(c) AS c,
    uniqState(u) AS u
FROM summing_merge_tree_null
GROUP BY
    d,
    k;

SELECT
    k,
    sum(c),
    uniqMerge(u)
FROM summing_merge_tree_aggregate_function
GROUP BY k
ORDER BY k ASC;