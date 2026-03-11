SELECT *
FROM
    tab AS l
CROSS JOIN tab AS r
WHERE l.x < r.x
    AND r.x < 2;

SELECT
    sum(x),
    sum(r.x)
FROM (
        SELECT *
        FROM
            tab AS l
        CROSS JOIN tab AS r
        WHERE r.x < 2
            AND l.x < 3
    );