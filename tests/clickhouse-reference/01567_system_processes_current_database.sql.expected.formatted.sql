SELECT count(*)
FROM `system`.processes
WHERE current_database = currentDatabase();