-- Tables should be swapped; the new right table is below the threshold - use HashJoin
SELECT trimBoth(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            lhs AS t0
        INNER JOIN rhs AS t1
            ON t0.a = t1.a
        SETTINGS query_plan_join_swap_table = 'auto'
    )
WHERE ilike(`explain`, '%Algorithm%');

-- Tables were not swapped; the right table is above the threshold - use ConcurrentHashJoin
SELECT trimBoth(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            lhs AS t0
        INNER JOIN rhs AS t1
            ON t0.a = t1.a
        SETTINGS query_plan_join_swap_table = false
    )
WHERE ilike(`explain`, '%Algorithm%');

-- Check estimations obtained from the cache
-- Tables should be swapped; the new right table is below the threshold - use HashJoin
SELECT trimBoth(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            lhs AS t0
        INNER JOIN rhs AS t1
            ON t0.a = t1.a
        SETTINGS query_plan_join_swap_table = true
    )
WHERE ilike(`explain`, '%Algorithm%');

-- Check estimations obtained from the cache
-- Right table is big, regardless of cardinality of join key, we should use ConcurrentHashJoin
SELECT *
FROM
    lhs AS t0
INNER JOIN (
        SELECT a % 10000 AS a
        FROM rhs
    ) AS t1
    ON t0.a = t1.a
SETTINGS query_plan_join_swap_table = false
FORMAT Null;

SELECT trimBoth(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            lhs AS t0
        INNER JOIN (
                SELECT a % 10000 AS a
                FROM rhs
            ) AS t1
            ON t0.a = t1.a
        SETTINGS query_plan_join_swap_table = false
    )
WHERE ilike(`explain`, '%Algorithm%');

-- Right table is big, but only a small fraction of rows reaches the join - use HashJoin
SELECT *
FROM
    lhs AS t0
INNER JOIN rhs AS t1
    ON t0.a = t1.a
WHERE t1.a < 10000
SETTINGS query_plan_join_swap_table = false
FORMAT Null;

SELECT trimBoth(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM
            lhs AS t0
        INNER JOIN rhs AS t1
            ON t0.a = t1.a
        WHERE t1.a < 10000
        SETTINGS query_plan_join_swap_table = false
    )
WHERE ilike(`explain`, '%Algorithm%');