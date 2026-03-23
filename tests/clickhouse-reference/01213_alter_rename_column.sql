CREATE TABLE table_for_rename
(
  date Date,
  key UInt64,
  value1 String,
  value2 String,
  value3 String
)
ENGINE = MergeTree()
PARTITION BY date
ORDER BY key;
INSERT INTO table_for_rename SELECT toDate('2019-10-01') + number % 3, number, toString(number), toString(number), toString(number) from numbers(9);
SELECT value1 FROM table_for_rename WHERE key = 1;
SELECT renamed_value1 FROM table_for_rename WHERE key = 1;
SELECT * FROM table_for_rename WHERE key = 1 FORMAT TSVWithNames;
SELECT renamed_value2, renamed_value3 FROM table_for_rename WHERE key = 7;
SELECT * FROM table_for_rename WHERE key = 7 FORMAT TSVWithNames;
