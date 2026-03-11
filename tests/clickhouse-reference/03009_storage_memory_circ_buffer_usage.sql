SELECT total_bytes FROM system.tables WHERE name = 'memory' and database = currentDatabase();
SELECT total_rows FROM system.tables WHERE name = 'memory' and database = currentDatabase();
