CREATE TABLE test_datetime (time DateTime) ENGINE=MergeTree PARTITION BY time ORDER BY time;
SELECT * FROM test_datetime WHERE time=toDate(18012);
