SELECT `explain`
FROM (
        EXPLAIN header = 1, keep_logical_steps = 1
        SELECT 1
        FROM
            t0
        INNER JOIN (
                SELECT 1 AS a
            ) AS tx
            ON t0.c0 = tx.a
    );

SELECT 1
FROM
    t0
INNER JOIN (
        SELECT 1 AS a
    ) AS tx
    ON t0.c0 = tx.a;

SELECT `explain`
FROM (
        EXPLAIN header = 1, keep_logical_steps = 1
        SELECT 1
        FROM
            t0
        INNER JOIN (
                SELECT
                    1 AS a,
                    2 AS b
            ) AS tx
            ON t0.c0 = tx.a
            AND t0.c1 = tx.b
    );

SELECT 1
FROM
    t0
INNER JOIN (
        SELECT
            1 AS a,
            2 AS b
    ) AS tx
    ON t0.c0 = tx.a
    AND t0.c1 = tx.b;