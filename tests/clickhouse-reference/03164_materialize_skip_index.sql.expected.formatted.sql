SELECT count()
FROM t_skip_index_insert
WHERE a >= 110
    AND a < 130
    AND b = 2;

SELECT
    count(),
    sum(ProfileEvents['MergeTreeDataWriterSkipIndicesCalculationMicroseconds'])
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'INSERT INTO t_skip_index_insert SELECT%')
    AND type = 'QueryFinish';