-- should be about 4MB
SELECT
    formatReadableSize(peak_memory_usage),
    *
FROM `system`.part_log
WHERE table = 'tvm'
    AND database = currentDatabase()
    AND event_date >= today() - 1
    AND event_type = 'MergeParts'
    AND peak_memory_usage > 100000000
FORMAT Vertical;