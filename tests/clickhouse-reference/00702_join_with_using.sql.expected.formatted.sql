SELECT *
FROM
    using1
LEFT JOIN (
        SELECT *
        FROM using2
    ) AS js2
    USING (a, b)
ORDER BY a ASC;

SELECT *
FROM
    persons
INNER JOIN children
    USING (id)
ORDER BY
    id ASC,
    name ASC,
    childName ASC;

SELECT *
FROM
    persons
INNER JOIN (
        SELECT *
        FROM children
    ) AS j
    USING (id)
ORDER BY
    id ASC,
    name ASC,
    childName ASC;

SELECT *
FROM
    (
        SELECT *
        FROM persons
    ) AS s
INNER JOIN (
        SELECT *
        FROM children
    ) AS j
    USING (id)
ORDER BY
    id ASC,
    name ASC,
    childName ASC;

SELECT *
FROM
    persons
INNER JOIN (
        SELECT *
        FROM children
    )
    USING (id)
ORDER BY
    id ASC,
    name ASC,
    childName ASC;

SELECT *
FROM
    (
        SELECT *
        FROM persons
    )
INNER JOIN (
        SELECT *
        FROM children
    )
    USING (id)
ORDER BY
    id ASC,
    name ASC,
    childName ASC;

SELECT *
FROM
    (
        SELECT *
        FROM persons
    ) AS s
INNER JOIN (
        SELECT *
        FROM children
    )
    USING (id)
ORDER BY
    id ASC,
    name ASC,
    childName ASC;