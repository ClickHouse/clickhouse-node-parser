SELECT
    address,
    type,
    has_watch,
    op_num,
    path,
    is_ephemeral,
    is_sequential,
    version,
    requests_size,
    request_idx,
    error,
    watch_type,
    watch_state,
    path_created,
    stat_version,
    stat_cversion,
    stat_dataLength,
    stat_numChildren
FROM `system`.zookeeper_log
WHERE like(path, concat('/test/01158/', currentDatabase(), '/rmt/log%'))
    AND op_num NOT IN (3, 4, 12, 500)
ORDER BY
    xid ASC,
    type ASC,
    request_idx ASC;

SELECT count() > 0
FROM `system`.zookeeper_log
WHERE like(path, concat('/test/01158/', currentDatabase(), '/rmt%'))
    AND duration_microseconds > 0;

SELECT
    sum(errors[0]) > 0,
    sum(average_latency) > 0
FROM `system`.aggregated_zookeeper_log
WHERE parent_path = concat('/test/01158/', currentDatabase(), '/rmt')
    AND operation = 'Create';