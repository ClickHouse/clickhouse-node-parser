SELECT *
FROM
    (SELECT (number, number+1) AS a FROM numbers(1000-3, 3)) AS t1,
    (SELECT (number, number+1) aS b FROM numbers(1000)) AS t2
WHERE t1.a = t2.b
SETTINGS enable_join_runtime_filters=1, join_runtime_filter_exact_values_limit=100, log_comment='Q1';
SELECT ProfileEvents['RuntimeFilterRowsChecked'], ProfileEvents['RuntimeFilterRowsSkipped']
FROM system.query_log
WHERE current_database = currentDatabase() AND event_time > now() - INTERVAL 30 MINUTE AND type = 'QueryFinish' AND log_comment = 'Q1';
SELECT *
FROM
    (SELECT (number, number+1) AS a FROM numbers(1000-3, 3)) AS t1,
    (SELECT (number, number+1) aS b FROM numbers(1000)) AS t2
WHERE t1.a = t2.b
SETTINGS enable_join_runtime_filters=1, join_runtime_filter_exact_values_limit=10000, log_comment='Q2';
SELECT ProfileEvents['RuntimeFilterRowsChecked'], ProfileEvents['RuntimeFilterRowsSkipped']
FROM system.query_log
WHERE current_database = currentDatabase() AND event_time > now() - INTERVAL 30 MINUTE AND type = 'QueryFinish' AND log_comment = 'Q2';
