SELECT s
FROM
    t1 AS lhs
LEFT JOIN (
        SELECT *
        FROM t2
        WHERE id2 = 2
    ) AS rhs
    ON lhs.id = rhs.id2;