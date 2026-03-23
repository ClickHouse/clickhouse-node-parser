-- Tags: long, zookeeper

SET send_logs_level = 'fatal';
SET replication_alter_partitions_sync = 2;
DROP TABLE IF EXISTS alter_compression_codec1;
DROP TABLE IF EXISTS alter_compression_codec2;
CREATE TABLE alter_compression_codec1 (
    somedate Date CODEC(LZ4),
    id UInt64 CODEC(NONE)
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00910/'||currentDatabase()||'alter_compression_codecs/{shard}', '1_{replica}') PARTITION BY somedate ORDER BY id;
CREATE TABLE alter_compression_codec2 (
  somedate Date CODEC(LZ4),
  id UInt64 CODEC(NONE)
) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00910/'||currentDatabase()||'alter_compression_codecs/{shard}', '2_{replica}') PARTITION BY somedate ORDER BY id;
INSERT INTO alter_compression_codec1 VALUES('2018-01-01', 1);
INSERT INTO alter_compression_codec1 VALUES('2018-01-01', 2);
SELECT * FROM alter_compression_codec1 ORDER BY id;
SELECT * FROM alter_compression_codec2 ORDER BY id;
ALTER TABLE alter_compression_codec1 ADD COLUMN alter_column String DEFAULT 'default_value' CODEC(ZSTD);
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec1' AND name = 'alter_column' AND database = currentDatabase();
SELECT compression_codec FROM system.columns WHERE table = 'alter_compression_codec2' AND name = 'alter_column' AND database = currentDatabase();
INSERT INTO alter_compression_codec1 VALUES('2018-01-01', 3, '3');
INSERT INTO alter_compression_codec1 VALUES('2018-01-01', 4, '4');
ALTER TABLE alter_compression_codec1 MODIFY COLUMN alter_column CODEC(NONE);
INSERT INTO alter_compression_codec2 VALUES('2018-01-01', 5, '5');
INSERT INTO alter_compression_codec2 VALUES('2018-01-01', 6, '6');
SET allow_suspicious_codecs = 1;
ALTER TABLE alter_compression_codec1 MODIFY COLUMN alter_column CODEC(ZSTD, LZ4HC, LZ4, LZ4, NONE);
INSERT INTO alter_compression_codec1 VALUES('2018-01-01', 7, '7');
INSERT INTO alter_compression_codec2 VALUES('2018-01-01', 8, '8');
ALTER TABLE alter_compression_codec1 MODIFY COLUMN alter_column FixedString(100);
