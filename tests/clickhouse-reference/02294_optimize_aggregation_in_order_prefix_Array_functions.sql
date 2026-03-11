SELECT arraySort(groupArrayArrayMerge(grp_aggreg)) gra , arraySort(groupArrayArray(grp_simple)) grs FROM data_02294 group by a, b SETTINGS optimize_aggregation_in_order=1;
