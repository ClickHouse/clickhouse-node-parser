SELECT a
FROM
    (
        SELECT (1, 2) AS a
    ) AS js1
INNER JOIN (
        SELECT (1, 2) AS a
    ) AS js2
    USING (a);