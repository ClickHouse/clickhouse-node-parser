SELECT *
FROM
    n1
CROSS JOIN n2
INNER JOIN n3
    ON n1.number = n3.number
ORDER BY
    n1.number ASC,
    n2.number ASC,
    n3.number ASC;