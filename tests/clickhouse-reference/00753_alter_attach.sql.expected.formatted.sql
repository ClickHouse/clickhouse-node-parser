CREATE TABLE alter_attach
(
    x UInt64,
    p UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY p;

INSERT INTO alter_attach;

INSERT INTO alter_attach;

SELECT *
FROM alter_attach
ORDER BY x ASC;

INSERT INTO alter_attach;

CREATE TABLE detach_all_no_partition
(
    x UInt64,
    p UInt8
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO detach_all_no_partition;

SELECT *
FROM detach_all_no_partition
ORDER BY x ASC;

CREATE TABLE replicated_table_detach_all1
(
    id UInt64,
    Data String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/test_00753_{database}/replicated_table_detach_all', '1')
ORDER BY id
PARTITION BY id;

CREATE TABLE replicated_table_detach_all2
(
    id UInt64,
    Data String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/test_00753_{database}/replicated_table_detach_all', '2')
ORDER BY id
PARTITION BY id;

INSERT INTO replicated_table_detach_all1;

SELECT *
FROM replicated_table_detach_all1
ORDER BY id ASC;

SELECT *
FROM replicated_table_detach_all2
ORDER BY id ASC;

CREATE TABLE partition_all
(
    x UInt64,
    p UInt8,
    q UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY p;

INSERT INTO partition_all;

CREATE TABLE partition_all2
(
    x UInt64,
    p UInt8,
    q UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY p;

INSERT INTO partition_all2;

-- test ATTACH ALL
CREATE TABLE partition_attach_all
(
    x UInt64,
    p UInt8
)
ENGINE = MergeTree
ORDER BY x
PARTITION BY p;

INSERT INTO partition_attach_all;

SELECT *
FROM partition_attach_all
ORDER BY x ASC;

CREATE TABLE replicated_partition_attach_all
(
    x UInt64,
    p UInt8
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/test_00753_{database}/replicated_partition_attach_all', '1')
ORDER BY x
PARTITION BY p;

INSERT INTO replicated_partition_attach_all;

SELECT *
FROM replicated_partition_attach_all
ORDER BY x ASC;