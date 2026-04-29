SELECT number
FROM numbers(1);

WITH 1 AS n

SELECT number * n
FROM numbers(1);

SELECT number
FROM (
        SELECT *
        FROM numbers(1)
    );

SELECT number
FROM (
        SELECT *
        FROM numbers(1)
    ) AS `select`;