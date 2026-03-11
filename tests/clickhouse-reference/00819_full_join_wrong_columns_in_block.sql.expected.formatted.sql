SELECT *
FROM
    (
        SELECT
            1 AS a,
            'x' AS b
    )
INNER JOIN (
        SELECT
            1 AS a,
            'y' AS b
    )
    USING (a);

SELECT *
FROM
    (
        SELECT
            1 AS a,
            'x' AS b
    )
LEFT JOIN (
        SELECT
            1 AS a,
            'y' AS b
    )
    USING (a);

SELECT *
FROM
    (
        SELECT
            1 AS a,
            'x' AS b
    )
FULL JOIN (
        SELECT
            1 AS a,
            'y' AS b
    )
    USING (a);

SELECT *
FROM
    (
        SELECT
            1 AS a,
            'x' AS b
    )
RIGHT JOIN (
        SELECT
            1 AS a,
            'y' AS b
    )
    USING (a);

SELECT *
FROM
    (
        SELECT
            1 AS a,
            'x' AS b
    )
INNER JOIN (
        SELECT
            1 AS a,
            'y' AS b
    )
    USING (a);

SELECT *
FROM
    (
        SELECT
            1 AS a,
            'x' AS b
    )
LEFT JOIN (
        SELECT
            1 AS a,
            'y' AS b
    )
    USING (a);

SELECT *
FROM
    (
        SELECT
            1 AS a,
            'x' AS b
    )
FULL JOIN (
        SELECT
            1 AS a,
            'y' AS b
    )
    USING (a);

SELECT *
FROM
    (
        SELECT
            1 AS a,
            'x' AS b
    )
RIGHT JOIN (
        SELECT
            1 AS a,
            'y' AS b
    )
    USING (a);