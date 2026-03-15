CREATE TABLE test_01640(i Int64, d Date, s String)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/{shard}/tables/test_01640','{replica}')
PARTITION BY toYYYYMM(d) ORDER BY i;
CREATE TABLE restore_01640(i Int64, d Date, s String)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/{shard}/tables/restore_01640','{replica}')
PARTITION BY toYYYYMM(d) ORDER BY i;
SELECT partition_id
FROM system.detached_parts
WHERE (table = 'restore_01640') AND (database = currentDatabase());
SELECT _part, * FROM restore_01640;
