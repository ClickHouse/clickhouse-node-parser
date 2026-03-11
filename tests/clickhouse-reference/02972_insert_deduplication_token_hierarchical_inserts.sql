SELECT sleep(3);
SELECT table, name, error FROM system.part_log
WHERE database = currentDatabase() and error != 389
ORDER BY table, name;
SELECT count() FROM landing;
