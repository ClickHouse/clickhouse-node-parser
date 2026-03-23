-- Tags: zookeeper
SYSTEM DROP  TABLE IF EXISTS r_prop_table1;

SYSTEM DROP  TABLE IF EXISTS r_prop_table2;

SET replication_alter_partitions_sync = 2;

CREATE TABLE r_prop_table1
(
    column_default UInt64 DEFAULT 42,
    column_codec String CODEC(ZSTD(10)),
    column_comment Date COMMENT 'Some comment',
    column_ttl UInt64 TTL column_comment + toIntervalMonth(1)
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01493/r_prop_table', '1')
ORDER BY tuple()
TTL column_comment + toIntervalMonth(2);

CREATE TABLE r_prop_table2
(
    column_default UInt64 DEFAULT 42,
    column_codec String CODEC(ZSTD(10)),
    column_comment Date COMMENT 'Some comment',
    column_ttl UInt64 TTL column_comment + toIntervalMonth(1)
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01493/r_prop_table', '2')
ORDER BY tuple()
TTL column_comment + toIntervalMonth(2);

INSERT INTO r_prop_table1 (column_codec, column_comment, column_ttl);

INSERT INTO r_prop_table1 (column_codec, column_comment, column_ttl);

SELECT
    column_default,
    column_codec,
    column_ttl
FROM r_prop_table1
ORDER BY column_ttl ASC;

INSERT INTO r_prop_table1 (column_codec, column_comment, column_ttl);

SELECT COUNT()
FROM r_prop_table1;

SELECT COUNT()
FROM r_prop_table2;