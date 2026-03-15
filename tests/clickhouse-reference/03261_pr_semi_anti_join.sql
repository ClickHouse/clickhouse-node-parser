CREATE TABLE t1 (x UInt32, s String) engine ReplicatedMergeTree('/clickhouse/{database}/t1', '1') order by tuple();
CREATE TABLE t2 (x UInt32, s String) engine ReplicatedMergeTree('/clickhouse/{database}/t2', '1') order by tuple();
SET join_use_nulls = 0;
set enable_analyzer = 1, enable_parallel_replicas = 1, max_parallel_replicas = 3, cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost';
SELECT t1.*, t2.* FROM t1 SEMI LEFT JOIN t2 USING(x) ORDER BY t1.x, t2.x, t1.s, t2.s;
SELECT t1.*, t2.* FROM t1 SEMI RIGHT JOIN t2 USING(x) ORDER BY t1.x, t2.x, t1.s, t2.s;
SELECT t1.*, t2.* FROM t1 ANTI LEFT JOIN t2 USING(x) ORDER BY t1.x, t2.x, t1.s, t2.s;
SELECT t1.*, t2.* FROM t1 ANTI RIGHT JOIN t2 USING(x) ORDER BY t1.x, t2.x, t1.s, t2.s;
