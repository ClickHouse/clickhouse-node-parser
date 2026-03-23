DROP TABLE IF EXISTS table_for_rename;
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
INSERT INTO table_for_rename (date, key, value1, value2) SELECT toDate('2019-10-01') + number % 3, number, toString(number), toString(number + 1) from numbers(9);
SELECT * FROM table_for_rename ORDER BY key;
SELECT '-- insert after rename --';
INSERT INTO table_for_rename (date, key, value4, value5) SELECT toDate('2019-10-01') + number % 3, number, toString(number), toString(number + 1) from numbers(10, 10);
INSERT INTO table_for_rename (date, key, value1, value2) SELECT toDate('2019-10-01') + number % 3, number, toString(number), toString(number + 1) from numbers(20,10);
