-- Tags: no-random-settings

set enable_analyzer=1;
set serialize_query_plan=0;
select '----------';
set serialize_query_plan=1;
DROP TABLE IF EXISTS test_parallel_replicas;
CREATE TABLE test_parallel_replicas (number UInt64) ENGINE=MergeTree() ORDER BY tuple();
INSERT INTO test_parallel_replicas SELECT * FROM numbers(10);
SET enable_parallel_replicas=2, max_parallel_replicas=2, cluster_for_parallel_replicas='test_cluster_one_shard_two_replicas', parallel_replicas_for_non_replicated_merge_tree=1, parallel_replicas_local_plan=1;
