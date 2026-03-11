SELECT *
FROM
    t1
RIGHT JOIN t0 AS t2
    ON NOT t0.x = t2.x
WHERE false;

SELECT *
FROM
    t1
RIGHT JOIN t0 AS t2
    ON NOT t0.x = t2.x
WHERE identity(false);