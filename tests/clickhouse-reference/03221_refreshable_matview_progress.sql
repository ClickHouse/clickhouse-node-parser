SELECT read_rows, total_rows, progress FROM system.view_refreshes WHERE database = currentDatabase() and view = '03221_rmv';
