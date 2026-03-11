SELECT
    table,
    part_name,
    event_type,
    merge_algorithm
FROM `system`.part_log
WHERE event_date >= yesterday()
    AND database = currentDatabase()
    AND table = 'data_horizontal'
    AND event_type IN ('NewPart', 'MergeParts')
ORDER BY event_time_microseconds ASC;

SELECT
    table,
    part_name,
    event_type,
    merge_algorithm
FROM `system`.part_log
WHERE event_date >= yesterday()
    AND database = currentDatabase()
    AND table = 'data_vertical'
    AND event_type IN ('NewPart', 'MergeParts')
ORDER BY event_time_microseconds ASC;