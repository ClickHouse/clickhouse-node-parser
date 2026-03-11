SELECT lo.c4
FROM
    t1 AS l
INNER JOIN t2 AS lo
    ON toInt64OrNull(l.c3) = lo.c4
FORMAT NULL;