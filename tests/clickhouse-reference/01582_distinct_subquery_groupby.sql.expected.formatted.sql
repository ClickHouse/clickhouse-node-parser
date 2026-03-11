SELECT *
FROM t;

SELECT '---';

SELECT DISTINCT b
FROM (
        SELECT
            a,
            b
        FROM d
        GROUP BY
            a,
            b
    )
ORDER BY b ASC;