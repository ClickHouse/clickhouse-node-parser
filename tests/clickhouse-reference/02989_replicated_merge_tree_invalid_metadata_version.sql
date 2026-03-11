SELECT name, version FROM system.zookeeper
WHERE path = (SELECT zookeeper_path FROM system.replicas WHERE database = currentDatabase() AND table = 'test_table_replicated')
AND name = 'metadata' FORMAT Vertical;
SELECT '--';
SELECT name, value FROM system.zookeeper
WHERE path = (SELECT replica_path FROM system.replicas WHERE database = currentDatabase() AND table = 'test_table_replicated_second')
AND name = 'metadata_version' FORMAT Vertical;
