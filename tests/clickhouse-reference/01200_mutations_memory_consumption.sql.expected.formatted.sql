SELECT arrayDistinct(groupArray(if(read_bytes >= peak_memory_usage, [1], [read_bytes, peak_memory_usage])))
FROM `system`.part_log
WHERE event_type = 'MutatePart'
    AND table = 'table_with_single_pk'
    AND database = currentDatabase();

SELECT arrayDistinct(groupArray(if(read_bytes >= peak_memory_usage, [1], [read_bytes, peak_memory_usage])))
FROM `system`.part_log
WHERE event_type = 'MutatePart'
    AND table = 'table_with_multi_pk'
    AND database = currentDatabase();

SELECT arrayDistinct(groupArray(if(read_bytes >= peak_memory_usage, [1], [read_bytes, peak_memory_usage])))
FROM `system`.part_log
WHERE event_type = 'MutatePart'
    AND table = 'table_with_function_pk'
    AND database = currentDatabase();

SELECT arrayDistinct(groupArray(if(read_bytes >= peak_memory_usage, [1], [read_bytes, peak_memory_usage])))
FROM `system`.part_log
WHERE event_type = 'MutatePart'
    AND table = 'table_without_pk'
    AND database = currentDatabase();