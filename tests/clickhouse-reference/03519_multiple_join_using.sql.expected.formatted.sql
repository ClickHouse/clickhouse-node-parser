SELECT *
FROM
    table0
INNER JOIN table2
    USING (id)
INNER JOIN table1
    USING (id2)
ORDER BY `ALL` ASC;

SELECT *
FROM
    table0 AS t0
INNER JOIN table2
    USING (val)
INNER JOIN table1
    USING (val)
ORDER BY `ALL` ASC;