SELECT blockSize() AS bs
FROM
    (
        SELECT 1 AS s
    ) AS js1
RIGHT JOIN (
        SELECT arrayJoin([2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3]) AS s
    ) AS js2
    USING (s)
GROUP BY bs
ORDER BY bs ASC;