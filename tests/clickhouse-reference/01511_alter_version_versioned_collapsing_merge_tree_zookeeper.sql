CREATE TABLE table_with_version_replicated_1
(
    key UInt64,
    value String,
    version UInt8,
    sign Int8
)
ENGINE ReplicatedVersionedCollapsingMergeTree('/clickhouse/' || currentDatabase() || '/test_01511/{shard}/t', '1_{replica}', sign, version)
ORDER BY key;
CREATE TABLE table_with_version_replicated_2
(
    key UInt64,
    value String,
    version UInt8,
    sign Int8
)
ENGINE ReplicatedVersionedCollapsingMergeTree('/clickhouse/' || currentDatabase() || '/test_01511/{shard}/t', '2_{replica}', sign, version)
ORDER BY key;
SELECT * FROM table_with_version_replicated_1 ORDER BY key;
SELECT * FROM table_with_version_replicated_1 FINAL ORDER BY key;
SELECT * FROM table_with_version_replicated_2 FINAL ORDER BY key;
