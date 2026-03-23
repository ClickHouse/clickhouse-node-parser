CREATE TABLE alter_default
(
  date Date,
  key UInt64
)
ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_01079/alter_default', '1')
ORDER BY key;
INSERT INTO alter_default select toDate('2020-01-05'), number from system.numbers limit 100;
SELECT sum(cast(value as UInt64)) FROM alter_default;
SELECT sum(value) from alter_default;
