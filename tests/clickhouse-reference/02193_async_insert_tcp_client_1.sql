SELECT * FROM t_async_insert_02193_1 ORDER BY id;
SELECT count(), sum(ProfileEvents['AsyncInsertQuery']) FROM system.query_log
WHERE
    event_date >= yesterday() AND
    type = 'QueryFinish' AND
    current_database = currentDatabase() AND
    query ILIKE 'INSERT INTO t_async_insert_02193_1%';
