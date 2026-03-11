SELECT 2;

SELECT count()
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND like(query, 'select /* test=01531, enable_global_with_statement=0 */ 2%')
    AND current_database = currentDatabase();