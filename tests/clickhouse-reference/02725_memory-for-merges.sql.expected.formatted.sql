SELECT if((sum(peak_memory_usage) < 1024 * 1024 * 200 AS x), x, sum(peak_memory_usage))
FROM `system`.part_log
WHERE database = currentDatabase()
    AND table = '02725_memory_for_merges'
    AND event_type = 'MergeParts';