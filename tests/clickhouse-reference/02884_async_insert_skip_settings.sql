SELECT 'pending to flush', length(entries.bytes) FROM system.asynchronous_inserts
WHERE database = currentDatabase() AND table = 't_async_insert_skip_settings'
ORDER BY first_update;
SELECT * FROM t_async_insert_skip_settings ORDER BY id;
SELECT 'flush queries', uniqExact(flush_query_id) FROM system.asynchronous_insert_log
WHERE database = currentDatabase() AND table = 't_async_insert_skip_settings';
