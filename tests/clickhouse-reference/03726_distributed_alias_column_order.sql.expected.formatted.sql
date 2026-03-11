SELECT
    e,
    f
FROM remote('127.0.0.{1,2}', currentDatabase(), test_local)
ORDER BY a ASC;