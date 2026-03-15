CREATE TABLE lwd_test_02521 (id UInt64, value String, event_time DateTime)
ENGINE MergeTree()
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0, index_granularity = 8192, index_granularity_bytes = '10Mi';
SET mutations_sync=1;
-- { echoOn }
SELECT 'Rows in parts', SUM(rows) FROM system.parts WHERE database = currentDatabase() AND table = 'lwd_test_02521' AND active;
SELECT 'Count', count() FROM lwd_test_02521;
