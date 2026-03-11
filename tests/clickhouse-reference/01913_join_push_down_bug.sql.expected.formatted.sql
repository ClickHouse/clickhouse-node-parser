SELECT
    id,
    flag
FROM
    test AS t1
INNER JOIN (
        SELECT DISTINCT id
        FROM test
    ) AS t2
    ON t1.id = t2.id
WHERE flag = 0
    AND t = 1
    AND id NOT IN (
        SELECT 1
        WHERE 0
    )
ORDER BY id ASC;