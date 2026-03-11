SELECT
    sumMap(sMap),
    sumMapMerge(aMap)
FROM test_smt;

SELECT
    arraySort(groupUniqArrayArrayMerge(grp_aggreg)) AS gra,
    arraySort(groupUniqArrayArray(grp_simple)) AS grs
FROM simple_agf_summing_mt
GROUP BY a;