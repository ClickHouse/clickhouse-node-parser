SET mutations_sync = 1;
DROP TABLE IF EXISTS test_updates;
CREATE TABLE test_updates (`id` UInt64, `json` JSON) ENGINE = MergeTree ORDER BY tuple() SETTINGS min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1, index_granularity = 5, index_granularity_bytes = '10Mi';
INSERT INTO test_updates SELECT number, '{"a" : 42}' FROM numbers(10);
SELECT * FROM test_updates;
DROP TABLE test_updates;
