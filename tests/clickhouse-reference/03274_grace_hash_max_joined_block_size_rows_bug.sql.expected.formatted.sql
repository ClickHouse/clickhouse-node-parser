SELECT
    sum(x),
    count()
FROM
    t0
INNER JOIN t1
    USING (x);