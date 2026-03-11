SELECT *
FROM
    a1 AS a
LEFT JOIN a2 AS b
    ON a.a = b.a
ORDER BY b ASC
SETTINGS join_default_strictness = 'ANY';

SELECT
    a1.*,
    a2.*
FROM
    a1
LEFT JOIN a2
    USING (a)
ORDER BY b ASC;