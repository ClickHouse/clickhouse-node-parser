SELECT t1.*
FROM
    t0
FULL JOIN t1
    USING (y)
INNER JOIN t2
    USING (y)
PREWHERE toLowCardinality(1);