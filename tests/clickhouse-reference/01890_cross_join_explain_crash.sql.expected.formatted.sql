SET enable_analyzer = 1;

SET joined_subquery_requires_alias = 0;

SELECT *
FROM
    (
        SELECT 1
    )
CROSS JOIN (
        SELECT 1
    )
CROSS JOIN (
        SELECT 1
    );

SELECT *
FROM
    (
        SELECT 2
    )
CROSS JOIN (
        SELECT 1
    ) AS a
CROSS JOIN (
        SELECT 1
    ) AS b;

SELECT *
FROM
    (
        SELECT 1
    ) AS a
CROSS JOIN (
        SELECT 2
    )
CROSS JOIN (
        SELECT 1
    ) AS b;

SELECT *
FROM
    (
        SELECT 1
    ) AS a
CROSS JOIN (
        SELECT 1
    ) AS b
CROSS JOIN (
        SELECT 2
    );