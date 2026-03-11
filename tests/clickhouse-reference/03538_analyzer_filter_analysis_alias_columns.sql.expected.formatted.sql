SELECT c0
FROM
    remote('localhost', currentDatabase(), 't0') AS tx
INNER JOIN t0__fuzz_42
    USING (c1);

SELECT 1
FROM
    (
        SELECT 1 AS c0
        FROM
            t0
        CROSS JOIN remote('localhost:9000', currentDatabase(), 't0') AS ty
    ) AS tx
INNER JOIN t0
    ON tx.c0 = t0.c0;