SELECT
    count(ignore(*)),
    sum(t1.a),
    sum(t1.b),
    sum(t2.a)
FROM
    (
        SELECT
            number AS a,
            number AS b
        FROM numbers(10000)
    ) AS t1
INNER JOIN (
        SELECT number + 100 AS a
        FROM numbers(10000)
    ) AS t2
    ON t1.a = t2.a
    AND t1.b > 0;