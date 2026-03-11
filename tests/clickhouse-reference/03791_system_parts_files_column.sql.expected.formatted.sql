SELECT files > 0
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test_parts_files'
    AND active;

SELECT toTypeName(files)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test_parts_files'
    AND active
LIMIT 1;