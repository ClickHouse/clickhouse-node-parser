SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.1', currentDatabase(), tab0)
    )
WHERE x IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.1', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.2', currentDatabase(), tab0)
    )
WHERE x IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.2', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
    )
WHERE x IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.{2,3}', currentDatabase(), tab0)
    )
WHERE x IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.{2,3}', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT *
FROM (
        EXPLAIN indexes = 1
        SELECT sum(y)
        FROM (
                SELECT *
                FROM remote('127.0.0.1', currentDatabase(), tab0)
            )
        WHERE x GLOBAL IN (
                SELECT number + 42
                FROM numbers(1)
            )
    );

SELECT *
FROM (
        EXPLAIN indexes = 1, distributed = 1
        SELECT sum(y)
        FROM (
                SELECT *
                FROM remote('127.0.0.2', currentDatabase(), tab0)
            )
        WHERE x GLOBAL IN (
                SELECT number + 42
                FROM numbers(1)
            )
    );

SELECT normalizeQuery(replace(query, currentDatabase(), 'default'))
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND like(log_comment, concat('%', currentDatabase(), '%'))
    AND NOT is_initial_query
    AND type != 'QueryStart'
    AND query_kind = 'Select'
ORDER BY event_time_microseconds ASC;