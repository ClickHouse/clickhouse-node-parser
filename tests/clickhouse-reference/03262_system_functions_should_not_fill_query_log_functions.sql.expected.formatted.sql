SELECT *
FROM `system`.functions
WHERE name = 'bitShiftLeft'
FORMAT Null;

SELECT
    used_aggregate_functions,
    used_functions,
    used_table_functions
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND like(query, '%bitShiftLeft%');