SELECT *
FROM test
FORMAT Null;

SELECT
    file_segment_range_begin,
    file_segment_range_end,
    size
FROM `system`.filesystem_cache
WHERE cache_name = '02240_filesystem_query_cache'
ORDER BY
    file_segment_range_end ASC,
    size ASC;

SELECT
    file_segment_range_begin,
    file_segment_range_end,
    size
FROM `system`.filesystem_cache
WHERE cache_name = '02240_filesystem_query_cache';