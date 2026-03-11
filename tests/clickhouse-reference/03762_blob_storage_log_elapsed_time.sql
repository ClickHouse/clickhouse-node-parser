SELECT elapsed_microseconds > 0 FROM system.blob_storage_log WHERE remote_path = '03762_data/file_'||currentDatabase()||'.parquet' ORDER BY event_time DESC LIMIT 1;
