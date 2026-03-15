CREATE TABLE table_with_pk_clear(
  key1 UInt64,
  key2 String,
  value1 String,
  value2 String
)
ENGINE = MergeTree()
ORDER by (key1, key2);
SELECT count(distinct key1) FROM table_with_pk_clear;
SELECT count(distinct key2) FROM table_with_pk_clear;
