-- Tags: zookeeper
SYSTEM DROP  TABLE IF EXISTS default_table SYNC;

CREATE TABLE default_table
(
    id UInt64,
    enum_column Enum8('undefined' = 0, 'fox' = 1, 'index' = 2)
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01135/default_table', '1')
ORDER BY tuple();

INSERT INTO default_table;

INSERT INTO default_table (id);

SELECT COUNT()
FROM default_table;