SELECT
    table,
    name,
    argMax(part_type, event_time_microseconds),
    argMax(deduplication_block_ids, event_time_microseconds)
FROM `system`.part_log
WHERE table IN (['03711_join_with', '03711_table', '03711_mv_table_1', '03711_mv_table_2'])
    AND database = '03710_database'
GROUP BY
    database,
    table,
    name
ORDER BY `ALL` ASC;