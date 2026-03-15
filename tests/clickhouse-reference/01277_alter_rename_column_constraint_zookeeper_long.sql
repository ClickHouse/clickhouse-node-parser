CREATE TABLE table_for_rename1
(
  date Date,
  key UInt64,
  value1 String,
  value2 String,
  value3 String,
  CONSTRAINT cs_value1 CHECK toInt64(value1) < toInt64(value2),
  CONSTRAINT cs_value2 CHECK toInt64(value2) < toInt64(value3)
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01277/test_for_rename', '1')
PARTITION BY date
ORDER BY key;
SELECT * FROM table_for_rename1 ORDER BY key;
SELECT '-- insert after rename --';
