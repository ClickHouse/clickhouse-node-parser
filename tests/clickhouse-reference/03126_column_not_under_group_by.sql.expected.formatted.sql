SELECT
    v.x,
    r.a,
    sum(c)
FROM
    (
        SELECT
            1 AS x,
            2 AS c
    ) AS v
LEFT JOIN (
        SELECT
            1 AS x,
            2 AS a
    ) AS r
    ON v.x = r.x
GROUP BY v.x;