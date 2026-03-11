SELECT uniqExact(query) FROM system.query_log WHERE has(databases, currentDatabase()) AND query LIKE '%INSERT%SELECT%' AND type = 'QueryFinish';
