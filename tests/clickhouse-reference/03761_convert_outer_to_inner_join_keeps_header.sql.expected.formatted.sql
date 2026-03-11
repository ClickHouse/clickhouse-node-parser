SELECT 1
FROM
    t0 AS l
INNER JOIN t0 AS m
    ON true
RIGHT JOIN t0 AS r
    ON (l.c0 + l.c1) = r.c1
WHERE isNull(1);