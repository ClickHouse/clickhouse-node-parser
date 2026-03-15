SET log_queries = 1;

CREATE TABLE xp
(
    A Date,
    B Int64,
    S String
)
ENGINE = MergeTree
ORDER BY B
PARTITION BY toYYYYMM(A);

CREATE TABLE xp_d AS xp
ENGINE = Distributed(test_shard_localhost, currentDatabase(), xp);

SELECT count(7 = (
        SELECT number
        FROM numbers(0)
        ORDER BY number ASC
        LIMIT 7
    ))
FROM xp_d
PREWHERE toYYYYMM(A) GLOBAL IN (
        SELECT
            NULL = (
                SELECT number
                FROM numbers(1)
                ORDER BY number DESC
                LIMIT 1
            ),
            toYYYYMM(min(A))
        FROM xp_d
    )
WHERE B > NULL
FORMAT Null;

SELECT count()
FROM xp_d
WHERE A GLOBAL IN (
        SELECT NULL
    );

CREATE TABLE trace_log
(
    event_date Date,
    event_time DateTime,
    event_time_microseconds DateTime64(6),
    timestamp_ns UInt64,
    revision UInt32,
    trace_type Enum8('Real' = 0, 'CPU' = 1, 'Memory' = 2, 'MemorySample' = 3),
    thread_id UInt64,
    query_id String,
    trace Array(UInt64),
    size Int64
)
ENGINE = MergeTree
ORDER BY (event_date, event_time)
PARTITION BY toYYYYMM(event_date)
SETTINGS index_granularity = 8192;

SET allow_introspection_functions = 1;

SET joined_subquery_requires_alias = 0, enable_analyzer = 0; -- the query is invalid with a new analyzer

SELECT
    number,
    number / 2 AS n,
    j1,
    j2
FROM
    remote('127.0.0.{2,3}', `system`.numbers)
LEFT JOIN (
        SELECT
            number / 3 AS n,
            number AS j1,
            'Hello' AS j2
        FROM `system`.numbers
        LIMIT 1048577
    )
    USING (n)
LIMIT 10
FORMAT Null;