-- Tags: no-fasttest
-- Tag no-fasttest: Depends on AWS

select * from urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv') ORDER BY c1, c2, c3;
select * from urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv', 'TSV') ORDER BY c1, c2, c3;
select * from urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv', 'TSV', 'c1 UInt64, c2 UInt64, c3 UInt64') ORDER BY c1, c2, c3;
select * from urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv', 'TSV', 'c1 UInt64, c2 UInt64, c3 UInt64', 'auto') ORDER BY c1, c2, c3;
select COUNT() from urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv');
select COUNT(*) from urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv');
select * from urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv') order by c1, c2, c3;
select * from urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV') order by c1, c2, c3;
select * from urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'auto') order by c1, c2, c3;
select * from urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto') order by c1, c2, c3;
select * from urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto', 'auto') order by c1, c2, c3;
create table test (x UInt32, y UInt32, z UInt32) engine=Memory();
insert into test select * from urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/a.tsv', 'TSV');
select * from test;
