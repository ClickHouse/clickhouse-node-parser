SELECT 1
LIMIT 0;

SELECT *
FROM `system`.query_log
PREWHERE ProfileEvents['Query'] > 0
    AND current_database = currentDatabase()
LIMIT 0;