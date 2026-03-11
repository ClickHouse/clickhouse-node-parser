SELECT a
FROM (
        SELECT
            a,
            b,
            count(*) AS v
        FROM t_dist
        GROUP BY ALL
    ) AS Z;