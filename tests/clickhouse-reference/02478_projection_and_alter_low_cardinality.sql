SELECT * FROM system.mutations WHERE database = currentDatabase() AND table = 'testing' AND not is_done;
