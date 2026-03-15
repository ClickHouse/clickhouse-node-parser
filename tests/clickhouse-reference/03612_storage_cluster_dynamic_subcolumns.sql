create table test (json JSON, d Dynamic) engine=MergeTree order by tuple();
create table test_cluster as cluster(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), 'test');
select * from test_cluster;
select json.a, d.Int64 from test_cluster;
