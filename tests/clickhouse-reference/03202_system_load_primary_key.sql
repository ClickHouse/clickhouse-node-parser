SELECT '-- Insert data into columns';
SELECT (SELECT count() FROM test), (SELECT count() FROM test2);
SELECT
    table,
    round(primary_key_bytes_in_memory, -6),
    round(primary_key_bytes_in_memory_allocated, -6)
FROM system.parts
WHERE
    database = currentDatabase()
    AND table IN ('test', 'test2')
ORDER BY table;
