SELECT *
FROM
    (
        SELECT *
        FROM `system`.one
    ) AS a
INNER JOIN (
        SELECT *
        FROM `system`.one
    ) AS b
    USING (dummy)
INNER JOIN (
        SELECT *
        FROM `system`.one
    ) AS c
    USING (dummy);