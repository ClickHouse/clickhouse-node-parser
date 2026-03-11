SELECT arraySort(groupArrayArrayMerge(grp_aggreg)) gra , arraySort(groupArrayArray(grp_simple)) grs FROM data_02293 group by a SETTINGS optimize_aggregation_in_order=1;
