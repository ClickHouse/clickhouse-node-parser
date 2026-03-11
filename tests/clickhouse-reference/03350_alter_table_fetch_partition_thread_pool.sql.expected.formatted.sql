SELECT
    'parts in data1',
    count()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'data1';

SELECT
    'detached parts in data2',
    count()
FROM `system`.detached_parts
WHERE database = currentDatabase()
    AND table = 'data2';

SELECT
    'FETCH PARTITION uses multiple threads',
    peak_threads_usage > 10
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND type != 'QueryStart'
    AND query_kind = 'Alter'
    AND current_database = currentDatabase();