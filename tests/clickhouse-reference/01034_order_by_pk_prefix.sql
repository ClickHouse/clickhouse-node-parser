CREATE TABLE test_table (n Int32, s String)
ENGINE = MergeTree() PARTITION BY n % 10 ORDER BY n;
SELECT * FROM test_table ORDER BY n, s LIMIT 30;
