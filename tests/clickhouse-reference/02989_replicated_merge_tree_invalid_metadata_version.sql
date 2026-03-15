CREATE TABLE test_table_replicated
(
    id UInt64,
    value String
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{database}/test_table_replicated', '1_replica') ORDER BY id;
SELECT name, version FROM system.zookeeper
WHERE path = (SELECT zookeeper_path FROM system.replicas WHERE database = currentDatabase() AND table = 'test_table_replicated')
AND name = 'metadata' FORMAT Vertical;
CREATE TABLE test_table_replicated_second
(
    id UInt64,
    value String,
    insert_time DateTime
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{database}/test_table_replicated', '2_replica') ORDER BY id;
SELECT '--';
SELECT name, value FROM system.zookeeper
WHERE path = (SELECT replica_path FROM system.replicas WHERE database = currentDatabase() AND table = 'test_table_replicated_second')
AND name = 'metadata_version' FORMAT Vertical;
