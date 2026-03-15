-- Tags: long, zookeeper

SET send_logs_level = 'fatal';
SET replication_alter_partitions_sync = 2;
CREATE TABLE alter_compression_codec1 (
    somedate Date CODEC(LZ4),
    id UInt64 CODEC(NONE)
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00910/'||currentDatabase()||'alter_compression_codecs/{shard}', '1_{replica}') PARTITION BY somedate ORDER BY id;
CREATE TABLE alter_compression_codec2 (
  somedate Date CODEC(LZ4),
  id UInt64 CODEC(NONE)
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00910/'||currentDatabase()||'alter_compression_codecs/{shard}', '2_{replica}') PARTITION BY somedate ORDER BY id;
SELECT * FROM alter_compression_codec1 ORDER BY id;
SELECT * FROM alter_compression_codec2 ORDER BY id;
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec1' AND name = 'alter_column' AND database = currentDatabase();
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec2' AND name = 'alter_column' AND database = currentDatabase();
SET allow_suspicious_codecs = 1;
