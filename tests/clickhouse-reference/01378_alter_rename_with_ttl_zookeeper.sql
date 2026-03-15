CREATE TABLE table_rename_with_ttl
(
  date1 Date,
  value1 String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test/table_rename_with_ttl_01378', '1')
ORDER BY tuple();
SELECT count() FROM table_rename_with_ttl;
SET materialize_ttl_after_modify = 0;
