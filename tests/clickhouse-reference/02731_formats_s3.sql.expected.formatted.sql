SELECT sum(*)
FROM s3(s3_conn, filename = '02731.parquet')
SETTINGS
    remote_filesystem_read_method = 'threadpool',
    remote_filesystem_read_prefetch = 1;

SELECT sum(*)
FROM s3(s3_conn, filename = '02731.arrow')
SETTINGS
    remote_filesystem_read_method = 'read',
    max_download_buffer_size = 1048576;