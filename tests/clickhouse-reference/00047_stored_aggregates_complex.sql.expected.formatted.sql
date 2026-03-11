SELECT
    d,
    k1,
    k2,
    sumMerge(Sum),
    avgMerge(Avg),
    uniqMerge(Uniq),
    anyMerge(`Any`),
    anyIfMerge(AnyIf),
    arrayMap(x -> round(x, 6), quantilesMerge(0.5, 0.9)(Quantiles)),
    groupArrayMerge(GroupArray)
FROM stored_aggregates
GROUP BY
    d,
    k1,
    k2
ORDER BY
    d ASC,
    k1 ASC,
    k2 ASC;

SELECT
    d,
    k1,
    sumMerge(Sum),
    avgMerge(Avg),
    uniqMerge(Uniq),
    anyMerge(`Any`),
    anyIfMerge(AnyIf),
    arrayMap(x -> round(x, 6), quantilesMerge(0.5, 0.9)(Quantiles)),
    groupArrayMerge(GroupArray)
FROM stored_aggregates
GROUP BY
    d,
    k1
ORDER BY
    d ASC,
    k1 ASC;

SELECT
    d,
    sumMerge(Sum),
    avgMerge(Avg),
    uniqMerge(Uniq),
    anyMerge(`Any`),
    anyIfMerge(AnyIf),
    arrayMap(x -> round(x, 6), quantilesMerge(0.5, 0.9)(Quantiles)),
    groupArrayMerge(GroupArray)
FROM stored_aggregates
GROUP BY d
ORDER BY d ASC;