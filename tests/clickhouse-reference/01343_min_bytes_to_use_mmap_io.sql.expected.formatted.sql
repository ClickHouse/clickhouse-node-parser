CREATE TABLE test_01343
(
    x String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, prewarm_mark_cache = 0, serialization_info_version = 'basic';

SET local_filesystem_read_method = 'mmap', min_bytes_to_use_mmap_io = 1;

SELECT *
FROM test_01343;

SELECT ProfileEvents['CreatedReadBufferMMap'] AS value
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= yesterday()
    AND event_time >= now() - 300
    AND like(query, 'SELECT * FROM test_01343%')
    AND type = 2
ORDER BY event_time DESC
LIMIT 1;