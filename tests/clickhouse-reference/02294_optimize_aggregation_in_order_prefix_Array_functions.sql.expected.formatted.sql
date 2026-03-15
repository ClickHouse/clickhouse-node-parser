CREATE TABLE data_02294
(
    a Int64,
    b Int64,
    grp_aggreg AggregateFunction(groupArrayArray, Array(UInt64)),
    grp_simple SimpleAggregateFunction(groupArrayArray, Array(UInt64))
)
ENGINE = MergeTree()
ORDER BY a;

SELECT
    arraySort(groupArrayArrayMerge(grp_aggreg)) AS gra,
    arraySort(groupArrayArray(grp_simple)) AS grs
FROM data_02294
GROUP BY
    a,
    b
SETTINGS optimize_aggregation_in_order = 1;