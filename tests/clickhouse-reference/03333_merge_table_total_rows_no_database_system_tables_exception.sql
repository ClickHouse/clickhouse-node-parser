SELECT * FROM merge;
SELECT table, total_rows, total_bytes FROM system.tables WHERE database = currentDatabase() AND table = 'merge';
