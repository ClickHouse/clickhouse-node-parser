CREATE TABLE new_table_test(name String) ENGINE = MergeTree ORDER BY name;
CREATE TABLE check_table_test(value1 UInt64, value2 UInt64) ENGINE = MergeTree ORDER BY tuple();
SELECT count() FROM check_table_test WHERE value2 > value1;
