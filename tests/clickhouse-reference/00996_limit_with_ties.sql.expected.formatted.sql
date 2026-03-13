SELECT a
FROM `ties`
ORDER BY a ASC
LIMIT 1 WITH TIES;

SELECT a
FROM `ties`
ORDER BY a ASC
LIMIT 3 WITH TIES;

SELECT a
FROM `ties`
ORDER BY a ASC
LIMIT 5 WITH TIES;

SELECT a
FROM `ties`
ORDER BY a ASC
LIMIT 1, 1 WITH TIES;

SELECT a
FROM `ties`
ORDER BY a ASC
LIMIT 1, 2 WITH TIES;

SELECT a
FROM `ties`
ORDER BY a ASC
LIMIT 2 WITH TIES;

SELECT a
FROM `ties`
ORDER BY a ASC
LIMIT 2, 3 WITH TIES;

SELECT a
FROM `ties`
ORDER BY a ASC
LIMIT 4 WITH TIES;

SELECT a
FROM `ties`
ORDER BY a ASC
LIMIT 3, 2 WITH TIES;

SELECT count()
FROM (
        SELECT number > 100
        FROM numbers(2000)
        ORDER BY number > 100 ASC
        LIMIT 1, 7 WITH TIES
    ); --TODO replace "number > 100" with "number > 100 as n"

SELECT count()
FROM (
        SELECT
            number,
            number < 100
        FROM numbers(2000)
        ORDER BY number < 100 DESC
        LIMIT 10 WITH TIES
    );

SELECT count()
FROM (
        SELECT
            number < 100,
            number
        FROM numbers(2000)
        ORDER BY number < 100 DESC
        LIMIT 10 WITH TIES
    );

SELECT count()
FROM (
        WITH data AS (
            SELECT *
            FROM numbers(0, 10)
            UNION ALL
            SELECT *
            FROM numbers(10, 10)
        )

        SELECT
            number DIV 10 AS ten,
            number
        FROM data
        ORDER BY ten ASC
        LIMIT 8, 6 WITH TIES
    );

SELECT count()
FROM (
        WITH data AS (
            SELECT *
            FROM numbers(0, 10)
            UNION ALL
            SELECT *
            FROM numbers(10, 10)
        )

        SELECT
            number DIV 11 AS eleven,
            number
        FROM data
        ORDER BY eleven ASC
        LIMIT 8, 6 WITH TIES
    );