SELECT
    t1.*,
    t2.*
FROM
    (
        SELECT 1 AS k
    ) AS t1
INNER JOIN (
        SELECT -1 AS k
    ) AS t2
    ON t1.k = t2.k;