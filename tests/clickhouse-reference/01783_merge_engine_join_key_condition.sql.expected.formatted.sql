SELECT *
FROM foo_merge
WHERE Val = 3
    AND Id = 3;

SELECT
    count(),
    X
FROM
    foo_merge
INNER JOIN t2
    USING (Val)
WHERE Val = 3
    AND Id = 3
    AND t2.X == 4
GROUP BY X;

SELECT
    count(),
    X
FROM
    foo_merge
INNER JOIN t2
    USING (Val)
WHERE Val = 3
    AND ((Id = 3
    AND t2.X == 4))
GROUP BY X;

SELECT
    count(),
    X
FROM
    foo_merge
INNER JOIN t2
    USING (Val)
WHERE Val = 3
    AND Id = 3
GROUP BY X;

SELECT
    count(),
    X
FROM
    (
        SELECT *
        FROM foo_merge
    ) AS f
INNER JOIN t2
    USING (Val)
WHERE Val = 3
    AND Id = 3
GROUP BY X;