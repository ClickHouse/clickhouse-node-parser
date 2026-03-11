SELECT
    arraySort(groupArrayArrayMerge(grp_aggreg)) AS gra,
    arraySort(groupArrayArray(grp_simple)) AS grs
FROM data_02293
GROUP BY a
SETTINGS optimize_aggregation_in_order = 1;