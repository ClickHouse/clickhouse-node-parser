SELECT *
FROM
    (
        SELECT 1 AS a
    ) AS t1
INNER JOIN (
        SELECT 1 AS a
    ) AS t2
    ON t1.a = t2.a;