SELECT age
FROM remote('127.0.0.{2,3}', currentDatabase(), users)
GROUP BY age
LIMIT 20
FORMAT JSON
SETTINGS output_format_write_statistics = 0;

SELECT service_name
FROM test_rows_count_bug_local
WHERE id GLOBAL IN (
        SELECT id
        FROM remote('127.0.0.{2,3}', currentDatabase(), test_rows_count_bug_local)
    )
GROUP BY service_name
ORDER BY service_name ASC
LIMIT 20
FORMAT JSON
SETTINGS output_format_write_statistics = 0;