SELECT
    merge_algorithm,
    if(peak_memory_usage < 500 * 1024 * 1024, 'OK', format('FAIL: memory usage: {}', formatReadableSize(peak_memory_usage)))
FROM `system`.part_log
WHERE database = currentDatabase()
    AND table = 't_vertical_merge_memory'
    AND event_type = 'MergeParts'
    AND length(merged_from) = 2;