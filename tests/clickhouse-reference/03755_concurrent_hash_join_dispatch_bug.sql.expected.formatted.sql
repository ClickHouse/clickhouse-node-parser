SELECT 1
FROM
    remote('localhost', currentDatabase(), t0) AS t0
INNER JOIN t0 AS t1
    ON false
RIGHT JOIN t0 AS t2
    ON false;