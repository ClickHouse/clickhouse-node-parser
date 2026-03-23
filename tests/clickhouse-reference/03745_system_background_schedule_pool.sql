SELECT count() >= 0 AS has_tasks FROM system.background_schedule_pool;
CREATE TABLE test_table_03745 (x UInt64) ENGINE = Memory;
CREATE TABLE test_buffer_03745 (x UInt64) ENGINE = Buffer(currentDatabase(), test_table_03745, 1, 10, 100, 10000, 1000000, 10000000, 100000000);
INSERT INTO test_buffer_03745 VALUES (1), (2), (3);
SELECT pool, database, table, table_uuid != toUUIDOrDefault(0) AS has_uuid, log_name FROM system.background_schedule_pool WHERE database = currentDatabase();
CREATE TABLE test_merge_tree_03745 (x UInt64, y String) ENGINE = MergeTree() ORDER BY x SETTINGS refresh_statistics_interval = '0';
INSERT INTO test_merge_tree_03745 VALUES (1, 'a'), (2, 'b');
CREATE TABLE test_local_03745 (x UInt64) ENGINE = Memory;
CREATE TABLE test_distributed_03745 (x UInt64) ENGINE = Distributed(test_shard_localhost, currentDatabase(), test_local_03745);
-- Pool is created only for async INSERTs
INSERT INTO test_distributed_03745 SETTINGS prefer_localhost_replica=0, distributed_foreground_insert=0 VALUES (1), (2), (3);
