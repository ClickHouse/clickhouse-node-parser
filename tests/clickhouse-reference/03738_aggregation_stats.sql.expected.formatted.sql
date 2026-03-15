CREATE TABLE t1
(
    n UInt64
)
ENGINE = MergeTree()
SETTINGS auto_statistics_types = 'uniq';

CREATE TABLE t2
(
    key1 UInt64,
    key2 UInt64,
    key3 UInt64,
    value UInt64
)
ENGINE = MergeTree()
SETTINGS auto_statistics_types = 'uniq';

SET enable_analyzer = 1;

SET query_plan_join_swap_table = 0;

SET use_statistics = 1;

SET enable_parallel_replicas = 0;

SET enable_join_runtime_filters = 0;

SELECT `explain`
FROM (
        EXPLAIN keep_logical_steps = 1, actions = 1
        SELECT *
        FROM
            t1
        INNER JOIN (
                SELECT
                    key1 AS key,
                    sum(value)
                FROM t2
                GROUP BY key
            ) AS tt2
            ON t1.n = tt2.key
    )
WHERE like(`explain`, '% Join%')
    OR like(`explain`, '% ResultRows:%')
    OR like(`explain`, '% ReadFromMergeTree%')
    OR like(`explain`, '% Aggregating%');

SELECT `explain`
FROM (
        EXPLAIN keep_logical_steps = 1, actions = 1
        SELECT *
        FROM
            t1
        INNER JOIN (
                SELECT
                    key1,
                    key2,
                    sum(value)
                FROM t2
                GROUP BY
                    key1,
                    key2
            ) AS tt2
            ON t1.n = tt2.key1
    )
WHERE like(`explain`, '% Join%')
    OR like(`explain`, '% ResultRows:%')
    OR like(`explain`, '% ReadFromMergeTree%')
    OR like(`explain`, '% Aggregating%');

SELECT `explain`
FROM (
        EXPLAIN keep_logical_steps = 1, actions = 1
        SELECT *
        FROM
            t1
        INNER JOIN (
                SELECT
                    key1,
                    key3,
                    sum(value)
                FROM t2
                GROUP BY
                    key1,
                    key3
            ) AS tt2
            ON t1.n = tt2.key1
    )
WHERE like(`explain`, '% Join%')
    OR like(`explain`, '% ResultRows:%')
    OR like(`explain`, '% ReadFromMergeTree%')
    OR like(`explain`, '% Aggregating%');

SELECT `explain`
FROM (
        EXPLAIN keep_logical_steps = 1, actions = 1
        SELECT *
        FROM
            t1
        INNER JOIN (
                SELECT
                    7 AS key,
                    sum(value)
                FROM t2
            ) AS tt2
            ON t1.n = tt2.key
    )
WHERE like(`explain`, '% Join%')
    OR like(`explain`, '% ResultRows:%')
    OR like(`explain`, '% ReadFromMergeTree%')
    OR like(`explain`, '% Aggregating%');