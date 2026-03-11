SELECT 1
FROM
    t0
RIGHT JOIN (
        SELECT c0
        FROM t0 FINAL
    ) AS tx
    ON true
GROUP BY c0;