SELECT count()
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 'per_table_ttl_02265';