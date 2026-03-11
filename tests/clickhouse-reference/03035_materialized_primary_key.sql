SELECT name, primary_key
FROM system.tables
WHERE database = currentDatabase() AND name LIKE 'test%';
