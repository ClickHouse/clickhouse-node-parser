SELECT
    'max_merge_delayed_streams_for_parallel_write=100' AS test,
    *
FROM `system`.part_log
WHERE table = 'metric_log'
    AND database = currentDatabase()
    AND event_date >= yesterday()
    AND event_type = 'MergeParts'
    AND peak_memory_usage > 1000000000
FORMAT Vertical;

SELECT
    'max_merge_delayed_streams_for_parallel_write=1000' AS test,
    count() AS count
FROM `system`.part_log
WHERE table = 'metric_log'
    AND database = currentDatabase()
    AND event_date >= yesterday()
    AND event_type = 'MergeParts'
    AND peak_memory_usage > 1000000000;