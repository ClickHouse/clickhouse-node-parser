-- Tags: no-fasttest

DROP TABLE IF EXISTS replace_partition_source;
DROP TABLE IF EXISTS replace_partition_dest1;
DROP TABLE IF EXISTS replace_partition_dest1_2;
DROP TABLE IF EXISTS replace_partition_dest2;
DROP TABLE IF EXISTS replace_partition_dest2_2;
CREATE TABLE replace_partition_source
(
    key UInt64
)
ENGINE = ReplicatedMergeTree('/test/02271_replace_partition_many/{database}/source', '1')
PARTITION BY key
ORDER BY tuple();
INSERT INTO replace_partition_source VALUES (1);
CREATE TABLE replace_partition_dest1
(
    key UInt64
)
ENGINE = ReplicatedMergeTree('/test/02271_replace_partition_many/{database}/dest1', '1')
PARTITION BY key
ORDER BY tuple();
CREATE TABLE replace_partition_dest1_2
(
    key UInt64
)
ENGINE = ReplicatedMergeTree('/test/02271_replace_partition_many/{database}/dest1', '2')
PARTITION BY key
ORDER BY tuple();
CREATE TABLE replace_partition_dest2
(
    key UInt64
)
ENGINE = ReplicatedMergeTree('/test/02271_replace_partition_many/{database}/dest2', '1')
PARTITION BY key
ORDER BY tuple();
CREATE TABLE replace_partition_dest2_2
(
    key UInt64
)
ENGINE = ReplicatedMergeTree('/test/02271_replace_partition_many/{database}/dest2', '2')
PARTITION BY key
ORDER BY tuple();
SELECT sleep(3) FORMAT Null;
SELECT * FROM replace_partition_source;
SELECT * FROM replace_partition_dest1;
SELECT * FROM replace_partition_dest2;
SELECT * FROM replace_partition_dest1_2;
SELECT * FROM replace_partition_dest2_2;
