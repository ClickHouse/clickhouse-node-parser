-- Tags: replica
SYSTEM DROP  TABLE IF EXISTS replicated_mutations_empty_partitions SYNC;

CREATE TABLE replicated_mutations_empty_partitions
(
    key UInt64,
    value String
)
ENGINE = ReplicatedMergeTree(concat('/clickhouse/test/', currentDatabase(), '/01586_replicated_mutations_empty_partitions/{shard}'), '{replica}')
ORDER BY key
PARTITION BY key;

-- insert_keeper* settings are adjusted since several actual inserts are happening behind one statement due to partitioning i.e. inserts in different partitions
INSERT INTO replicated_mutations_empty_partitions SETTINGS insert_keeper_fault_injection_probability = 0 SELECT
    number,
    toString(number)
FROM numbers(10);

SELECT countDistinct(value)
FROM replicated_mutations_empty_partitions;

SELECT count()
FROM `system`.zookeeper
WHERE path = concat('/clickhouse/test/', currentDatabase(), '/01586_replicated_mutations_empty_partitions/', getMacro('shard'), '/block_numbers');

SELECT sum(value)
FROM replicated_mutations_empty_partitions;