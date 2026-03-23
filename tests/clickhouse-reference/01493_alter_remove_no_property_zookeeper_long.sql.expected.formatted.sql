-- Tags: long, zookeeper
SYSTEM DROP  TABLE IF EXISTS no_prop_table;

CREATE TABLE no_prop_table
(
    some_column UInt64
)
ENGINE = MergeTree()
ORDER BY tuple();

SYSTEM DROP  TABLE IF EXISTS r_no_prop_table;

CREATE TABLE r_no_prop_table
(
    some_column UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test/01493_r_no_prop_table', '1')
ORDER BY tuple();