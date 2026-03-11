SELECT total_bytes
FROM `system`.tables
WHERE name = 'test_buffer_table'
    AND database = currentDatabase();