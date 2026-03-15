-- Tags: long, zookeeper, no-replicated-database, no-async-insert
-- Tag no-replicated-database: Fails due to additional replicas or shards
-- Tag no-async-insert: Async insert calculate block_id differently, it takes all inserted data into account

SET insert_keeper_fault_injection_probability=0;
CREATE TABLE partitioned_table (
    key UInt64,
    partitioner UInt8,
    value String
)
ENGINE ReplicatedMergeTree('/clickhouse/{database}/01650_drop_part_and_deduplication_partitioned_table', '1')
ORDER BY key
PARTITION BY partitioner;
SELECT partition_id, name FROM system.parts WHERE table = 'partitioned_table' AND database = currentDatabase() and active ORDER BY name;
SELECT substring(name, 1, 2), value FROM system.zookeeper WHERE path='/clickhouse/' || currentDatabase() || '/01650_drop_part_and_deduplication_partitioned_table/blocks/' ORDER BY value;
