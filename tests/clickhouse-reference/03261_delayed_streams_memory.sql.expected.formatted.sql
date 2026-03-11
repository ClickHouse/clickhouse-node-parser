SELECT if(memory_usage < 300000000, 'Ok', format('Fail: memory usage {}', formatReadableSize(memory_usage)))
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'INSERT INTO t_100_columns%')
    AND type = 'QueryFinish';