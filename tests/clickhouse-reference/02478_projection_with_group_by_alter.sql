SELECT c FROM testing ORDER BY d;
SELECT c FROM testing ORDER BY e, d;
SELECT * FROM system.mutations WHERE database = currentDatabase() AND table = 'testing' AND not is_done;
