create table test (key Int) engine=MergeTree() order by tuple() settings ratio_of_defaults_for_sparse_serialization=0.1;
select arrayMap(x -> (x <= key), [1]) from test;
