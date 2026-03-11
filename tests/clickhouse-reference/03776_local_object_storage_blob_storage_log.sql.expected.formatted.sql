SELECT *
FROM test_local_blob_log
ORDER BY a ASC;

SELECT
    'Upload events:',
    count() > 0
FROM `system`.blob_storage_log
WHERE event_type = 'Upload'
    AND like(remote_path, '%03776_test_local_blob_log%')
    AND data_size > 0
    AND error_code = 0
    AND event_date >= yesterday()
    AND event_time > now() - toIntervalMinute(5);

SELECT
    'Delete events:',
    count() > 0
FROM `system`.blob_storage_log
WHERE event_type = 'Delete'
    AND like(remote_path, '%03776_test_local_blob_log%')
    AND error_code = 0
    AND event_date >= yesterday()
    AND event_time > now() - toIntervalMinute(5);