SELECT *
FROM
    `system`.one
INNER JOIN (
        SELECT number AS k
        FROM `system`.numbers
    ) AS js2
    ON dummy = k;