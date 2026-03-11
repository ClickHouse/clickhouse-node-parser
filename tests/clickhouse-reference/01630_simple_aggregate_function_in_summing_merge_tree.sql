select sumMap(sMap), sumMapMerge(aMap) from test_smt;
SELECT arraySort(groupUniqArrayArrayMerge(grp_aggreg)) gra , arraySort(groupUniqArrayArray(grp_simple)) grs FROM simple_agf_summing_mt group by a;
