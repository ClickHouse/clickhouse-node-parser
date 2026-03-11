SELECT 1
FROM
    t0
INNER JOIN t0 AS tx
    ON t0.c0 <=> tx.c0;