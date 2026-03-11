SELECT *
FROM
    t0
FULL JOIN t0 AS ty
    ON ty.s = t.a
WHERE t.a.size = 1
ORDER BY `ALL` ASC;

SELECT
    s.a,
    s.a.size
FROM t0
ORDER BY `ALL` ASC;