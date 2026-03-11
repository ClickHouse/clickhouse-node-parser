SELECT sum(b) FROM t_index_hint WHERE b >= 100 AND b < 200 SETTINGS max_threads = 1;
SELECT sum(b) FROM t_index_hint WHERE a >= 100 AND a < 200 AND b >= 100 AND b < 200 SETTINGS max_threads = 1, force_primary_key = 1;
SELECT sum(b) FROM t_index_hint WHERE indexHint(a >= 100 AND a < 200) AND b >= 100 AND b < 200 SETTINGS max_threads = 1, force_primary_key = 1;
SELECT
    ProfileEvents['FileOpen'],
    read_rows,
    arraySort(arrayMap(x -> splitByChar('.', x)[-1], columns))
FROM system.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND query LIKE '%SELECT sum(b) FROM t_index_hint%'
ORDER BY event_time_microseconds;
SELECT count() FROM t_index_hint WHERE s LIKE '%my_token%' SETTINGS max_threads = 1;
SELECT count() FROM t_index_hint WHERE has(s_tokens, 'my_token') AND s LIKE '%my_token%' SETTINGS max_threads = 1, force_data_skipping_indices = 'idx_tokens';
SELECT count() FROM t_index_hint WHERE indexHint(has(s_tokens, 'my_token')) AND s LIKE '%my_token%' SETTINGS max_threads = 1, force_data_skipping_indices = 'idx_tokens';
SELECT
    ProfileEvents['FileOpen'],
    read_rows,
    arraySort(arrayMap(x -> splitByChar('.', x)[-1], columns))
FROM system.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND query LIKE '%SELECT count() FROM t_index_hint%'
ORDER BY event_time_microseconds;
