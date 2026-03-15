---- partition merge
set allow_deprecated_syntax_for_merge_tree=1;
create table summing_merge_tree_aggregate_function (
    d Date,
    k UInt64,
    u AggregateFunction(uniq, UInt64)
) engine=SummingMergeTree(d, k, 1);
select count() from summing_merge_tree_aggregate_function;
create table summing_merge_tree_aggregate_function (
    d materialized today(),
    k UInt64,
    c UInt64,
    u AggregateFunction(uniq, UInt8),
    ue AggregateFunction(uniqExact, UInt8)
) engine=SummingMergeTree(d, k, 8192);
select
    k, sum(c),
    uniqMerge(u), uniqExactMerge(ue)
from summing_merge_tree_aggregate_function group by k;
---- sum + topK
create table summing_merge_tree_aggregate_function (d materialized today(), k UInt64, c UInt64, x AggregateFunction(topK(2), UInt8)) engine=SummingMergeTree(d, k, 8192);
select k, sum(c), topKMerge(2)(x) from summing_merge_tree_aggregate_function group by k;
---- sum + topKWeighted
create table summing_merge_tree_aggregate_function (d materialized today(), k UInt64, c UInt64, x AggregateFunction(topKWeighted(2), UInt8, UInt8)) engine=SummingMergeTree(d, k, 8192);
select k, sum(c), topKWeightedMerge(2)(x) from summing_merge_tree_aggregate_function group by k;
---- avg
create table summing_merge_tree_aggregate_function (d materialized today(), k UInt64, x AggregateFunction(avg, Float64)) engine=SummingMergeTree(d, k, 8192);
select k, avgMerge(x) from summing_merge_tree_aggregate_function group by k;
---- quantile
create table summing_merge_tree_aggregate_function (d materialized today(), k UInt64, x AggregateFunction(quantile(0.1), Float64)) engine=SummingMergeTree(d, k, 8192);
select k, round(quantileMerge(0.1)(x), 1) from summing_merge_tree_aggregate_function group by k;
---- sum + uniq with more data
create table summing_merge_tree_null (
    d materialized today(),
    k UInt64,
    c UInt64,
    u UInt64
) engine=Null;
create materialized view summing_merge_tree_aggregate_function (
    d Date,
    k UInt64,
    c UInt64,
    u AggregateFunction(uniq, UInt64)
) engine=SummingMergeTree(d, k, 8192)
as select d, k, sum(c) as c, uniqState(u) as u
from summing_merge_tree_null
group by d, k;
select k, sum(c), uniqMerge(u) from summing_merge_tree_aggregate_function group by k order by k;
