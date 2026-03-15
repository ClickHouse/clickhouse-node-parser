SET exact_rows_before_limit = 1;

CREATE TABLE users
(
    uid Int16,
    name String,
    age Int16
)
ENGINE = MergeTree
ORDER BY uid;

SELECT age
FROM remote('127.0.0.{2,3}', currentDatabase(), users)
GROUP BY age
LIMIT 20
FORMAT JSON
SETTINGS output_format_write_statistics = 0;

CREATE TABLE test_rows_count_bug_local
(
    id UUID DEFAULT generateUUIDv4(),
    service_name String,
    path String
)
ENGINE = MergeTree
ORDER BY tuple();

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