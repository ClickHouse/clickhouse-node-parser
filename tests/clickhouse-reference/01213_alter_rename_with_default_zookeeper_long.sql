CREATE TABLE table_rename_with_default
(
  date Date,
  key UInt64,
  value1 String,
  value2 String DEFAULT concat('Hello ', value1),
  value3 String ALIAS concat('Word ', value1)
)
ENGINE = MergeTree()
PARTITION BY date
ORDER BY key;
SELECT * FROM table_rename_with_default WHERE key = 1 FORMAT TSVWithNames;
SELECT value2 FROM table_rename_with_default WHERE key = 1;
SELECT value3 FROM table_rename_with_default WHERE key = 1;
CREATE TABLE table_rename_with_ttl
(
  date1 Date,
  date2 Date,
  value1 String,
  value2 String TTL date1 + INTERVAL 500 MONTH
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01213/table_rename_with_ttl', '1')
ORDER BY tuple()
TTL date2 + INTERVAL 500 MONTH;
SELECT * FROM table_rename_with_ttl WHERE value1 = '1' FORMAT TSVWithNames;
