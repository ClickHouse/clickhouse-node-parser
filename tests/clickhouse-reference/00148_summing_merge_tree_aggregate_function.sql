select count() from summing_merge_tree_aggregate_function;
select
    k, sum(c),
    uniqMerge(u), uniqExactMerge(ue)
from summing_merge_tree_aggregate_function group by k;
select k, sum(c), topKMerge(2)(x) from summing_merge_tree_aggregate_function group by k;
select k, sum(c), topKWeightedMerge(2)(x) from summing_merge_tree_aggregate_function group by k;
select k, avgMerge(x) from summing_merge_tree_aggregate_function group by k;
select k, round(quantileMerge(0.1)(x), 1) from summing_merge_tree_aggregate_function group by k;
select k, sum(c), uniqMerge(u) from summing_merge_tree_aggregate_function group by k order by k;
