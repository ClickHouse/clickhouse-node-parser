SELECT sum(b)
FROM t_multi_prewhere
PREWHERE a < 5000;

SELECT ProfileEvents['FileOpen']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND ilike(query, '%select sum(b) from t_multi_prewhere prewhere a < 5000%');