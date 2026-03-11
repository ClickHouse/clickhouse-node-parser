SELECT *
FROM (
        SELECT 1
        FROM
            remote('localhost:9000', currentDatabase(), 't0') AS t0
        INNER JOIN t1
            ON t0.c0 = t1.c0
        RIGHT JOIN t2
            ON t2.c0 = t1.c0
    )
FORMAT Null;

SELECT *
FROM (
        SELECT 1
        FROM
            remote('localhost:9000', currentDatabase(), 't0') AS t0
        INNER JOIN t1
            ON true
        RIGHT JOIN t2
            ON true
    )
FORMAT Null;