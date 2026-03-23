-- Tags: long, replica

SET insert_keeper_fault_injection_probability=0; -- disable fault injection; part ids are non-deterministic in case of insert retries
SET replication_alter_partitions_sync=2;
DROP TABLE IF EXISTS test SYNC;
DROP TABLE IF EXISTS test2 SYNC;
CREATE TABLE test (x Enum('hello' = 1, 'world' = 2), y String) ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01346/table', 'r1') PARTITION BY x ORDER BY y;
CREATE TABLE test2 (x Enum('hello' = 1, 'world' = 2), y String) ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01346/table', 'r2') PARTITION BY x ORDER BY y;
INSERT INTO test VALUES ('hello', 'test');
SELECT * FROM test;
SELECT * FROM test2;
SELECT min_block_number, max_block_number, partition, partition_id FROM system.parts WHERE database = currentDatabase() AND table = 'test' AND active ORDER BY partition;
SELECT min_block_number, max_block_number, partition, partition_id FROM system.parts WHERE database = currentDatabase() AND table = 'test2' AND active ORDER BY partition;
INSERT INTO test VALUES ('goodbye', 'test');
SELECT * FROM test ORDER BY x;
SELECT * FROM test2 ORDER BY x;
INSERT INTO test VALUES (111, 'abc');
DROP TABLE test SYNC;
DROP TABLE test2 SYNC;
