SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.id = t2.id
    AND t1.attr != 0;