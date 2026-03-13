SELECT *
FROM
    (
        SELECT
            1 AS A,
            2 AS B
    ) AS X
LEFT JOIN (
        SELECT
            3 AS A,
            2 AS B
    ) AS Y
    USING (B);

SELECT *
FROM
    (
        SELECT
            1 AS A,
            2 AS B
    ) AS X
LEFT JOIN (
        SELECT
            3 AS A,
            2 AS B
    )
    USING (B); -- { serverError ALIAS_REQUIRED }

SELECT *
FROM
    (
        SELECT
            1 AS A,
            2 AS B
    )
LEFT JOIN (
        SELECT
            3 AS A,
            2 AS B
    ) AS Y
    USING (B); -- { serverError ALIAS_REQUIRED }