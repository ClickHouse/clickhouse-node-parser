SELECT
    k,
    a,
    b
FROM
    (
        SELECT
            number AS k,
            toString(number) AS a
        FROM `system`.numbers
        LIMIT 10
    )
INNER JOIN (
        SELECT
            number AS k,
            toString(number) AS b
        FROM `system`.numbers
        LIMIT 5, 10
    )
    USING (k)
ORDER BY k ASC;

SELECT
    k,
    a,
    b
FROM
    (
        SELECT
            number AS k,
            toString(number) AS a
        FROM `system`.numbers
        LIMIT 10
    )
LEFT JOIN (
        SELECT
            number AS k,
            toString(number) AS b
        FROM `system`.numbers
        LIMIT 5, 10
    )
    USING (k)
ORDER BY k ASC;

SELECT
    k,
    a,
    b
FROM
    (
        SELECT
            number AS k,
            toString(number) AS a
        FROM `system`.numbers
        LIMIT 10
    )
RIGHT JOIN (
        SELECT
            number AS k,
            toString(number) AS b
        FROM `system`.numbers
        LIMIT 5, 10
    )
    USING (k)
ORDER BY k ASC;

SELECT
    k,
    a,
    b
FROM
    (
        SELECT
            number AS k,
            toString(number) AS a
        FROM `system`.numbers
        LIMIT 10
    )
FULL JOIN (
        SELECT
            number AS k,
            toString(number) AS b
        FROM `system`.numbers
        LIMIT 5, 10
    )
    USING (k)
ORDER BY k ASC;