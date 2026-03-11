SELECT
    q1.a,
    countIf(q1.a, q2.b > 1)
FROM
    (
        SELECT
            1 AS a,
            2 AS b
    ) AS q1
INNER JOIN (
        SELECT
            1 AS a,
            22 AS c
    ) AS q2
    USING (a)
GROUP BY q1.a;

SELECT
    q1.a,
    countIf(q1.a, q2.b > 1)
FROM
    (
        SELECT
            1 AS a,
            2 AS b
    ) AS q1
INNER JOIN (
        SELECT
            1 AS a,
            22 AS c
    ) AS q2
    USING (a)
LEFT JOIN (
        SELECT 1 AS a
    ) AS q3
    ON q1.a = q3.a
GROUP BY q1.a;