-- add_minmax_index_for_numeric_columns=0: Different plan
SET serialize_query_plan = 0;

SET enable_analyzer = 1;

SET enable_parallel_replicas = 0;

SET prefer_localhost_replica = 1;

CREATE TABLE tab0
(
    x UInt32,
    y UInt32
)
ENGINE = MergeTree
ORDER BY x
SETTINGS index_granularity = 8192, min_bytes_for_wide_part = 1e9, index_granularity_bytes = 10e6, add_minmax_index_for_numeric_columns = 0;

-- { echo }
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

-- SKIP: current_database = currentDatabase()
SELECT normalizeQuery(replace(query, currentDatabase(), 'default'))
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND like(log_comment, concat('%', currentDatabase(), '%'))
    AND NOT is_initial_query
    AND type != 'QueryStart'
    AND query_kind = 'Select'
ORDER BY event_time_microseconds ASC;