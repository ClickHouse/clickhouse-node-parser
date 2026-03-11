SELECT *
FROM t1_all AS t1
WHERE t1.a IN (
        SELECT t2.a
        FROM t2_all AS t2
    );

SELECT t1.*
FROM
    t1_all AS t1
INNER JOIN t2_all AS t2
    ON t1.a = t2.a
ORDER BY t1.a ASC;