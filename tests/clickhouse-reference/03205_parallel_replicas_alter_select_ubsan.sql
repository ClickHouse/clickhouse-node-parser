SET alter_sync = 2;
SET max_parallel_replicas = 3, cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost', parallel_replicas_for_non_replicated_merge_tree = true;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t1__fuzz_26;
CREATE TABLE t1__fuzz_26 (`a` Nullable(Float64), `b` Nullable(Float32), `pk` Int64) ENGINE = MergeTree ORDER BY pk;
CREATE TABLE t1 ( a Float64, b Int64, pk String) Engine = MergeTree() ORDER BY pk;
DROP TABLE t1;
DROP TABLE t1__fuzz_26;
