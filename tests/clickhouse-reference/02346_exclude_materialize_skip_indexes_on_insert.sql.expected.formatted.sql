SELECT *
FROM explain_indexes;

SELECT count()
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'INSERT INTO tab SELECT%')
    AND type = 'QueryFinish';