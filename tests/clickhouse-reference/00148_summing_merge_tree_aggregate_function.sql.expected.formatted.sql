SELECT count()
FROM summing_merge_tree_aggregate_function;

SELECT
    k,
    sum(c),
    uniqMerge(u),
    uniqExactMerge(ue)
FROM summing_merge_tree_aggregate_function
GROUP BY k;

SELECT
    k,
    sum(c),
    topKMerge(2)(x)
FROM summing_merge_tree_aggregate_function
GROUP BY k;

SELECT
    k,
    sum(c),
    topKWeightedMerge(2)(x)
FROM summing_merge_tree_aggregate_function
GROUP BY k;

SELECT
    k,
    avgMerge(x)
FROM summing_merge_tree_aggregate_function
GROUP BY k;

SELECT
    k,
    round(quantileMerge(0.1)(x), 1)
FROM summing_merge_tree_aggregate_function
GROUP BY k;

SELECT
    k,
    sum(c),
    uniqMerge(u)
FROM summing_merge_tree_aggregate_function
GROUP BY k
ORDER BY k ASC;