SELECT '-- check that partition key with ignore works correctly';
CREATE TABLE partition_by_ignore (ts DateTime, ts_2 DateTime) ENGINE=MergeTree PARTITION BY (toYYYYMM(ts), ignore(ts_2)) ORDER BY tuple() SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
INSERT INTO partition_by_ignore SELECT toDateTime('2022-08-03 00:00:00') + toIntervalDay(number), toDateTime('2022-08-04 00:00:00') + toIntervalDay(number) FROM numbers(60);
