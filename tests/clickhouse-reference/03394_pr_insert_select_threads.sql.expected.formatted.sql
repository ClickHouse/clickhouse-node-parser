SELECT count()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_mt_source';

SELECT
    if(is_initial_query, 'inital', 'secondary'),
    if(toUInt64OrZero(`Settings`['parallel_replicas_insert_select_local_pipeline']) == 0
    AND is_initial_query, 1, 8) AS threads_limit,
    least(peak_threads_usage, threads_limit),
    format('local_pipeline={}', `Settings`['parallel_replicas_insert_select_local_pipeline'])
FROM `system`.query_log
WHERE ((current_database = currentDatabase()
    OR has(databases, currentDatabase())))
    AND type = 'QueryFinish'
    AND `Settings`['allow_experimental_parallel_reading_from_replicas'] = '1'
    AND query_kind = 'Insert'
    AND has(tables, concat(currentDatabase(), '.t_rmt_target'))
ORDER BY event_time_microseconds ASC
SETTINGS allow_experimental_parallel_reading_from_replicas = 0;