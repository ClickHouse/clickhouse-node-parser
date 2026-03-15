CREATE TABLE data_02293
(
    a Int64,
    grp_aggreg AggregateFunction(groupArrayArray, Array(UInt64)),
    grp_simple SimpleAggregateFunction(groupArrayArray, Array(UInt64))
)
ENGINE = MergeTree()
ORDER BY a;

SELECT
    arraySort(groupArrayArrayMerge(grp_aggreg)) AS gra,
    arraySort(groupArrayArray(grp_simple)) AS grs
FROM data_02293
GROUP BY a
SETTINGS optimize_aggregation_in_order = 1;