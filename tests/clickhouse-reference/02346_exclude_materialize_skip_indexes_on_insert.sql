SELECT * FROM explain_indexes;
SELECT count()
FROM system.query_log
WHERE current_database = currentDatabase()
    AND query LIKE 'INSERT INTO tab SELECT%'
    AND type = 'QueryFinish';
