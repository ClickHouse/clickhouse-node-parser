CREATE TABLE test_03217_merge_replica_1
(
    x UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_03217_merge_replica', 'r1')
ORDER BY x;

CREATE TABLE test_03217_merge_replica_2
(
    x UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_03217_merge_replica', 'r2')
ORDER BY x;

CREATE TABLE test_03217_all_replicas
(
    x UInt32
)
ENGINE = Merge(currentDatabase(), 'test_03217_merge_replica_*');