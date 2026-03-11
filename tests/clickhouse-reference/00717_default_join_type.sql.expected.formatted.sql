SELECT
    a,
    b
FROM
    default_join1
INNER JOIN (
        SELECT
            a,
            b
        FROM default_join2
    ) AS js2
    USING (a)
ORDER BY b ASC
SETTINGS join_default_strictness = 'ANY';