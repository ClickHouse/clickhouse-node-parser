SELECT 1
FROM
    t0
FULL JOIN (
        SELECT 0 AS c0
    ) AS tx
    ON t0.c0 = tx.c0
PASTE JOIN (
        SELECT
            0 AS c0,
            1 AS c1
    ) AS ty
ORDER BY
    ty.c0 ASC,
    ty.c1 ASC;

SELECT *
FROM
    t0
FULL JOIN (
        SELECT 0 AS c0
    ) AS tx
    ON t0.c0 = tx.c0
PASTE JOIN (
        SELECT
            0 AS c0,
            1 AS c1
    ) AS ty
ORDER BY
    ty.c0 ASC,
    ty.c1 ASC;

SELECT *
FROM
    t0
FULL JOIN (
        SELECT 0 AS c0
    ) AS tx
    ON t0.c0 = tx.c0
PASTE JOIN (
        SELECT
            0 AS c0,
            1 AS c1
    ) AS ty
ORDER BY
    ty.c0 ASC,
    ty.c1 ASC
SETTINGS join_use_nulls = 1;

SELECT
    count(),
    sum(t0_c0),
    sum(tx_c0),
    sum(ty_c0),
    sum(ty_c1)
FROM (
        SELECT
            t0.c0 AS t0_c0,
            tx.c0 AS tx_c0,
            ty.c0 AS ty_c0,
            ty.c1 AS ty_c1
        FROM
            t0
        FULL JOIN (
                SELECT number::UInt8 AS c0
                FROM numbers(5)
            ) AS tx
            ON t0.c0 = tx.c0
        PASTE JOIN (
                SELECT
                    number::UInt8 AS c0,
                    ((number + 1))::UInt8 AS c1
                FROM numbers(20)
            ) AS ty
        ORDER BY
            ty.c0 ASC,
            ty.c1 ASC
    );

SELECT
    count(),
    sum(t0_c0),
    sum(tx_c0),
    sum(ty_c0),
    sum(ty_c1)
FROM (
        SELECT
            t0.c0 AS t0_c0,
            tx.c0 AS tx_c0,
            ty.c0 AS ty_c0,
            ty.c1 AS ty_c1
        FROM
            t0
        FULL JOIN (
                SELECT number::UInt8 AS c0
                FROM numbers(5)
            ) AS tx
            ON t0.c0 = tx.c0
        PASTE JOIN (
                SELECT
                    number::UInt8 AS c0,
                    ((number + 1))::UInt8 AS c1
                FROM numbers(20)
            ) AS ty
        ORDER BY
            ty.c0 ASC,
            ty.c1 ASC
    )
SETTINGS query_plan_join_swap_table = 'false';