SELECT *
FROM (
        SELECT
            t1.k AS k,
            t1.x AS x1,
            t2.x AS x2,
            t3.x AS x3
        FROM
            adaptive_spill_03277_1 AS t1
        LEFT JOIN adaptive_spill_03277_2 AS t2
            ON t1.k = t2.k
        LEFT JOIN adaptive_spill_03277_3 AS t3
            ON t1.k = t3.k
    )
ORDER BY
    k ASC,
    x1 ASC,
    x2 ASC,
    x3 ASC
LIMIT 100;