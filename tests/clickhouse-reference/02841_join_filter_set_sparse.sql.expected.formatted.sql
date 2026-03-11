SELECT countIf(ignore(*) == 0)
FROM
    t1
INNER JOIN t2
    ON t1.s = t2.s;