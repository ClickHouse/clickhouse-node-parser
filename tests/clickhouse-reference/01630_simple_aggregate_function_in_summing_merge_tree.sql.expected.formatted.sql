CREATE TABLE test_smt
(
    id UInt32,
    sMap SimpleAggregateFunction(sumMap, Tuple(Array(UInt8), Array(Int64))),
    aMap AggregateFunction(sumMap, Tuple(Array(UInt8), Array(Int64)))
)
ENGINE = SummingMergeTree
ORDER BY id
PARTITION BY tuple();

SELECT
    sumMap(sMap),
    sumMapMerge(aMap)
FROM test_smt;

CREATE TABLE simple_agf_summing_mt
(
    a Int64,
    grp_aggreg AggregateFunction(groupUniqArrayArray, Array(UInt64)),
    grp_simple SimpleAggregateFunction(groupUniqArrayArray, Array(UInt64))
)
ENGINE = SummingMergeTree()
ORDER BY a;

SELECT
    arraySort(groupUniqArrayArrayMerge(grp_aggreg)) AS gra,
    arraySort(groupUniqArrayArray(grp_simple)) AS grs
FROM simple_agf_summing_mt
GROUP BY a;