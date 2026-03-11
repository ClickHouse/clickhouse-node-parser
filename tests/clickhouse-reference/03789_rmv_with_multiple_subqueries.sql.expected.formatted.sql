SELECT uniqExact(query)
FROM `system`.query_log
WHERE has(databases, currentDatabase())
    AND like(query, '%INSERT%SELECT%')
    AND type = 'QueryFinish';