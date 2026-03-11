SELECT total_bytes FROM system.tables WHERE name = 'memory' and database = currentDatabase(); -- 17408 in total
SELECT total_rows FROM system.tables WHERE name = 'memory' and database = currentDatabase(); -- 1100 in total
