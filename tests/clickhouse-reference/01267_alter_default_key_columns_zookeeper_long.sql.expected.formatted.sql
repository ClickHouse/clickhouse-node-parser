-- Tags: long, zookeeper
SYSTEM DROP  TABLE IF EXISTS test_alter;

CREATE TABLE test_alter
(
    x Date,
    s String
)
ENGINE = MergeTree
ORDER BY s
PARTITION BY x;

SYSTEM DROP  TABLE test_alter;

SYSTEM DROP  TABLE IF EXISTS test_alter_r1;

SYSTEM DROP  TABLE IF EXISTS test_alter_r2;

CREATE TABLE test_alter_r1
(
    x Date,
    s String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01267/alter', 'r1')
ORDER BY s
PARTITION BY x;

CREATE TABLE test_alter_r2
(
    x Date,
    s String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01267/alter', 'r2')
ORDER BY s
PARTITION BY x;

SYSTEM DROP  TABLE test_alter_r1;

SYSTEM DROP  TABLE test_alter_r2;