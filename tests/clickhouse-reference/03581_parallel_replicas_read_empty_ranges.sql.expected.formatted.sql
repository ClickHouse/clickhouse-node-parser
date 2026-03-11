SELECT
    'Primary key:',
    count()
FROM `03581_data`
WHERE key = 2000;

SELECT
    'Skip index MinMax:',
    count()
FROM `03581_data`
WHERE val_minmax = 2000;

SELECT
    'Skip index Set:',
    count()
FROM `03581_data`
WHERE val_set = 2000;

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND ilike(query, '% from 03581_data where %')
ORDER BY event_time_microseconds DESC;