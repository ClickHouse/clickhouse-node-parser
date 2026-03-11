SELECT count()
FROM (
        SELECT *
        FROM remote('127.0.0.1', `system`.numbers)
        LIMIT 100
    )
SETTINGS max_rows_to_read_leaf = 1;

SELECT count()
FROM (
        SELECT *
        FROM remote('127.0.0.1', `system`.numbers)
        LIMIT 100
    )
SETTINGS max_bytes_to_read_leaf = 1;

SELECT count()
FROM (
        SELECT *
        FROM remote('127.0.0.1', `system`.numbers)
        LIMIT 100
    )
SETTINGS max_rows_to_read_leaf = 100;

SELECT count()
FROM (
        SELECT *
        FROM remote('127.0.0.1', `system`.numbers)
        LIMIT 100
    )
SETTINGS max_bytes_to_read_leaf = 1000;

SELECT count()
FROM (
        SELECT *
        FROM remote('127.0.0.2', `system`.numbers)
        LIMIT 100
    )
SETTINGS max_rows_to_read_leaf = 1;

SELECT count()
FROM (
        SELECT *
        FROM remote('127.0.0.2', `system`.numbers)
        LIMIT 100
    )
SETTINGS max_bytes_to_read_leaf = 1;

SELECT count()
FROM (
        SELECT *
        FROM remote('127.0.0.2', `system`.numbers)
        LIMIT 100
    )
SETTINGS max_rows_to_read_leaf = 100;

SELECT count()
FROM (
        SELECT *
        FROM remote('127.0.0.2', `system`.numbers)
        LIMIT 100
    )
SETTINGS max_bytes_to_read_leaf = 1000;

SELECT count()
FROM (
        SELECT *
        FROM test_distributed
    )
SETTINGS max_rows_to_read_leaf = 40000;

SELECT count()
FROM (
        SELECT *
        FROM test_distributed
    )
SETTINGS max_bytes_to_read_leaf = 40000;

SELECT count()
FROM (
        SELECT *
        FROM test_distributed
    )
SETTINGS max_rows_to_read = 60000;

SELECT count()
FROM (
        SELECT *
        FROM test_distributed
    )
SETTINGS max_rows_to_read_leaf = 60000;

SELECT count()
FROM (
        SELECT *
        FROM test_distributed
    )
SETTINGS max_bytes_to_read = 100000;

SELECT count()
FROM (
        SELECT *
        FROM test_distributed
    )
SETTINGS max_bytes_to_read_leaf = 100000;