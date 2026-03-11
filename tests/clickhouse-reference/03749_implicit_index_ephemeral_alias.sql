SELECT table, name FROM system.data_skipping_indices WHERE database = currentDatabase() ORDER BY table, name;
