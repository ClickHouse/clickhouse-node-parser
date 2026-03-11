SELECT table, engine FROM system.dropped_tables WHERE database = currentDatabase() LIMIT 1;
SELECT database, table, name FROM system.dropped_tables_parts WHERE database = currentDatabase() and table = '25400_dropped_tables';
