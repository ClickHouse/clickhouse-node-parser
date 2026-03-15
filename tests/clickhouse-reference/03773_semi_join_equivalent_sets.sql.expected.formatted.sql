SET enable_analyzer = 1;

SET enable_parallel_replicas = 0;

SET query_plan_join_swap_table = 0;

SET enable_join_runtime_filters = 0;

CREATE TABLE users
(
    uid UInt64,
    name String,
    age Int16
)
ENGINE = MergeTree
ORDER BY uid;

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            users
        LEFT JOIN (
                SELECT number
                FROM numbers(10)
            ) AS t2
            ON users.uid = t2.number
        WHERE t2.number = 0
    )
WHERE ilike(`explain`, '%Type:%')
    OR ilike(`explain`, '%Strictness%')
    OR ilike(`explain`, '%filter column%');

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            users
        LEFT JOIN (
                SELECT number
                FROM numbers(10)
            ) AS t2
            ON users.uid = t2.number
        WHERE t2.number = 1
    )
WHERE ilike(`explain`, '%Type:%')
    OR ilike(`explain`, '%Strictness%')
    OR ilike(`explain`, '%filter column%');

SELECT '--';

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            users
        LEFT JOIN (
                SELECT number
                FROM numbers(10)
            ) AS t2
            ON users.uid = t2.number
        WHERE users.uid = 1
    )
WHERE ilike(`explain`, '%Type:%')
    OR ilike(`explain`, '%Strictness%')
    OR ilike(`explain`, '%filter column%');

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            users
        RIGHT JOIN (
                SELECT number
                FROM numbers(10)
            ) AS t2
            ON users.uid = t2.number
        WHERE users.uid = 1
    )
WHERE ilike(`explain`, '%Type:%')
    OR ilike(`explain`, '%Strictness%')
    OR ilike(`explain`, '%filter column%');

SELECT `explain`
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            users
        RIGHT JOIN (
                SELECT number
                FROM numbers(10)
            ) AS t2
            ON users.uid = t2.number
        WHERE t2.number = 1
    )
WHERE ilike(`explain`, '%Type:%')
    OR ilike(`explain`, '%Strictness%')
    OR ilike(`explain`, '%filter column%');