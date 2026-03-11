SELECT 1
FROM
    (
        SELECT
            1 AS x,
            1 AS y
    ) AS a
INNER JOIN (
        SELECT 1 AS y
    ) AS b
    USING (y)
WHERE round(*) = b.y;