SELECT
    t1.B,
    t2.B
FROM
    table1 AS t1
INNER JOIN table2 AS t2
    ON t1.B = t2.B
ORDER BY
    t1.B ASC,
    t2.B ASC;