create table data_02294 (a Int64, b Int64, grp_aggreg AggregateFunction(groupArrayArray, Array(UInt64)), grp_simple SimpleAggregateFunction(groupArrayArray, Array(UInt64))) engine = MergeTree() order by a;
SELECT arraySort(groupArrayArrayMerge(grp_aggreg)) gra , arraySort(groupArrayArray(grp_simple)) grs FROM data_02294 group by a, b SETTINGS optimize_aggregation_in_order=1;
