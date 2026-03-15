CREATE TABLE replicated_mutations_empty_partitions
(
    key UInt64,
    value String
)
ENGINE = ReplicatedMergeTree(concat('/clickhouse/test/', currentDatabase(), '/01586_replicated_mutations_empty_partitions/{shard}'), '{replica}')
ORDER BY key
PARTITION BY key;

SELECT countDistinct(value)
FROM replicated_mutations_empty_partitions;

SELECT count()
FROM `system`.zookeeper
WHERE path = concat('/clickhouse/test/', currentDatabase(), '/01586_replicated_mutations_empty_partitions/', getMacro('shard'), '/block_numbers');

SELECT sum(value)
FROM replicated_mutations_empty_partitions;