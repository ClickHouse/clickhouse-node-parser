-- Tags: long, zookeeper
SYSTEM DROP  TABLE IF EXISTS alter_default;

CREATE TABLE alter_default
(
    date Date,
    key UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01079/alter_default', '1')
ORDER BY key;

INSERT INTO alter_default SELECT
    toDate('2020-01-05'),
    number
FROM `system`.numbers
LIMIT 100;

SELECT sum(CAST(value AS UInt64))
FROM alter_default;

SELECT sum(value)
FROM alter_default;