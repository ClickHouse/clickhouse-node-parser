SELECT 40 AS z
FROM (
        SELECT *
        FROM `system`.numbers
        LIMIT 3
    )
GROUP BY z;

SELECT 41 AS z
FROM remote('127.0.0.{2,3}', `system`.one)
GROUP BY z;

SELECT
    count(),
    42 AS z
FROM remote('127.0.0.{2,3}', `system`.one)
GROUP BY z;

SELECT 43 AS z
FROM remote('127.0.0.{2,3}', `system`.one)
GROUP BY
    42,
    43,
    44;

SELECT 11 AS z
FROM (
        SELECT 2
        UNION ALL
        SELECT 3
    )
GROUP BY
    42,
    43,
    44;

SELECT 40 AS z
FROM (
        SELECT *
        FROM `system`.numbers
        LIMIT 3
    )
GROUP BY z
WITH TOTALS;

SELECT 41 AS z
FROM remote('127.0.0.{2,3}', `system`.one)
GROUP BY z
WITH TOTALS;

SELECT
    count(),
    42 AS z
FROM remote('127.0.0.{2,3}', `system`.one)
GROUP BY z
WITH TOTALS;

SELECT 43 AS z
FROM remote('127.0.0.{2,3}', `system`.one)
GROUP BY
    42,
    43,
    44
WITH TOTALS;

SELECT 11 AS z
FROM (
        SELECT 1
        UNION ALL
        SELECT 2
    )
GROUP BY
    42,
    43,
    44
WITH TOTALS;

SELECT 11 AS z
FROM (
        SELECT 2
        UNION ALL
        SELECT 3
    )
GROUP BY
    42,
    43,
    44
WITH TOTALS;

SELECT count()
WITH TOTALS;

SELECT count()
FROM remote('127.0.0.{2,3}', `system`.one)
WITH TOTALS;