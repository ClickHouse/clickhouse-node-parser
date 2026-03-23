-- Tags: no-parallel-replicas, no-object-storage
SET min_bytes_to_use_direct_io = 0;

DROP TABLE IF EXISTS `03595_data`;

CREATE TABLE `03595_data`
(
    key UInt32,
    val String
)
ENGINE = MergeTree
ORDER BY key AS
SELECT
    number,
    concat('val-', number)
FROM numbers(100000);

SELECT *
FROM `03595_data`
FORMAT Null
SETTINGS local_filesystem_read_method = 'pread_threadpool', min_bytes_to_use_direct_io = 1, log_query_threads = 1, use_uncompressed_cache = 0;

DROP TABLE `03595_data`;