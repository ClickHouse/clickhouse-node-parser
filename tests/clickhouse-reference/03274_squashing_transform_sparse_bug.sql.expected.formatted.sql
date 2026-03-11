SELECT sum(ignore(*))
FROM
    t0 AS a
FULL JOIN t1 AS b
    ON a.x = b.x
FORMAT Null;