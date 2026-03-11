SELECT d0.id
FROM
    t1_distr AS d0
INNER JOIN (
        SELECT d1.id
        FROM
            t1_distr AS d1
        INNER JOIN t2_distr AS d2
            ON d1.id = d2.id
        WHERE d1.id > 0
        ORDER BY d1.id ASC
    ) AS s0
    USING (id);