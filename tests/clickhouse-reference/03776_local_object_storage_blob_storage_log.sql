CREATE TABLE test_local_blob_log (a Int32, b String)
ENGINE = MergeTree() ORDER BY a
SETTINGS disk = disk(type = 'local_blob_storage', path = '03776_test_local_blob_log/');
SELECT * FROM test_local_blob_log ORDER BY a;
-- Check that upload events were logged
SELECT 'Upload events:', count() > 0 FROM system.blob_storage_log
WHERE event_type = 'Upload'
    AND remote_path LIKE '%03776_test_local_blob_log%'
    AND data_size > 0
    AND error_code = 0
    AND event_date >= yesterday()
    AND event_time > now() - INTERVAL 5 MINUTE;
-- Check that delete events were logged
SELECT 'Delete events:', count() > 0 FROM system.blob_storage_log
WHERE event_type = 'Delete'
    AND remote_path LIKE '%03776_test_local_blob_log%'
    AND error_code = 0
    AND event_date >= yesterday()
    AND event_time > now() - INTERVAL 5 MINUTE;
