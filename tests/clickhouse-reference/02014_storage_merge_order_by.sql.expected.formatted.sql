SELECT sum(e)
FROM (
        SELECT *
        FROM merged
        ORDER BY t ASC
        LIMIT 10
    )
SETTINGS optimize_read_in_order = 0;

SELECT sum(e)
FROM (
        SELECT *
        FROM merged
        ORDER BY t ASC
        LIMIT 10
    )
SETTINGS max_threads = 1;

SELECT sum(e)
FROM (
        SELECT *
        FROM merged
        ORDER BY t ASC
        LIMIT 10
    )
SETTINGS max_threads = 3;

SELECT sum(e)
FROM (
        SELECT *
        FROM merged
        ORDER BY t ASC
        LIMIT 10
    )
SETTINGS max_threads = 10;

SELECT sum(e)
FROM (
        SELECT *
        FROM merged
        ORDER BY t ASC
        LIMIT 10
    )
SETTINGS max_threads = 50;