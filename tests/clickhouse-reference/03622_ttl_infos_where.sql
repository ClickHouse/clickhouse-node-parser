SELECT * FROM users ORDER BY ALL;
SELECT
    delete_ttl_info_min,
    delete_ttl_info_max,
    rows_where_ttl_info.min,
    rows_where_ttl_info.max
FROM system.parts WHERE database = currentDatabase() AND table = 'users' AND active
ORDER BY name;
SELECT merge_algorithm FROM system.part_log WHERE database = currentDatabase() AND table = 'users' AND event_type = 'MergeParts' ORDER BY event_time_microseconds DESC LIMIT 1;
