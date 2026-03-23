CREATE TABLE replace_partition_source
(
    key UInt64
)
ENGINE = ReplicatedMergeTree('/test/02271_replace_partition_many/{database}/source', '1')
ORDER BY tuple()
PARTITION BY key;

INSERT INTO replace_partition_source;

CREATE TABLE replace_partition_dest1
(
    key UInt64
)
ENGINE = ReplicatedMergeTree('/test/02271_replace_partition_many/{database}/dest1', '1')
ORDER BY tuple()
PARTITION BY key;

CREATE TABLE replace_partition_dest1_2
(
    key UInt64
)
ENGINE = ReplicatedMergeTree('/test/02271_replace_partition_many/{database}/dest1', '2')
ORDER BY tuple()
PARTITION BY key;

CREATE TABLE replace_partition_dest2
(
    key UInt64
)
ENGINE = ReplicatedMergeTree('/test/02271_replace_partition_many/{database}/dest2', '1')
ORDER BY tuple()
PARTITION BY key;

CREATE TABLE replace_partition_dest2_2
(
    key UInt64
)
ENGINE = ReplicatedMergeTree('/test/02271_replace_partition_many/{database}/dest2', '2')
ORDER BY tuple()
PARTITION BY key;

SELECT sleep(3)
FORMAT Null;

SELECT *
FROM replace_partition_source;

SELECT *
FROM replace_partition_dest1;

SELECT *
FROM replace_partition_dest2;

SELECT *
FROM replace_partition_dest1_2;

SELECT *
FROM replace_partition_dest2_2;