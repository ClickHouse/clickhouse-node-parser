create table test_smt (id UInt32, sMap SimpleAggregateFunction(sumMap, Tuple(Array(UInt8), Array(Int64))), aMap AggregateFunction(sumMap, Tuple(Array(UInt8), Array(Int64)))) engine SummingMergeTree partition by tuple() order by id;
select sumMap(sMap), sumMapMerge(aMap) from test_smt;
create table simple_agf_summing_mt (a Int64, grp_aggreg AggregateFunction(groupUniqArrayArray, Array(UInt64)), grp_simple SimpleAggregateFunction(groupUniqArrayArray, Array(UInt64))) engine = SummingMergeTree() order by a;
SELECT arraySort(groupUniqArrayArrayMerge(grp_aggreg)) gra , arraySort(groupUniqArrayArray(grp_simple)) grs FROM simple_agf_summing_mt group by a;
