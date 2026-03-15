CREATE TABLE table_for_rename
(
  date Date,
  key UInt64,
  value1 String,
  value2 String,
  value3 String MATERIALIZED concat(value1, ' + ', value2) 
)
ENGINE = MergeTree()
PARTITION BY date
ORDER BY key;
SELECT * FROM table_for_rename ORDER BY key;
SELECT '-- insert after rename --';
