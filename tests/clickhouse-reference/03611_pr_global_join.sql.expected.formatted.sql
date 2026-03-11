SELECT *
FROM
    t2
INNER JOIN t2 AS tx
    ON true
RIGHT JOIN t1
    ON true;

SELECT '---';

SELECT *
FROM
    t2
INNER JOIN t2 AS tx
    ON true
RIGHT JOIN t1
    ON true;

SELECT *
FROM
    t2
RIGHT JOIN t1
    ON true;