CREATE TABLE alter_default
(
    date Date,
    key UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01079/alter_default', '1')
ORDER BY key;

SELECT sum(CAST(value AS UInt64))
FROM alter_default;

SELECT sum(value)
FROM alter_default;