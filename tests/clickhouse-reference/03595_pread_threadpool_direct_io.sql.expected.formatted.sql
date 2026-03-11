SELECT *
FROM `03595_data`
FORMAT Null
SETTINGS local_filesystem_read_method = 'pread_threadpool', min_bytes_to_use_direct_io = 1, log_query_threads = 1, use_uncompressed_cache = 0;