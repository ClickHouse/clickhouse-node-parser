SELECT name
FROM test
GROUP BY name
SETTINGS force_optimize_projection_name = 'projection_name';

SELECT name
FROM test
GROUP BY name
SETTINGS force_optimize_projection_name = 'non_existing_projection';

SELECT name
FROM test
SETTINGS force_optimize_projection_name = 'projection_name';

SELECT 1
SETTINGS force_optimize_projection_name = 'projection_name';

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, '%SELECT name FROM test%')
    AND `Settings`['force_optimize_projection_name'] = 'projection_name'
    AND type = 'ExceptionBeforeStart';