create table t (n int, s String) engine MergeTree order by n;
select count(), count(n), count(s) from cluster('test_cluster_two_shards', currentDatabase(), t);
