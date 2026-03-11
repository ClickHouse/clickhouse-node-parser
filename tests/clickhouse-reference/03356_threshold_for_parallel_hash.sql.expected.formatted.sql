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